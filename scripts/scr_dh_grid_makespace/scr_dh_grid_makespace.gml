/// @func scr_dh_grid_makespace(grid, index, w/h, howmuch);
/// @desc makes space at the given index. like moses parted the sea. so will it the grid.
/// @arg {real} grid		into
/// @arg {real} index		to insert at
/// @arg {real} w/h			type of index given. should it copy verticly (true) or horisontally (false).
/// @arg {real} howmuch		how many rows/columns should be created

// the data in the index and below is lowered down by 1


/*
argument0
argument1
argument2
argument3
*/

//resize
ds_grid_resize(argument0,ds_grid_width(argument0)+argument2*argument3,ds_grid_height(argument0)+!argument2*argument3);

//moved

//if given a width index
if argument2
//starts at the bottom and works till (including) the given index
for (var i=ds_grid_width(argument0)-1;i>argument1+(argument3-1);i--)
	{
	for (var ii=0;ii<ds_grid_height(argument0);ii++)
	//   to				from
	argument0[# i,ii]=argument0[# i-argument3,ii];
	}

//if given a height index
else	// !argument2
for (var i=ds_grid_height(argument0)-1;i>argument1+(argument3-1);i--)
	{
	for (var ii=0;ii<ds_grid_width(argument0);ii++)
	//   to				from
	argument0[# ii,i]=argument0[# ii,i-argument3];
	}


//new region cleared
if argument2
	ds_grid_set_region(argument0, argument1, 0, argument1+(argument3-1), ds_grid_height(argument0), 0);
else
	ds_grid_set_region(argument0, 0, argument1, ds_grid_width(argument0), argument1+(argument3-1), 0);