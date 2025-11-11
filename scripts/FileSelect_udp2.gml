/// FileSelect_udp2()


var _i, _datakey0;


//show_debug_message("");
SaveFileRandoInfo_dm[?"_Need"+STR_Surface] = false;
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _datakey0 = STR_Save+STR_File+hex_str(_i+1);
    
    SaveFileRandoInfo_dm[?_datakey0+"_Need"+STR_Surface] = false;
    //show_debug_message("FileSelect_udp(). "+"is_undefined(SaveFileRandoInfo_dm[?"+_datakey0+STR_Rando+STR_Settings+"])="+string(is_undefined(SaveFileRandoInfo_dm[?_datakey0+STR_Rando+STR_Settings])));
    //show_debug_message("_datakey0="+_datakey0+", is_undefined(SaveFileRandoInfo_dm[?_datakey0+STR_Rando+STR_Data])="+string(is_undefined(SaveFileRandoInfo_dm[?_datakey0+STR_Rando+STR_Data]))+", is_undefined(  SaveFileRandoInfo_dm[?_datakey0+STR_Surface])="+string(is_undefined(  SaveFileRandoInfo_dm[?_datakey0+STR_Surface]))+", surface_exists(SaveFileRandoInfo_dm[?_datakey0+STR_Surface])="+string(surface_exists(SaveFileRandoInfo_dm[?_datakey0+STR_Surface])));
    if(!is_undefined(SaveFileRandoInfo_dm[?_datakey0+STR_Rando+STR_Settings])) // if this save file is rando'd
    {
        //if(!surface_exists(SaveFileRandoInfo_dm[?STR_Save+STR_File+hex_str(_i+1)+STR_Surface]))
        if (is_undefined(  SaveFileRandoInfo_dm[?_datakey0+STR_Surface]) 
        || !surface_exists(SaveFileRandoInfo_dm[?_datakey0+STR_Surface]) )
        {
            SaveFileRandoInfo_dm[?          "_Need"+STR_Surface] = true;
            SaveFileRandoInfo_dm[?_datakey0+"_Need"+STR_Surface] = true;
        }
    }
}




