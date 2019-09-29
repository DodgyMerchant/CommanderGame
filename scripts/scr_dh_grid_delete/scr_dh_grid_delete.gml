/// @func scr_dh_grid_delete(grid, index, w/h);
/// @desc deletes a row/column of data and then resizes
/// @arg {real} grid		id
/// @arg {real} index		the index of the column or row to delete
/// @arg {real} w/h			type of index given. should it copy verticly or horisontally. 1=w  0=h
/// @arg {real} howmuch		how many rows/columns should be removed

/*
EXPLAINATION

depending of the type of the index given the script hopies everything
down the list the numbers of slots to remove up.
so that effectively the not needed cells are now replaced by the lower ones

then it resizes so that the duplicate cells at the end are cut off
*/

/*
argument0	  //grid
argument1	  //index
argument2	  //w/h
argument3	  //howmuch
*/

//given width
if argument2
for (var i=argument1;i<ds_grid_width(argument0)-argument3;i++)
	{
	for (var ii=0;ii<ds_grid_height(argument0);ii++)
		argument0[# i,ii]=argument0[# i+argument3,ii];
	}
//given height
else
for (var i=argument1;i<ds_grid_height(argument0)-argument3;i++)
	{
	for (var ii=0;ii<ds_grid_width(argument0);ii++)
		argument0[# ii,i]=argument0[# ii,i+argument3];
	}

//resize
var _w=ds_grid_width(argument0)-argument2*argument3;
var _h=ds_grid_height(argument0)-!argument2*argument3;
ds_grid_resize(argument0,max(1,_w),max(1,_h));

//resize is <=0 returns true
if _w<=0 or _h<=0
	return true;