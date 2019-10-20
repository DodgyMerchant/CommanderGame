/// @desc 



#region debug buttons

if keyboard_check(vk_control) or global.debug
{
//basics
#region J				Activate Debug

if keyboard_check_pressed(ord("J"))
	{
	global.debug = !global.debug;
	}

#endregion
#region R				Restart

if keyboard_check_pressed(ord("R"))
	{
	game_restart();
	}

#endregion
#region Esc				Stop Game

if keyboard_check_pressed(vk_escape)
	{
	game_end();
	}

#endregion

//custom
#region arrow keys		Camera Controll		INACTIVE
/*
var _x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var _y_input = keyboard_check(vk_down) - keyboard_check(vk_up);

if _x_input!=0 or _y_input!=0
	{
	//var _cam = view_camera[0];
	var _speed = 2;
	//camera_set_view_pos(_cam,camera_get_view_x(_cam) + _x_input * _speed,camera_get_view_y(_cam) + _y_input * _speed);
	
	global.Camera_x_true+= _x_input * _speed;
	global.Camera_y_true+= _y_input * _speed;
	}
*/
#endregion
#region camera mumbo jumbo					INACTIVE
/*
if keyboard_check_pressed(ord("N"))
	{
	obj_handler.camera_trueposition=!obj_handler.camera_trueposition;
	}
if keyboard_check_pressed(ord("M"))
	{
	obj_handler.appsurf_resize_type=scr_wrap_around(obj_handler.appsurf_resize_type+1,0,APPSURF_RESIZE_TYPE.HEIGHT-1);
	}
*/
#endregion
#region I +- Shift	Room switch

//switches through 
if keyboard_check_pressed(ord("I"))
	{
	room_goto( scr_wrap_around(room+ (!keyboard_check(vk_shift)? 1: -1) ,room_first,room_last));
	}

#endregion


//very temp
#region temp

if keyboard_check_pressed(vk_space)
with(obj_game)
	{
	var _str="";
	repeat( irandom_range(4,20) )
		{
		repeat(4)
			_str+=string(ds_list_size(dw_list));
		_str+=" ";
		}
	scr_dw_dialoge_create(_str);
	}
#endregion



}
#endregion