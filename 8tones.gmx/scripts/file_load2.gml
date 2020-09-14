///file_load(derp_filename);
var fname, _this_file, _ffile, ERROR;
fname = argument0;
_this_file = ds_map_create();
ERROR = 0;
if (file_exists(fname))
{
    _ffile = file_text_open_read(fname);
    ds_map_read(_this_file,file_text_read_string(_ffile));
    cursor = ds_map_find_value(_this_file,'cursor');
    rows = ds_map_find_value(_this_file,'rows');
    row = ds_map_find_value(_this_file,'row');
    channel = ds_map_find_value(_this_file,'channel');
    tempo = ds_map_find_value(_this_file,'tempo');
    songname = ds_map_find_value(_this_file,'name');
    LOOP = ds_map_find_value(_this_file,'loop');
    channel = ds_map_find_value(_this_file,'channel');
    
    if (is_undefined(cursor))
    || (is_undefined(row))
    || (is_undefined(rows))
    || (is_undefined(channel))
    || (is_undefined(tempo))
    || (is_undefined(songname))
    || (is_undefined(LOOP))
    {
        ERROR = 1;
        PLAYING = -9191;
        var x_x;
        x_x = show_message_async("Oh noes!#File is either unreadable or corrupted!");
        game_restart();
    }
    
    if (ERROR == 0)
    {
        ds_grid_resize(channel_a,2,(rows+1)*16);
        ds_grid_resize(channel_b,2,(rows+1)*16);
        ds_grid_resize(channel_c,2,(rows+1)*16);
        ds_grid_resize(channel_d,2,(rows+1)*16);
        ds_grid_resize(channel_e,2,(rows+1)*16);
        
        ds_grid_read(channel_a,ds_map_find_value(_this_file,'channel_a'));
        ds_grid_read(channel_b,ds_map_find_value(_this_file,'channel_b'));
        ds_grid_read(channel_c,ds_map_find_value(_this_file,'channel_c'));
        ds_grid_read(channel_d,ds_map_find_value(_this_file,'channel_d'));
        ds_grid_read(channel_e,ds_map_find_value(_this_file,'channel_e'));
    }
    
    file_text_close(_ffile);
}
