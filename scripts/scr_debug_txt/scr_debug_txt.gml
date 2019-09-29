/// @func scr_debug_txt(xx,yy,txt1,txt2,...)
/// @desc displays lines of debug code. returns the y of the last line. 
/// @arg {arg} xx height of text
/// @arg {arg} yy height of text
/// @arg {arg} txt1 line of debug code.
/// @arg {arg} txt2... line of debug code.

/*
argument[0]	=	xx
argument[1]	=	yy

*/




var _skip=2;//number of arguments to skip // skips the xx,yy as displayable text
var _yy=argument[1];
var _xx=argument[0];
for(var i=_skip;i<argument_count;i++)
    {
    var str=argument[i];
	draw_text(_xx,_yy,str);
	_yy+=string_height(str);
    }

return argument[1]+_yy