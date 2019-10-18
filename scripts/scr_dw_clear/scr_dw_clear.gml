/// @func scr_dw_clear();
/// @desc description

/*
clears the list 
but doesnt destroy it

*/

var _list;

if dw_list[| 0] != -1
for (var i=0;i<ds_list_size(dw_list);i++)
	{
	_list = dw_list[| i];//get list
	ds_list_destroy(_list);//destroy
	}

ds_list_clear(dw_list);