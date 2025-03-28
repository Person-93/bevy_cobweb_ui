/*
[Extended colors from the CSS4 specification](https://en.wikipedia.org/wiki/Web_colors#Extended_colors).
Also known as X11 colors, which were standardized in HTML 4.0.
Copied from the Bevy v0.14.1 codebase.
*/

#manifest
self as builtin.colors.css

#import
// The CSS4 colors are a superset of the CSS1 colors, so we can just re-export the CSS1 colors.
builtin.colors.basic as _

#defs
$ALICE_BLUE = Srgba{ red:0.941 green:0.973 blue:1.0 alpha:1.0 }
$ANTIQUE_WHITE = Srgba{ red:0.98 green:0.922 blue:0.843 alpha:1.0 }
$AQUA = Srgba{ red:0.0 green:1.0 blue:1.0 alpha:1.0 }
$AQUAMARINE = Srgba{ red:0.498 green:1.0 blue:0.831 alpha:1.0 }
$AZURE = Srgba{ red:0.941 green:1.0 blue:1.0 alpha:1.0 }
$BEIGE = Srgba{ red:0.961 green:0.961 blue:0.863 alpha:1.0 }
$BISQUE = Srgba{ red:1.0 green:0.894 blue:0.769 alpha:1.0 }
$BLANCHED_ALMOND = Srgba{ red:1.0 green:0.922 blue:0.804 alpha:1.0 }
$BLUE_VIOLET = Srgba{ red:0.541 green:0.169 blue:0.886 alpha:1.0 }
$BROWN = Srgba{ red:0.647 green:0.165 blue:0.165 alpha:1.0 }
$BURLYWOOD = Srgba{ red:0.871 green:0.722 blue:0.529 alpha:1.0 }
$CADET_BLUE = Srgba{ red:0.373 green:0.62 blue:0.627 alpha:1.0 }
$CHARTREUSE = Srgba{ red:0.498 green:1.0 blue:0.0 alpha:1.0 }
$CHOCOLATE = Srgba{ red:0.824 green:0.412 blue:0.118 alpha:1.0 }
$CORAL = Srgba{ red:1.0 green:0.498 blue:0.314 alpha:1.0 }
$CORNFLOWER_BLUE = Srgba{ red:0.392 green:0.584 blue:0.929 alpha:1.0 }
$CORNSILK = Srgba{ red:1.0 green:0.973 blue:0.863 alpha:1.0 }
$CRIMSON = Srgba{ red:0.863 green:0.078 blue:0.235 alpha:1.0 }
$DARK_BLUE = Srgba{ red:0.0 green:0.0 blue:0.545 alpha:1.0 }
$DARK_CYAN = Srgba{ red:0.0 green:0.545 blue:0.545 alpha:1.0 }
$DARK_GOLDENROD = Srgba{ red:0.722 green:0.525 blue:0.043 alpha:1.0 }
$DARK_GRAY = Srgba{ red:0.663 green:0.663 blue:0.663 alpha:1.0 }
$DARK_GREEN = Srgba{ red:0.0 green:0.392 blue:0.0 alpha:1.0 }
$DARK_GREY = Srgba{ red:0.663 green:0.663 blue:0.663 alpha:1.0 }
$DARK_KHAKI = Srgba{ red:0.741 green:0.718 blue:0.42 alpha:1.0 }
$DARK_MAGENTA = Srgba{ red:0.545 green:0.0 blue:0.545 alpha:1.0 }
$DARK_OLIVEGREEN = Srgba{ red:0.333 green:0.42 blue:0.184 alpha:1.0 }
$DARK_ORANGE = Srgba{ red:1.0 green:0.549 blue:0.0 alpha:1.0 }
$DARK_ORCHID = Srgba{ red:0.6 green:0.196 blue:0.8 alpha:1.0 }
$DARK_RED = Srgba{ red:0.545 green:0.0 blue:0.0 alpha:1.0 }
$DARK_SALMON = Srgba{ red:0.914 green:0.588 blue:0.478 alpha:1.0 }
$DARK_SEA_GREEN = Srgba{ red:0.561 green:0.737 blue:0.561 alpha:1.0 }
$DARK_SLATE_BLUE = Srgba{ red:0.282 green:0.239 blue:0.545 alpha:1.0 }
$DARK_SLATE_GRAY = Srgba{ red:0.184 green:0.31 blue:0.31 alpha:1.0 }
$DARK_SLATE_GREY = Srgba{ red:0.184 green:0.31 blue:0.31 alpha:1.0 }
$DARK_TURQUOISE = Srgba{ red:0.0 green:0.808 blue:0.82 alpha:1.0 }
$DARK_VIOLET = Srgba{ red:0.58 green:0.0 blue:0.827 alpha:1.0 }
$DEEP_PINK = Srgba{ red:1.0 green:0.078 blue:0.576 alpha:1.0 }
$DEEP_SKY_BLUE = Srgba{ red:0.0 green:0.749 blue:1.0 alpha:1.0 }
$DIM_GRAY = Srgba{ red:0.412 green:0.412 blue:0.412 alpha:1.0 }
$DIM_GREY = Srgba{ red:0.412 green:0.412 blue:0.412 alpha:1.0 }
$DODGER_BLUE = Srgba{ red:0.118 green:0.565 blue:1.0 alpha:1.0 }
$FIRE_BRICK = Srgba{ red:0.698 green:0.133 blue:0.133 alpha:1.0 }
$FLORAL_WHITE = Srgba{ red:1.0 green:0.98 blue:0.941 alpha:1.0 }
$FOREST_GREEN = Srgba{ red:0.133 green:0.545 blue:0.133 alpha:1.0 }
$GAINSBORO = Srgba{ red:0.863 green:0.863 blue:0.863 alpha:1.0 }
$GHOST_WHITE = Srgba{ red:0.973 green:0.973 blue:1.0 alpha:1.0 }
$GOLD = Srgba{ red:1.0 green:0.843 blue:0.0 alpha:1.0 }
$GOLDENROD = Srgba{ red:0.855 green:0.647 blue:0.125 alpha:1.0 }
$GREEN_YELLOW = Srgba{ red:0.678 green:1.0 blue:0.184 alpha:1.0 }
$GREY = Srgba{ red:0.502 green:0.502 blue:0.502 alpha:1.0 }
$HONEYDEW = Srgba{ red:0.941 green:1.0 blue:0.941 alpha:1.0 }
$HOT_PINK = Srgba{ red:1.0 green:0.412 blue:0.706 alpha:1.0 }
$INDIAN_RED = Srgba{ red:0.804 green:0.361 blue:0.361 alpha:1.0 }
$INDIGO = Srgba{ red:0.294 green:0.0 blue:0.51 alpha:1.0 }
$IVORY = Srgba{ red:1.0 green:1.0 blue:0.941 alpha:1.0 }
$KHAKI = Srgba{ red:0.941 green:0.902 blue:0.549 alpha:1.0 }
$LAVENDER = Srgba{ red:0.902 green:0.902 blue:0.98 alpha:1.0 }
$LAVENDER_BLUSH = Srgba{ red:1.0 green:0.941 blue:0.961 alpha:1.0 }
$LAWN_GREEN = Srgba{ red:0.486 green:0.988 blue:0.0 alpha:1.0 }
$LEMON_CHIFFON = Srgba{ red:1.0 green:0.98 blue:0.804 alpha:1.0 }
$LIGHT_BLUE = Srgba{ red:0.678 green:0.847 blue:0.902 alpha:1.0 }
$LIGHT_CORAL = Srgba{ red:0.941 green:0.502 blue:0.502 alpha:1.0 }
$LIGHT_CYAN = Srgba{ red:0.878 green:1.0 blue:1.0 alpha:1.0 }
$LIGHT_GOLDENROD_YELLOW = Srgba{ red:0.98 green:0.98 blue:0.824 alpha:1.0 }
$LIGHT_GRAY = Srgba{ red:0.827 green:0.827 blue:0.827 alpha:1.0 }
$LIGHT_GREEN = Srgba{ red:0.565 green:0.933 blue:0.565 alpha:1.0 }
$LIGHT_GREY = Srgba{ red:0.827 green:0.827 blue:0.827 alpha:1.0 }
$LIGHT_PINK = Srgba{ red:1.0 green:0.714 blue:0.757 alpha:1.0 }
$LIGHT_SALMON = Srgba{ red:1.0 green:0.627 blue:0.478 alpha:1.0 }
$LIGHT_SEA_GREEN = Srgba{ red:0.125 green:0.698 blue:0.667 alpha:1.0 }
$LIGHT_SKY_BLUE = Srgba{ red:0.529 green:0.808 blue:0.98 alpha:1.0 }
$LIGHT_SLATE_GRAY = Srgba{ red:0.467 green:0.533 blue:0.6 alpha:1.0 }
$LIGHT_SLATE_GREY = Srgba{ red:0.467 green:0.533 blue:0.6 alpha:1.0 }
$LIGHT_STEEL_BLUE = Srgba{ red:0.69 green:0.769 blue:0.871 alpha:1.0 }
$LIGHT_YELLOW = Srgba{ red:1.0 green:1.0 blue:0.878 alpha:1.0 }
$LIMEGREEN = Srgba{ red:0.196 green:0.804 blue:0.196 alpha:1.0 }
$LINEN = Srgba{ red:0.98 green:0.941 blue:0.902 alpha:1.0 }
$MAGENTA = Srgba{ red:1.0 green:0.0 blue:1.0 alpha:1.0 }
$MEDIUM_AQUAMARINE = Srgba{ red:0.4 green:0.804 blue:0.667 alpha:1.0 }
$MEDIUM_BLUE = Srgba{ red:0.0 green:0.0 blue:0.804 alpha:1.0 }
$MEDIUM_ORCHID = Srgba{ red:0.729 green:0.333 blue:0.827 alpha:1.0 }
$MEDIUM_PURPLE = Srgba{ red:0.576 green:0.439 blue:0.859 alpha:1.0 }
$MEDIUM_SEA_GREEN = Srgba{ red:0.235 green:0.702 blue:0.443 alpha:1.0 }
$MEDIUM_SLATE_BLUE = Srgba{ red:0.482 green:0.408 blue:0.933 alpha:1.0 }
$MEDIUM_SPRING_GREEN = Srgba{ red:0.0 green:0.98 blue:0.604 alpha:1.0 }
$MEDIUM_TURQUOISE = Srgba{ red:0.282 green:0.82 blue:0.8 alpha:1.0 }
$MEDIUM_VIOLET_RED = Srgba{ red:0.78 green:0.082 blue:0.522 alpha:1.0 }
$MIDNIGHT_BLUE = Srgba{ red:0.098 green:0.098 blue:0.439 alpha:1.0 }
$MINT_CREAM = Srgba{ red:0.961 green:1.0 blue:0.98 alpha:1.0 }
$MISTY_ROSE = Srgba{ red:1.0 green:0.894 blue:0.882 alpha:1.0 }
$MOCCASIN = Srgba{ red:1.0 green:0.894 blue:0.71 alpha:1.0 }
$NAVAJO_WHITE = Srgba{ red:1.0 green:0.871 blue:0.678 alpha:1.0 }
$OLD_LACE = Srgba{ red:0.992 green:0.961 blue:0.902 alpha:1.0 }
$OLIVE_DRAB = Srgba{ red:0.42 green:0.557 blue:0.137 alpha:1.0 }
$ORANGE = Srgba{ red:1.0 green:0.647 blue:0.0 alpha:1.0 }
$ORANGE_RED = Srgba{ red:1.0 green:0.271 blue:0.0 alpha:1.0 }
$ORCHID = Srgba{ red:0.855 green:0.439 blue:0.839 alpha:1.0 }
$PALE_GOLDENROD = Srgba{ red:0.933 green:0.91 blue:0.667 alpha:1.0 }
$PALE_GREEN = Srgba{ red:0.596 green:0.984 blue:0.596 alpha:1.0 }
$PALE_TURQUOISE = Srgba{ red:0.686 green:0.933 blue:0.933 alpha:1.0 }
$PALE_VIOLETRED = Srgba{ red:0.859 green:0.439 blue:0.576 alpha:1.0 }
$PAPAYA_WHIP = Srgba{ red:1.0 green:0.937 blue:0.835 alpha:1.0 }
$PEACHPUFF = Srgba{ red:1.0 green:0.855 blue:0.725 alpha:1.0 }
$PERU = Srgba{ red:0.804 green:0.522 blue:0.247 alpha:1.0 }
$PINK = Srgba{ red:1.0 green:0.753 blue:0.796 alpha:1.0 }
$PLUM = Srgba{ red:0.867 green:0.627 blue:0.867 alpha:1.0 }
$POWDER_BLUE = Srgba{ red:0.69 green:0.878 blue:0.902 alpha:1.0 }
$REBECCA_PURPLE = Srgba{ red:0.4 green:0.2 blue:0.6 alpha:1.0 }
$ROSY_BROWN = Srgba{ red:0.737 green:0.561 blue:0.561 alpha:1.0 }
$ROYAL_BLUE = Srgba{ red:0.255 green:0.412 blue:0.882 alpha:1.0 }
$SADDLE_BROWN = Srgba{ red:0.545 green:0.271 blue:0.075 alpha:1.0 }
$SALMON = Srgba{ red:0.98 green:0.502 blue:0.447 alpha:1.0 }
$SANDY_BROWN = Srgba{ red:0.957 green:0.643 blue:0.376 alpha:1.0 }
$SEA_GREEN = Srgba{ red:0.18 green:0.545 blue:0.341 alpha:1.0 }
$SEASHELL = Srgba{ red:1.0 green:0.961 blue:0.933 alpha:1.0 }
$SIENNA = Srgba{ red:0.627 green:0.322 blue:0.176 alpha:1.0 }
$SKY_BLUE = Srgba{ red:0.529 green:0.808 blue:0.922 alpha:1.0 }
$SLATE_BLUE = Srgba{ red:0.416 green:0.353 blue:0.804 alpha:1.0 }
$SLATE_GRAY = Srgba{ red:0.439 green:0.502 blue:0.565 alpha:1.0 }
$SLATE_GREY = Srgba{ red:0.439 green:0.502 blue:0.565 alpha:1.0 }
$SNOW = Srgba{ red:1.0 green:0.98 blue:0.98 alpha:1.0 }
$SPRING_GREEN = Srgba{ red:0.0 green:1.0 blue:0.498 alpha:1.0 }
$STEEL_BLUE = Srgba{ red:0.275 green:0.51 blue:0.706 alpha:1.0 }
$TAN = Srgba{ red:0.824 green:0.706 blue:0.549 alpha:1.0 }
$THISTLE = Srgba{ red:0.847 green:0.749 blue:0.847 alpha:1.0 }
$TOMATO = Srgba{ red:1.0 green:0.388 blue:0.278 alpha:1.0 }
$TURQUOISE = Srgba{ red:0.251 green:0.878 blue:0.816 alpha:1.0 }
$VIOLET = Srgba{ red:0.933 green:0.51 blue:0.933 alpha:1.0 }
$WHEAT = Srgba{ red:0.961 green:0.871 blue:0.702 alpha:1.0 }
$WHITE_SMOKE = Srgba{ red:0.961 green:0.961 blue:0.961 alpha:1.0 }
$YELLOW_GREEN = Srgba{ red:0.604 green:0.804 blue:0.196 alpha:1.0 }
