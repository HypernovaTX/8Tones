//sns_load()
//Call this to load Stop & Swap data to your game.
//You only need to load it once!
global.stopandswapdata = ds_map_create();
if (file_exists("SYSTEM.gv"))
{
    file = file_text_open_read("SYSTEM.gv");
    ds_map_read(global.stopandswapdata,file_text_read_string(file));
    file_text_close(file);
}
