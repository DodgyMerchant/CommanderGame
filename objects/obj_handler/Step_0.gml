/// @desc 

/*

global.Camera_x_true=0;
global.Camera_y_true=0;

camera_get_view_x(view_camera[0])
camera_get_view_y(view_camera[0])
*/


#region mouse wheel zoom
//*
var _input_wheel = mouse_wheel_down() - mouse_wheel_up();

if _input_wheel!=0
	{
	//if zoom changed
	
	scr_zoom_value(global.Zoom_value + (.1 * _input_wheel),true);
	
	
	}
//*/
#endregion

#region auto zoom

if global.Zoom_value != zoom_seek
	{
	//set new zoom value
	var _dist = zoom_seek - global.Zoom_value;
	
	if abs(_dist)<0.001
		global.Zoom_value = zoom_seek;
	else
		global.Zoom_value += sign(_dist) * abs(_dist)/10;
	
	
	//get new sizes
	//var _w = clamp(lerp(zoom_min_w,zoom_max_w,global.Zoom_value),zoom_min_w,zoom_max_w);
	//var _h = clamp(lerp(zoom_min_h,zoom_max_h,global.Zoom_value),zoom_min_h,zoom_max_h);
	var _w = lerp(zoom_min_w,zoom_max_w,global.Zoom_value);
	var _h = lerp(zoom_min_h,zoom_max_h,global.Zoom_value);
	
	//set pos
	var _x = global.Camera_x_true;
	var _y = global.Camera_y_true;
	var _w_old=camera_get_view_width(view_camera[0]);
	var _h_old=camera_get_view_height(view_camera[0]);
	_x -= (_w - _w_old) / 2;
	_y -= (_h - _h_old) / 2;
	
	global.Camera_x_true=_x;
	global.Camera_y_true=_y;
	
	//set size
	camera_set_view_size(view_camera[0],_w,_h);
	
	//set appsurface
	
	switch (appsurf_resize_type)
		{
		case APPSURF_RESIZE_TYPE.always:
			#region always resize
			
			surface_resize(application_surface,_w * global.AppSurf_scale,_h * global.AppSurf_scale);
			show_debug_message("resize!");
			
			#endregion
		break;
		case APPSURF_RESIZE_TYPE.good_res:
			#region resize on good pixel res
			
			if frac(_w)==0 and frac(_h)==0
				{
				surface_resize(application_surface,_w * global.AppSurf_scale,_h * global.AppSurf_scale);
				show_debug_message("RESIZE: "+string(frac(_w))+"|"+string(frac(_h)));
				}
			else
				show_debug_message("NO RESIZE: "+string(frac(_w))+"|"+string(frac(_h)));
			
			#endregion
		break;
		case APPSURF_RESIZE_TYPE.good_res_whsep:
			#region resize on good pixel res for w/h seperate
			
			var _need_resize=false;
			var _w_set = _w_old;
			var _h_set = _h_old;
			
			if frac(_w)==0
				{
				var _w_set = _w;
				_need_resize=true;
				}
				
			if frac(_h)==0
				{
				var _h_set = _h;
				_need_resize=true;
				}
			
			if _need_resize
			surface_resize(application_surface,_w_set * global.AppSurf_scale,_h_set * global.AppSurf_scale);
			
			#endregion
		break;
		case APPSURF_RESIZE_TYPE.good_res_approach:
		
		break;
		}
	
	
	//show_debug_message("AUTO ZOOM!");
	}

#endregion