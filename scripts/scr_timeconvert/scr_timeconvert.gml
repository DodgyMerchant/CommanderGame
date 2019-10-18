/// @func scr_timeconvert(millisec);
/// @desc description
/// @arg {real} millisec

/*
changes the millisec into a hh:mm:ss format
00:00:00

returns a tring
*/

var _sec,_min,_hour,_str;

//convert the numbers
_sec = argument0 / 1000;
_min = _sec div 60;
_hour = _min div 60;

//make string
_str =string_format(_hour,2,0)+":"+string_format(_min,2,0)+":"+string_format(_sec,2,0);

//replace " " with "0"
for(var i=1;i<=8;i++)
	if string_char_at(_str,i) == " "
		_str = string_replace_all(_str," ","0");

//end
return _str;