/// @func scr_es_entity_create(x,y,name,align,hp,stab,inv,spd);
/// @desc creates a new entity and gives it all the given aruments
/// @arg {real} x
/// @arg {real} y
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
	var _index = ds_grid_width(es_grid);
	ds_grid_resize(es_grid,_index+1,ES_INDEX.HEIGHT);
	}
else
	{
	_index = 0;
	}

//give all the arguments
var _end = min(argument_count,ES_INDEX.HEIGHT);
for (var i=0;i<_end;i++)
	es_grid[# _index,i] = argument[i];


//set position
var _x = es_grid[# _index,ES_INDEX.pos_x];
var _y = es_grid[# _index,ES_INDEX.pos_y];
map_grid[# _x,_y] = _index;//map grid | for easy data acces
//ow grid | for view orientation
ow_grid[# _x,_y]= ( es_grid[# _index,ES_INDEX.alignment]==ALIGN_INDEX.order ? OW_INDEX.friendly : OW_INDEX.enemy );


//error
if i != argument_count
	show_debug_message("///// Entity Sysztem Entity Create error: too many values given /////");
if i != ES_INDEX.HEIGHT
	show_debug_message("///// Entity Sysztem Entity Create error: not all values given /////");