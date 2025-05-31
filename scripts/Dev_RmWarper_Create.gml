/// Dev_RmWarper_Create()


var _i,_j,_k,_m, _idx, _a, _val;
var _count;
var _str, _mapkey;


depth = DEPTH_SURFACE-1;




SND_OPEN_APP            = get_audio_theme_track(dk_OpenGUI);
//                                              // 
SND_OPTION_CHANGE1      = get_audio_theme_track(dk_CursorSpellMenu);
SND_OPTION_CHANGE2      = get_audio_theme_track(dk_CursorFileSelect);
SND_OPTION_CHANGE_UP    = SND_OPTION_CHANGE1;
SND_OPTION_CHANGE_DWN   = SND_OPTION_CHANGE1;
// SND_OPTION_CHANGE_UP    = Audio.SND_WLK_WTR1A;
// SND_OPTION_CHANGE_DWN   = Audio.SND_WLK_WTR1B;
//                                              // 
SND_OPTION_SELECT1      = get_audio_theme_track(dk_ItemDrop); // 
SND_OPTION_CONFIRM      = get_audio_theme_track(STR_Sword+STR_Beam); // 
// SND_OPTION_CONFIRM      = Audio.SND_GUI_OPEN; // 

SND_OPTION_CANCEL       = get_audio_theme_track(dk_StrikeEnemy);
// SND_OPTION_BACK         = Audio.SND_PC_GRUNT1;
// SND_SHLD_HIT1, SND_WLK_WTR1A, SND_WLK_WTR1B, 
// SND_BLOK_BRK1, SND_BRDG_CRBL, SND_SPWN_ITM1
// SND_ELEV_MVE1. SND_TYPE_CHR1, SND_STAB_1A
// SND_GUI_OPEN,  SND_PC_GRUNT1, SND_STRK_ENM1
// SND_SWRD_BEAM


DUR1    = $20;
DUR2    = $08;



Text_CHAR_W     =  8;
TEXT_PAD_X      = ($01 * Text_CHAR_W) + $0;
TEXT_PAD_Y      = ($01 * Text_CHAR_W) + $0;
TEXT_DIST_Y     = ($01 * Text_CHAR_W) + $0; // vertical dist between 2 options
TEXT_DIST_Y    += TEXT_PAD_Y;


//                  // 
              _a = 0;
STATE_FIRST = _a;
//                  // 
STATE_IDLE  = _a++; // IDLE
STATE_AREA  = _a++; // 
STATE_RM1   = _a++; // 
STATE_EXIT  = _a++; // 
STATE_GOTO  = _a++;
//                  // 
STATE_LAST  = _a-1;
STATE_COUNT = _a;
state       = STATE_IDLE;
//                  // 
//                  // 

timer = 0;


area_idx   = 0;
AREA_COUNT = ds_list_size(g.dl_AREA_NAME);

dl_area = ds_list_create();
for(_i=0; _i<AREA_COUNT; _i++) ds_list_add(dl_area,g.dl_AREA_NAME[|_i]);
ds_list_add(dl_area,Area_Title);
AREA_COUNT = ds_list_size(dl_area);


rm_id      =  $00;
RmID_COUNT = $100;


ExitType_COUNT = $05;
ExitID_COUNT   = ExitType_COUNT<<4;
ExitID         = 0;
exit_idx       = 0;

dl_ExitID = ds_list_create();
for(_i=ExitID_COUNT-1; _i>=0; _i--)
{
    _val  = (_i>>4)&$F; //   0,  1,  2,  3,  4
    _val  = $08 <<_val; // $08,$10,$20,$40,$80
    _val &= $F0;        // $00,$10,$20,$40,$80
    _val |= _i&$F;
    dl_ExitID[|_i] = _val;
    // sdm("_i $"+hex_str(_i)+", _j $"+hex_str(_j)+", _idx $"+hex_str(_idx)+",  dl_ExitID[| _idx] $"+hex_str(dl_ExitID[| _idx]));
}

dl_Rm_ExitIDs = ds_list_create();







Text_DrawArea_X         = viewW()>>2;
// Text_DrawArea_X         = round(viewW() * .25);
Text_DrawArea_X         = (Text_DrawArea_X>>3)<<3; // round down to 8



AreaID_DrawArea_W       = AreaID_LEN * Text_CHAR_W;
AreaID_DrawArea_H       = (TEXT_DIST_Y * AREA_COUNT) - TEXT_PAD_Y;
AreaID_DrawArea_H_      = AreaID_DrawArea_H>>1;
AreaID_DrawArea_X       = Text_DrawArea_X;
AreaID_DrawArea_Y       = viewH_() - AreaID_DrawArea_H_;



RmID_DrawArea_W         = $02 * Text_CHAR_W;
RmID_DrawArea_H         = (TEXT_DIST_Y * RmID_COUNT) - TEXT_PAD_Y;
RmID_DrawArea_H_        = RmID_DrawArea_H>>1;
RmID_DrawArea_X         = AreaID_DrawArea_X + AreaID_DrawArea_W + TEXT_PAD_X;
RmID_DrawArea_Y         = viewH_() - RmID_DrawArea_H_;



ExitID_DrawArea_W       = $02 * Text_CHAR_W;
ExitID_DrawArea_H       = (TEXT_DIST_Y * ExitID_COUNT) - TEXT_PAD_Y;
ExitID_DrawArea_H_      = ExitID_DrawArea_H>>1;
ExitID_DrawArea_X       = RmID_DrawArea_X + RmID_DrawArea_W + TEXT_PAD_X;
ExitID_DrawArea_Y       = viewH_() - ExitID_DrawArea_H_;



Text_DrawArea_W         = AreaID_DrawArea_W + TEXT_PAD_X;
Text_DrawArea_W        += RmID_DrawArea_W   + TEXT_PAD_X;
Text_DrawArea_W        += ExitID_DrawArea_W;



TEXT_DRAWAREA_PAD_X     = $10<<3;
TEXT_DRAWAREA_PAD_Y     = $04<<3;







// ExitName:  GO-TO exit name. Constantly displays.
ExitName_goto   = REEN_DEFAULT;
ExitName_CLM    = $02;
ExitName_ROW    = $03;

Area_CLM    = TEXT_DRAWAREA_PAD_X>>3;
Area_ROW    = TEXT_DRAWAREA_PAD_Y>>3;

Rm_CLM      = Area_CLM + AreaID_LEN + (TEXT_PAD_X>>3);

Exit_CLM    = Rm_CLM + $02 + (TEXT_PAD_X>>3);





/*
dm_DATA = ds_map_create();
for(_i=0; _i<AREA_COUNT; _i++) // Each area
{
    _mapkey  = g.dl_AREA_NAME[|_i];
    
    for(_j=0; _j<RmID_COUNT; _j++) // Each rm of this area
    {
        _mapkey += hex_str(_j);
        
        // g.dm_rm_data[? _RM_NAME + STR_rm_num]
        if(!defined(g.dm_rm_data[? _mapkey + STR_rm_num]))
        {   continue;  } // rm does NOT exist
        
        ds_map_add(dm_DATA, _mapkey, 1); // Indicate rm exists
        
        for(_k=0; _k<ExitType_COUNT; _k++) // Each possible exit type
        {
            for(_m=0; _m<$10; _m++) // Each possible exit of this exit type
            {
                _mapkey  = g.dl_AREA_NAME[|_i];
                _mapkey += hex_str(_j);
                
                _val  = $08<<_k;
                _val &= $F0;
                _val |= _m;
                _mapkey += hex_str(_val);
                
                // g.dm_rm_data[? _exit_name + STR_Num]
                if(!defined(g.dm_rm_data[? _mapkey + STR_Num]))
                {   break;  } // _m. Exit does NOT exist
                
                
                ds_map_add(dm_DATA, _mapkey, 1); // Indicate exit exists
            }
        }
    }
}
*/








