/// @debug


#region debug

if global.debug
{
draw_set_font(fn_debug);

draw_set_alpha(0.9);
draw_set_color(c_orange);
draw_set_valign(0);

var _cam = view_camera[0];
var _inst = obj_game;

#region left
draw_set_halign(0);
var _y=20;




_y = scr_debug_txt(0,_y,

"//////ROOM//////",
"room: "+string(room),
"w|h: "+string(room_width)+"|"+string(room_height),
"camera: "+string(room_get_camera(room,0)),
/*
"//////VIEW//////",
"enabled: "+string(view_enabled),
"visible: "+string(view_visible),
"view x|y: "+string(camera_get_view_x(_cam))+"|"+string(camera_get_view_y(_cam)),
"true x|y: "+string(global.Camera_x_true)+"|"+string(global.Camera_y_true),
"truepos used: "+string(_inst.camera_trueposition),
"view w|h: "+string(camera_get_view_width(_cam))+"|"+string(camera_get_view_height(_cam)),
//"port x|y: "+string(view_xport[_cam])+"|"+string(view_yport[_cam]),
//"port w|h: "+string(view_wport[_cam])+"|"+string(view_hport[_cam]),
"window w|h: "+string(window_get_width())+"|"+string(window_get_height()),
"GUI w|h: "+string(display_get_gui_width())+"|"+string(display_get_gui_height()),
"appsurf w|h: "+string(surface_get_width(application_surface))+"|"+string(surface_get_height(application_surface)),
"appsurf res type: "+string(obj_handler.appsurf_resize_type),

//*/

/*
"//////ZOOM//////",
"val: "+string(global.Zoom_value),
"seek: "+string(_inst.zoom_seek),
"max w|h: "+string(_inst.zoom_max_w)+"|"+string(_inst.zoom_max_h),
"min w|h: "+string(_inst.zoom_min_w)+"|"+string(_inst.zoom_min_h),
//*/

"//////GAME//////",
"mouse x|y: "+string(mouse_x)+"|"+string(mouse_y),
"//////OPERATIONAL WINDOW//////",
"grid w|h: "+string(ds_grid_width(_inst.ow_grid))+"|"+string(ds_grid_height(_inst.ow_grid)),
"x|y: "+string(_inst.ow_grid_x)+"|"+string(_inst.ow_grid_y),
"select 1x|y: "+string(_inst.select_x1)+"|"+string(_inst.select_y1),
"select 2x|y: "+string(_inst.select_x2)+"|"+string(_inst.select_y2),
"grab x|y: "+string(_inst.ow_mouse_grab_x)+"|"+string(_inst.ow_mouse_grab_y),






);



#endregion

#region right
draw_set_halign(2);
_y = 20;
var _x = display_get_gui_width();

_y = scr_debug_list(_x,_y,_inst.select_list,"select");
//_y = scr_debug_grid(_x,_y,_inst.ow_grid,"OW");


#endregion

draw_set_alpha(1);
}
#endregion end of debug

