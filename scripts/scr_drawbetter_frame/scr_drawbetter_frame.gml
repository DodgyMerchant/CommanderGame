/// @func scr_drawbetter_frame(x1, y1, x2, y2, col, alpha, width);
/// @desc description
/// @arg {real} x1 description
/// @arg {real} y1 description
/// @arg {real} x2 description
/// @arg {real} y2 description
/// @arg {real} col description
/// @arg {real} alpha description
/// @arg {real} width description

/*
argument0	= x1
argument1	= y1
argument2	= x2
argument3	= y2
argument4	= col
argument5	= alpha
argument6	= width
*/

var _w=argument2 - argument0;
var _h=argument3 - argument1;


//top
draw_sprite_ext(spr_pixel,0,argument0,argument1,_w,argument6,0,argument4,argument5);
//bottom
draw_sprite_ext(spr_pixel,0,argument0,argument3 - argument6,_w,argument6,0,argument4,argument5);
//left
draw_sprite_ext(spr_pixel,0,argument0,argument1 + argument6,argument6,_h - argument6*2,0,argument4,argument5);
//right
draw_sprite_ext(spr_pixel,0,argument2 - argument6,argument1 + argument6,argument6,_h - argument6*2,0,argument4,argument5);