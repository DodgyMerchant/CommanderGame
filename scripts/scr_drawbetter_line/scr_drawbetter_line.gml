/// @func scr_drawbetter_line(x1, y1, x2, y2, col, alpha);
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

var _rot = point_direction(argument0,argument1,argument2,argument3);
var _dis = point_distance(argument0,argument1,argument2,argument3);

//compensation for rotation of srite and origin change
var _x_comp= ((_rot + 45)%360) div 180;
var _y_comp= ((_rot + 90 + 45)%360) div 180;
/*
r	x	y
0	0	0
90	0	+1
180	+1	+1
270	+1	0
*/

draw_sprite_ext(spr_pixel,0,argument0 + _x_comp,argument1 + _y_comp,_dis,1,_rot,argument4,argument5);