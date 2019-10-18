/// @desc 


/*
TO DO NOW:

pre:
700fps
104 swaps
110 swaps

after:




*/

#region start

//room_width=camera_get_view_width(view_camera[0]);
//room_height=camera_get_view_height(view_camera[0]);


#endregion
#region general



#endregion
#region input

//repeated input
input_repetition_timer=5;//after how many frames pressing the input ut starts to get repeated
input_repetition_freq=2;//how many frames delay there is after each repetition

#endregion
#region mission

mission_start=current_time;//start time
mission_time=current_time - mission_start;// passed time
mission_time_string=scr_timeconvert(mission_time);// "00:00:00"  shows the passed mission time

#endregion
#region select

select_list=ds_list_create();//list of selected instances

select_start_x=0;
select_start_y=0;
select_x1=-1;//cells selected in the operational window
select_y1=-1;
select_x2=-1;
select_y2=-1;

#endregion

#region UI elements
#region general

global.Alpha_master=1;
crt_color=c_lime;

UI_element_sep_w = 10;
UI_element_sep_h = 10;

frame_sep_w=10;	//seperation of the frame from the window border
frame_sep_h=10;
frame_sep2_w=10;//seperation to the sides of the right frame
frame_sep2_h=10;//seperation to the sides of the bottom frame

frame_alpha=0.2;//alpha of the frame

UI_element_window_sep_w = frame_sep_w + frame_sep2_w;
UI_element_window_sep_h = frame_sep_h + frame_sep2_h;

#endregion
#region pointer

//pointer_line_w = 1;	//width of the line //not used
pointer_alpha_norm=0.3;
pointer_alpha_ow=0.7;
pointer_alpha_ow_move=0.5;


//unused striped pointer vars
/*
pointer_line_part_leng=4;	//for a striped pointer
pointer_line_sep_leng=4;	//for a striped pointer
*/


#endregion
#region operational window
//the window in which the map will be shown

ow_mouse_active=false;

//grid
ow_grid_dead_size=5;//5	//size of dead space in the window
ow_grid_cell_size=30;//size of the displayed cells in pixels // 1x1
ow_grid_cell_dead_size=4;//4	//dead space of the inner cell to the outer cell
ow_grid_cell_display_w=7;//displayed cells horizontally
ow_grid_cell_display_h=7;//displayed cells vertically
ow_grid=ds_grid_create(room_width div MAP_CELL_SIZE,room_height div MAP_CELL_SIZE);// 50 50
ow_grid_x=0;	//the cell index displayed in the top right //the coordinates of the map on the field
ow_grid_y=0;	//the cell index displayed in the top right

//input
ow_mouse_grab_x=-1; //map movement with mouse
ow_mouse_grab_y=-1;

//size & pos

ow_w = ow_grid_cell_display_w * ow_grid_cell_size + ow_grid_dead_size*2;	//width of the window
ow_h = ow_grid_cell_display_h * ow_grid_cell_size + ow_grid_dead_size*2;	//height of the window

ow_x = camera_get_view_width(view_camera[0]) - frame_sep_w - frame_sep2_w - ow_w;	//x pos of the window
ow_y = camera_get_view_height(view_camera[0]) - frame_sep_h - frame_sep2_h - ow_h;	//x pos of the window

//alpha
ow_frame_alpha=0.7;
ow_grid_alpha=0.2;
ow_grid_border_alpha=0.5;
ow_grid_select_alpha_max=0.6;
ow_grid_select_alpha_min=0.4;
ow_grid_select_alpha_speed=1;
ow_grid_cell_alpha=0.05;
ow_grid_cell_select_alpha_max=0.3;
ow_grid_cell_select_alpha_min=0.1;
ow_grid_cell_select_alpha_speed=1;


#endregion
#region dialogue window

//!!width fit the window
dw_frame_alpha=0.5;	//
dw_fill_alpha=0.5;	//the rec that fills the frame
dw_index=0; //which dialogue message is focused
dw_font= fn_normal;
var _dw_row_number = 6;//numer of indexes to display

draw_set_font(dw_font);
dw_height = string_height("A")*_dw_row_number;

//system
dw_list=ds_list_create();
dw_list[| 0]=-1;


#region enums

enum DW_LIST
	{
	text,
	time,
	HEIGHT
	}

#endregion


#endregion
#endregion
#region map conversion

#macro MAP_CELL_SIZE 16	//size of the cells on the room editor map || used for room to map translation






#endregion

#region test

var _w,_h;
_w=ds_grid_width(ow_grid);
_h=ds_grid_height(ow_grid);

for (var i=0;i<_w;i++)
for (var ii=0;ii<_h;ii++)
	{
	ow_grid[# i,ii]=i+ii;
	}


#endregion