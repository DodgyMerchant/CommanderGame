/// @func scr_dh_grid_switch(from_grid, to_grid, from_index, to_index,w/h);
/// @desc switches 2 w/h with each other  w (true)  h (false)
/// @arg {real} from_grid		the 1st grid id
/// @arg {real} to_grid			the 2nd grid id
/// @arg {real} from_index		from
/// @arg {real} to_index		to
/// @arg {real} w/h				type of index given. should it copy verticly or horisontally.

/*
argument0
argument1
argument2
argument3
argument4
*/
var _hold=0;
if argument4
	var _size=ds_grid_height(argument0);
else
	var _size=ds_grid_width(argument0);

for (var i=0;i<_size;i++)
	{
	if argument4
		{
		//saving copied to
		_hold=argument1[# argument3,i];
		//transfer
		argument1[# argument3,i]=argument0[# argument2,i];
		//pasting from save
		argument0[# argument2,i]=_hold;
		}
	else
		{
		//saving copied to
		_hold=argument1[# i,argument3];
		//transfer
		argument1[# i,argument3]=argument0[# i,argument2];
		//pasting from save
		argument0[# i,argument2]=_hold;
		}
	}


