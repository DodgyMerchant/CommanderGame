/// @func scr_drawbetter_rec(x1, y1, x2, y2, col, alpha);
/// @desc description
/// @arg {real} x1 description
/// @arg {real} y1 description
/// @arg {real} x2 description
/// @arg {real} y2 description
/// @arg {real} col description
/// @arg {real} alpha description

/*
argument0	= x1
argument1	= y1
argument2	= x2
argument3	= y2
argument4	= col
argument5	= alpha
*/

draw_sprite_ext(spr_pixel,0,
argument0,
argument1,
argument2 - argument0,
argument3 - argument1,
0,
argument4,argument5);