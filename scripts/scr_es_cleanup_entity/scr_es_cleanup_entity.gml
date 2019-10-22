/// @func scr_es_cleanup_entity(index);
/// @desc clears a entity/width of the es_grid
/// @arg {real} index the index to be cleared
/*
this is an extra script because scr_es_clear and scr_es_entity_destroy use it both
and it may need frequent updating because of changes
*/

/*
ES_INDEX.pos_x
ES_INDEX.pos_y
ES_INDEX.name
ES_INDEX.alignment
ES_INDEX.hp
ES_INDEX.stability
ES_INDEX.inventory	<- needs specia clearing
ES_INDEX.speed

*/
//everything that needs special clearing will be cleared
var _val = es_grid[# argument0,ES_INDEX.inventory];

if _val != -1
	ds_grid_destroy(_val);