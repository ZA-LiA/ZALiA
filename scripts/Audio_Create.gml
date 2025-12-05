/// Audio_Create()

if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("Audio_Create() START");
}


var _i,_j, _idx, _val,_val1,_val2, _count,_count1, _num, _vol;
var _snd1,_snd2, _mus1,_mus2, _theme;
var _dk,_dk1,_dk2, _prefix;
var _town_name;
var _VOL_NIKO  = .58; // Niko Tengoku
var _VOL_CHIM  = .58; // Isabelle Chiming
var _VOL_STCR  = .39; // Steel Crescent
var _VOL_STCR2 = .34; // Steel Crescent - ALT
//var _VOL_STCR2 = .40; // Steel Crescent - ALT
var _VOL_STCR3 = .56; // Steel Crescent - NES PLUS
var _VOL_STCR4 = .24; // Steel Crescent - Scug
//var _VOL_STCR4 = .30; // Steel Crescent - Scug
var _VOL_STCR5 = .36; // Steel Crescent - Synth
var _VOL_WYNG1 = .42; // Wyng
//var _VOL_WYNG1 = .55; // Wyng
var _VOL_WYNG2 = min(_VOL_WYNG1+.15, 1); // Wyng


testing_num = 0;


depth = DEPTH_Audio;


// GameMaker Audio Looping Issue With Tracks With An Intro: -------
//   If you have 2 separate files (Intro, Body) then there will 
// be a noticeable gap between the intro and body because checking 
// when the intro is over in the step may mean you're late if the 
// intro ended somewhere between steps. 
//   So, the solution is to have 1 asset that is the intro + the 
// body + 1s extra of the beginning of the body. You can look 
// at PixelatedPope's video of this: How To Loop A Music Track That Has An Intro
// In the step, you check if the track's position is >= the total 
// length of the intro and body (meaning the position is now in the added 1s), 
// then subtract the length of the body from the current position.
//   This is seamless. However.. if you're using compression in the 
// sound asset, there will be a slight gap and crackle when setting 
// the tracks position. I've tried adjusting various quality settings 
// in the sound asset. I've also tried importing the sound as ogg 
// instead of mp3. After searching for a solution online, it seems 
// that this is actually a GameMaker bug and the only solution is to 
// set the sound asset to uncompressed. Unfortunately, this means 
// greater file size for the app.
//UseNewLoopSystem_IsabelleChiming = false;




dm = ds_map_create();
dm[?STR_AudioGroup+'_snd'] = audiogroup_snd;
dm[?STR_AudioGroup+'_mus'] = audiogroup_mus;



_dk1 = STR_Audio+STR_Set+STR_Creator+STR_Name;
var _set_ZELDA1     = STR_Zelda+"1";
var _set_ZELDA2_FDS = STR_Zelda+"2"+STR_FDS;


dl_AUDIO_SETS=ds_list_create();

_dk=STR_Default;
ds_list_add(dl_AUDIO_SETS,_dk);
dm[?_dk1+_dk]="ZELDA II (NES)";
//dm[?_dk1+_dk]="DEFAULT";




    _val = asset_get_index("mus_ZeldaII_FDS_Title");
if (_val!=-1)
{
    _dk=_set_ZELDA2_FDS;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]="ZELDA II (FDS)";
}




    _val = asset_get_index("mus_NikoTengoku_Title_Body");
if (_val!=-1)
{
    _dk=dk_Nikos8BitStereo;
    ds_list_add(dl_AUDIO_SETS,_dk);
    //dm[?_dk1+_dk]="NIKOS 8BIT STEREO (Z2 STEREO)";
    //dm[?_dk1+_dk]="NIKOS 8BIT STEREO (ZELDA II STEREO)";
    //dm[?_dk1+_dk]="NIKOS 8BIT STEREO";
    dm[?_dk1+_dk]="NIKOS 8BIT STEREO (Z2 8BS STYLE)";
    //dm[?_dk1+_dk]="NIKOS 8BIT STEREO (NIKOTENGOKU'S Z2 8BS STYLE)";
}




_dk=_set_ZELDA1;
ds_list_add(dl_AUDIO_SETS,_dk);
dm[?_dk1+_dk]="THE LEGEND OF ZELDA 1";




_val1 = "ISABELLE CHIMING (VRC6 OST)";
    _val = asset_get_index("mus_IsabelleChiming_Title"); // title song is just to check if the audio files for the audio set are in the app
if (_val!=-1)
{
    _dk = dk_IsabelleChiming;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk] = _val1;
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}

    _val = asset_get_index("mus_IsabelleChiming_BattleJPN_Body"); // 2025/08/11. `mus_IsabelleChiming_BattleJPN_Body` currently the only `dk_IsabelleChiming2` audio set track
if (_val!=-1)
{
    _dk = dk_IsabelleChiming2;
    //ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk] = _val1;
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}
/*
    _val = asset_get_index("mus_IsabelleChiming_Title");
if (_val!=-1)
{
    _val = "ISABELLE CHIMING (VRC6 OST)";
    _dk=dk_IsabelleChiming;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=_val;
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
    
        _val = asset_get_index("mus_IsabelleChiming_BattleJPN_Body");
    if (_val!=-1)
    {
        _dk=dk_IsabelleChiming2;
        //ds_list_add(dl_AUDIO_SETS,_dk);
        dm[?_dk1+_dk]=_val;
        dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
        dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
    }
}
*/




    _val = asset_get_index("mus_SteelCrescent_Title_Body");
if (_val!=-1)
{
    _dk=dk_SteelCrescent;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=SteelCrescents_NAME;
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




    _val = asset_get_index("mus_SteelCrescent2_Title_Body");
if (_val!=-1)
{
    _dk=dk_SteelCrescent2;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=SteelCrescents_NAME+" - ALT";
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




    _val = asset_get_index("mus_SteelCrescent3_Title_Body");
if (_val!=-1)
{
    _dk=dk_SteelCrescent3;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=SteelCrescents_NAME+" - NES PLUS";
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




    _val = asset_get_index("mus_SteelCrescent4_LevelUp");
if (_val!=-1)
{
    _dk=dk_SteelCrescent4;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=SteelCrescents_NAME+" - SKUG";
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




    _val = asset_get_index("mus_SteelCrescent5_Title_Body");
if (_val!=-1)
{
    _dk=dk_SteelCrescent5;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]=SteelCrescents_NAME+" - SYNTH";
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




    _val = asset_get_index("mus_Wyng1_Title01");
if (_val!=-1)
{
    _dk=dk_Wyng;
    ds_list_add(dl_AUDIO_SETS,_dk);
    dm[?_dk1+_dk]="WYNG - ORCHESTRAL SOUNDTRACK";
    dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
    dm[?dk_SceneMusicThemeException+"02"+_dk] = true;
}




_dk=dk_Castlevania2;
//ds_list_add(dl_AUDIO_SETS,_dk);
dm[?_dk1+_dk]="CASTLEVANIA 2";
dm[?dk_SceneMusicThemeException+"01"+_dk] = true;
dm[?dk_SceneMusicThemeException+"02"+_dk] = true;




AudioSets_COUNT = ds_list_size(dl_AUDIO_SETS);
dl_random_custom = ds_list_create();
ds_list_copy(dl_random_custom,dl_AUDIO_SETS);




_dk=STR_Random+"1";
ds_list_add(dl_AUDIO_SETS,_dk);
dm[?_dk1+_dk]="RANDOM";




_dk=dk_RandomCustom;
ds_list_add(dl_AUDIO_SETS,_dk);
dm[?_dk1+_dk]="RANDOM-CUSTOM";




audio_set = STR_Default;













Volume_DEFAULT = 5;

snd_vol = Volume_DEFAULT;
audio_group_set_gain(audiogroup_snd, snd_vol/10, 0);

mus_vol = Volume_DEFAULT;
audio_group_set_gain(audiogroup_mus, mus_vol/10, 0);

audio_group_load(audiogroup_snd);
audio_group_load(audiogroup_mus);






SND_NONE = snd_0; // snd_0: 1 frame of dead air


_theme=dk_GannonLaugh;
dm[?_theme+STR_Description] = "GAME OVER LAUGH";
add_sound_data(snd_Laugh_Ganon_1a, 1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_GanonLaugh"); if (_val!=-1){add_sound_data(snd_NikoTengoku_GanonLaugh, 1, _theme,dk_Nikos8BitStereo);}
//add_sound_data(snd_NikoTengoku_GanonLaugh,_VOL_NIKO, _theme,dk_Nikos8BitStereo);

_theme=STR_PC+STR_Damage;
dm[?_theme+STR_Description] = "PLAYER DAMAGE";
add_sound_data(snd_Grunt_PC_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_ZeldaII_FDS_PCDamage"); if (_val!=-1){add_sound_data(_val,       1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_PCGrunt"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}


_theme=STR_Stab;
dm[?_theme+STR_Description] = "STAB";
add_sound_data(snd_Sword_Stab_1a,                  1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_PCSwordStab"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(snd_Z1_Stab01,                      1, _theme,_set_ZELDA1);

_theme=STR_Sword+STR_Beam;
dm[?_theme+STR_Description] = "SWORD BEAM";
add_sound_data(snd_Sword_Beam_1a,               .6, _theme,STR_Default);
//add_sound_data(snd_NikoTengoku_SwordBeam,       .3, _theme,dk_Nikos8BitStereo);
//add_sound_data(snd_NikoTengoku_SwordBeam,_VOL_NIKO, _theme,dk_Nikos8BitStereo);
add_sound_data(snd_Z1_SwordBeam,                 1, _theme,_set_ZELDA1);


_theme=dk_StrikeEnemy;
dm[?_theme+STR_Description] = "ENEMY DAMAGE";
add_sound_data(snd_Strike_Enemy_1a,1, _theme,STR_Default);


_theme=dk_HitShield;
dm[?_theme+STR_Description] = "SHIELD DING";
add_sound_data(snd_Ding_Shield_1a,1, _theme,STR_Default);


_theme=dk_Boomerang;
dm[?_theme+STR_Description] = "BOOMERANG";
add_sound_data(snd_Boomerang_1a,1, _theme,STR_Default);


_theme=dk_StrikeSolid;
dm[?_theme+STR_Description] = "STRIKE SOLID";
add_sound_data(snd_Strike_Solid_1a,               .6, _theme,STR_Default);
//add_sound_data(snd_ZeldaII_FDS_StabSolid,         .6, _theme,_set_ZELDA2_FDS); // Turned this off because too annoying
//add_sound_data(snd_NikoTengoku_StrikeSolid,_VOL_NIKO, _theme,dk_Nikos8BitStereo);


_theme=STR_PC+STR_Death;
dm[?_theme+STR_Description] = "PLAYER DEATH";
add_sound_data(snd_Death_PC_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_ZeldaII_FDS_PCDeath"); if (_val!=-1){add_sound_data(_val,       .8, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_PCDeath"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_PlayerDeath"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}
add_sound_data(snd_Castlevania2_PCDeath,       1, _theme,dk_Castlevania2);


_theme=dk_EnemyDeath;
dm[?_theme+STR_Description] = "ENEMY DEATH";
add_sound_data(snd_Death_Enemy_1a,1, _theme,STR_Default);


_theme=STR_Boss+STR_Explode;
dm[?_theme+STR_Description] = "BOSS EXPLODE";
add_sound_data(snd_Boss_Explode_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_ZeldaII_FDS_BossExplode"); if (_val!=-1){add_sound_data(_val,       .8, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_BossExplode"); if (_val!=-1){add_sound_data(_val,        1, _theme,dk_Nikos8BitStereo);}
//add_sound_data(snd_NikoTengoku_BossExplode,_VOL_NIKO, _theme,dk_Nikos8BitStereo);


_theme=dk_WalkWater+"01";
dm[?_theme+STR_Description] = "WALK IN WATER 1";
add_sound_data(snd_Walk_Water_1a,1, _theme,STR_Default);

_theme=dk_WalkWater+"02";
dm[?_theme+STR_Description] = "WALK IN WATER 2";
add_sound_data(snd_Walk_Water_1b,1, _theme,STR_Default);


_theme=dk_BlockBreak;
dm[?_theme+STR_Description] = "TILE BREAK";
add_sound_data(snd_Break_Block_1a,1, _theme,STR_Default);

_theme=dk_BridgeCrumble;
dm[?_theme+STR_Description] = "TILE CRUMBLE";
add_sound_data(snd_Crumble_Bridge_1a,1, _theme,STR_Default);



_theme=dk_ItemDrop;
dm[?_theme+STR_Description] = "ITEM DROP";
add_sound_data(snd_Item_Drop_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_ItemDrop"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
//add_sound_data(snd_Z1_RevealItem,           1, _theme,_set_ZELDA1);
_val=asset_get_index("snd_Wyng1_ItemDrop"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}

_theme=dk_ElevatorMove;
dm[?_theme+STR_Description] = "ELEVATOR";
add_sound_data(snd_Elevator_Move_1a,1, _theme,STR_Default);

_theme=dk_RaiseBarrier;
dm[?_theme+STR_Description] = "BARRIER RAISING";
add_sound_data(snd_Raise_Barrier_1a,                1, _theme,STR_Default);
//add_sound_data(snd_NikoTengoku_RaiseBarrier,_VOL_NIKO, _theme,dk_Nikos8BitStereo);



_theme=STR_Open+STR_LockedDoor;
dm[?_theme+STR_Description] = "LOCKED DOOR OPENING";
add_sound_data(snd_Lock_Open_1a,               1, _theme,STR_Default); // A shortened ver of 'boss explosion'
_val=asset_get_index("snd_ZeldaII_FDS_OpenLockedDoor"); if (_val!=-1){add_sound_data(_val,.8, _theme,_set_ZELDA2_FDS);}


_theme=STR_Cast+STR_Spell;
dm[?_theme+STR_Description] = "CAST SPELL";
add_sound_data(snd_Cast_Spell_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_ZeldaII_FDS_CastSpell"); if (_val!=-1){add_sound_data(_val,       .8, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_CastSpell"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_CastSpell"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}



_theme=STR_Flute;
dm[?_theme+STR_Description] = "FLUTE";
add_sound_data(snd_Flute_Item_1a,               1,  _theme,STR_Default);
add_sound_data(snd_Z1_Flute,                    1,  _theme,_set_ZELDA1);
_val=asset_get_index("snd_ZeldaII_FDS_Flute"); if (_val!=-1){add_sound_data(_val,           1,  _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_Flute"); if (_val!=-1){add_sound_data(_val,   _VOL_NIKO,  _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_SteelCrescent_Flute"); if (_val!=-1){add_sound_data(_val, _VOL_STCR,  _theme,dk_SteelCrescent);}
_val=asset_get_index("snd_SteelCrescent2_Flute"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("snd_Wyng1_Flute1"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Warp+STR_Flute;
dm[?_theme+STR_Description] = "WARP FLUTE";
add_sound_data(snd_MagicalKeyHouse,                    1, _theme,STR_Default);
add_sound_data(snd_Z1_Secret,                          1, _theme,_set_ZELDA1);
_val=asset_get_index("snd_NikoTengoku_MagicalKeyHouse"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_SteelCrescent2_WarpFlute"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent);}
_val=asset_get_index("snd_SteelCrescent2_WarpFlute"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("snd_Wyng1_Flute2"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}



_theme=dk_LowHPBeep;
dm[?_theme+STR_Description] = "LOW HP BEEP";
add_sound_data(snd_Beep_Low_HP_1a_1,             1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_LowHPBeep"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_LowHPBeep"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}



_theme=dk_OpenGUI;
dm[?_theme+STR_Description] = "OPEN MENU";
add_sound_data(snd_GUI_Open_1a,                 1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_OpenMenu"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_OpenMenu"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}

_theme=dk_CursorSpellMenu; // Spell menu cursor move
dm[?_theme+STR_Description] = "SPELL MENU CURSOR";
add_sound_data(snd_Cursor_Move_1a,1, _theme,STR_Default);

_theme=dk_CursorFileSelect; // File Select cursor move
dm[?_theme+STR_Description] = "FILE SELECT CURSOR";
add_sound_data(snd_Cursor_Move_2a,                      1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_CursorFileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}

_theme=dk_CursorRegisterName; // In REGISTER NAME, moving cursor to diff char
dm[?_theme+STR_Description] = "REGISTER NAME CURSOR";
add_sound_data(snd_Cursor_Move_3a,                     1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_CursorNameEntry"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}

_theme=dk_TypeChar; // TODO: Fix type sound.
dm[?_theme+STR_Description] = "TYPE CHARACTER";
add_sound_data(snd_Type_Char_1a,1, _theme,STR_Default);

_theme=dk_ChooseChar; // Choose a char in FileSelect 'REGISTER YOUR NAME'
dm[?_theme+STR_Description] = "CHOOSE CHARACTER";
add_sound_data(snd_Choose_Char_1a,                 1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_InputLetter"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_MenuSelect1"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}

_theme=dk_EliminateFile;
dm[?_theme+STR_Description] = "ELIMINATE FILE";
add_sound_data(snd_Eliminate_file_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_EliminateFile"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}



_theme=dk_FallScene+STR_Sound;
dm[?_theme+STR_Description] = "FALL SCENE";
//dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(snd_FallScene01,                  1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_FallScene"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
//sdm("snd_FallScene01 length: "+string(audio_sound_length(snd_FallScene01))); // 2.01
//sdm("snd_NikoTengoku_FallScene length: "+string(audio_sound_length(snd_NikoTengoku_FallScene))); // 2.96
_val=asset_get_index("snd_Wyng1_FallScene"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}


_theme=STR_Encounter+STR_Enter;
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
dm[?_theme+STR_Description] = "ENTER ENCOUNTER";
add_sound_data(snd_Encounter_Enter_1a,                1, _theme,STR_Default);
//add_sound_data(snd_NikoTengoku_EncounterEnter,_VOL_NIKO, _theme,dk_Nikos8BitStereo);
_val=asset_get_index("snd_ZeldaII_FDS_EncounterEnter"); if (_val!=-1){add_sound_data(_val,       .8, _theme,_set_ZELDA2_FDS);}
//add_sound_data(snd_Wyng1_EncounterEnter, _VOL_WYNG2, _theme,dk_Wyng);

_theme=STR_Encounter+STR_Leave;
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
dm[?_theme+STR_Description] = "LEAVE ENCOUNTER";
add_sound_data(snd_Encounter_Leave_1a,                1, _theme,STR_Default);
//add_sound_data(snd_NikoTengoku_EncounterLeave,_VOL_NIKO, _theme,dk_Nikos8BitStereo);
//add_sound_data(snd_Wyng1_EncounterExit, _VOL_WYNG2, _theme,dk_Wyng);





_theme=STR_Fairy+STR_Greeting;
dm[?_theme+STR_Description] = "FAIRY GREETING";
add_sound_data(snd_Anounce_Fairy_1a,                 1, _theme,STR_Default);
_val=asset_get_index("snd_ZeldaII_FDS_FairyGreeting"); if (_val!=-1){add_sound_data(_val,        1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("snd_NikoTengoku_FairyGreeting"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("snd_Wyng1_FairyGreeting"); if (_val!=-1){add_sound_data(_val,       _VOL_WYNG1,_theme,dk_Wyng);}




_theme=dk_MagicalKeyHouse;
dm[?_theme+STR_Description] = "REVEAL SECRET HOUSE";
add_sound_data(snd_MagicalKeyHouse,                    1, _theme,STR_Default);
add_sound_data(snd_Z1_Secret,                          1, _theme,_set_ZELDA1);
_val=asset_get_index("snd_NikoTengoku_MagicalKeyHouse"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}



_theme="_Jingle"+"01"; // Unused jingle from OG
//dm[?_theme+STR_Description] = "JINGLE 1";
//add_sound_data(snd_NikoTengoku_Jingle01,_VOL_NIKO, _theme,dk_Nikos8BitStereo);



_theme=dk_XPTick;
dm[?_theme+STR_Description] = "XP TICK";
add_sound_data(snd_Cursor_Move_1a,1, _theme,STR_Default);

_theme=dk_FairyFly;
dm[?_theme+STR_Description] = "FAIRY FLYING";
add_sound_data(snd_Item_Drop_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_ItemDrop"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}

_theme=dk_ZeldaTalk;
dm[?_theme+STR_Description] = "ZELDA TALKING";
add_sound_data(snd_Item_Drop_1a,                1, _theme,STR_Default);
_val=asset_get_index("snd_NikoTengoku_ItemDrop"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo);}

_theme=dk_StabItem;
dm[?_theme+STR_Description] = "STAB ITEM";
add_sound_data(snd_Sword_Beam_1a, .6, _theme,STR_Default);
//add_sound_data(snd_NikoTengoku_SwordBeam,.4, _theme,dk_Nikos8BitStereo);
_val=asset_get_index("snd_Wyng1_PickUpKey"); if (_val!=-1){add_sound_data(_val,   _VOL_WYNG1,_theme,dk_Wyng);}


_theme="_SpikeTrap"; // SpikeTrap hit solid
dm[?_theme+STR_Description] = "SPIKETRAP HIT SOLID";
add_sound_data(snd_Type_Char_1a, 1, _theme,STR_Default);
//snd_Type_Char_1a, snd_Ding_Shield_1a, snd_Cursor_Move_1a, 



_theme=STR_Secret; // Z1 'Secret Found' music
dm[?_theme+STR_Description] = "SECRET JINGLE";
add_sound_data(snd_Z1_Secret,   1, _theme,STR_Default);
//add_sound_data(snd_Z1_Secret,   1, _theme,_set_ZELDA1);
_val=asset_get_index("snd_Wyng1_SecretJingle"); if (_val!=-1){add_sound_data(_val, 1, _theme,dk_Wyng);}









//SND_SECRET_1A = add_sound_data(snd_Z1_Secret);         // Z1 'Secret Found' music
SND_BOSS_ROAR = add_sound_data(snd_Z1_Boss_Roar_1a);   // Z1 Boss roar
SND_STEP_1A   = add_sound_data(snd_Z1_Step_1a);        // Z1 walk into dungeon, but just 1 step 
SND_STEPS_1A  = add_sound_data(snd_Z1_Steps_1a);       // Z1 walk into dungeon
SND_REVL_ITEM = add_sound_data(snd_Z1_RevealItem);     // Z1 reveal item
SND_TYPE_CHR2 = add_sound_data(snd_Z1_TypeCharacter01);// Z1 type text char

SND_Z1_DNGN1_TRIANGLE_PART = add_sound_data(snd_Z1_Dungeon_Part1_Triangle_1a); // Triangle: Bass


// TODO: Fix fire sound.
// The following is either multiple recordings or 1 long one.
       SND_FIRE_VER = 1;
switch(SND_FIRE_VER)
{
    // ------------------------------------------
    // ------------------------------------------
    case 1:{
                                         _val = .8;
    SND_FIRE_1A = add_sound_data(snd_Fire_1a,_val);
    SND_FIRE_1B = add_sound_data(snd_Fire_1b,_val);
    SND_FIRE_1C = add_sound_data(snd_Fire_1c,_val);
    SND_FIRE_1D = add_sound_data(snd_Fire_1d,_val);
                dl_snd_fire = ds_list_create();
    ds_list_add(dl_snd_fire, SND_FIRE_1A); // 0: First idx is most recent one
    ds_list_add(dl_snd_fire, 0);           // 1: can play
    ds_list_add(dl_snd_fire, -1);          // 2: volume.  -1: use default
    ds_list_add(dl_snd_fire, 0);           // 3: timer
    ds_list_add(dl_snd_fire, $07);         // 4: timer reset
    ds_list_add(dl_snd_fire, SND_FIRE_1A); // 5: 
    ds_list_add(dl_snd_fire, SND_FIRE_1B); // 6: 
    ds_list_add(dl_snd_fire, SND_FIRE_1C); // 7: 
    ds_list_add(dl_snd_fire, SND_FIRE_1D); // 8: 
    break;}//case 1
    
    // ------------------------------------------
    // ------------------------------------------
    case 2:{
                                         _val = .8;
    SND_FIRE_1A = add_sound_data(snd_Fire_1a,_val);
    SND_FIRE_1B = add_sound_data(snd_Fire_1b,_val);
    SND_FIRE_1C = add_sound_data(snd_Fire_1c,_val);
    SND_FIRE_1D = add_sound_data(snd_Fire_1d,_val);
                dl_snd_fire = ds_list_create();
    ds_list_add(dl_snd_fire, SND_FIRE_1A); // snd
    ds_list_add(dl_snd_fire, 0);           // can play
    ds_list_add(dl_snd_fire, 0);           // timer
    ds_list_add(dl_snd_fire, $60);         // timer reset
    break;}//case 2
}//switch(SND_FIRE_VER)


























// ------------------------------------------------------------------------------







// OVERWORLD ---------------------------------------------------------
_prefix = "OVERWORLD: ";

_theme=STR_Overworld+STR_Standard;
dm[?_theme+STR_Description] = _prefix+"NORMAL";
add_sound_data(mus_Overworld_Body_1a,                   .9, _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,               .9, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,   _VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                    1, _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld"); if (_val!=-1){add_sound_data(_val,    _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Overworld_Body"); if (_val!=-1){add_sound_data(_val, _VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Overworld_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Overworld_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Overworld_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Overworld_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_Overworld_Intro")));}
_val=asset_get_index("mus_Wyng1_Overworld01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Overworld+dk_DeathMountain; // Death Mtn
dm[?_theme+STR_Description] = _prefix+"DEATH MOUNTAIN";
add_sound_data(mus_Overworld_Body_1a,                        .9, _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,                    .9, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,        _VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                         1, _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn_Intro")));}
_val=asset_get_index("mus_SteelCrescent_DeathMountain"); if (_val!=-1){add_sound_data(_val,       _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_DeathMountain"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_DeathMountain"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_DeathMountain"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_DeathMountain"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_DeathMountain01"); if (_val!=-1){add_sound_data(_val,              _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Overworld+dk_MazeIsland; // Maze Isl
dm[?_theme+STR_Description] = _prefix+"MAZE ISLAND";
add_sound_data(mus_Overworld_Body_1a,                       .9, _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,                   .9, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,       _VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                        1, _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Overworld_Body"); if (_val!=-1){add_sound_data(_val, _VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Overworld_Intro")));}
//_val=asset_get_index("mus_SteelCrescent_MazeIsland"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_MazeIsland"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_MazeIsland"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_MazeIsland"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_MazeIsland_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_MazeIsland_Intro")));}
_val=asset_get_index("mus_Wyng1_MazeIsland_Body"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Overworld+dk_ValleyOfDeath; // Valley of Death
dm[?_theme+STR_Description] = _prefix+"VALLEY OF DEATH";
add_sound_data(mus_Overworld_Body_1a,                        .9, _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,                    .9, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,        _VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                         1, _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn_Intro")));}
_val=asset_get_index("mus_SteelCrescent_DeathMountain"); if (_val!=-1){add_sound_data(_val, _VOL_STCR,  _theme,dk_SteelCrescent);} // 2024/09/07. SteelCrescent says, "change Kupardour's death Valley track back to Death Mountain"
//data_sound_valmus_SteelCrescent_ValleyOfDeath, _VOL_STCR,  _theme,dk_SteelCrescent);
_val=asset_get_index("mus_SteelCrescent2_DeathMountain"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_DeathMountain"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_DeathMountain"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_DeathMountain"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_MazeIsland_Body"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Overworld+STR_Dragmire; // Dragmire
dm[?_theme+STR_Description] = _prefix+"DRAGMIRE";
add_sound_data(mus_Overworld_Body_1a,                       .9, _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,                   .9, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,       _VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                        1, _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld_Dragmire_Body"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_Dragmire"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Dragmire"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Dragmire"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_Dragmire"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Dragmire"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_MazeIsland_Body"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}

_theme=STR_Overworld+STR_Makarrha; // Makarrha (Sword Island)
dm[?_theme+STR_Description] = _prefix+"MAKARRHA";
//_theme=SwordIsl_Name; // Makarrha (Sword Island)
//dm[?_theme+STR_Description] = _prefix+string_upper(SwordIsl_Name);
add_sound_data(mus_Overworld_Body_1a,                       .9,  _theme,STR_Default,        mus_Overworld_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Overworld"); if (_val!=-1){add_sound_data(_val,                   .9,  _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Overworld_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Overworld_Body"); if (_val!=-1){add_sound_data(_val,       _VOL_NIKO,  _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Overworld_Intro")));}
add_sound_data(mus_Z1_Overworld_Body,                        1,  _theme,_set_ZELDA1,        mus_Z1_Overworld_Intro);
_val=asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM,  _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Makarrha"); if (_val!=-1){add_sound_data(_val,           _VOL_STCR,  _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Makarrha_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_SwordIsland"); if (_val!=-1){add_sound_data(_val,       _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_MazeIsland"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_MazeIsland"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_SwordIsland"); if (_val!=-1){add_sound_data(_val,       _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_MazeIsland_Body"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}






// TOWNS ---------------------------------------------------------------------
//sdm("mus_Town_Body_1a: "+string(audio_sound_get_pitch(mus_Town_Body_1a))+", mus_Town_Intro_1a: "+string(audio_sound_get_pitch(mus_Town_Intro_1a)));
_prefix = "TOWN ";

_town_name = STR_Rauru;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                    1,  _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,                1,  _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,   _VOL_NIKO,  _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val,    _VOL_CHIM,  _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val, _VOL_STCR,  _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2,  max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3,  max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Ruto;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Saria;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Mido;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Nabooru;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Darunia;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_New_Kasuto;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a,                 1, _theme,STR_Default,        mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Town01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
//                                                                                                                  //
_town_name = STR_Old_Kasuto;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_House_1a,                         1, _theme,STR_Default);
_val=asset_get_index("mus_ZeldaII_FDS_Town"); if (_val!=-1){add_sound_data(_val,                 1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_House"); if (_val!=-1){add_sound_data(_val,        _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_OldKasuto"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_OldKasuto_Intro")));}
_val=asset_get_index("mus_SteelCrescent_OldKasuto2"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_OldKasuto"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_OldKasuto"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_House"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_House"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_OldKasuto_Body"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body,           1, _theme,dk_Castlevania2,    mus_Castlevania2_Town_Intro);
_val=asset_get_index("mus_SteelCrescent_OldKasuto"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,STR_Other);} // Old SteelCrescent1 Old Kasuto track.(Leaving it because I really like it)
//                                                                                                                  //
_town_name = STR_Bulblin;
_theme = _town_name;
dm[?_theme+STR_Description] = _prefix+string(val(g.dm_town[?STR_Town+STR_Num+_town_name]))+":"+string_upper(string_replace_all(_town_name,"_"," "));
add_sound_data(mus_Town_Body_1a, 1, _theme,STR_Default, mus_Town_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Town");         if (_val!=-1){add_sound_data(_val,        1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Town_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Town_Body");    if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Town_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Town");     if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Town_Body");  if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4,  max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5,  max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_Wyng1_Bulblin01");          if (_val!=-1){add_sound_data(_val,_VOL_WYNG1, _theme,dk_Wyng);}
add_sound_data(mus_Castlevania2_Town_Body, 1, _theme,dk_Castlevania2, mus_Castlevania2_Town_Intro);
//                                                                                                                  //









// DUNGEONS -------------------------------------------------------------
_a=$00;
_prefix = "DUNGEON ";

// Parapa Palace                                                                                                    //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": PARAPA PALACE";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon1"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon1_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_Dungeon_Intro")));}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Midoro Palace                                                                                                    //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": MIDORO PALACE";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon2"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon2_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_Dungeon_Intro")));}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Island Palace                                                                                                    //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": ISLAND PALACE";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon3"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon3_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_Dungeon_Intro")));}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Maze Island Palace                                                                                               //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": MAZE ISLAND PALACE";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon4"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon4_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Dungeon2"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Palace on the Sea                                                                                                //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": PALACE ON THE SEA";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon5"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon5_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Dungeon2"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Three-Eye-Rock Palace                                                                                            //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": HIDDEN PALACE";
add_sound_data(mus_Palace_Body_1a,                   1, _theme,STR_Default,        mus_Palace_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon1_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon1_Intro")));}
add_sound_data(mus_Z1_Dungeon_Body_1a,               1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon6"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon6_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Dungeon2"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_Dungeon01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Great Palace                                                                                                     //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": GREAT PALACE";
add_sound_data(mus_Great_Palace_Body_1a,             1, _theme,STR_Default,        mus_Great_Palace_Intro_1a);
//data_sound_valmus_ZeldaII_FDS_Dungeon,      1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));
_val=asset_get_index("mus_NikoTengoku_Dungeon2_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon2_Intro")));}
add_sound_data(mus_Z1_Dungeon2,                      1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Dungeon7"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Dungeon7_Intro")));}
_val=asset_get_index("mus_SteelCrescent_GreatPalace2_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_GreatPalace2_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_GreatPalace_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_GreatPalace_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_GreatPalace_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_GreatPalace_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_GreatPalace_Intro")));}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_GreatPalace01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
_val=asset_get_index("mus_SteelCrescent_GreatPalace_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,STR_Other, max(0,asset_get_index("mus_SteelCrescent_GreatPalace_Intro")));} // Old StellCrescent1 GreatPalace track.(Leaving it because I really like it)
//                                                                                                                  //
// Dragmire Tower                                                                                                   //
_theme=STR_Dungeon+hex_str(++_a);
dm[?_theme+STR_Description] = _prefix+string(_a)+": DRAGMIRE TOWER";
add_sound_data(mus_Broomietunes_DragmireTower,       1, _theme,STR_Default);
_val=asset_get_index("mus_ZeldaII_FDS_Dungeon"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Dungeon_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Dungeon2_Body"); if (_val!=-1){add_sound_data(_val,_VOL_NIKO, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Dungeon2_Intro")));}
add_sound_data(mus_Z1_Dungeon2,                      1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_DragmireTower_Body"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_DragmireTower_Intro")));}
_val=asset_get_index("mus_SteelCrescent_DragmireTower"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_DragmireTower"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_DragmireTower"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_DragmireTower"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_DragmireTower"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
add_sound_data(mus_Castlevania2_Dungeon_Body,           1, _theme,dk_Castlevania2,   mus_Castlevania2_Dungeon_Intro);
_val=asset_get_index("mus_Wyng1_DragmireTower01"); if (_val!=-1){add_sound_data(_val,          _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
// BOSS --------------------------------------------------------------
_theme=STR_Boss+"01"; // Normal boss music
dm[?_theme+STR_Description] = "BOSS: REGULAR";
add_sound_data(mus_Boss_Battle_1a,              1, _theme,STR_Default);
_val=asset_get_index("mus_ZeldaII_FDS_Boss"); if (_val!=-1){add_sound_data(_val,            1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_Boss1"); if (_val!=-1){add_sound_data(_val,   _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_Boss"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Boss_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Boss"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Boss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Boss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_Boss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Boss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_BossBattle01"); if (_val!=-1){add_sound_data(_val,     _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_Boss1_Body,     _VOL_WYNG1, _theme,dk_Wyng, mus_Wyng1_Boss1_Intro);
//                                                                                                                  //
_theme=dk_ThunderBird;
dm[?_theme+STR_Description] = "BOSS: THUNDERBIRD";
_val=asset_get_index("mus_IsabelleChiming_ThunderBird"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_ThunderBird_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Thunderbird"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Thunderbird"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Thunderbird"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_Thunderbird"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Thunderbird"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_Thunderbird01"); if (_val!=-1){add_sound_data(_val,     _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_Thunderbird_Body,     _VOL_WYNG1, _theme,dk_Wyng, mus_Wyng1_Thunderbird_Intro);
//                                                                                                                  //
_theme=dk_ShadowBoss+"01"; // Dark Lonk 1st Quest
dm[?_theme+STR_Description] = "BOSS: SHADOW LINK (1ST QUEST)";
add_sound_data(mus_Broomietunes_darklink_Body,        1, _theme,STR_Default,        mus_Broomietunes_darklink_Intro); // Broomietunes: Evil Blood - Body
//add_sound_data(mus_Shadow_Link_1a,                    1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_Boss2"); if (_val!=-1){add_sound_data(_val,         _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_ShadowBoss_Intro")));}
_val=asset_get_index("mus_SteelCrescent_DarkLink"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_ShadowBoss_Body"); if (_val!=-1){add_sound_data(_val,       _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=dk_ShadowBoss+"02"; // Dark Lonk 2nd Quest
dm[?_theme+STR_Description] = "BOSS: SHADOW LINK (2ND QUEST)";
add_sound_data(mus_Broomietunes_darklink_Body,        1, _theme,STR_Default,        mus_Broomietunes_darklink_Intro); // Broomietunes: Evil Blood - Body
_val=asset_get_index("mus_NikoTengoku_Boss2"); if (_val!=-1){add_sound_data(_val,         _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_EvilHeart_Body"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_EvilHeart_Intro")));}
_val=asset_get_index("mus_SteelCrescent_DarkLink"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_ShadowBoss"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_ShadowBoss_Body"); if (_val!=-1){add_sound_data(_val,       _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=STR_Ganon+"1"; // Ganon1
dm[?_theme+STR_Description] = "BOSS A1"; // no spoiler generalization
add_sound_data(mus_Boss_Battle_1a,                        1, _theme,STR_Default);
_val=asset_get_index("mus_ZeldaII_FDS_Boss"); if (_val!=-1){add_sound_data(_val,                      1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_Boss1"); if (_val!=-1){add_sound_data(_val,             _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_Boss"); if (_val!=-1){add_sound_data(_val,          _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Boss_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Ganon01"); if (_val!=-1){add_sound_data(_val,         _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Ganon01_Body"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Ganon01_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Ganon1And2_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Ganon1And2_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Ganon01"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Ganon01"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_BossBattle01"); if (_val!=-1){add_sound_data(_val,     _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_Boss1_Body,     _VOL_WYNG1, _theme,dk_Wyng, mus_Wyng1_Boss1_Intro);
//                                                                                                                  //
_theme=STR_Ganon+"2"; // Ganon2
dm[?_theme+STR_Description] = "BOSS A2"; // no spoiler generalization
add_sound_data(mus_Shadow_Link_1a,                        1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_Boss2"); if (_val!=-1){add_sound_data(_val,             _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_ShadowBoss"); if (_val!=-1){add_sound_data(_val,    _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_ShadowBoss_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Ganon01"); if (_val!=-1){add_sound_data(_val,         _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Ganon01_Body"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Ganon01_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Ganon1And2_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Ganon1And2_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Ganon01"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Ganon01"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_BossBattle01"); if (_val!=-1){add_sound_data(_val,     _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_Boss1_Body,     _VOL_WYNG1, _theme,dk_Wyng, mus_Wyng1_Boss1_Intro);
//                                                                                                                  //
_theme=STR_Ganon+"3"; // Ganon3
dm[?_theme+STR_Description] = "BOSS A3"; // no spoiler generalization
//dm[?_theme+STR_Description] = "BOSS: GANON, FINAL FORM";
add_sound_data(mus_Ganon_Battle1_Body,             1, _theme,STR_Default,        mus_Ganon_Battle1_Intro); // Broomietunes: ALttP final battle rendition - Body
//add_sound_data(mus_IsabelleChiming_Ganon3,        _VOL_CHIM,  _theme,dk_Nikos8BitStereo, mus_IsabelleChiming_Ganon3_Intro);
_val=asset_get_index("mus_IsabelleChiming_Ganon3"); if (_val!=-1){add_sound_data(_val,        _VOL_CHIM,  _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Ganon3_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Ganon_FinalPhase"); if (_val!=-1){add_sound_data(_val,_VOL_STCR,  _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Ganon02"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_GanonPhase03"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_Ganon03"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Ganon03"); if (_val!=-1){add_sound_data(_val,        _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_Ganon01"); if (_val!=-1){add_sound_data(_val,       _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_ShadowBoss_Body,       _VOL_WYNG1, _theme,dk_Wyng);
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
_theme=STR_Title;
dm[?_theme+STR_Description] = "TITLE";
add_sound_data(mus_Title_Body_1a,                     1, _theme,STR_Default,        mus_Title_Intro_1a);
_val=asset_get_index("mus_ZeldaII_FDS_Title"); if (_val!=-1){add_sound_data(_val,                 1, _theme,_set_ZELDA2_FDS,    max(0,asset_get_index("mus_ZeldaII_FDS_Title_Intro")));}
_val=asset_get_index("mus_NikoTengoku_Title_Body"); if (_val!=-1){add_sound_data(_val,           .7, _theme,dk_Nikos8BitStereo, max(0,asset_get_index("mus_NikoTengoku_Title_Intro")));}
add_sound_data(mus_Z1_Title,                          1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Title"); if (_val!=-1){add_sound_data(_val,     _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Title_Intro_1")));}
_val=asset_get_index("mus_SteelCrescent_Title_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent, max(0,asset_get_index("mus_SteelCrescent_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Title_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Title_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent3_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Title_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4, max(0,asset_get_index("mus_SteelCrescent4_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Title_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5, max(0,asset_get_index("mus_SteelCrescent5_Title_Intro")));}
_val=asset_get_index("mus_Wyng1_Title01"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//add_sound_data(mus_Wyng1_Title_Body,  _VOL_WYNG1, _theme,dk_Wyng, mus_Wyng1_Title_Intro);
add_sound_data(mus_Castlevania2_GameStart,            1, _theme,dk_Castlevania2);
//                                                                                                                  //
_theme=dk_FileSelect;
dm[?_theme+STR_Description] = "FILE SELECT";
_val=asset_get_index("mus_Broomietunes_FileSelect01"); if (_val!=-1){add_sound_data(_val,1, _theme,STR_Default);}
_val=asset_get_index("mus_IsabelleChiming_FileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_FileSelect_Intro")));}
_val=asset_get_index("mus_SteelCrescent_FileSelect2"); if (_val!=-1){add_sound_data(_val,max(_VOL_STCR,.8), _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_FileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_FileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_FileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_FileSelect"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_FileSelect_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
_val=asset_get_index("mus_Castlevania2_GameStart"); if (_val!=-1){add_sound_data(_val,            1, _theme,dk_Castlevania2);}
_val=asset_get_index("mus_SteelCrescent_FileSelect"); if (_val!=-1){add_sound_data(_val,max(_VOL_STCR,.8), _theme,STR_Other);} // Old SteelCrescent1 FileSelect track.(Leaving it because I really like it)
//                                                                                                                  //
_theme=dk_ContinueSave;
dm[?_theme+STR_Description] = "CONTINUE/SAVE";
add_sound_data(mus_Z1_GameOver_1a,                      1, _theme,STR_Default);
add_sound_data(mus_Z1_GameOver_1a,                      1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_GameOver"); if (_val!=-1){add_sound_data(_val,    _VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_GameOver_Intro")));}
_val=asset_get_index("mus_SteelCrescent_ContinueSave"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_ContinueSave"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_ContinueSave"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent2_ContinueSave"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent2_ContinueSave"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_ContinueSave_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=STR_House+"01";
dm[?_theme+STR_Description] = "IN HOUSE";
add_sound_data(mus_House_1a,                       1, _theme,STR_Default);
_val=asset_get_index("mus_ZeldaII_FDS_House"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_House"); if (_val!=-1){add_sound_data(_val,      _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_InDoors"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_InDoors_Intro")));}
_val=asset_get_index("mus_SteelCrescent_House"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_House_1"); if (_val!=-1){add_sound_data(_val, _VOL_STCR2, _theme,dk_SteelCrescent2);}
//data_sound_valmus_SteelCrescent2_House,  _VOL_STCR2, _theme,dk_SteelCrescent2);
_val=asset_get_index("mus_SteelCrescent3_House"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_House"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_House"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_House_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=STR_Basement+"01";
dm[?_theme+STR_Description] = "FAST TRAVEL TUNNELS";
add_sound_data(mus_House_1a_Triangle_1a,                   1, _theme,STR_Default);
_val=asset_get_index("mus_IsabelleChiming_FastTravel_Body"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_FastTravel_Intro")));}
_val=asset_get_index("mus_SteelCrescent_FastTravelTunnels"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_TravelTunnels"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_TravelTunnels"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_TravelTunnels"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_TravelTunnels"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_FastTravelTunnels_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
_theme=dk_Minigame+"01";
dm[?_theme+STR_Description] = "MINIGAME";
add_sound_data(mus_Minigame1,                            1, _theme,STR_Default,        mus_Minigame1_Intro);
_val=asset_get_index("mus_IsabelleChiming_Minigame_Body"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming, max(0,asset_get_index("mus_IsabelleChiming_Minigame_Intro")));}
_val=asset_get_index("mus_SteelCrescent_MiniGame_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
//_val=asset_get_index("mus_SteelCrescent_MiniGame_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent,   max(0,asset_get_index("mus_SteelCrescent_MiniGame_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Minigame_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2, max(0,asset_get_index("mus_SteelCrescent2_Minigame_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Minigame_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3, max(0,asset_get_index("mus_SteelCrescent2_Minigame_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_MiniGame"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_MiniGame"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_Minigame_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
// ------------------------------------------------------------------------------
for(_i=1; _i<=2; _i++)
{
    _theme=STR_Battle+hex_str(_i);
    dm[?_theme+STR_Description] = "BATTLE "+string(_i);
    //add_sound_data(mus_Battle_Main_1a, 1, _theme,STR_Default);
    switch(_i){
    case 1:{
    add_sound_data(mus_Battle_Main_1a, 1, _theme,STR_Default);
    _val=asset_get_index("mus_NikoTengoku_Battle1");    if (_val!=-1){add_sound_data(_val,        .9,  _theme,dk_Nikos8BitStereo);}
    _val=asset_get_index("mus_NikoTengoku_Battle1_2");  if (_val!=-1){add_sound_data(_val,        .6,  _theme,STR_Other);}
    _val=asset_get_index("mus_IsabelleChiming_Battle"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM,  _theme,dk_IsabelleChiming);}
    _val=asset_get_index("mus_Wyng1_Battle1_Body");     if (_val!=-1){add_sound_data(_val, _VOL_WYNG1, _theme,dk_Wyng);}
    break;}
    case 2:{ // unused battle theme variation that's fuller with reverb
    _val=asset_get_index("mus_NikoTengoku_Battle1_2");          if (_val!=-1){add_sound_data(mus_Battle_Main_1a, 1, _theme,STR_Default);}
    _val=asset_get_index("mus_NikoTengoku_Battle1_2");          if (_val!=-1){add_sound_data(_val,        .6,  _theme,dk_Nikos8BitStereo);}
    _val=asset_get_index("mus_IsabelleChiming_Battle");         if (_val!=-1){add_sound_data(_val, _VOL_CHIM,  _theme,dk_IsabelleChiming);}
    _val=asset_get_index("mus_IsabelleChiming_BattleJPN_Body"); if (_val!=-1){add_sound_data(_val, _VOL_CHIM,  _theme,dk_IsabelleChiming2, max(0,asset_get_index("mus_IsabelleChiming_BattleJPN_Intro")));}
    _val=asset_get_index("mus_Wyng1_Battle2_Body");             if (_val!=-1){add_sound_data(_val, _VOL_WYNG1, _theme,dk_Wyng);}
    break;}
    }
    _val=asset_get_index("mus_ZeldaII_FDS_Battle");    if (_val!=-1){add_sound_data(_val,         1,  _theme,_set_ZELDA2_FDS);}
    _val=asset_get_index("mus_SteelCrescent_Battle");  if (_val!=-1){add_sound_data(_val, _VOL_STCR,  _theme,dk_SteelCrescent);}
    _val=asset_get_index("mus_SteelCrescent2_Battle"); if (_val!=-1){add_sound_data(_val, _VOL_STCR2, _theme,dk_SteelCrescent2);}
    _val=asset_get_index("mus_SteelCrescent3_Battle"); if (_val!=-1){add_sound_data(_val, _VOL_STCR3, _theme,dk_SteelCrescent3);}
    _val=asset_get_index("mus_SteelCrescent4_Battle"); if (_val!=-1){add_sound_data(_val, _VOL_STCR4, _theme,dk_SteelCrescent4);}
    _val=asset_get_index("mus_SteelCrescent5_Battle"); if (_val!=-1){add_sound_data(_val, _VOL_STCR5, _theme,dk_SteelCrescent5);}
    add_sound_data(mus_Castlevania2_BloodyTears_Body, 1, _theme,dk_Castlevania2, mus_Castlevania2_BloodyTears_Intro);
}

/*
_theme=STR_Cave+"01";
dm[?_theme+STR_Description] = "CAVE";
add_sound_data(mus_Battle_Main_1a,                1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_Battle1"); if (_val!=-1){                                                add_sound_data(_val,          .8, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_Battle"); if (_val!=-1){                                                add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
//add_sound_data(mus_Castlevania2_BloodyTears_Body, 1, _theme,dk_Castlevania2, mus_Castlevania2_BloodyTears_Intro);
*/
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
_theme=dk_PlaceCrystal;
dm[?_theme+STR_Description] = "PLACE CRYSTAL";
add_sound_data(mus_PlaceCrystal01,                      1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_PlaceCrystal"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
_val=asset_get_index("mus_IsabelleChiming_DungeonClear"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_PalaceClear"); if (_val!=-1){add_sound_data(_val,   _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_DungeonClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_DungeonClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_DungeonClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_DungeonClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_DungeonClear_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// Win Game; Hold triforce, defeated Ganon.  length: about $108 frames
_theme=dk_GameClear;
dm[?_theme+STR_Description] = "GAME CLEAR";
add_sound_data(mus_Victory_Fanfare_1a,               1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_GameClear"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_GameClear,                     1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_GameClear"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_GameClear_PirateVer"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_GameClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_GameClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_GameClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_GameClear"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_GameClear_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=dk_WakeZelda; // For 1st Quest
dm[?_theme+STR_Description] = "WAKE ZELDA - 1ST QUEST";
add_sound_data(mus_Wake_Zelda_1a,                      1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_WakeZelda"); if (_val!=-1){add_sound_data(_val,      _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_GameOver_1a,                     1, _theme,_set_ZELDA1);
//add_sound_data(mus_Z1_Credits_Intro,                 1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_Credits_Intro"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_Wyng1_PrincessZeldaQuest1_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
_theme=dk_WakeZelda+"2"; // For 2nd Quest
dm[?_theme+STR_Description] = "WAKE ZELDA - 2ND QUEST";
add_sound_data(mus_Wake_Zelda_1a,                      1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_WakeZelda"); if (_val!=-1){add_sound_data(_val,      _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_GameOver_1a,                     1, _theme,_set_ZELDA1);
//add_sound_data(mus_Z1_Credits_Intro,                 1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_Credits_Intro"); if (_val!=-1){add_sound_data(_val,_VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_WakeZelda"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_Wyng1_PrincessZeldaQuest2_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
// The credits scene's theme is dk_WakeZelda, so the credits track 
// is triggered by Cutscene_GameEnd_1B_update() when "THE END" text is 
// displayed (right before the curtains start to rise).
_theme=dk_Credits;
dm[?_theme+STR_Description] = "CREDITS";
add_sound_data(mus_End_Credits_1a,                      1, _theme,STR_Default);
_val=asset_get_index("mus_NikoTengoku_EndCredits"); if (_val!=-1){add_sound_data(_val,      _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Credits_Body,                     1, _theme,_set_ZELDA1, mus_Z1_Credits_Intro);
_val=asset_get_index("mus_IsabelleChiming_Credits"); if (_val!=-1){add_sound_data(_val,     _VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_Credits_Body"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Credits_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent3_Credits_Body"); if (_val!=-1){add_sound_data(_val,_VOL_STCR3, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_Credits"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_Credits"); if (_val!=-1){add_sound_data(_val,     _VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_Credits"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                                                  //
//                                                                                                                  //
//                                                                                                                  //
_theme=dk_GetSpell;
dm[?_theme+STR_Description] = "GET SPELL";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_Get_Spell_1a,                    1, _theme,STR_Default); // same as mus_Level_Up_1a
_val=asset_get_index("mus_ZeldaII_FDS_GetSpell"); if (_val!=-1){add_sound_data(_val,            1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_GetSpell"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Get_Item_1a,                  1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_GetSpell"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_GetSpell"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
_theme=dk_SaveGame; // Same as Get Spell. When saving w/ NPC
dm[?_theme+STR_Description] = "SAVE GAME";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_SaveGame_Default,                1, _theme,STR_Default); // same as mus_Get_Spell_1a
_val=asset_get_index("mus_ZeldaII_FDS_SaveGame"); if (_val!=-1){add_sound_data(_val,            1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_SaveGame"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Get_Item_1a,                  1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_SaveGame"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_SaveGame"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_SaveGame"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_SaveGame"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_GetSpell"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
_theme=dk_LevelUp;
dm[?_theme+STR_Description] = "LEVEL UP";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_Level_Up_1a,                    1, _theme,STR_Default); // same as mus_Level_Up_1a
_val=asset_get_index("mus_ZeldaII_FDS_LevelUp"); if (_val!=-1){add_sound_data(_val,            1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_LevelUp"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Get_Item_1a,                 1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_LevelUp"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_LevelUp"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
_theme=dk_Fanfare; // Same as Level Up. Reveal NewKasuto, P6, RiverDevil, ScroblinDoor
dm[?_theme+STR_Description] = "FANFARE";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_Fanfare01,                        1, _theme,STR_Default); // same as mus_Level_Up_1a
_val=asset_get_index("mus_ZeldaII_FDS_Fanfare01"); if (_val!=-1){add_sound_data(_val,            1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_Fanfare01"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_ShowTriforce,                  1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_Fanfare01"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_Fanfare01"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_Fanfare"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_Fanfare"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_LevelUp"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
_theme=dk_GetItem+"01"; // Same as Level Up. Hold item over head (major items, quest items, completed containers), RemoveBarrier2
dm[?_theme+STR_Description] = "GET ITEM 1";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_GetItem01,                        1, _theme,STR_Default); // same as mus_Level_Up_1a
_val=asset_get_index("mus_ZeldaII_FDS_GetItem"); if (_val!=-1){add_sound_data(_val,              1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_GetItem01"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Get_Item_1a,                   1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_GetItem01"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_GetItem01"); if (_val!=-1){add_sound_data(_val,  _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_GetItem01"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_GetItem01"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_LevelUp"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_CompleteContainer"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
_theme=dk_GetItem+"02"; // Same as Get Spell.  // Hold item over head (incomplete container, 1up doll)
dm[?_theme+STR_Description] = "GET ITEM 2";
dm[?dk_SceneMusicThemeException+"02"+_theme] = true;
add_sound_data(mus_GetItem02,                        1, _theme,STR_Default); // same as mus_Get_Spell_1a
_val=asset_get_index("mus_ZeldaII_FDS_GetItem2"); if (_val!=-1){add_sound_data(_val,             1, _theme,_set_ZELDA2_FDS);}
_val=asset_get_index("mus_NikoTengoku_GetItem02"); if (_val!=-1){add_sound_data(_val,    _VOL_NIKO, _theme,dk_Nikos8BitStereo);}
add_sound_data(mus_Z1_Get_Item_1a,                   1, _theme,_set_ZELDA1);
_val=asset_get_index("mus_IsabelleChiming_GetItem02"); if (_val!=-1){add_sound_data(_val,_VOL_CHIM, _theme,dk_IsabelleChiming);}
_val=asset_get_index("mus_SteelCrescent_GetItem"); if (_val!=-1){add_sound_data(_val,    _VOL_STCR, _theme,dk_SteelCrescent);}
_val=asset_get_index("mus_SteelCrescent2_GetItem02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent2);}
_val=asset_get_index("mus_SteelCrescent2_GetItem02"); if (_val!=-1){add_sound_data(_val,_VOL_STCR2, _theme,dk_SteelCrescent3);}
_val=asset_get_index("mus_SteelCrescent4_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR4, _theme,dk_SteelCrescent4);}
_val=asset_get_index("mus_SteelCrescent5_GetSpell"); if (_val!=-1){add_sound_data(_val,_VOL_STCR5, _theme,dk_SteelCrescent5);}
_val=asset_get_index("mus_Wyng1_GetSpell"); if (_val!=-1){add_sound_data(_val,  _VOL_WYNG1, _theme,dk_Wyng);}
//                                                                                      //
//                                                                                      //
//                                                                                      //
MUS_Z1_DNGN1               = add_sound_data(mus_Z1_Dungeon_Body_1a);
MUS_Z1_DNGN1_SQUARES       = add_sound_data(mus_Z1_Dungeon_Square1_Square2_1a);
MUS_Z1_DNGN1_TRIANGLE      = add_sound_data(mus_Z1_Dungeon_Triangle_1a);
MUS_Z1_DNGN1_TRIANGLE_PART = add_sound_data(mus_Z1_Dungeon_Part1_Triangle_1a);
MUS_Z1_DNGN1_INTRO         = MUS_Z1_DNGN1_SQUARES;




global.dl_Halloween_TOWN_MUSIC = ds_list_create();
_val=asset_get_index("mus_Wyng1_MazeIsland_Body"); if (_val!=-1){ds_list_add(global.dl_Halloween_TOWN_MUSIC,_val);}
_val=asset_get_index("mus_IsabelleChiming_OldKasuto"); if (_val!=-1){ds_list_add(global.dl_Halloween_TOWN_MUSIC,_val);}
_val=asset_get_index("mus_Wyng1_OldKasuto_Body"); if (_val!=-1){ds_list_add(global.dl_Halloween_TOWN_MUSIC,_val);}
ds_list_add(global.dl_Halloween_TOWN_MUSIC,mus_Z1_Dungeon_Triangle_1a);
ds_list_add(global.dl_Halloween_TOWN_MUSIC,mus_Castlevania2_BloodyTears_Body);
ds_list_add(global.dl_Halloween_TOWN_MUSIC,mus_Castlevania2_Town_Body);




_val=asset_get_index("mus_Wyng1_Credits"); if (_val!=-1){dm[?audio_get_name(_val)+STR_Loop] = false;} // Wyng says the credits track should NOT loop







PRIORITY_TOP = $FF; // highest priority
PRIORITY_LOW = 0;   // lowest  priority


rm_music_theme      = STR_Title;
rm_music_theme_prev = rm_music_theme;

current_theme_random_track = 0;









dm_random_custom = ds_map_create();
_count = val(dm[?STR_Theme+STR_Count+STR_Music]);
for(_i=1; _i<=_count; _i++)
{
    _theme = dm[?STR_Theme+STR_Music+hex_str(_i)];
    _count1 = val(dm[?_theme+STR_Track+STR_Count+STR_Music]);
    for(_j=1; _j<=_count1; _j++)
    {
        dm_random_custom[?_theme+hex_str(_j)+STR_Qualified] = true;
    }
}









// intro of mus_rm_body
mus_rm_intr = 0; 
// music track for current rm
mus_rm_body = 0; 
// music track to play on any given frame when playing music is qualified
mus_rm_curr = 0;
// instance of music track to play on any given frame when playing music is qualified
mus_rm_inst = 0;
// music body prev rm
mus_rm_body_prev = 0;


encounter_sound_inst = 0;


can_play_mus_rm_body = true;
mus_rm_started = false;

// This is just in case there is a boss intro track 
// and the boss is defeated before the boss intro is done 
// and the boss body hasn't played yet
can_play_boss_music = false;






// NOTE: According to PixelatedPope's music looping video, 
// GameMaker runs audio in a completely separate system from the game 
// so tracking any sounds by FRAME won't work.
// Updating these each frame and comparing them gives ability to 
// determine the frame the song looped since the track pos on the 
// loop frame is a fraction instead of an int. 
// This is useful for timing things based on when the song starts.
// audio_sound_get_track_position() returns a very precise fraction 
// instead of an int
mus_rm_pos_prev = 0;
mus_rm_pos_curr = 0;


// The timing_sound_.. variables are used to loop the title screen scrolling properly
timing_sound_position_prev = 0;
timing_sound_position_curr = 0;
timing_sound_inst = 0;

add_sound_data(snd_Default_Title_Intro_no_volume,0);
add_sound_data(snd_Default_Title_no_volume,0);


mus_rm_body_last_pos = 0;
mus_asset_name_interrupted = 0;
//sound_inst_interrupted_mus_rm_body = 0;



// Incremented in update_Sound if 'walk water' sound is 
// to play. Bit 1 means the pitch is higher.
walk_water_played_count = 0; // 07F6


dm_music_inst = ds_map_create();





LowHPSound_PLAY_LIMIT1 = $08; // How many times snd can play at OG speed
LowHPSound_counter1    = 0;
LowHPSound_counter2    = 0;
LowHPSound_HP_AMT      = Container_AMT;



pitch1           = 1;
pitch1_MIN       = 0.85;
pitch1_MAX       = 1.15;
pitch1_dir       = -1;
pitch1_timer     = 0;
pitch1_timer2    = 0;
pitch1_duration  = 0;
pitch1_DURATION1 = $40;
pitch1_DURATION2 = $60;





TOGGLE_SOUND_KEY = ord("N");
TOGGLE_MUSIC_KEY = ord("M");







var _dl1 = ds_list_create();
var _dl2 = ds_list_create();

// IsabelleChiming
_val=asset_get_index("mus_IsabelleChiming_Overworld_Dragmire_Body"); if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_IsabelleChiming_Overworld");               if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Overworld");               if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn");      if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn");      if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_DeathMtn_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl");       if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl");       if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Overworld_MazeIsl_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon1");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon1_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon1");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon1_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon2");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon2_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon2");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon2_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon3");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon3_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon3");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon3_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon4");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon4_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon4");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon4_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon5");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon5_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon5");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon5_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon6");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon6_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon6");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon6_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Dungeon7");                if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon7_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_Dungeon7");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Dungeon7_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_DragmireTower_Body");      if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_IsabelleChiming_DragmireTower_Intro")));}
_val=asset_get_index("mus_IsabelleChiming_DragmireTower_Body");      if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_DragmireTower_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Boss");                    if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Boss_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_ThunderBird");             if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_ThunderBird_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_ShadowBoss");              if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_ShadowBoss_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_EvilHeart_Body");          if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_EvilHeart_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Ganon3");                  if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Ganon3_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_BattleJPN_Body");          if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_BattleJPN_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Title");                   if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Title_Intro_1")));}

_val=asset_get_index("mus_IsabelleChiming_FileSelect");              if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_FileSelect_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_GameOver");                if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_GameOver_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_InDoors");                 if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_InDoors_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_FastTravel_Body");         if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_FastTravel_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Minigame_Body");           if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Minigame_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_Town");                    if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_Town_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_OldKasuto");               if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_IsabelleChiming_OldKasuto_Intro")));}

_val=asset_get_index("mus_IsabelleChiming_WakeZelda");               if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_IsabelleChiming_Credits");                 if (_val!=-1){ds_list_add(_dl2,_val);}




// SteelCrescent
_val=asset_get_index("mus_SteelCrescent_Overworld_Body");    if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Overworld_Body");   if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent2_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Overworld_Body");   if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent3_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Overworld_Body");   if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent4_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Overworld_Body");   if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent5_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent_Overworld_Body");    if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Overworld_Body");   if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Overworld_Body");   if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Overworld_Body");   if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent4_Overworld_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Overworld_Body");   if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_Overworld_Intro")));}

_val=asset_get_index("mus_SteelCrescent_DeathMountain");     if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_DeathMountain");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent3_DeathMountain");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent4_DeathMountain");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent5_DeathMountain");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent_DeathMountain");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_DeathMountain");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_DeathMountain");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_DeathMountain");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_DeathMountain");    if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_MazeIsland");        if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_MazeIsland");       if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent3_MazeIsland");       if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent4_MazeIsland");       if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent5_MazeIsland_Body");  if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent5_MazeIsland_Intro")));}
_val=asset_get_index("mus_SteelCrescent_MazeIsland");        if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_MazeIsland");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_MazeIsland");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_MazeIsland");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_MazeIsland_Body");  if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_MazeIsland_Intro")));}

_val=asset_get_index("mus_SteelCrescent_Dragmire");          if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_Dragmire");         if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent3_Dragmire");         if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent4_Dragmire");         if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent5_Dragmire");         if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent_Dragmire");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_Dragmire");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_Dragmire");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Dragmire");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Dragmire");         if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent2_SwordIsland");      if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent5_SwordIsland");      if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_SwordIsland");      if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_SwordIsland");      if (_val!=-1){ds_list_add(_dl2,_val);}
/*
_val=asset_get_index("mus_SteelCrescent_Town_Body");         if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body");        if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body");        if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body");        if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body");        if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_OldKasuto");        if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent3_OldKasuto");        if (_val!=-1){ds_list_add(_dl1,_val);}
*/
_val=asset_get_index("mus_SteelCrescent_Town_Body");         if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Town_Body");        if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Town_Body");        if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Town_Body");        if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent4_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Town_Body");        if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_Town_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_OldKasuto");        if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_OldKasuto");        if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Dungeon_Body");      if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Dungeon2");         if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent2_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent5_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02");   if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent_Dungeon_Body");      if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent4_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Dungeon_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_Dungeon_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_DungeonTheme02");   if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_GreatPalace_Body");  if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent2_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent3_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent4_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl1,_val, max(0,asset_get_index("mus_SteelCrescent5_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent_GreatPalace_Body");  if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent4_GreatPalace_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_GreatPalace_Body"); if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_GreatPalace_Intro")));}

_val=asset_get_index("mus_SteelCrescent_DragmireTower");     if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent2_DragmireTower");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent3_DragmireTower");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent4_DragmireTower");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent5_DragmireTower");    if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_SteelCrescent_DragmireTower");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_DragmireTower");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_DragmireTower");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_DragmireTower");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_DragmireTower");    if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Boss");              if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_Boss");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_Boss");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Boss");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Boss");             if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Thunderbird");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_Thunderbird");      if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_Thunderbird");      if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Thunderbird");      if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Thunderbird");      if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_DarkLink");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_ShadowBoss");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_ShadowBoss");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_ShadowBoss");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_ShadowBoss");       if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent2_Ganon01_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Ganon01_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Ganon1And2_Body");  if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_Ganon1And2_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Ganon01");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Ganon01");          if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent2_Ganon02");          if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Ganon_FinalPhase");  if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_GanonPhase03");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Ganon03");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Ganon03");          if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Title_Body");        if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Title_Body");       if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent3_Title_Body");       if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent3_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_Title_Body");       if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent4_Title_Intro")));}
_val=asset_get_index("mus_SteelCrescent5_Title_Body");       if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent5_Title_Intro")));}

_val=asset_get_index("mus_SteelCrescent_FileSelect");        if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_FileSelect");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_FileSelect");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_FileSelect");       if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_FileSelect");       if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_ContinueSave");      if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_ContinueSave");     if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_House");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_House_1");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_House");            if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_House");            if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_House");            if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_FastTravelTunnels"); if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_TravelTunnels");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_TravelTunnels");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_TravelTunnels");    if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_MiniGame_Body");     if (_val!=-1){ds_list_add(_dl2,_val);}
//_val=asset_get_index("mus_SteelCrescent_MiniGame_Body");     if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent_MiniGame_Intro")));}
_val=asset_get_index("mus_SteelCrescent2_Minigame_Body");    if (_val!=-1){ds_list_add(_dl2,_val, max(0,asset_get_index("mus_SteelCrescent2_Minigame_Intro")));}
_val=asset_get_index("mus_SteelCrescent4_MiniGame");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_MiniGame");         if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Battle");            if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_Battle");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_Battle");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Battle");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Battle");           if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_SteelCrescent_Credits_Intro");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent2_Credits_Body");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent3_Credits_Body");     if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent4_Credits");          if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_SteelCrescent5_Credits");          if (_val!=-1){ds_list_add(_dl2,_val);}




// Wyng
_val=asset_get_index("mus_Wyng1_MazeIsland_Body");           if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_OldKasuto_Body");            if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_Overworld01");               if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_DeathMountain01");           if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_Dungeon01");                 if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_GreatPalace01");             if (_val!=-1){ds_list_add(_dl1,_val);}
_val=asset_get_index("mus_Wyng1_DragmireTower01");           if (_val!=-1){ds_list_add(_dl1,_val);}
//ds_list_add(_dl1,mus_Wyng1_Town01);
//ds_list_add(_dl1,mus_Wyng1_Bulblin01);

_val=asset_get_index("mus_Wyng1_MazeIsland_Body");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_OldKasuto_Body");            if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_ShadowBoss_Body");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_FileSelect_Body");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_ContinueSave_Body");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_House_Body");                if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_FastTravelTunnels_Body");    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Minigame_Body");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Battle1_Body");              if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Battle2_Body");              if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_DungeonClear_Body");         if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_GameClear_Body");            if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_PrincessZeldaQuest1_Body");  if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_PrincessZeldaQuest2_Body");  if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Credits");                   if (_val!=-1){ds_list_add(_dl2,_val);}

_val=asset_get_index("mus_Wyng1_Overworld01");               if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_DeathMountain01");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Town01");                    if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Bulblin01");                 if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Dungeon01");                 if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_GreatPalace01");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_DragmireTower01");           if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_BossBattle01");              if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Thunderbird01");             if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Ganon01");                   if (_val!=-1){ds_list_add(_dl2,_val);}
_val=asset_get_index("mus_Wyng1_Title01");                   if (_val!=-1){ds_list_add(_dl2,_val);}




ds_list_add(_dl2,mus_Castlevania2_GameStart);
ds_list_add(_dl2,mus_Castlevania2_Town_Body, mus_Castlevania2_Town_Intro);
ds_list_add(_dl2,mus_Castlevania2_BloodyTears_Body, mus_Castlevania2_BloodyTears_Intro);
ds_list_add(_dl2,mus_Castlevania2_Night_Body, mus_Castlevania2_Night_Intro);
ds_list_add(_dl2,mus_Castlevania2_Dungeon_Body, mus_Castlevania2_Dungeon_Intro);


for(_i=ds_list_size(_dl1)-1; _i>=0; _i--)
{   // These tracks should persist into certain rooms like encounters
    dm[?dk_SceneMusicThemeException+"01"+audio_get_name(_dl1[|_i])] = true;
}

for(_i=ds_list_size(_dl2)-1; _i>=0; _i--)
{   // These tracks should resume at interupption pos if interrupted
    dm[?dk_SceneMusicThemeException+"02"+audio_get_name(_dl2[|_i])] = true;
}





// Isabelle Chiming --------------------------------------
/*
dm[?audio_get_name(mus_IsabelleChiming_OverworldStandard01)     +STR_Intro+STR_Length] = 006.400;
dm[?audio_get_name(mus_IsabelleChiming_OverworldStandard01)     +STR_Body +STR_Length] = 067.208;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_OverworldDeathMountain01)+STR_Intro+STR_Length] = 006.936;
dm[?audio_get_name(mus_IsabelleChiming_OverworldDeathMountain01)+STR_Body +STR_Length] = 060.675;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_OverworldMazeIsland01)   +STR_Intro+STR_Length] = 005.334;
dm[?audio_get_name(mus_IsabelleChiming_OverworldMazeIsland01)   +STR_Body +STR_Length] = 042.671;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_Town01)                  +STR_Intro+STR_Length] = 003.733;
dm[?audio_get_name(mus_IsabelleChiming_Town01)                  +STR_Body +STR_Length] = 063.471;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_OldKasuto01)             +STR_Intro+STR_Length] = 007.470;
dm[?audio_get_name(mus_IsabelleChiming_OldKasuto01)             +STR_Body +STR_Length] = 044.803;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_ParapaPalace01)          +STR_Intro+STR_Length] = 003.200;
dm[?audio_get_name(mus_IsabelleChiming_ParapaPalace01)          +STR_Body +STR_Length] = 089.608;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_MidoroPalace01)          +STR_Intro+STR_Length] = 018.135;
dm[?audio_get_name(mus_IsabelleChiming_MidoroPalace01)          +STR_Body +STR_Length] = 081.609;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_IslandPalace01)          +STR_Intro+STR_Length] = 005.868;
dm[?audio_get_name(mus_IsabelleChiming_IslandPalace01)          +STR_Body +STR_Length] = 112.944;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_MazeIslandPalace01)      +STR_Intro+STR_Length] = 010.670;
dm[?audio_get_name(mus_IsabelleChiming_MazeIslandPalace01)      +STR_Body +STR_Length] = 151.361;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_PalaceOnTheSea01)        +STR_Intro+STR_Length] = 006.934;
dm[?audio_get_name(mus_IsabelleChiming_PalaceOnTheSea01)        +STR_Body +STR_Length] = 180.283;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_HiddenPalace01)          +STR_Intro+STR_Length] = 003.211;
dm[?audio_get_name(mus_IsabelleChiming_HiddenPalace01)          +STR_Body +STR_Length] = 112.810;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_GreatPalace01)           +STR_Intro+STR_Length] = 004.802;
dm[?audio_get_name(mus_IsabelleChiming_GreatPalace01)           +STR_Body +STR_Length] = 064.004;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_DragmireTower01)         +STR_Intro+STR_Length] = 008.619;
dm[?audio_get_name(mus_IsabelleChiming_DragmireTower01)         +STR_Body +STR_Length] = 051.505;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_BossBattle01)            +STR_Intro+STR_Length] = 002.404;
dm[?audio_get_name(mus_IsabelleChiming_BossBattle01)            +STR_Body +STR_Length] = 038.405;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_Thunderbird01)           +STR_Intro+STR_Length] = 002.409;
dm[?audio_get_name(mus_IsabelleChiming_Thunderbird01)           +STR_Body +STR_Length] = 025.203;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_ShadowBoss01)            +STR_Intro+STR_Length] = 009.603;
dm[?audio_get_name(mus_IsabelleChiming_ShadowBoss01)            +STR_Body +STR_Length] = 070.405;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_EvilHeart01)             +STR_Intro+STR_Length] = 016.000;
dm[?audio_get_name(mus_IsabelleChiming_EvilHeart01)             +STR_Body +STR_Length] = 080.009;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_GanonFinalForm01)        +STR_Intro+STR_Length] = 008.007;
dm[?audio_get_name(mus_IsabelleChiming_GanonFinalForm01)        +STR_Body +STR_Length] = 071.740;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_Title01)                 +STR_Intro+STR_Length] = 025.606;
dm[?audio_get_name(mus_IsabelleChiming_Title01)                 +STR_Body +STR_Length] = 059.739;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_FileSelect01)            +STR_Intro+STR_Length] = 002.934;
dm[?audio_get_name(mus_IsabelleChiming_FileSelect01)            +STR_Body +STR_Length] = 023.469;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_FileSelect01_1)          +STR_Intro+STR_Length] = 002.934;
dm[?audio_get_name(mus_IsabelleChiming_FileSelect01_1)          +STR_Body +STR_Length] = 023.469;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_ContinueSave01)          +STR_Intro+STR_Length] = 010.668;
dm[?audio_get_name(mus_IsabelleChiming_ContinueSave01)          +STR_Body +STR_Length] = 010.668;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_House01)                 +STR_Intro+STR_Length] = 007.466;
dm[?audio_get_name(mus_IsabelleChiming_House01)                 +STR_Body +STR_Length] = 029.868;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_Basement01)              +STR_Intro+STR_Length] = 016.001;
dm[?audio_get_name(mus_IsabelleChiming_Basement01)              +STR_Body +STR_Length] = 010.667;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_Minigame01)              +STR_Intro+STR_Length] = 001.900;
dm[?audio_get_name(mus_IsabelleChiming_Minigame01)              +STR_Body +STR_Length] = 020.269;
//                                                                                                  //
dm[?audio_get_name(mus_IsabelleChiming_BattleJPN01)             +STR_Intro+STR_Length] = 002.823;
dm[?audio_get_name(mus_IsabelleChiming_BattleJPN01)             +STR_Body +STR_Length] = 042.668;
//                                                                                                  //
*/




// Wyng --------------------------------------
_val=asset_get_index("mus_Wyng1_Overworld01");     if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 011.319;}
_val=asset_get_index("mus_Wyng1_Overworld01");     if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 077.617;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_DeathMountain01"); if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 006.909;}
_val=asset_get_index("mus_Wyng1_DeathMountain01"); if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 051.818;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Town01");          if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 003.535;}
_val=asset_get_index("mus_Wyng1_Town01");          if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 062.959;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Bulblin01");       if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 003.968;}
_val=asset_get_index("mus_Wyng1_Bulblin01");       if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 068.655;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Dungeon01");       if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 003.310;}
_val=asset_get_index("mus_Wyng1_Dungeon01");       if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 099.955;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_GreatPalace01");   if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 033.529;}
_val=asset_get_index("mus_Wyng1_GreatPalace01");   if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 149.019;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_DragmireTower01"); if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 017.021;}
_val=asset_get_index("mus_Wyng1_DragmireTower01"); if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 080.222;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_BossBattle01");    if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 001.333;}
_val=asset_get_index("mus_Wyng1_BossBattle01");    if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 032.000;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Thunderbird01");   if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 004.145;}
_val=asset_get_index("mus_Wyng1_Thunderbird01");   if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 040.073;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Ganon01");         if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 005.901;}
_val=asset_get_index("mus_Wyng1_Ganon01");         if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 084.708;}
//                                                                              //
_val=asset_get_index("mus_Wyng1_Title01");         if (_val!=-1){dm[?audio_get_name(_val)+STR_Intro+STR_Length] = 007.752;}
_val=asset_get_index("mus_Wyng1_Title01");         if (_val!=-1){dm[?audio_get_name(_val)+STR_Body +STR_Length] = 060.945;}
//                                                                              //









_dk1 = STR_Rando+STR_Value+"01"; // Limit chance of rando selecting sound
_dk2 = STR_Rando+STR_Value+"02"; // Exclude track from rando audio set (can be turned on in rando custom rando custom)
_val=asset_get_index("mus_SteelCrescent4_Overworld_Body");    if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Overworld_Intro");   if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_DeathMountain");     if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_MazeIsland");        if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Dragmire");          if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Town_Body");         if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Town_Intro");        if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_House");             if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Body");      if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Dungeon_Intro");     if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_GreatPalace_Body");  if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_GreatPalace_Intro"); if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_DragmireTower");     if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Boss");              if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Thunderbird");       if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_ShadowBoss");        if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Ganon01");           if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Ganon03");           if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Title_Body");        if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Title_Intro");       if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_FileSelect");        if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_TravelTunnels");     if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_MiniGame");          if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Battle");            if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_WakeZelda");         if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}
_val=asset_get_index("mus_SteelCrescent4_Credits");           if (_val!=-1){dm[?audio_get_name(_val)+_dk2]=true;}




ds_list_destroy(_dl1); _dl1=undefined;
ds_list_destroy(_dl2); _dl2=undefined;




if (DEV)
{
    show_debug_message("Audio_Create() END. "+string(current_time-_START_TIME));
    repeat(1) show_debug_message("");
}




