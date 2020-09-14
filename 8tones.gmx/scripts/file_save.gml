//file_save();
var fname, _this_file, _ffile;
fname = songname;
if (os_type == os_android) || (os_type == os_ios)
{
    if (file_exists("projects\"+fname))
    {
        file_delete("projects\"+fname);
    }
    _ffile = file_text_open_write("projects\"+fname);
}
else
{
    if (file_exists("projects\"+fname+".8t"))
    {
        file_delete("projects\"+fname+".8t");
    }
    _ffile = file_text_open_write("projects\"+fname+".8t");
}
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
file_text_write_string(_ffile,ds_map_write(_this_file));
file_text_close(_ffile);
