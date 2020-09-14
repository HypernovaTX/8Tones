//project_to_string();
var _this_file;
_this_file = ds_map_create();
ds_map_add(_this_file,'channel_a',ds_grid_write(channel_a));
ds_map_add(_this_file,'channel_b',ds_grid_write(channel_b));
ds_map_add(_this_file,'channel_c',ds_grid_write(channel_c));
ds_map_add(_this_file,'channel_d',ds_grid_write(channel_d));
ds_map_add(_this_file,'channel_e',ds_grid_write(channel_e));
ds_map_add(_this_file,'cursor',cursor);
ds_map_add(_this_file,'rows',rows);
ds_map_add(_this_file,'row',row);
ds_map_add(_this_file,'channel',channel);
ds_map_add(_this_file,'tempo',tempo);
ds_map_add(_this_file,'name',songname);
ds_map_add(_this_file,'loop',LOOP);
return (ds_map_write(_this_file));

