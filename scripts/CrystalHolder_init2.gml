/// CrystalHolder_init2()

// eID = $14, $15


var _i, _val;


GO_depth_init(DEPTH_ITEM);
GO_init_palidx(global.PI_MOB_ORG); // This is the CRYSTAL's palidx


DUNGEON_NUM = g.dungeon_num;
/*
_val = f.dm_rando[?STR_Boss+STR_Scene+STR_Name+g.rm_name+STR_Normal];
if(!is_undefined(_val))
{
    switch(string_copy(string(_val),1,AreaID_LEN)){
    case Area_PalcA:{DUNGEON_NUM=1; break;}
    case Area_PalcB:{DUNGEON_NUM=2; break;}
    case Area_PalcC:{DUNGEON_NUM=3; break;}
    case Area_PalcD:{DUNGEON_NUM=4; break;}
    case Area_PalcE:{DUNGEON_NUM=5; break;}
    case Area_PalcF:{DUNGEON_NUM=6; break;}
    case Area_PalcG:{DUNGEON_NUM=7; break;}
    case Area_PalcH:{DUNGEON_NUM=8; break;}
    }
}
*/


facing_dir = 1;
can_draw_self = false;

canDrawCrystal = 0; // 0081[eIndex]

Flash_DUR   = $62;
Flash_timer = 0; // 0767


dl_COLOR_ID = ds_list_create();
ds_list_add(dl_COLOR_ID,color_str(p.C_VLT3)); // 0: blue
ds_list_add(dl_COLOR_ID,color_str(p.C_WHT1)); // 1: white
ds_list_add(dl_COLOR_ID,color_str(p.C_GRN2)); // 2: green
ds_list_add(dl_COLOR_ID,color_str(p.C_RED3)); // 3: red


// THIS ALGORITHM IS CORRECT, BUT YOU 
// NEED TO KNOW THE CORRECT DEPTH FOR THE CRYSTAL HOLDER.
midtone_PALDATA_POS = p.PAL_POS_BGR2 + (global.PAL_CHAR_PER_COLOR*(string_pos("R",global.PAL_BASE_COLOR_ORDER)-1));
midtone_colorID_DEF = string_copy(p.pal_rm_def, midtone_PALDATA_POS, global.PAL_CHAR_PER_COLOR);
midtone_colorID_cur = midtone_colorID_DEF;



//spawn_x  = ((xx>>8)<<8) + $80 - ww_;

GROUND_Y = (((spawn_yt>>8)+1)<<8) - ($3<<3);
GROUND_Y = get_ground_y(x,GROUND_Y, -1,GROUND_Y);


spawn_yt  = GROUND_Y - ($48+$6);
set_xlyt(id, spawn_xl,spawn_yt);

// sdm("GROUND_Y $"+hex_str(GROUND_Y)+", spawn_yt $"+hex_str(spawn_yt));


if (crystal_is_placed(DUNGEON_NUM)) counter = 0; // Only udp will update
else                                counter = 1;


Fanfare_THEME = dk_PlaceCrystal;
Fanfare_MUSIC = get_audio_theme_track(Fanfare_THEME);
fanfare_failsafe_timer  = round(audio_sound_length(Fanfare_MUSIC)*ROOM_SPEED_BASE);
fanfare_failsafe_timer += 8;
//fanfare_failsafe_timer = $138 + 8;




