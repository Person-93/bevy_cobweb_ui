use bevy::ecs::system::EntityCommands;
use bevy::prelude::*;
use bevy_cobweb::prelude::*;
use serde::{Deserialize, Serialize};
use sickle_ui::lerp::Lerp;
use sickle_ui::theme::dynamic_style::DynamicStyle;
use sickle_ui::theme::dynamic_style_attribute::{DynamicStyleAttribute, DynamicStyleController};
use sickle_ui::theme::pseudo_state::PseudoState;
use sickle_ui::theme::style_animation::{AnimationSettings, AnimationState};
use sickle_ui::ui_style::{
    AnimatedStyleAttribute, AnimatedVals, CustomAnimatedStyleAttribute, CustomInteractiveStyleAttribute,
    CustomStaticStyleAttribute, InteractiveStyleAttribute, InteractiveVals, StaticStyleAttribute,
};
use sickle_ui::FluxInteraction;

use crate::*;

//-------------------------------------------------------------------------------------------------------------------

fn add_attribute_to_theme(
    In((entity, state, attribute)): In<(Entity, Option<Vec<PseudoState>>, DynamicStyleAttribute)>,
    mut commands: Commands,
    mut query: Query<(Option<&mut DynamicStyle>, Option<&mut LoadedThemes>)>,
)
{
    // Access the entity.
    let Ok((maybe_style, maybe_themes)) = query.get_mut(entity) else { return };

    // If there is a loaded theme, then add this attribute to the theme.
    if let Some(mut themes) = maybe_themes {
        themes.update(state, attribute);
        commands.add(RefreshLoadedTheme { entity });
        return;
    }

    // If there is no loaded theme, add this attribute directly.
    // - NOTE: If the entity has a theme ancestor, then these changes MAY be overwritten.
    let style = DynamicStyle::new(vec![attribute]);
    if let Some(mut existing) = maybe_style {
        let mut temp = DynamicStyle::new(Vec::default());
        std::mem::swap(&mut *existing, &mut temp);
        *existing = temp.merge(style);
    } else {
        commands.entity(entity).try_insert(style);
    }
}

//-------------------------------------------------------------------------------------------------------------------

fn extract_static_value<T: ThemedAttribute>(val: T::Value) -> impl Fn(Entity, &mut World)
{
    move |entity: Entity, world: &mut World| {
        // Apply the value to the entity.
        world.syscall(
            (entity, val.clone()),
            |In((entity, new_val)): In<(Entity, T::Value)>, mut c: Commands| {
                let Some(mut ec) = c.get_entity(entity) else { return };
                T::update(&mut ec, new_val);
            },
        );
    }
}

//-------------------------------------------------------------------------------------------------------------------

fn extract_responsive_value<T: ResponsiveAttribute + ThemedAttribute>(
    vals: InteractiveVals<T::Value>,
) -> impl Fn(Entity, FluxInteraction, &mut World)
{
    move |entity: Entity, state: FluxInteraction, world: &mut World| {
        // Compute new value.
        let new_value = vals.to_value(state);

        // Apply the value to the entity.
        world.syscall(
            (entity, new_value),
            |In((entity, new_val)): In<(Entity, T::Value)>, mut c: Commands| {
                let Some(mut ec) = c.get_entity(entity) else { return };
                T::update(&mut ec, new_val);
            },
        );
    }
}

//-------------------------------------------------------------------------------------------------------------------

fn extract_animation_value<T: AnimatableAttribute + ThemedAttribute>(
    vals: AnimatedVals<T::Value>,
) -> impl Fn(Entity, AnimationState, &mut World)
where
    <T as ThemedAttribute>::Value: Lerp,
{
    move |entity: Entity, state: AnimationState, world: &mut World| {
        // Compute new value.
        let new_value = vals.to_value(&state);

        // Apply the value to the entity.
        world.syscall(
            (entity, new_value),
            |In((entity, new_val)): In<(Entity, T::Value)>, mut c: Commands| {
                let Some(mut ec) = c.get_entity(entity) else { return };
                T::update(&mut ec, new_val);
            },
        );
    }
}

//-------------------------------------------------------------------------------------------------------------------

/// Trait for loadable types that specify a value for a theme.
pub trait ThemedAttribute: Loadable + TypePath
{
    /// Specifies the value-type of the theme attribute.
    type Value: Loadable + TypePath;

    /// Specifies how values should be updated on an entity for this themed attribute.
    fn update(entity_commands: &mut EntityCommands, value: Self::Value);
}

//-------------------------------------------------------------------------------------------------------------------

/// Trait for loadable types that respond to interactions.
pub trait ResponsiveAttribute: Loadable + TypePath
{
    /// Specifies the interactivity loadable used by this responsive.
    ///
    /// Can be used to hook target entities up to custom interactivity.
    ///
    /// For example [`Interactive`] (for `bevy_ui`).
    type Interactive: Default + ApplyLoadable;
}

//-------------------------------------------------------------------------------------------------------------------

/// Trait for loadable types that can be animated in response to interactions.
pub trait AnimatableAttribute: Loadable + TypePath
{
    /// Specifies the interactivity loadable used by this animatable.
    ///
    /// Can be used to hook target entities up to custom interactivity.
    ///
    /// For example [`Interactive`] (for `bevy_ui`).
    type Interactive: Default + ApplyLoadable;
}

//-------------------------------------------------------------------------------------------------------------------

/// Loadable type for theme values.
#[derive(Reflect, Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Themed<T: ThemedAttribute>
{
    /// Specifies which [`PseudoStates`](PseudoState) the entity must be in for this to become active.
    ///
    /// Only used if this struct is applied to an entity with a loaded theme.
    #[reflect(default)]
    pub state: Option<Vec<PseudoState>>,
    /// The value that will be applied to the entity with `T`.
    pub value: T::Value,
}

impl<T: ThemedAttribute> ApplyLoadable for Themed<T>
{
    fn apply(self, ec: &mut EntityCommands)
    {
        // Prepare an updated DynamicStyleAttribute.
        let attribute = DynamicStyleAttribute::Static(StaticStyleAttribute::Custom(
            CustomStaticStyleAttribute::new(extract_static_value::<T>(self.value)),
        ));

        let id = ec.id();
        ec.commands()
            .syscall((id, self.state, attribute), add_attribute_to_theme);
    }
}

//-------------------------------------------------------------------------------------------------------------------

/// Loadable type for responsive values.
///
/// Note that the `InteractiveVals::idle` field must always be set, which means it is effectively the 'default'
/// value for `T` that will be applied to the entity and override any value you set elsewhere.
#[derive(Reflect, Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Responsive<T: ResponsiveAttribute + ThemedAttribute>
{
    /// Specifies which [`PseudoStates`](PseudoState) the entity must be in for this to become active.
    ///
    /// Only used if this struct is applied to an entity with a loaded theme.
    #[reflect(default)]
    pub state: Option<Vec<PseudoState>>,
    /// The values that are toggled in response to interaction changes.
    pub values: InteractiveVals<T::Value>,
}

impl<T: ResponsiveAttribute + ThemedAttribute> ApplyLoadable for Responsive<T>
{
    fn apply(self, ec: &mut EntityCommands)
    {
        T::Interactive::default().apply(ec);

        // Prepare an updated DynamicStyleAttribute.
        let attribute = DynamicStyleAttribute::Interactive(InteractiveStyleAttribute::Custom(
            CustomInteractiveStyleAttribute::new(extract_responsive_value::<T>(self.values)),
        ));

        let id = ec.id();
        ec.commands()
            .syscall((id, self.state, attribute), add_attribute_to_theme);
    }
}

//-------------------------------------------------------------------------------------------------------------------

/// Loadable type for animatable values.
///
/// Note that the `AnimatedVals::idle` field must always be set, which means it is effectively the 'default' value
/// for `T` that will be applied to the entity and override any value you set elsewhere.
#[derive(Reflect, Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Animated<T: AnimatableAttribute + ThemedAttribute>
where
    <T as ThemedAttribute>::Value: Lerp,
{
    /// Specifies which [`PseudoStates`](PseudoState) the entity must be in for this animation to become active.
    ///
    /// Only used if this struct is applied to an entity with a loaded theme.
    #[reflect(default)]
    pub state: Option<Vec<PseudoState>>,
    /// The values that are end-targets for each animation.
    pub values: AnimatedVals<T::Value>,
    /// Settings that control how values are interpolated.
    pub settings: AnimationSettings,
}

impl<T: AnimatableAttribute + ThemedAttribute> ApplyLoadable for Animated<T>
where
    <T as ThemedAttribute>::Value: Lerp,
{
    fn apply(self, ec: &mut EntityCommands)
    {
        T::Interactive::default().apply(ec);

        // Prepare an updated DynamicStyleAttribute.
        let attribute = DynamicStyleAttribute::Animated {
            attribute: AnimatedStyleAttribute::Custom(CustomAnimatedStyleAttribute::new(
                extract_animation_value::<T>(self.values),
            )),
            controller: DynamicStyleController::new(self.settings, AnimationState::default()),
        };

        let id = ec.id();
        ec.commands()
            .syscall((id, self.state, attribute), add_attribute_to_theme);
    }
}

//-------------------------------------------------------------------------------------------------------------------
