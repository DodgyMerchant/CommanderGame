/// @func scr_debug_grid(x,y,grid,txt);
/// @desc displays ds_grids. returns the y of the last line.
/// @arg {real} x the x coord to display at.
/// @arg {real} y start height of the list. is added upon and returnd so it can be used in other debug scripts.
/// @arg {real} grid the index of the grid
/// @arg {real} txt the name of the list to identify it

/*
argument0	=	x
argument1	=	y
argument2	=	grid
argument3	=	txt



*/

var _sep=20;//min distance to next entry
//var _sep_w=string_length(" ");
for (var i=0;i<ds_grid_width(argument2);i++)
    {
    var str="";
	var _h=ds_grid_height(argument2)
    for (var ii=0; ii<_h; ii++)
        {
        str+=" "+string(argument2[# i,ii]);
        if ii!=_h-1
        while (string_width(str)<_sep*ii)    //min distance to next entry
            {
            str+=" ";
            }
        }
    str=string_insert(argument3+" - "+string(i)+" - ",str,0);  //adding the grid name in front
    draw_text(argument0,argument1+i*string_height(str),str);
    }

return argument1+(i+1)*string_height(str)