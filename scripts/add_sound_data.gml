/// add_sound_data(sound resource, *volume, *music theme, *music set, *music intro, *will loop)


var                   _arg=0;

var _SOUND = argument[_arg++];

var                      _VOLUME = 1;
if (argument_count>_arg) _VOLUME = clamp(argument[_arg++], 0,1);

var                      _THEME  = 0;
if (argument_count>_arg) _THEME  = argument[_arg++];

var                      _SET    = STR_Default;
if (argument_count>_arg) _SET    = argument[_arg++];

var                      _INTRO  = 0;
if (argument_count>_arg)
{
    _INTRO  = argument[_arg++];
    if (DEV && audio_get_name(_INTRO)==audio_get_name(snd_0)){show_debug_message(""); show_debug_message("WARNING. add_sound_data(). snd_0 was passed as the intro for "+audio_get_name(_SOUND)); show_debug_message("");}
}

var                      _LOOP   = -1;
if (argument_count>_arg) _LOOP   = argument[_arg++];


with(Audio)
{
    var _SOUND_NAME = audio_get_name(_SOUND);
    
    var         _INTRO_NAME = 0;
    if (_INTRO) _INTRO_NAME = audio_get_name(_INTRO);
    
    
    
    
    var _AUDIO_GROUP = STR_AudioGroup+"_"+string_copy(_SOUND_NAME,1,3);
        _AUDIO_GROUP = val(dm[?_AUDIO_GROUP],audiogroup_snd);
    dm[?_SOUND_NAME+STR_AudioGroup] = _AUDIO_GROUP;
    
    dm[?_SOUND_NAME+STR_Volume] = val(dm[?_SOUND_NAME+STR_Volume], _VOLUME);
    
    
    
    
    
    /*  Here's a basic visualization of the data structuring
    
          THEME: | Title      Overworld  Battle     Dungeon1   Dungeon2
    ------------------------------------------------------------------------
    SET:
    STR_Default  | sound id.  sound id.  sound id.  sound id.  sound id.
    Chiming      | sound id.  sound id.  sound id.  sound id.  sound id.
    Composer..   | sound id.  sound id.  sound id.  sound id.  sound id.
    ------------------------------------------------------------------------
    THEME
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
    THEME
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
        SET
            SOUND BODY, SOUND INTRO
    */
    
    //dk_SoundObject+STR_Datakey
    
    if (is_string(_THEME))
    {
        var _num, _dk;
        
        // When playing a sound, it needs more data than just the audio asset, 
        // it needs; what its intro or body is, what its audiogroup is, what 
        // its volume is, etc...
        // There are also scenarios where audio assets may be found more than 
        // once in a theme if an audio set is re-using it. Or maybe a certain 
        // audio set wants to give a sound's body a different intro, etc..
        // A SoundObject_DK is a unique key
        var _SoundObject_DK = _THEME+_SET;
        
        if (is_undefined(dm[?_SoundObject_DK])) dm[?_SoundObject_DK] = _SOUND;
        //if (is_string(_SET)){if (is_undefined(dm[?_SoundObject_DK])) dm[?_SoundObject_DK] = _SOUND;}
        
        if (_LOOP!=-1) dm[?_SoundObject_DK+STR_Loop] = _LOOP;
        
                    if (is_undefined(dm[?_SoundObject_DK+STR_Body]))  dm[?_SoundObject_DK+STR_Body]  = _SOUND;
        if (_INTRO){if (is_undefined(dm[?_SoundObject_DK+STR_Intro])) dm[?_SoundObject_DK+STR_Intro] = _INTRO;}
        
        if (_INTRO)
        {
            dm[?_INTRO_NAME+STR_AudioGroup] = _AUDIO_GROUP;
            dm[?_INTRO_NAME+STR_Volume]     = _VOLUME;
            
            dm[?_THEME     +dk_Intro_CanPlay] = true;
            dm[?_SOUND_NAME+dk_Intro_CanPlay] = true;
            dm[?_SOUND_NAME+STR_Intro] = _INTRO; // _SOUND/_SOUND_NAME is the body
            //dm[?_SOUND_NAME+STR_Intro+_THEME+_SET] = _INTRO; // _SOUND/_SOUND_NAME is the body
            dm[?_INTRO_NAME+STR_Body]  = _SOUND;
            dm[?_INTRO_NAME+"_Is"+STR_Intro] = true;
        }
        
        
        
        // --------------------------------------------------------
        var _dk_GROUP = undefined;
        if (_AUDIO_GROUP==audiogroup_snd 
        ||  _AUDIO_GROUP==audiogroup_mus )
        {
            if (_AUDIO_GROUP==audiogroup_snd) _dk_GROUP = STR_Sound;
            else                              _dk_GROUP = STR_Music;
        }
        
        // Indexing theme names
        _dk = STR_Theme+STR_Count;
        
        // Index all theme names
        if (is_undefined(dm[?_THEME+STR_Num]))
        {
                   dm[?_dk] = val(dm[?_dk])+1;
            _num = dm[?_dk];
            dm[?STR_Theme+hex_str(_num)] = _THEME;
            dm[?_THEME+STR_Num] = _num;
        }
        
        if(!is_undefined(_dk_GROUP))
        {
            // Index themes that have at least 1 _dk_GROUP track
            if (is_undefined(dm[?_THEME+_dk_GROUP+STR_Num]))
            {
                       dm[?_dk+_dk_GROUP] = val(dm[?_dk+_dk_GROUP])+1;
                _num = dm[?_dk+_dk_GROUP];
                dm[?STR_Theme+_dk_GROUP+hex_str(_num)] = _THEME;
                dm[?_THEME+_dk_GROUP+STR_Num] = _num;
            }
        }
        
        
        // --------------------------------------------------------
        // Indexing the tracks of this theme
        _dk = _THEME+STR_Track;
               dm[?_dk+STR_Count] = val(dm[?_dk+STR_Count])+1;
        _num = dm[?_dk+STR_Count];
        
        dm[?_dk+hex_str(_num)] = _SOUND;
        dm[?_dk+hex_str(_num)+STR_Set] = _SET;
        
                    dm[?_dk+hex_str(_num)+STR_Body]  = _SOUND;
        if (_INTRO) dm[?_dk+hex_str(_num)+STR_Intro] = _INTRO;
        
        
        if(!is_undefined(_dk_GROUP))
        {
                   dm[?_dk+STR_Count+_dk_GROUP] = val(dm[?_dk+STR_Count+_dk_GROUP])+1;
            _num = dm[?_dk+STR_Count+_dk_GROUP];
            
            dm[?_dk+_dk_GROUP+hex_str(_num)] = _SOUND;
            dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Set] = _SET;
            
                        dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Body]  = _SOUND;
            if (_INTRO) dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Intro] = _INTRO;
        }
        
        
        // --------------------------------------------------------
        // Indexing the tracks of this theme as a list with no duplicates
        _dk = _THEME+STR_Unique+STR_Track;
        if (is_undefined(dm[?_dk+STR_Num+_SOUND_NAME])) // if is a unique track for this theme
        {
                   dm[?_dk+STR_Count] = val(dm[?_dk+STR_Count])+1;
            _num = dm[?_dk+STR_Count];
            
            dm[?_dk+STR_Num+_SOUND_NAME] = _num;
            dm[?_dk+hex_str(_num)] = _SOUND;
            
                        dm[?_dk+hex_str(_num)+STR_Set]   = _SET;
                        dm[?_dk+hex_str(_num)+STR_Body]  = _SOUND;
            if (_INTRO) dm[?_dk+hex_str(_num)+STR_Intro] = _INTRO;
            
            
            if(!is_undefined(_dk_GROUP))
            {
                       dm[?_dk+STR_Count+_dk_GROUP] = val(dm[?_dk+STR_Count+_dk_GROUP])+1;
                _num = dm[?_dk+STR_Count+_dk_GROUP];
                
                dm[?_dk+STR_Num+_SOUND_NAME+_dk_GROUP] = _num;
                dm[?_dk+_dk_GROUP+hex_str(_num)] = _SOUND;
                
                            dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Set]   = _SET;
                            dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Body]  = _SOUND;
                if (_INTRO) dm[?_dk+_dk_GROUP+hex_str(_num)+STR_Intro] = _INTRO;
            }
        }
    }
    
    
    
    
    /* // Show the length, in frames, of this asset. ** The length can be a fraction of a frame; 8.27, 0.21, 129.01, ..
                sdm(_SOUND_NAME+": "+string(audio_sound_length(_SOUND))+", "+string(audio_sound_length(_SOUND)%1));
    if (_INTRO) sdm(_INTRO_NAME+": "+string(audio_sound_length(_INTRO))+", "+string(audio_sound_length(_INTRO)%1));
    sdm("");*/
    
    
    return _SOUND;
}




