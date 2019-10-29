/// @func scr_draw_alpha(alpha);
/// @desc checks if the given alpa is being used and if not use it
/// @arg {real} alpha the alpha to check for and set


if draw_get_alpha()!=argument0
	draw_set_alpha(argument0);
