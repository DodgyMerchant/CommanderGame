/// @func scr_es_entity_create(x,y,name,align,hp,stab,inv,spd);
/// @desc creates a new entity and gives it all the given aruments
/// @arg {real} name name of the Entity
/// @arg {real} align alignment to what group/faction | from the ALIGN_INDEX
/// @arg {real} hp hit points
/// @arg {real} stab mental stability
/// @arg {real} inv a list containing the inventory or -1
/// @arg {real} spd movement speed

/*
Purely for creating the Entity

ES_INDEX.pos_x
ES_INDEX.pos_y
ES_INDEX.name
ES_INDEX.alignment
ES_INDEX.hp
ES_INDEX.stability
ES_INDEX.inventory
ES_INDEX.speed

ALIGN_INDEX
*/

if es_grid[# 0,0]!=-1//if not empty
	{
	var index = ds_grid_width(es_grid);
	ds_grid_resize(es_grid,index+1,ES_INDEX.HEIGHT);
	}
else
	{
	index = 0;
	}

//give all the arguments
var _end = min(argument_count,ES_INDEX.HEIGHT);
for (var i=0;i<_end;i++)
	es_grid[# index,i] = argument[i];


//set position
map_grid[# es_grid[# index,ES_INDEX.pos_x],es_grid[# index,ES_INDEX.pos_y]] = es_grid;



//error
if i != argument_count
	show_debug_message("///// Entity Sysztem Entity Create error: too many values given /////");
if i != ES_INDEX.HEIGHT
	show_debug_message("///// Entity Sysztem Entity Create error: not all values given /////");