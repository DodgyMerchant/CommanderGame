/// @desc 




/*
 * global.Alpha_master


*/

var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);


//draw_set_color(c_red);
draw_set_color(global.Color_CRT);
//global.Color_CRT

#region frame

scr_drawbetter_frame(0+frame_sep_w,0+frame_sep_h,_view_w-frame_sep_w,_view_h-frame_sep_h,global.Color_CRT,frame_alpha * global.Alpha_master,1);

#endregion
#region operational window
//draws everything in the OW


//frame
scr_drawbetter_frame(ow_x,ow_y,ow_x+ow_w,ow_y+ow_h,global.Color_CRT,ow_frame_alpha * global.Alpha_master,1);

var _x,_y;
var _cell_num_w=(ow_w - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _cell_num_h=(ow_h - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _grid_w=ds_grid_width(map_grid);
var _grid_h=ds_grid_height(map_grid);

/*
select_x1
select_y1
select_x2
select_y2
*/
var _x1=select_x1-ow_grid_x;
var _y1=select_y1-ow_grid_y;
var _x2=select_x2-ow_grid_x;
var _y2=select_y2-ow_grid_y;
var _alpha; // _alpha = 

#region lines

//select positions relative to the grid position


//wave alpha progress
var _prog = (current_time-ow_grid_select_alpha_start)*0.001 / ow_grid_select_alpha_speed;
var _stage = false;

#region vert lines OLD
/*
for (var i= ow_grid_x!=0;i<_cell_num_w + (ow_grid_x==(_grid_w-_cell_num_w));i++)
	{
	#region get alpha
	//sonething selected  &  edges of selected region
	if select_x1!=-1 and (i == _x1 or i == _x2+1)
		_alpha = ow_grid_select_alpha_min + scr_wave2(ow_grid_select_alpha_max - ow_grid_select_alpha_min,_prog) * global.Alpha_master;
	//border alpha
	else if i==0 or i==_cell_num_w
		_alpha = ow_grid_border_alpha * global.Alpha_master;//border alpha
	//else alpha
	else
		{
		_alpha = ow_grid_alpha * global.Alpha_master;
		//stage alpha
		if ((ow_grid_x+i) % ow_grid_stage_interval)==0
			{
			_alpha+=ow_grid_alpha_stage;
			}
		}
	#endregion
	
	//get x
	_x=ow_x + ow_grid_cell_size * i + ow_grid_dead_size;
	scr_drawbetter_line(_x,ow_y+ow_grid_dead_size,_x,ow_y+ow_h-ow_grid_dead_size,global.Color_CRT,_alpha);//vert lines
	}*/
#endregion
#region vert lines
for (var i= ow_grid_x!=0;i<_cell_num_w + (ow_grid_x==(_grid_w-_cell_num_w));i++)
	{
	//if line is a stage line
	_stage = ((ow_grid_x+i) % ow_grid_stage_interval)==0;
	
	#region get alpha
	//sonething selected  &  edges of selected region
	if select_x1!=-1 and (i == _x1 or i == _x2+1)
		_alpha = ow_grid_select_alpha_min + scr_wave2(ow_grid_select_alpha_max - ow_grid_select_alpha_min,_prog) * global.Alpha_master;
	//border alpha
	else if i==0 or i==_cell_num_w
		_alpha = ow_grid_border_alpha * global.Alpha_master;//border alpha
	//else alpha
	else
		{
		//normal alpha or stage1
		_alpha = ow_grid_alpha + (_stage * ow_grid_alpha_stage) * global.Alpha_master;
		
		}
	#endregion
	
	//get x
	_x=ow_x + ow_grid_cell_size * i + ow_grid_dead_size;
	scr_drawbetter_line(_x,ow_y+ow_grid_dead_size,_x,ow_y+ow_h-ow_grid_dead_size,global.Color_CRT,_alpha);//vert lines
	}
#endregion
#region hor lines
for (var i= ow_grid_y!=0;i<_cell_num_h + (ow_grid_y==(_grid_h-_cell_num_h));i++)
	{
	#region get alpha
	//sonething selected  &  edges of selected region
	if select_x1!=-1 and (i == _y1 or i == _y2+1)
		_alpha = ow_grid_select_alpha_min + scr_wave2(ow_grid_select_alpha_max - ow_grid_select_alpha_min,_prog) * global.Alpha_master;
	//border alpha
	else if i==0 or i==_cell_num_h
		_alpha = ow_grid_border_alpha * global.Alpha_master;//border alpha
	//else alpha
	else
		{
		_alpha = ow_grid_alpha * global.Alpha_master;
		//stage alpha
		if ((ow_grid_y+i) % ow_grid_stage_interval)==0
			{
			_alpha+=ow_grid_alpha_stage;
			}
		}
	#endregion
	
	//get y
	_y=ow_y + ow_grid_cell_size * i + ow_grid_dead_size;
	scr_drawbetter_line(ow_x+ow_grid_dead_size,_y,ow_x+ow_w-ow_grid_dead_size,_y,global.Color_CRT,_alpha);//vert lines
	}
#endregion

#endregion
#region grid content

//test
draw_set_alpha(1);
draw_set_font(fn_debug);

//go through the displayed cells
for (var i=0;i<_cell_num_w;i++)
for (var ii=0;ii<_cell_num_h;ii++)
	{
	//get alpha
	//if ow_grid_cell_select_x == ow_grid_x+i and ow_grid_cell_select_y == ow_grid_y+ii
	if point_in_rectangle(ow_grid_x+i,ow_grid_y+ii,select_x1,select_y1,select_x2,select_y2)
		_alpha = ow_grid_cell_select_alpha_min + scr_wave2(ow_grid_cell_select_alpha_max - ow_grid_cell_select_alpha_min,_prog) * global.Alpha_master;
	else
		_alpha = ow_grid_cell_alpha * global.Alpha_master;
	
	//cell (filler)
	var _x1=ow_x+ow_grid_dead_size + i*ow_grid_cell_size + ow_grid_cell_dead_size;//get positions
	var _y1=ow_y+ow_grid_dead_size + ii*ow_grid_cell_size + ow_grid_cell_dead_size;//get positions
	var _x2=_x1+ow_grid_cell_size-ow_grid_cell_dead_size*2;
	var _y2=_y1+ow_grid_cell_size-ow_grid_cell_dead_size*2;
	scr_drawbetter_rec(_x1,_y1,_x2,_y2,global.Color_CRT,_alpha);//draw rectangle
	
	//draw ow_grid content
	
	var _xm = _x1+(_x2-_x1)/2;
	var _ym = _y1+(_y2-_y1)/2;
	#region type switch
	switch (ow_grid[# ow_grid_x+i,ow_grid_y+ii])
		{
		case OW_INDEX.nothing:
		break;
		#region friendly
		case OW_INDEX.friendly:
			scr_draw_color(global.Color_CRT);
			scr_draw_alpha(1);
			draw_circle(_xm,_ym,ow_grid_cell_size/2 - ow_grid_cell_dead_size,false);
		break;
		#endregion
		#region enemy
		case OW_INDEX.enemy:
			scr_draw_color(global.Color_BAD);
			scr_draw_alpha(1);
			draw_circle(_xm,_ym,ow_grid_cell_size/2 - ow_grid_cell_dead_size,false);
		break;
		#endregion
		case OW_INDEX.objekt:
		break;
		case OW_INDEX.building:
		break;
		}
	#endregion
	
	
	
	
	//test draw grid content
	if global.debug
		{
		
		scr_draw_color(global.Color_CRT);
		draw_set_valign(0);draw_set_halign(0);
		draw_text(_x1,_y1,ow_grid[# ow_grid_x+i,ow_grid_y+ii]);
		draw_set_valign(2);draw_set_halign(2);
		draw_text(_x2,_y2,map_grid[# ow_grid_x+i,ow_grid_y+ii]);
		}
	}

#endregion

#endregion
#region dialogue window


var _x1 = UI_element_window_sep_w;
var _x2 = ow_x - UI_GENERAL_SEP;
var _y1 = _view_h - UI_element_window_sep_h - dw_height;
var _y2 = _view_h - UI_element_window_sep_h;

#region draw frame and fill


//frame
var _alpha=dw_frame_alpha;
if dw_notify_count!=0 //if blinking
	//blink wave
	_alpha*= scr_wave2(-1,(current_time-dw_notify_start)*0.001/dw_notify_duration)+1;
scr_drawbetter_frame(_x1,_y1,_x2,_y2,global.Color_CRT,_alpha*global.Alpha_master,1);

//fill
_x1 += dw_frame_sep;
_y1 += dw_frame_sep;
_x2 -= dw_frame_sep;
_y2 -= dw_frame_sep;
scr_drawbetter_rec(_x1,_y1,_x2,_y2,global.Color_CRT,dw_fill_alpha*global.Alpha_master);

#endregion
#region draw text
draw_set_valign(2);//bottom bound
draw_set_halign(0);
draw_set_alpha(1);
draw_set_font(dw_font);
scr_draw_color(global.Color_CRT);

if !ds_list_empty(dw_list)//check for empty
	{
	var _w = _x2-_x1;//width of the text box
	var _h = _y2;
	var _list,_str,_str_height,_str_height_ext;
	//loop
	//var _size=ds_list_size(dw_list);
	
	//display text
	//var i=(_size-1)-dw_index;
	var i=dw_index;
	var _line=0;
	while(_line<dw_line_number and i>=0)
		{
		//get list and stuff
		_list = dw_list[| i];
		_str = _list[| DW_LIST_INDEX.text];
		_str_height=global.Font_H+dw_line_sep;
		_str_height_ext=string_height_ext(_str,_str_height,_w)+dw_line_sep;
		
		_line+= _str_height_ext div _str_height;
		
		//draw string
		if _line-1<dw_line_number
			draw_text_ext(_x1,_h,_str,_str_height,_w);
			//draw_text_ext(_x1,_h,_str+"|"+string(_str_height)+"|"+string(_str_height_ext),_str_height,_w);
		//move height
		_h -= _str_height_ext;
		i--;
		}
	
	if i ==-1 and _line<dw_line_number//if list it at end
		{
		//display end phrase
		var _str="";
		var _phrase_w=string_width(dw_end_phrase);
		var _decor_w=string_width(dw_end_decor);
		var _decor_space=(_w-_phrase_w)/2;
		//gen decor
		repeat(_decor_space div _decor_w)
			{
			_str+=dw_end_decor;
			}
		//draw phrase and decor
		draw_text(_x1,_h,_str + dw_end_phrase + _str);
		}
	}
#endregion

#endregion
#region status window

scr_drawbetter_frame(sw_x,sw_y,sw_x+sw_w,sw_y+sw_h,global.Color_CRT,sw_frame_alpha,1);

//get usable space
var _x1=sw_x+UI_GENERAL_PAD;
var _y1=sw_y+UI_GENERAL_PAD;
var _x2=sw_x+sw_w-UI_GENERAL_PAD;
var _y2=sw_y+sw_h-UI_GENERAL_PAD
var _w=_x2-_x1;
var _h=_y2-_y1;


#region get info
//shape xy
var _sx=_x2 - sprite_get_width(spr_sw_BodyFull) - 1;
var _sy=_y1 + 1;
//background shape x
var _bsx = _sx - 1;//1 for distance to sprite
//shape line x
var _lsx= _bsx - UI_GENERAL_PAD;
//background name y2
var _bnx2 = _lsx - UI_GENERAL_PAD;
var _bny2 = _y1 + global.Font_H;
//line name
var _lny = _bny2 + UI_GENERAL_PAD;

#endregion
#region draw
#region back
//back shape
scr_drawbetter_rec(_bsx,_y1,_x2,_y2,global.Color_CRT,sw_fill_alpha);
//back name
scr_drawbetter_rec(_x1,_y1,_bnx2,_bny2,global.Color_CRT,sw_fill_alpha);

//back

#endregion
#region line
//line shape
scr_drawbetter_line(_lsx,sw_y+1,_lsx,sw_y+sw_h-1,global.Color_CRT,sw_frame_alpha);
//line name
scr_drawbetter_line(sw_x+1,_lny,_lsx,_lny,global.Color_CRT,sw_frame_alpha);

#endregion
#region special
//shape
draw_sprite_ext(spr_sw_BodyFull,0,_sx,_sy,1,1,0,global.Color_CRT,1);

#endregion
#endregion

#endregion
#region pointer

var _alpha;

if ow_mouse_active// and point_in_rectangle(mouse_x,mouse_y,ow_x + ow_grid_dead_size,ow_y + ow_grid_dead_size,ow_x + ow_w - ow_grid_dead_size,ow_y + ow_h - ow_grid_dead_size)
	{
	//in OW
	if ow_mouse_grab_x==-1
		_alpha = pointer_alpha_ow * global.Alpha_master;
	else
		_alpha = pointer_alpha_ow_move * global.Alpha_master;

	/*
	pointer_line_part_leng
	pointer_line_sep_leng
	
	mouse_x
	mouse_y
	ow_x + ow_grid_dead_size		//x1
	ow_y + ow_grid_dead_size		//y1
	ow_x + ow_w - ow_grid_dead_size	//x2
	ow_y + ow_h - ow_grid_dead_size	//y2
	*/
	//horizontal
	if mouse_y>ow_y + ow_grid_dead_size and mouse_y<ow_y + ow_h - ow_grid_dead_size
		scr_drawbetter_line(ow_x + ow_grid_dead_size,mouse_y,ow_x + ow_w - ow_grid_dead_size,mouse_y,global.Color_CRT,_alpha);
	//vertical
	if mouse_x>ow_x + ow_grid_dead_size and mouse_x<ow_x + ow_w - ow_grid_dead_size
		scr_drawbetter_line(mouse_x,ow_y + ow_grid_dead_size,mouse_x,ow_y + ow_h - ow_grid_dead_size,global.Color_CRT,_alpha);
	}
else
	{
	//normal
	_alpha = pointer_alpha_norm * global.Alpha_master;
	scr_drawbetter_line(0,mouse_y,_view_w,mouse_y,global.Color_CRT,_alpha);
	scr_drawbetter_line(mouse_x,0,mouse_x,_view_h,global.Color_CRT,_alpha);
	}
#endregion

draw_set_alpha(1);

var _x=50;
var _y=50;
var _w=100;
var _h=50;
scr_drawbetter_frame(_x,_y,_x+_w,_y+_h,global.Color_CRT,0.5,1);
scr_drawbetter_rec(_x,_y+_h,_x+_w,_y+_h*2,global.Color_CRT,0.5);
draw_set_color(c_red);
draw_point(_x+_w+1,_y);