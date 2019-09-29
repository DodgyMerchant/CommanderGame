/// @desc 


#region camera last positioning || true position
/*
global.Camera_x_true=0;
global.Camera_y_true=0;

camera_get_view_x(view_camera[0])
camera_get_view_y(view_camera[0])
*/

if camera_trueposition
	{
	var _x=floor(global.Camera_x_true);
	var _y=floor(global.Camera_y_true);
	}
else
	{
	var _x=global.Camera_x_true;
	var _y=global.Camera_y_true;
	}

//if true position adjusted isnt the shown position
if _x != camera_get_view_x(view_camera[0])
or _y != camera_get_view_y(view_camera[0])
	{
	//update camera
	camera_set_view_pos(view_camera[0],_x,_y);
	
	//show_debug_message("////////////CAMERA TRUE POSITION AUTO UPDATE//////////////");
	}

#endregion

