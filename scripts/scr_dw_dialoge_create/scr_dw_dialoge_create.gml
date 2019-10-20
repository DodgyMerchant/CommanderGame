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

//set index
if dw_index != 0//if not viewing the newest message
	{
	dw_index++;//let the index stay on the same message
	dw_notify_count=dw_notify_num*dw_notify_duration*60;//notify player //play notify animation
	
	dw_notify_start=current_time;
	}

var _list = ds_list_create();//create new list

ds_list_add(dw_list,_list);//add to overall
//fill
_list[| DW_LIST.text] = argument0;
_list[| DW_LIST.time] = mission_time_string;

}