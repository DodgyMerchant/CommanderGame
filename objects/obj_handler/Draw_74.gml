/// @desc 





#region appsurf draw


//but without zoom compensation
/*
//global.Zoom_value
//global.GUI_scale


var _gui_w=display_get_gui_width();
var _gui_h=display_get_gui_height();
var _w=camera_get_view_width(view_camera[0]);
var _h=camera_get_view_height(view_camera[0]);
appsurf_wscale= (_gui_w / _w);
appsurf_hscale= (_gui_h / _h);

draw_surface_part_ext(application_surface,0,0,_w,_h, 0, 0, appsurf_wscale, appsurf_hscale, c_white, 1);


//wird zu schnell zu klein


//lerp(,,global.Zoom_value);


var _scale = 1 / 10;
var _app_x= _gui_w - surface_get_width(application_surface) * _scale;
var _app_y= _gui_h - surface_get_height(application_surface) * _scale;
draw_surface_ext(application_surface, _app_x, _app_y, _scale, _scale, 0, c_white, 1);
draw_rectangle(_app_x,_app_y,_gui_w,_gui_h,1);
*/
#endregion
