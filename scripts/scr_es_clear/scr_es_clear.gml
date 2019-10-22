/// @func scr_es_clear();
/// @desc clears the entire es_grid

//clear whole grid
var _w = ds_grid_width(es_grid);
for (var i=0;i<_w;i++)
	{
	scr_es_cleanup_entity(i);
	}

//resize / delete every entity
ds_grid_resize(es_grid,1,ES_INDEX.HEIGHT);
es_grid[# 0,0]=1;//mark empty