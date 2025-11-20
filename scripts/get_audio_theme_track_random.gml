/// get_audio_theme_track_random(theme)


with(Audio)
{
    var _THEME = argument[0];
    
    var _track       = val(dm[?_THEME+STR_Default]);
    var _TRACK_COUNT = val(dm[?_THEME+STR_Track+STR_Count]);
    //sdm("_TRACK_COUNT "+string(_TRACK_COUNT));
    
    
    if (_TRACK_COUNT>1)
    {
        var _i, _sound;
        var _dl_SOUNDS = ds_list_create();
        
        switch(audio_set)
        {
            // ---------------------------------------------------------------
            default:{
            for(_i=1; _i<=_TRACK_COUNT; _i++)
            {
                _sound = dm[?_THEME+STR_Track+hex_str(_i)+STR_Body];
                if(!is_undefined(_sound))
                {
                    if(!val(dm[?audio_get_name(_sound)+STR_Rando+STR_Value+"02"]))
                    {
                        if(!val(dm[?audio_get_name(_sound)+STR_Rando+STR_Value+"01"]) 
                        || !irandom($3) )
                        {
                            ds_list_add(_dl_SOUNDS,_sound);
                        }
                    }
                }
            }
            //var _NUM = irandom(_TRACK_COUNT-1)+1;
            //_track = val(dm[?_THEME+STR_Track+hex_str(_NUM)+STR_Body], _track);
            break;}//default
            
            
            
            
            // ---------------------------------------------------------------
            case dk_RandomCustom:{
            var _DK1 = STR_Unique+STR_Track;
            var _COUNT = val(dm[?_THEME+_DK1+STR_Count+STR_Music]);
            if (_COUNT)
            {
                for(_i=1; _i<=_COUNT; _i++)
                {
                        _sound = val(dm[?_THEME+_DK1+STR_Music+hex_str(_i)+STR_Body]);
                    if (_sound 
                    &&  val(dm_random_custom[?_THEME+hex_str(_i)+STR_Qualified]) ) // if it's set in the AUDIO CUSTOM audio set
                    {
                        if(!val(dm[?STR_Rando+STR_Value+"01"+audio_get_name(_sound)]) 
                        || !irandom($3) )
                        {
                            ds_list_add(_dl_SOUNDS,_sound);
                        }
                    }
                }
            }
            else
            {
                for(_i=1; _i<=_TRACK_COUNT; _i++)
                {
                    _sound = dm[?_THEME+_DK1+hex_str(_i)+STR_Body];
                    if(!is_undefined(_sound))
                    {
                        if(!val(dm[?STR_Rando+STR_Value+"01"+audio_get_name(_sound)]) 
                        || !irandom($3) )
                        {
                            ds_list_add(_dl_SOUNDS,_sound);
                        }
                    }
                }
                //var _NUM = irandom(_TRACK_COUNT-1)+1;
                //_track = val(dm[?_THEME+_DK1+hex_str(_NUM)+STR_Body], _track);
            }
            break;}//case dk_RandomCustom
        }//switch(audio_set)
        
        
        
        
        if (ds_list_size(   _dl_SOUNDS))
        {
            ds_list_shuffle(_dl_SOUNDS);
            _track =        _dl_SOUNDS[|0];
        }
        
        ds_list_destroy(_dl_SOUNDS); _dl_SOUNDS=undefined;
    }
    
    
    
    
    return _track;
}


return 0;




