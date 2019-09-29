/// @func scr_debug_list(x,y,list,txt);
/// @desc displays ds_lists. returns the y of the last line.
/// @arg {real} x
/// @arg {real} y start height of the list. is added upon and returnd so it can be used in other debug scripts.
/// @arg {real} list the index of the list
/// @arg {real} txt the name of the list to identify it

/*

argument0	=	x
argument1	=	y
argument2	=	list
argument3	=	txt
*/




var str=argument3+" - "+string(argument2)+" - ";
for (var i=0;i<ds_list_size(argument2);i++)
    {
    str+=" "+string(argument2[| i]);
    }
draw_text(argument0,argument1,str);
return argument1 + string_height(str)

