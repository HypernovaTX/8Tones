//sns_save()
//Call this to save any changes you made using sns_writevalue()
if (file_exists("SYSTEM.gv"))
{
    file_delete("SYSTEM.gv");
}
file = file_text_open_write("SYSTEM.gv");
file_text_write_string(file,ds_map_write(global.stopandswapdata));
file_text_close(file);
