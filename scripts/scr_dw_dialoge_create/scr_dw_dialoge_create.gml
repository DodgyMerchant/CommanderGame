/// @func scr_dw_dialoge_create(text,type,value);
/// @desc description
/// @arg {real} text description
/// @arg {real} type description
/// @arg {real} value description



//with(obj_game) //maybe not needet
{

//set index
if dw_index != ds_list_size(dw_list)-1//if not viewing the newest message
	{
	
	//notify
	dw_notify_count=dw_notify_num*dw_notify_duration*60;//notify player //play notify animation
	dw_notify_start=current_time;//reset animation
	
	//play sound
	if audio_is_playing(snd_notification)
		{//stop double sound
		audio_stop_sound(snd_notification)
		}
	
	audio_play_sound(snd_notification, 10, false);
	}
else //if viewing newest
	{
	dw_index++;//move with index
	}

var _list = ds_list_create();//create new list

ds_list_add(dw_list,_list);//add to overall
//fill
_list[| DW_LIST_INDEX.text] = mission_time_string+"> "+argument0;
_list[| DW_LIST_INDEX.type] = argument1;
_list[| DW_LIST_INDEX.val] = argument2;

}