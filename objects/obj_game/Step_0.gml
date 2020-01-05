/// @desc 



var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);

#region input

var _input_mouse_l		= mouse_check_button(mb_left)
var _input_mouse_l_p	= mouse_check_button_pressed(mb_left)
var _input_mouse_l_r	= mouse_check_button_released(mb_left)
var _input_mouse_r		= mouse_check_button(mb_right)
var _input_mouse_r_p	= mouse_check_button_pressed(mb_right)
var _input_mouse_r_r	= mouse_check_button_released(mb_right)

var _input_left	= mouse_check_button(vk_left);
var _input_left_p	= keyboard_check_pressed(vk_left);
var _input_right	= mouse_check_button(vk_right);
var _input_right_p	= keyboard_check_pressed(vk_right);
var _input_down	= mouse_check_button(vk_down);
var _input_down_p	= keyboard_check_pressed(vk_down);
var _input_up		= mouse_check_button(vk_up);
var _input_up_p	= keyboard_check_pressed(vk_up);

var _input_shift	= keyboard_check(vk_shift);
var _input_shift_p	= keyboard_check_pressed(vk_shift);
var _input_shift_r	= keyboard_check_released(vk_shift);
var _input_ctrl	= keyboard_check(vk_control);
var _input_alt		= keyboard_check(vk_alt);

var _input_arrow_any=_input_left+_input_left_p+_input_right+_input_right_p+_input_down+_input_down_p+_input_up+_input_up_p;

var _input_mouse_w = mouse_wheel_down() - mouse_wheel_up();

#endregion
#region mission

//passed time   updating time
mission_time=current_time - mission_start;// passed time
mission_time_string=scr_timeconvert(mission_time);// "00:00:00"  shows the passed mission time


#endregion
#region Operation Window Input

#region INFO
/*
mod keys:
ctrl	modify funktion
shift	marking stuff
alt		alternate funktion

--------keyboard map funktions:-------------|--------keys-------|---input type------|------done------
											|					|					|
normal move									|	only arrow keys	|					|	done
cell snap to frame							|	ctrl			|	hold			|	done
map move									|	alt				|	hold			|	done
map move by window							|	alt + ctrl		|	hold			|	
select this instance						|	shift			|	tap				|	
select										|	shift			|	hold			|	
											|					|					|
---------keyboard map controll ideas:-------|--------keys-------|---input type------|
											|					|					|
snap to nearest unit/cycle					|	shift + alt		|	tap				|


alt + ctrl		taken by screen rotate


*/
#endregion

var _cell_num_w=(ow_w - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _cell_num_h=(ow_h - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _grid_w=ds_grid_width(map_grid);
var _grid_h=ds_grid_height(map_grid);

#region select general

if _input_shift_p //start select
	{
	ds_list_clear(select_list);
	
	}
else if _input_shift_r//end select
	{
	
	}

#endregion
#region mouse input
/*
ow_mouse_grab_x
ow_mouse_grab_y

select_x1
select_y1
select_x2
select_y2

*/

if point_in_rectangle(mouse_x,mouse_y,ow_x,ow_y,ow_x+ow_w,ow_y+ow_h)
	{
	ow_mouse_active=true;
	window_set_cursor(cr_none);
	}
else
	{
	ow_mouse_active=false;
	window_set_cursor(cr_default);
	}

//if in OW or moving the map
if ow_mouse_active or (ow_mouse_grab_x!=-1 and ow_mouse_grab_y!=-1)
	{
	#region select
	if _input_mouse_l_p
		{
		select_x1 = (mouse_x - ow_x - ow_grid_dead_size) div ow_grid_cell_size + ow_grid_x;
		select_y1 = (mouse_y - ow_y - ow_grid_dead_size) div ow_grid_cell_size + ow_grid_y;
		
		select_x2=select_x1;
		select_y2=select_y1;
		
		//set start for field creation
		select_start_x=select_x1;
		select_start_y=select_y1;
		
		//start alpha wave
		ow_grid_select_alpha_start = current_time;
		}
	if _input_mouse_l
		{
		var _x = (mouse_x - ow_x - ow_grid_dead_size) div ow_grid_cell_size + ow_grid_x;
		var _y = (mouse_y - ow_y - ow_grid_dead_size) div ow_grid_cell_size + ow_grid_y;
		
		//create field
		if _x<=select_start_x//left
		select_x1=_x;
		if _x>=select_start_x//right
		select_x2=_x;
		if _y<=select_start_y//up
		select_y1=_y;
		if _y>=select_start_y//down
		select_y2=_y;
		}
	#endregion
	#region move
	if _input_mouse_r
		{
		if _input_mouse_r_p
			{
			ow_mouse_grab_x=(mouse_x-ow_x-ow_grid_dead_size) div ow_grid_cell_size + ow_grid_x;
			ow_mouse_grab_y=(mouse_y-ow_y-ow_grid_dead_size) div ow_grid_cell_size + ow_grid_y;
			}
		if _input_mouse_r
			{
			var _x = (mouse_x-ow_x-ow_grid_dead_size) div ow_grid_cell_size;
			var _y = (mouse_y-ow_y-ow_grid_dead_size) div ow_grid_cell_size;
			ow_grid_x= clamp(ow_mouse_grab_x - _x,0,_grid_w-_cell_num_w);
			ow_grid_y= clamp(ow_mouse_grab_y - _y,0,_grid_h-_cell_num_h);
			}
		}
	else if _input_mouse_r_r
			{
			ow_mouse_grab_x=-1;
			ow_mouse_grab_y=-1;
			}
	#endregion
	}

#endregion
#region keyboard input

/*
_input_shift
_input_ctrl
_input_alt
*/
#region input machine

/*
generates repeated inputs

_input_left
_input_left_p
_input_right
_input_right_p
_input_down
_input_down_p
_input_up
_input_up_p

input_repetition_timer
input_repetition_freq

*/




var _ow_input_w = _input_right_p - _input_left_p;
var _ow_input_h = _input_down_p - _input_up_p;





#endregion
/*
select_x1
select_y1
select_x2
select_y2
*/
//arrow key movement
if _input_arrow_any//may need repositioning
if _input_alt //move map
	{
	#region by one panel
	if _input_ctrl//modify
		{
		//move map by one panel
		}
	#endregion
	#region normal
	else//normal
		{
		//move map normal
		ow_grid_x=clamp(ow_grid_x+_ow_input_w,0,_grid_w-_cell_num_w);
		ow_grid_y=clamp(ow_grid_y+_ow_input_h,0,_grid_h-_cell_num_h);
		
		//moving selected
		select_x1=clamp(select_x1+_ow_input_w,0,_grid_w-1);
		select_y1=clamp(select_y1+_ow_input_h,0,_grid_h-1);
		select_x2=select_x1;
		select_y2=select_y1;
		}
	#endregion
	}
else //move select
	{
	#region snap to frame
	if _input_ctrl//modify
		{
		//cell snap to frame
		if _ow_input_w!=0
			select_x1=_input_right_p * (_cell_num_w-1) + ow_grid_x;
		if _ow_input_h!=0
			select_y1=_input_down_p * (_cell_num_h-1) + ow_grid_y;
		
		select_x2=select_x1;
		select_y2=select_y1;
		}
	#endregion
	#region normal
	else//norm movement
		{
		//norm movement
		select_x1=clamp(select_x1+_ow_input_w,0,_grid_w-1);
		select_y1=clamp(select_y1+_ow_input_h,0,_grid_h-1);
		
		//move cam a bit
		if select_x1<ow_grid_x					//left
			ow_grid_x=clamp(ow_grid_x-1,0,_grid_w-_cell_num_w);
		if select_x1>=ow_grid_x+_cell_num_w		//right
			ow_grid_x=clamp(ow_grid_x+1,0,_grid_w-_cell_num_w);
		if select_y1<ow_grid_y					//up
			ow_grid_y=clamp(ow_grid_y-1,0,_grid_h-_cell_num_h);
		if select_y1>=ow_grid_y+_cell_num_h		//down
			ow_grid_y=clamp(ow_grid_y+1,0,_grid_h-_cell_num_h);
		
		select_x2=select_x1;
		select_y2=select_y1;
		}
	#endregion
	}

#endregion
#endregion
#region dialogue window

var _x1 = UI_element_window_sep_w;
var _x2 = ow_x - UI_GENERAL_SEP;
var _y1 = _view_h - UI_element_window_sep_h - dw_height;
var _y2 = _view_h - UI_element_window_sep_h;

//mouse in dialogue window
if point_in_rectangle(mouse_x,mouse_y,_x1,_y1,_x2,_y2)
	{
	//moue idex scrolling
	if _input_mouse_w!=0
		dw_index = clamp(dw_index - _input_mouse_w,0,max(0,ds_list_size(dw_list)-1));
	}

//frame blink
if dw_notify_count>0
	dw_notify_count=max(0,dw_notify_count-1);
	

#endregion
