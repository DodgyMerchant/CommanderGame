/// @desc 

if (live_call()){
	return live_result;
	}


/*
 * global.Alpha_master


*/

var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);


draw_set_color(crt_color);

#region frame

draw_set_alpha(frame_alpha * global.Alpha_master);
draw_rectangle(0+frame_sep_w,0+frame_sep_h,_view_w-frame_sep_w,_view_h-frame_sep_h,true);



#endregion
#region operational window
//draws everything in the OW

/*
UI_element_sep_w
UI_element_sep_w
UI_element_window_sep_w
UI_element_window_sep_h
*/

//frame
draw_set_alpha(ow_frame_alpha * global.Alpha_master);
draw_rectangle(ow_x,ow_y,ow_x+ow_w,ow_y+ow_h,true);

var _x,_y;
var _cell_num_w=(ow_w - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _cell_num_h=(ow_h - ow_grid_dead_size*2) / ow_grid_cell_size;//number of cells that can be displayed w
var _grid_w=ds_grid_width(ow_grid);
var _grid_h=ds_grid_height(ow_grid);

/*
select_x1
select_y1
select_x2
select_y2
*/

#region lines

//select positions relative to the grid position
var _x1=select_x1-ow_grid_x;
var _y1=select_y1-ow_grid_y;
var _x2=select_x2-ow_grid_x;
var _y2=select_y2-ow_grid_y;


//vert lines
for (var i= ow_grid_x!=0;i<_cell_num_w + (ow_grid_x==(_grid_w-_cell_num_w));i++)
	{
	//select alpha
	//sonething selected  &  edges of selected region
	if select_x1!=-1 and (i == _x1 or i == _x2+1)
		draw_set_alpha(scr_wave(ow_grid_select_alpha_max, ow_grid_select_alpha_min, ow_grid_select_alpha_speed, 0) * global.Alpha_master);
	//border alpha
	else if i==0 or i==_cell_num_w
		draw_set_alpha(ow_grid_border_alpha * global.Alpha_master);//border alpha
	//else alpha
	else
		draw_set_alpha(ow_grid_alpha * global.Alpha_master);
	
	_x=ow_x + ow_grid_cell_size * i + ow_grid_dead_size;
	draw_line(_x,ow_y+ow_grid_dead_size,_x,ow_y+ow_h-ow_grid_dead_size);//vert lines
	}



//hor lines
for (var i= ow_grid_y!=0;i<_cell_num_h + (ow_grid_y==(_grid_h-_cell_num_h));i++)
	{
	//select alpha
	//sonething selected  &  edges of selected region
	if select_x1!=-1 and (i == _y1 or i == _y2+1)
		draw_set_alpha(scr_wave(ow_grid_select_alpha_max, ow_grid_select_alpha_min, ow_grid_select_alpha_speed, 0) * global.Alpha_master);
	//border alpha
	else if i==0 or i==_cell_num_h
		draw_set_alpha(ow_grid_border_alpha * global.Alpha_master);//border alpha
	//else alpha
	else
		draw_set_alpha(ow_grid_alpha * global.Alpha_master);
	
	_y=ow_y + ow_grid_cell_size * i + ow_grid_dead_size;
	draw_line(ow_x+ow_grid_dead_size,_y,ow_x+ow_w-ow_grid_dead_size,_y);//vert lines
	}

#endregion
#region grid content

//go through the displayed cells
for (var i=0;i<_cell_num_w;i++)
for (var ii=0;ii<_cell_num_h;ii++)
	{
	//get alpha
	//if ow_grid_cell_select_x == ow_grid_x+i and ow_grid_cell_select_y == ow_grid_y+ii
	if point_in_rectangle(ow_grid_x+i,ow_grid_y+ii,select_x1,select_y1,select_x2,select_y2)
		draw_set_alpha(scr_wave(ow_grid_cell_select_alpha_max, ow_grid_cell_select_alpha_min, ow_grid_cell_select_alpha_speed, 0) * global.Alpha_master);
	else
		draw_set_alpha(ow_grid_cell_alpha * global.Alpha_master);
	
	//get positions
	var _x=ow_x+ow_grid_dead_size + i*ow_grid_cell_size + ow_grid_cell_dead_size;
	var _y=ow_y+ow_grid_dead_size + ii*ow_grid_cell_size + ow_grid_cell_dead_size;
	draw_rectangle(_x,_y,_x+ow_grid_cell_size-ow_grid_cell_dead_size*2,_y+ow_grid_cell_size-ow_grid_cell_dead_size*2,0);//draw rectangle
	
	
	
	//test
	draw_set_valign(0);
	draw_set_halign(0);
	draw_set_alpha(1);
	draw_text(_x,_y,ow_grid[# ow_grid_x+i,ow_grid_y+ii]);
	
	}



#endregion

#endregion
#region dialogue window

/*
UI_element_sep_w
UI_element_sep_h
UI_element_window_sep_w
UI_element_window_sep_h

ow_x
ow_y
*/
var _x1 = UI_element_window_sep_w;
var _x2 = ow_x - UI_element_sep_w;
var _y1 = _view_h - UI_element_window_sep_h - dw_height;
var _y2 = _view_h - UI_element_window_sep_h;



scr_drawbetter_line(_x1,_y1,_x2,_y2,crt_color,dw_base_alpha*global.Alpha_master);


//test
draw_set_alpha(0.3);
draw_line(_x1,_y1,_x2,_y2);
draw_set_alpha(1);

#endregion
#region status window




#endregion
#region pointer

if ow_mouse_active// and point_in_rectangle(mouse_x,mouse_y,ow_x + ow_grid_dead_size,ow_y + ow_grid_dead_size,ow_x + ow_w - ow_grid_dead_size,ow_y + ow_h - ow_grid_dead_size)
	{
	//in OW
	if ow_mouse_grab_x==-1
		draw_set_alpha(pointer_alpha_ow * global.Alpha_master);
	else
		draw_set_alpha(pointer_alpha_ow_move * global.Alpha_master);

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
		draw_line_width(ow_x + ow_grid_dead_size,mouse_y,ow_x + ow_w - ow_grid_dead_size,mouse_y,pointer_line_w);
	//vertical
	if mouse_x>ow_x + ow_grid_dead_size and mouse_x<ow_x + ow_w - ow_grid_dead_size
		draw_line_width(mouse_x,ow_y + ow_grid_dead_size,mouse_x,ow_y + ow_h - ow_grid_dead_size,pointer_line_w);
	}
else
	{
	//normal
	draw_set_alpha(pointer_alpha_norm * global.Alpha_master);
	draw_line_width(0,mouse_y,_view_w,mouse_y,pointer_line_w);
	draw_line_width(mouse_x,0,mouse_x,_view_h,pointer_line_w);
	}
#endregion