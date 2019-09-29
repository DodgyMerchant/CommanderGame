/// @desc 

/*
TO DO:


*/

#region views and zoom

/// !!!! ///
//application_surface_draw_enable(false);
//application_surface_enable(false);
/// !!!! ///

//the TRUE variables represent the true camera position
//for picture crispness the shown position is floored
global.Camera_x_true = 0;
global.Camera_y_true = 0;
camera_trueposition=false;	//if the true position will be floored for the cam pos
appsurf_resize_type=APPSURF_RESIZE_TYPE.always;
enum APPSURF_RESIZE_TYPE	//0=always	|1=good pixel res	|2=good w/h seperate	|3=good size + 
	{
	always,
	good_res,
	good_res_whsep,
	good_res_approach,
	HEIGHT
	}


#region view configurable
/*
16:9 = (1.78:1)


Width	|	Height	|	Ratio	|	Standart	|	Details	|	divisible 8
--------|-----------|-----------|---------------|-----------|--------------------
128		|	72		|	16:9	|				|			|	yes
256		|	144		|	16:9	|				|			|	yes
384		|	216		|	16:9	|				|			|	yes
480		|	270		|	16:9	|				|	1/4 ori	|
512		|	288		|	16:9	|				|			|	yes
640		|	360		|	16:9	|				|	1/3 ori	|	yes
640		|	480		|			|	VGA			|			|
720		|	480		|			|	80s CRT		|			|
768		|	432		|	16:9	|				|			|	yes
960		|	540		|	16:9	|				|	1/2 ori	|
1280	|	720		|	16:9	|	720p HD		|			|	yes
1440	|	810		|	16:9	|				|	3/4 ori	|
1600	|	900		|	16:9	|				|			|
1664	|	936		|	16:9	|				|			|	yes
1920	|	1080	|	16:9	|	1080p HD	|	ori		|	yes

*/

var _view_w	=640;
var _view_h	=480;

global.Window_scale=1;		//the size window size from the view res		|| window / frac = appsurf
global.AppSurf_ori="view";	//to what the appsurf will be oriented on  "window" or "view"
global.AppSurf_scale=1;		//the size of the appsurf from the AppSurf_ori	|| XXX / frac = appsurf
global.GUI_scale=1;			//the size of the GUI scaled from the view		|| view * scale = GUI

#endregion
#region zoom


//configurable
var _zoom_max = 4;
var _zoom_min = 4;

zoom_max_w = _view_w * _zoom_max;
zoom_max_h = _view_h * _zoom_max;
zoom_min_w = _view_w / _zoom_min;
zoom_min_h = _view_h / _zoom_min;

//usables
//lerp(zoom_min_w,zoom_max_w,global.Zoom_value);
//lerp(zoom_min_h,zoom_max_h,global.Zoom_value);

//get zoom value so that the standart cam doesnt change
global.Zoom_value=(_view_h - zoom_min_h) / (zoom_max_h - zoom_min_h);


//smooth zoom system
zoom_seek=global.Zoom_value;	//the zoom value that is to seek






#endregion
#region application

//let it be
global.View_Ratio = _view_w / _view_h;

var _window_w	=_view_w * global.Window_scale;
var _window_h	=_view_h * global.Window_scale;

var _gui_w		=_view_w  * global.GUI_scale;
var _gui_h		=_view_h * global.GUI_scale;

if global.AppSurf_ori=="view"
	{
	var _surf_w	=_view_w / global.AppSurf_scale;
	var _surf_h	=_view_h / global.AppSurf_scale;
	}
else if global.AppSurf_ori=="window"
	{
	var _surf_w	=_window_w / global.AppSurf_scale;
	var _surf_h	=_window_h / global.AppSurf_scale;
	}


view_camera[0] = camera_create_view(0,0,_view_w,_view_h);
view_visible[0] = true;
view_enabled = true;

view_set_xport(view_camera[0],0);
view_set_yport(view_camera[0],0);
view_set_wport(view_camera[0],_window_w);
view_set_hport(view_camera[0],_window_h);

window_set_size(_window_w,_window_h);
surface_resize(application_surface,_surf_w,_surf_h); //norm size
//surface_resize(application_surface,zoom_max_w,zoom_max_h);	//max size
display_set_gui_size(_gui_w,_gui_h);

//queue stuff
alarm[0] = 1;


#endregion
#region appsurface2 electric boogaloo
/*
global.Applicationsurface2_electric_boogaloo = surface_create(zoom_max_w,zoom_max_h);
surface_set_target(global.Applicationsurface2_electric_boogaloo);



*/
#endregion
#region warnings

if _window_w < _gui_w or _window_h < _gui_h
	show_debug_message("!!!WARNING!!!  INIT /// VIEW_SETUP /// gui larger than window");
if _window_w < _surf_w or _window_h < _surf_h
	show_debug_message("!!!WARNING!!!  INIT /// VIEW_SETUP /// appsurf larger than window");

#endregion

#endregion views
