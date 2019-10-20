/// @debug


#region debug

if global.debug
{
draw_set_font(fn_debug);

draw_set_alpha(0.9);
draw_set_color(c_orange);
draw_set_valign(0);

//var _cam = view_camera[0];
var _cam = room_get_camera(room,0);

#region left
draw_set_halign(0);
var _y=20;

/*
if instance_exists(1)
_y = scr_debug_txt(0,_y,
"//////GAME//////",
"mouse x|y: "+string(mouse_x)+"|"+string(mouse_y),
);
*/

#region handler & general
_y = scr_debug_txt(0,_y,

"//////GENERAL//////",
"mouse x|y: "+string(mouse_x)+"|"+string(mouse_y),
"",
"//////ROOM//////",
"room: "+string(room),
"w|h: "+string(room_width)+"|"+string(room_height),
"camera: "+string(_cam),

/*
"//////VIEW//////",
"enabled: "+string(view_enabled),
"visible: "+string(view_visible),
"view x|y: "+string(camera_get_view_x(_cam))+"|"+string(camera_get_view_y(_cam)),
"true x|y: "+string(global.Camera_x_true)+"|"+string(global.Camera_y_true),
//"truepos used: "+string(obj_handler.camera_trueposition),
"view w|h: "+string(camera_get_view_width(_cam))+"|"+string(camera_get_view_height(_cam)),
"port x|y: "+string(view_xport[0])+"|"+string(view_yport[0]),
"port w|h: "+string(view_wport[0])+"|"+string(view_hport[0]),
"window w|h: "+string(window_get_width())+"|"+string(window_get_height()),
"GUI w|h: "+string(display_get_gui_width())+"|"+string(display_get_gui_height()),
"appsurf w|h: "+string(surface_get_width(application_surface))+"|"+string(surface_get_height(application_surface)),
//"appsurf res type: "+string(obj_handler.appsurf_resize_type),
"",

//*/
/*
"//////ZOOM//////",
"val: "+string(global.Zoom_value),
"seek: "+string(obj_handler.zoom_seek),
"max w|h: "+string(obj_handler.zoom_max_w)+"|"+string(obj_handler.zoom_max_h),
"min w|h: "+string(obj_handler.zoom_min_w)+"|"+string(obj_handler.zoom_min_h),
//*/
);
#endregion
#region game

if instance_exists(obj_game)
with(obj_game)
_y = scr_debug_txt(0,_y,
"//////GAME//////",
//*
"//////OPERATIONAL WINDOW//////",
"grid w|h: "+string(ds_grid_width(ow_grid))+"|"+string(ds_grid_height(ow_grid)),
"x|y: "+string(ow_grid_x)+"|"+string(ow_grid_y),
"select 1x|y: "+string(select_x1)+"|"+string(select_y1),
"select 2x|y: "+string(select_x2)+"|"+string(select_y2),
"grab x|y: "+string(ow_mouse_grab_x)+"|"+string(ow_mouse_grab_y),
//*/
//*
"//////DIALOGUE WINDOW//////",
"d num: "+string(ds_list_size(dw_list)),
"index: "+string(dw_index),
"notify count: "+string(dw_notify_count),

//*/
);
#endregion
#region menu

if instance_exists(obj_menu)
_y = scr_debug_txt(0,_y,
"//////MENU//////",



);

#endregion

#endregion

#region right
draw_set_halign(2);
_y = 20;
var _x = display_get_gui_width();

//obj_game part
if instance_exists(obj_game)
	{
	_y = scr_debug_list(_x,_y,obj_game.select_list,"select");
	//_y = scr_debug_grid(_x,_y,obj_game.ow_grid,"OW");
	}



#endregion

draw_set_alpha(1);
}
#endregion end of debug



/*
var _gui_w=display_get_gui_width();
var _gui_h=display_get_gui_height();

//dist lines
var _lines = 5;
var _dist = 25;

for (var i=-_lines;i<=_lines;i++)
	{
	var _y = _gui_h/2 + _dist * i;
	scr_drawbetter_line(0,_y,_gui_w,_y,c_blue,0.5 *     ((abs(i)/(_lines+1))*-1+1)   );
	}


var _y = scr_wave2(-50,(current_time)*0.001 / 1);

draw_circle(_gui_w/2,_gui_h/2 + _y,5,false);





