/// Ganon2_init2()


Boss_init_2();

add_to_solid_inst_list(id);

GO_sprite_init(SPRITE1);
GO_init_palidx(PALIDX2);

DRAW_YOFF = 0;

facing_dir = 1;
xScale    = facing_dir;

GROUND_Y  = get_ground_y(g.rm_w_, (g.rm_row0<<3)+$80,1, (g.rm_row0+$1B)<<3);
set_xy(id, g.rm_w+8+ww_, GROUND_Y-hh_);


var _ROW = find_row_solid(0, $20,g.rm_row0, 1,-1, g.rm_row0+$05) + $01;
var _CLM = find_clm_solid(0, $00,_ROW,      1,-1, $05);
LEFT_WALL_XR = _CLM<<3;


hp = HP;
timer = 4;


Crystal_x  = x + Crystal_xoff;
Crystal_y  = y + Crystal_yoff;
// yoff from skull center y when attached to skull forehead
Crystal_YOFF1 = -5;
Crystal_Y1 = GROUND_Y - Slime_H_ + Crystal_YOFF1; // skull forhead
//Crystal_Y1 = GROUND_Y-Slime_H_;



// Energy Ball projectile
EnergyBall_PI = global.PI_BGR4;
var _PAL = build_pal(p.C_WHT1,p.C_ORG2,p.C_ORG1,p.C_BLK1,-2,-2,-2,-2);
var _LEN = string_length(_PAL);
var _POS = get_pal_pos(EnergyBall_PI+1)-_LEN;
change_pal(strReplaceAt(p.pal_rm_new, _POS,_LEN,_PAL));



g.pc_lock   = PC_LOCK;
global.pc.xScale = 1;



audio_group_stop_all(audiogroup_mus);
Audio.can_play_mus_rm_body = false;
Audio.can_play_boss_music  = false;




//sdm("arena_xl $"+hex_str(arena_xl)+", arena_x $"+hex_str(arena_x)+", arena_xr $"+hex_str(arena_xr));
arena_xl = -PAGE_CLMS;
arena_xr = g.rm_w+(abs(arena_xl)<<1);
arena_w  = arena_xr-arena_xl;
arena_x  = arena_xl+(arena_w>>1);






if (is_undefined(dk_spawn))
{                dk_spawn=get_spawn_datakey(g.rm_name,STR_PRIO,0);  }


Defeated_DATAKEY = get_defeated_dk()+dk_spawn;
Fought_DATAKEY   = dk_spawn+STR_Battle+STR_Count+STR_Quest+hex_str(f.quest_num);

if (val(f.dm_quests[?Defeated_DATAKEY]))
{
    set_xy(id, -(ww<<1), g.rm_h+hh);
    
    timer=$00;
    sub_state=sub_state_DONE;
}
else
{
    if (val(f.dm_quests[?Fought_DATAKEY])) // if already fought
    {
        set_xy(id, StartBattle_X, y);
        DURATION9 = min($10, DURATION9>>3);
        
        timer=$04;
        sub_state=sub_state_RM_ENTER;
    }
    
    f.dm_quests[?Fought_DATAKEY] = val(f.dm_quests[?Fought_DATAKEY])+1;
    
    f.dm_quests[?object_get_name(Ganon3)+STR_Phase+"02"] = 0;
}

/*
if(0&&DEV){ // TESTING TESTING TESTING TESTING TESTING
set_xy(id, x-($C<<3), y); // TESTING. skips much of the intro cutscene
hp = $02; // TESTING
DURATION9=min($10, DURATION9>>3);
}
*/




