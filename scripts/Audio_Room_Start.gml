/// Audio_Room_Start();


show_debug_message("Audio_Room_Start()");


var _val, _theme;

var _ROOM_A = g.room_type=="A";
var _ROOM_B = g.room_type=="B";
var _ROOM_C = g.room_type=="C";


var                   _RM_NAME = g.rm_name;
if(!_ROOM_A)          _RM_NAME = room_get_name(room);
switch(room){
case rmB_Title:      {_RM_NAME=Area_Title+'00'; break;}
case rmB_FileSelect: {_RM_NAME=Area_FileS+'00'; break;}
case rmC_Overworld_A:{_RM_NAME=Area_OvrwA+'00'; break;}
}


var _AREA_NAME = global.OVERWORLD.dg_AreaNames[#(global.OVERWORLD.pcrc>>0)&$FF,(global.OVERWORLD.pcrc>>8)&$FF];



// ----------------------------------------------------------------
can_play_boss_music = false;








// ----------------------------------------------------------------
mus_rm_body_prev = mus_rm_body;

rm_music_theme_prev = rm_music_theme;
rm_music_theme      = val(g.dm_rm[?   _RM_NAME+STR_Music], "undefined");
rm_music_theme      = val(f.dm_rando[?_RM_NAME+STR_Music], rm_music_theme);


if (room==rmB_ContinueSave)
{
    rm_music_theme = dk_ContinueSave;
}
else if(!_ROOM_B)
{
    if (_ROOM_A 
    &&  g.town_name==STR_Bulblin 
    //&& !(f.items&ITM_MASK) )
    && !g.pc.Disguise_enabled ) // set in g.Room_Start()
    {
        rm_music_theme = STR_Battle+"02"; // STR_Battle+"02": only difference is Niko's audio set will be a fuller variation of battle theme
    }
    else if (_ROOM_A 
    &&  g.rm_name==g.GameEnd1B_RM_NAME 
    &&  rm_music_theme==dk_WakeZelda 
    &&  f.quest_num>=2 )
    {
        rm_music_theme = dk_WakeZelda+"2";
    }
    else
    {
        // _c1 is for: Most Death Mtn caves, Restore Fairy scenes, encounters, falling scenes
        // This is to prevent scenarios where certain tracks can be annoying when 
        // they're cut off and then restarted often (like in Death Mtn)
        var _c1 = false;
        if (_ROOM_A 
        && !is_undefined(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME]) )
        {
            if(!is_undefined(dm[?dk_SceneMusicThemeException+"01"+audio_set]) 
            ||  (string_pos("RANDOM",string_upper(audio_set)) && !is_undefined(dm[?dk_SceneMusicThemeException+"01"+audio_get_name(mus_rm_body_prev)])) )
            {
                _c1 = true;
            }
        }
        
        
        if (_c1 
        &&  (g.town_num || g.dungeon_num) )
        {
            if (g.town_num)
            {
                rm_music_theme = g.town_name;
            }
            else if (g.dungeon_num)
            {
                rm_music_theme = STR_Dungeon+hex_str(g.dungeon_num);
            }
        }
        else
        {
            if (_c1 
            ||  _ROOM_C )
            {
                     if (string_pos("DEATH MOUNTAIN", _AREA_NAME)) rm_music_theme = STR_Overworld+dk_DeathMountain; // Death Mtn
                else if (string_pos("MAZE ISLAND",    _AREA_NAME)) rm_music_theme = STR_Overworld+dk_MazeIsland;    // Maze Isl
                else if (string_pos("VALLEY OF DEATH",_AREA_NAME)) rm_music_theme = STR_Overworld+dk_ValleyOfDeath; // Valley of Death
                else if (string_pos("DRAGMIRE",       _AREA_NAME)) rm_music_theme = STR_Overworld+STR_Dragmire;     // Dragmire
                else if (string_pos("MAKARRHA",       _AREA_NAME)) rm_music_theme = STR_Overworld+STR_Makarrha;     // Makarrha
                else                                               rm_music_theme = STR_Overworld+STR_Standard;     // Normal
            }
        }
    }
}



rm_music_theme = string(rm_music_theme);





var         _dl_halloween_music_towns = ds_list_create();
ds_list_add(_dl_halloween_music_towns,STR_Rauru,STR_Ruto,STR_Saria,STR_Mido,STR_Nabooru,STR_Darunia,STR_New_Kasuto);
//ds_list_add(_dl_halloween_music_towns,STR_Old_Kasuto);

if (g.coming_from==g.coming_from_FILE 
||  g.coming_from==g.coming_from_CONT )
{
    var _dl = ds_list_create();
    ds_list_copy(_dl,global.dl_Halloween_TOWN_MUSIC);
    ds_list_shuffle(_dl);
    var _SIZE = ds_list_size(_dl);
    
    for(_i=ds_list_size(_dl_halloween_music_towns)-1; _i>=0; _i--)
    {
        dm[?STR_Halloween+STR_Music+_dl_halloween_music_towns[|_i]] = _dl[|_i mod _SIZE];
    }
    
    ds_list_destroy(_dl); _dl=undefined;
}





var _use_town_halloween_music = false;
if (_ROOM_A 
&&  global.Halloween1_enabled 
&& !is_undefined(g.town_name) 
&&  ds_list_find_index(_dl_halloween_music_towns,g.town_name)!=-1 )
{
    if (rm_music_theme==STR_House+"01" 
    ||  ds_list_find_index(_dl_halloween_music_towns,rm_music_theme)!=-1 )
    {
        if (val(g.dm_rm[?g.rm_name+STR_Town+STR_Outside]) 
        ||  val(g.dm_rm[?g.rm_name+STR_Town+STR_House]) )
        {
            _use_town_halloween_music = true;
            rm_music_theme = g.town_name;
            //rm_music_theme = STR_Old_Kasuto;
        }
    }
}





var _IS_DIFF_THEME = rm_music_theme != rm_music_theme_prev;









// ----------------------------------------------------------------
can_play_mus_rm_body = true;


if (string_pos("RANDOM",string_upper(audio_set)))
{
    if (_IS_DIFF_THEME) mus_rm_body = get_audio_theme_track_random(rm_music_theme);
    //sdm("mus_rm_body "+audio_get_name(mus_rm_body)+", current_theme_random_track "+audio_get_name(current_theme_random_track));
}
else
{
    mus_rm_body = get_audio_theme_track(rm_music_theme);
}


if (_use_town_halloween_music)
{
    mus_rm_body = val(dm[?STR_Halloween+STR_Music+g.town_name], mus_rm_body);
}
//mus_Wyng1_MazeIsland_Body, mus_IsabelleChiming_OldKasuto, mus_Z1_Dungeon_Triangle_1a, mus_Castlevania2_BloodyTears_Body, mus_Castlevania2_Town_Body, 
//mus_Wyng1_MazeIsland_Body, mus_IsabelleChiming_OldKasuto, mus_SteelCrescent3_OldKasuto, mus_Z1_Dungeon_Triangle_1a, mus_Castlevania2_BloodyTears_Body, mus_Castlevania2_Town_Body, mus_Castlevania2_Night_Body


var _IS_DIFF_BODY = mus_rm_body != mus_rm_body_prev;






if (_IS_DIFF_THEME 
&&  _IS_DIFF_BODY )
{
    mus_rm_intr = val(dm[?audio_get_name(mus_rm_body)+STR_Intro]);
}
else
{
    mus_rm_intr = 0;
    if(!is_undefined(dm[?rm_music_theme+dk_Intro_CanPlay]))
    {                dm[?rm_music_theme+dk_Intro_CanPlay] = false;  }
}


//if (room==rmB_Title) sdm("mus_rm_intr: "+audio_get_name(mus_rm_intr)+", mus_rm_body: "+audio_get_name(mus_rm_body));








// ----------------------------------------------------------------
if (_IS_DIFF_BODY)
{
    if (g.ChangeRoom_timer>0) can_play_mus_rm_body = false;
    
    ds_map_clear(dm_music_inst);
    
    audio_group_stop_all(audiogroup_mus);
    //audio_stop_sound(mus_rm_inst);
    mus_rm_inst = aud_play_sound(snd_0);
    //mus_rm_inst     = 0;
    mus_rm_pos_prev = 0;
    mus_rm_pos_curr = 0;
    
    mus_rm_body_last_pos = 0;
}
else if (0)
{
    //if(!_IS_DIFF_BODY 
    //&&  _ROOM_A 
    //&&  g.encounter_type 
    //&& !_IS_DIFF_THEME 
    //&&  val(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME]) 
    if (encounter_sound_inst 
    &&  audio_is_playing(encounter_sound_inst) 
    &&  mus_rm_body 
    &&  audio_is_playing(mus_rm_body) 
    &&  val(dm[?dk_SceneMusicThemeException+"02"+audio_get_name(mus_rm_body)]) )
    //&&  mus_rm_inst 
    //&&  audio_is_playing(mus_rm_inst) )
    {
        //var _NAME = dm_music_inst[?string(mus_rm_body)+STR_Audio+STR_Asset+STR_Name];
        //if(!is_undefined(_NAME) 
        //&&  val(dm[?dk_SceneMusicThemeException+"02"+_NAME]) )
        //&&  audio_get_name(mus_rm_body)==_NAME )
        if(!_ROOM_A 
        ||  val(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME]) )
        //if (_ROOM_C 
        //||  (_ROOM_A && val(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME])) )
        //if ((_ROOM_A && val(dm[?dk_SceneMusicThemeException+"02"+STR_Encounter+STR_Enter])) 
        //||  (_ROOM_C && val(dm[?dk_SceneMusicThemeException+"02"+STR_Encounter+STR_Leave])) )
        {
            mus_asset_name_interrupted = audio_get_name(mus_rm_body);
            
            if (g.ChangeRoom_timer>0) can_play_mus_rm_body = false;
            audio_group_stop_all(audiogroup_mus);
        }
    }
}








// ----------------------------------------------------------------
audio_stop_sound(snd_Default_Title_Intro_no_volume);
audio_stop_sound(snd_Default_Title_no_volume);
timing_sound_inst = 0;
timing_sound_position_prev = 0;
timing_sound_position_curr = 0;








// ----------------------------------------------------------------
// I believe the following "_CanPlay" lines should 
// run regardless if the set is STR_Random
if (_ROOM_B)
{
    if (room==rmB_Title)        dm[?STR_Title      +dk_Intro_CanPlay] = true;
    if (room==rmB_FileSelect)   dm[?dk_FileSelect  +dk_Intro_CanPlay] = true;
    if (room==rmB_ContinueSave) dm[?dk_ContinueSave+dk_Intro_CanPlay] = true;
    
    if (room==rmB_FileSelect 
    ||  room==rmB_ContinueSave )
    {
        dm[?STR_Overworld+STR_Standard    +dk_Intro_CanPlay] = true; // Normal Overworld theme
        dm[?STR_Overworld+dk_DeathMountain+dk_Intro_CanPlay] = true; // Death Mtn
        dm[?STR_Overworld+dk_MazeIsland   +dk_Intro_CanPlay] = true; // Maze Isl
        dm[?STR_Overworld+dk_ValleyOfDeath+dk_Intro_CanPlay] = true; // Valley of Death
        dm[?STR_Overworld+STR_Dragmire    +dk_Intro_CanPlay] = true; // Dragmire
        dm[?STR_Overworld+STR_Makarrha    +dk_Intro_CanPlay] = true; // Makarrha
    }
}

     if(!string_pos("DEATH MOUNTAIN", _AREA_NAME)) dm[?STR_Overworld+dk_DeathMountain+dk_Intro_CanPlay] = true; // Death Mtn
else if(!string_pos("MAZE ISLAND",    _AREA_NAME)) dm[?STR_Overworld+dk_MazeIsland   +dk_Intro_CanPlay] = true; // Maze Isl
else if(!string_pos("VALLEY OF DEATH",_AREA_NAME)) dm[?STR_Overworld+dk_ValleyOfDeath+dk_Intro_CanPlay] = true; // Valley of Death
else if(!string_pos("DRAGMIRE",       _AREA_NAME)) dm[?STR_Overworld+STR_Dragmire    +dk_Intro_CanPlay] = true; // Dragmire
else if(!string_pos("MAKARRHA",       _AREA_NAME)) dm[?STR_Overworld+STR_Makarrha    +dk_Intro_CanPlay] = true; // Makarrha
else                                               dm[?STR_Overworld+STR_Standard    +dk_Intro_CanPlay] = true; // Normal Overworld theme


var _ROOM_B1 = _ROOM_B && (room==rmB_Title || room==rmB_FileSelect || room==rmB_ContinueSave);

if (_ROOM_B1 
||  _ROOM_C 
|| (_ROOM_A && !g.town_num) )
{
    dm[?STR_Rauru     +dk_Intro_CanPlay] = true;
    dm[?STR_Ruto      +dk_Intro_CanPlay] = true;
    dm[?STR_Saria     +dk_Intro_CanPlay] = true;
    dm[?STR_Mido      +dk_Intro_CanPlay] = true;
    dm[?STR_Nabooru   +dk_Intro_CanPlay] = true;
    dm[?STR_Darunia   +dk_Intro_CanPlay] = true;
    dm[?STR_New_Kasuto+dk_Intro_CanPlay] = true;
    dm[?STR_Old_Kasuto+dk_Intro_CanPlay] = true;
    dm[?STR_Bulblin   +dk_Intro_CanPlay] = true;
}

if (_ROOM_B1 
||  _ROOM_C 
|| (_ROOM_A && !g.dungeon_num) )
{
    dm[?STR_Dungeon+"01"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"02"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"03"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"04"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"05"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"06"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"07"+dk_Intro_CanPlay] = true;
    dm[?STR_Dungeon+"08"+dk_Intro_CanPlay] = true;
    //dm[?STR_Dungeon+"09"+dk_Intro_CanPlay] = true;
}






_theme=STR_Boss+"01";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Normal boss music

_theme=STR_Ganon+"1";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Ganon1

_theme=STR_Ganon+"2";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Ganon2

_theme=STR_Ganon+"3";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Ganon3

_theme=dk_ThunderBird;
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // ThunderBird

_theme=dk_ShadowBoss+"01";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Dark Lonk 1st Quest

_theme=dk_ShadowBoss+"02";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // Dark Lonk 2nd Quest


_theme=STR_Battle+"01";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // 

_theme=STR_Battle+"02";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // 

_theme=STR_House+"01";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // 

_theme=STR_Basement+"01";
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // 

_theme=dk_Credits;
if (rm_music_theme!=_theme 
&& !is_undefined(dm[?_theme+dk_Intro_CanPlay]) )
{                dm[?_theme+dk_Intro_CanPlay] = true;  } // 




/*
if (room==rmB_ContinueSave)
{
    rm_music_theme = dk_ContinueSave;
}
else if(!_ROOM_B)
{
    if (_ROOM_A 
    &&  g.town_num 
    &&  g.town_name==STR_Bulblin 
    //&& !(f.items&ITM_MASK) )
    && !g.pc.use_disguise ) // set in g.Room_Start()
    {
        rm_music_theme = STR_Battle+"02"; // STR_Battle+"02": only difference is Niko's audio set will be a fuller variation of battle theme
    }
    else if (_ROOM_A 
    &&  g.rm_name==g.GameEnd1B_RM_NAME 
    &&  rm_music_theme==dk_WakeZelda 
    &&  f.quest_num>=2 )
    {
        rm_music_theme = dk_WakeZelda+"02";
    }
    else if (_ROOM_A 
    &&  global.HalloweenSpecial1_ENABLED 
    &&  isVal(g.town_name,STR_Rauru,STR_Ruto,STR_Saria,STR_Mido,STR_Nabooru,STR_Darunia,STR_New_Kasuto,STR_Old_Kasuto) )
    {
        rm_music_theme = STR_Old_Kasuto;
    }
    else
    {
        // _c1 is for: Most Death Mtn caves, Restore Fairy scenes, path encounters, falling scenes
        // This is to prevent scenarios where certain tracks can be annoying when 
        // they're cut off and then restarted often (like in Death Mtn)
        var _c1 = false;
        if (_ROOM_A 
        && !is_undefined(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME]) )
        {
            if (string_pos("RANDOM",string_upper(audio_set)) 
            || !is_undefined(dm[?dk_SceneMusicThemeException+"01"+audio_set]) )
            {
                _c1 = true;
            }
        }
        //var _c1 = _ROOM_A 
        //       && !is_undefined(dm[?dk_SceneMusicThemeException+"01"+audio_set]) 
        //       && !is_undefined(dm[?dk_SceneMusicThemeException+"01"+_RM_NAME]);
        //
        if (_c1 
        &&  (g.town_num || g.dungeon_num) )
        {
            if (g.town_num)
            {
                rm_music_theme = g.town_name;
            }
            else if (g.dungeon_num)
            {
                rm_music_theme = STR_Dungeon+hex_str(g.dungeon_num);
            }
        }
        else
        {
            if (_c1 
            ||  _ROOM_C )
            {
                     if (string_pos("DEATH MOUNTAIN",           _AREA_NAME)) rm_music_theme = STR_Overworld+"02"; // Death Mtn
                else if (string_pos("MAZE ISLAND",              _AREA_NAME)) rm_music_theme = STR_Overworld+"03"; // Maze Isl
                else if (string_pos("VALLEY OF DEATH",          _AREA_NAME)) rm_music_theme = STR_Overworld+"04"; // Valley of Death
                else if (string_pos("DRAGMIRE",                 _AREA_NAME)) rm_music_theme = STR_Overworld+"05"; // Dragmire
                else if (string_pos(string_upper(SwordIsl_Name),_AREA_NAME)) rm_music_theme = SwordIsl_Name;      // Makarrha
                else                                                         rm_music_theme = STR_Overworld+"01"; // Normal
            }
        }
    }
}
*/





ds_list_destroy(_dl_halloween_music_towns); _dl_halloween_music_towns=undefined;




