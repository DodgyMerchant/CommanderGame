/// @desc 

/*
TO DO NOW:

pre:
700fps
104 swaps
110 swaps

after:


*/
_cam_w=camera_get_view_width(view_camera[0]);
_cam_h=camera_get_view_height(view_camera[0]);


#region start



#endregion
#region general



#endregion
#region input

//repeated input
input_repetition_timer=5;//after how many frames pressing the input ut starts to get repeated
input_repetition_freq=2;//how many frames delay there is after each repetition

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
#region map


//#macro MAP_CELL_SIZE 16	//size of the cells on the room editor map || used for room to map translation
//var _map_w = room_width div MAP_CELL_SIZE;//mapsize related to room size
//var _map_h = room_height div MAP_CELL_SIZE;
var _map_w = 20;
var _map_h = 20;

//former ow_grid
map_grid=ds_grid_create(_map_w,_map_h);// 50 50

ds_grid_set_region(map_grid,0,0,ds_grid_width(map_grid),ds_grid_height(map_grid),MAP_INDEX.nothing);

#endregion
#region Entity System

es_grid = ds_grid_create(1,ES_INDEX.HEIGHT);
es_grid[# 0,0]=-1;






#endregion
#region UI elements
#region UI general

global.Alpha_master=1;
global.Color_CRT=c_lime;
global.Color_BAD=c_red;
draw_set_font(fn_normal);
global.Font_H=string_height("A");

#macro UI_GENERAL_SEP 10
#macro UI_GENERAL_PAD 4
#macro UI_GENERAL_FRAME_A 0.5
#macro UI_GENERAL_FILL_A 0.1

frame_sep_w=UI_GENERAL_SEP;	//seperation of the frame from the window border
frame_sep_h=UI_GENERAL_SEP;
frame_sep2_w=UI_GENERAL_SEP;//seperation to the sides of the right frame
frame_sep2_h=UI_GENERAL_SEP;//seperation to the sides of the bottom frame

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


//make grid and set to nothing
ow_grid=ds_grid_create(ds_grid_width(map_grid),ds_grid_height(map_grid));
ds_grid_set_region(ow_grid,0,0,ds_grid_width(ow_grid)-1,ds_grid_height(ow_grid)-1,OW_INDEX.nothing);

ow_mouse_active=false;
ow_grid_dead_size=UI_GENERAL_PAD + 1 ;//5	//size of dead space in the window //1 for the 1pixel border line
ow_grid_cell_size=30;//size of the displayed cells in pixels // 1x1
ow_grid_cell_dead_size=UI_GENERAL_PAD;//4	//dead space of the inner cell to the outer cell
ow_grid_cell_display_w=7;//displayed cells horizontally
ow_grid_cell_display_h=7;//displayed cells vertically
ow_grid_x=0;	//the cell index displayed in the top right //the coordinates of the map on the field
ow_grid_y=0;	//the cell index displayed in the top right
ow_grid_stage_interval=5;	//the intervall in which stage lines will be drawn for use orientation

//input
ow_mouse_grab_x=-1; //map movement with mouse
ow_mouse_grab_y=-1;

//size & pos

ow_w = ow_grid_cell_display_w * ow_grid_cell_size + ow_grid_dead_size*2;	//width of the window
ow_h = ow_grid_cell_display_h * ow_grid_cell_size + ow_grid_dead_size*2;	//height of the window

ow_x = _cam_w - frame_sep_w - frame_sep2_w - ow_w;	//x pos of the window
ow_y = _cam_h - frame_sep_h - frame_sep2_h - ow_h;	//y pos of the window

//alpha
ow_frame_alpha=UI_GENERAL_FRAME_A;
ow_grid_alpha=0.2;//normal grid line alpha
ow_grid_alpha_stage=0.25;//alpha added for each stage //5   10,50,100
ow_grid_border_alpha=0.5;//alpha of the border lines // lines at the edge of the map
ow_grid_select_alpha_max=0.6;//selected space edge line alpha fluctuation
ow_grid_select_alpha_min=0.4;
ow_grid_select_alpha_speed=1;//sepeed of fluc
ow_grid_cell_alpha=UI_GENERAL_FILL_A;//0.05   alpha of fill
ow_grid_cell_select_alpha_max=0.3;//selected cell fill alpha fluctuation
ow_grid_cell_select_alpha_min=0.1;

ow_grid_select_alpha_speed=1;//in seconds
ow_grid_select_alpha_start=0;//holds the game time the alpha wave has to start

#endregion
#region dialogue window

//!!width fit the window
dw_frame_sep=UI_GENERAL_PAD;
dw_frame_alpha=UI_GENERAL_FRAME_A;	//
dw_fill_alpha=UI_GENERAL_FILL_A;	//the rec that fills the frame
dw_font= fn_normal;//font used in the dialogue window
dw_end_phrase="END OF LOG";//the phrase shown at the top of the log
dw_end_decor="/";//the decore chars displayed with the phrase
dw_index=0; //which dialogue message is focused
dw_line_sep=1;//seperation between the lines of text
dw_line_number = 6;//numer of indexes to display


dw_height = global.Font_H*dw_line_number + dw_frame_sep*2 + dw_line_sep*(dw_line_number-1);

//system
dw_list=ds_list_create();

//
dw_notify_num = 2;
dw_notify_duration = audio_sound_length(snd_notification)/dw_notify_num;//in seconds || 0.5
dw_notify_count=0;
dw_notify_start=0;//holds the game time the wave is suposed to start

#region enums

enum DW_LIST_INDEX
	{
	text,
	type,
	val,
	HEIGHT
	}

#endregion


#endregion
#region status window

sw_frame_alpha = UI_GENERAL_FRAME_A;
sw_fill_alpha = UI_GENERAL_FILL_A;

sw_x = ow_x;
sw_y = frame_sep_h + frame_sep2_h;
sw_w = ow_w;
sw_h = ow_y - UI_GENERAL_SEP - sw_y;






#endregion
#endregion
#region mission
//general
mission_start=current_time;//start time
mission_time=current_time - mission_start;// passed time
mission_time_string=scr_timeconvert(mission_time);// "00:00:00"  shows the passed mission time











#endregion
#region enums

//used in the map grid | map_grid
enum MAP_INDEX  
	{
	nothing=-1
	//anything else would be an entity,objekt,other...
	}

//used only in the ow_grid
enum OW_INDEX
	{
	nothing,
	friendly,
	enemy,
	objekt,
	building
	}

//types of data the enteties have
enum ES_INDEX
	{
	pos_x,		//grid position x
	pos_y,		//grid position y
	name,		//name of the entity
	alignment,
	hp,			//physical hp
	stability,	//mental hp
	inventory,	//a list/grid that halds the inventory
	speed,
	HEIGHT
	}

//types of entity alignment
enum ALIGN_INDEX
	{
	order,
	chaos,
	rogue
	}

#endregion

#region test
//fill with placeholder text
repeat (3)
	scr_dw_dialoge_create(test_placeh_text_gen(3,6,4,string(ds_list_size(dw_list))),0,0);


//spawn test entities
scr_es_entity_create(0,0,"Test1",ALIGN_INDEX.order,10,10,-1,1);
scr_es_entity_create(1,1,"Test2",ALIGN_INDEX.chaos,10,10,-1,1);

#endregion