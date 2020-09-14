//sns_writevalue("name",value)
//Use this to save information to Stop and Swap!
if (ds_map_exists(global.stopandswapdata,argument0))
{
    ds_map_replace(global.stopandswapdata,argument0,argument1);
}
else
{
    ds_map_add(global.stopandswapdata,argument0,argument1);
}
