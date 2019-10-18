/// @func scr_dw_dialoge_create(text);
/// @desc description
/// @arg {real} text description

/*
future expansion

data transmition so a message can be inspected

"I saw something" -> inspect -> cam jumps to 'something'

*/


//with(obj_game) //maybe not needet
{
var _list = ds_list_create();//create new list
if dw_list[| 0] != -1	//not empty
	ds_list_add(dw_list,_list);//add to overall
else
	dw_list[| 0] = _list;//fill empty placeholder slot
//fill
_list[| DW_LIST.text] = argument0;
_list[| DW_LIST.time] = mission_time_string;




}