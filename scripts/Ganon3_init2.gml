/// Ganon3_init2()


var _i, _a, _val, _pos, _datakey, _len, _order;
var _DATAKEY1 = object_get_name(Ganon3)+STR_Phase+"02";


//Boss_init_2();
GROUND_Y = get_ground_y(g.rm_w_, (g.rm_row0<<3)+$80,1, (g.rm_row0+$1B)<<3);
//                                              //
    arena_x = g.rm_w_;
if(!is_undefined(dk_spawn))
{
    arena_x = val(g.dm_spawn[?dk_spawn+STR_Arena+"_x"], arena_x);
}
//                                              //
arena_xl = find_clm_solid(TID_SOLID1,g.rm_w_>>3,g.rm_row0+$4, -1);
arena_xl =(arena_xl+1)<<3;
//                                              //
arena_xr = find_clm_solid(TID_SOLID1,g.rm_w_>>3,g.rm_row0+$4, 1);
arena_xr = arena_xr<<3;
//                                              //
arena_w  = arena_xr-arena_xl;
//                                              //
arena_yb = GROUND_Y;
arena_yt = viewYT();
arena_y  = arena_yt + ((arena_yb-arena_yt)>>1);




GO_sprite_init(dg_SPRITES[#SPRITES_idx,0]);
GO_init_palidx(PALIDX2);
//PALIDX1=global.PI_BGR4; PALIDX2=global.PI_MOB_RED; Slime_PI1=global.PI_BGR1; Slime_PI2=global.PI_MOB_PUR;

// Change colors for better looking stun flashing
change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(global.PI_MOB_ORG), string_length(p.PAL_MOB_SET3), p.PAL_MOB_SET3));
/*
// Change colors for better looking stun flashing
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_BLU,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_CYN4)));
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_BLU,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_CYN4)));
// Change colors for better looking stun flashing
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_PUR,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_PUR,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
*/
//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(Slime_PI1,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(Slime_PI1,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));

//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(Slime_PI2,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(Slime_PI2,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));

//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
//change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));




facing_dir = 1;
xScale    = facing_dir;


set_xy(id, x, GROUND_Y-hh_);



var _PHASE = 0;
if(!is_undefined(dk_spawn))
{
    for(_i=1; _i<=$F; _i++)
    {
        _val=val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)]);
        if (is_string(_val))
        {
                _pos=string_pos(    STR_Phase,_val);
            if (_pos)
            {   _pos+=string_length(STR_Phase);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                _PHASE=str_hex(_val);
                //sdm("A - _PHASE: $"+hex_str(_PHASE));
                break;//_i
            }
        }
    }
}
//sdm("B - _PHASE: $"+hex_str(_PHASE));
       _PHASE = clamp(_PHASE,0,4);
switch(_PHASE){
case 0:{sub_state=sub_state_INTRO1; break;} // battle rm
case 1:{sub_state=sub_state_PHASE1; break;} // drop from Ganon2
case 2:{sub_state=sub_state_PHASE2; break;} // rm before battle rm
case 3:{sub_state=sub_state_PHASE3; break;} // after battle falling1
case 4:{sub_state=sub_state_PHASE4; break;} // after battle falling2
}
//sdm("C - sub_state==sub_state_INTRO1: "+string(sub_state==sub_state_INTRO1)+", sub_state==sub_state_PHASE2: "+string(sub_state==sub_state_PHASE2));
switch(sub_state)
{
    case sub_state_PHASE2:{ // in the room before the battle room
    arena_xl = -PAGE_CLMS;
    arena_xr = g.rm_w+(abs(arena_xl)<<1);
    arena_w  = arena_xr-arena_xl;
    arena_x  = arena_xl+(arena_w>>1);
    break;}
    
    
    case sub_state_INTRO1:{ // in the battle room
    f.dm_quests[?_DATAKEY1] = 1;
    break;}
}
//sdm("D - f.dm_quests[?_DATAKEY1] = "+string(val(f.dm_quests[?_DATAKEY1])));




// use g.dl_HP_DEFAULT in case enemy hp has been randomized
HP_IDX = $0D; // g.dl_HP_DEFAULT[|$0D] = $18
hp = g.dl_HP_DEFAULT[|HP_IDX];



Attack_round  = 1;
Attack_ROUNDS = 3;
//                                                  //
var _PER_ROUND1 = hp div Attack_ROUNDS; // round skull hp
var _PER_ROUND2 = $6;                                 // round slime hp
//sdm("HP_IDX=$"+hex_str(HP_IDX)+", g.dl_HP_DEFAULT[|HP_IDX]=$"+hex_str(g.dl_HP_DEFAULT[|HP_IDX])+", _PER_ROUND1 $"+hex_str(_PER_ROUND1));
    dg_AttackRounds = ds_grid_create(Attack_ROUNDS,4);
for(_i=0; _i<Attack_ROUNDS; _i++)
{
    if (_i==Attack_ROUNDS-1) dg_AttackRounds[#_i,0] = _PER_ROUND1 + (hp mod Attack_ROUNDS); // round skull hp default
    else                     dg_AttackRounds[#_i,0] = _PER_ROUND1;                                        // round skull hp default
    dg_AttackRounds[#_i,1] = dg_AttackRounds[#_i,0];                                                      // round skull hp current
    //sdm("dg_AttackRounds[#"+string(_i)+",1] = $"+hex_str(dg_AttackRounds[#_i,1]));
    dg_AttackRounds[#_i,2] = _PER_ROUND2;              // round slime hp default
    dg_AttackRounds[#_i,3] = dg_AttackRounds[#_i,2]+2; // round slime hp current
}

/*
    HP  = 0;
for(_i=0; _i<Attack_ROUNDS; _i++)
{   HP += dg_AttackRounds[#_i,1];  }
hp =HP;
*/
// HPBar_XOFF: x offset from viewXL()
HPBar_XOFF  = max(0, (viewW()-arena_w)>>1);
HPBar_XOFF += HPBar_XPAD;
HPBar_XOFF  = clamp(HPBar_XOFF, HPBar_XPAD,viewW_()-4);


audio_group_stop_all(audiogroup_mus);
Audio.can_play_mus_rm_body = false;
Audio.can_play_boss_music  = false;

               _a=BodyHB_IDX;
BODY_HB_IDX1 = _a++;
BODY_HB_IDX2 = _a++; // on side, top facing left
BODY_HB_IDX3 = _a++; // on side, top facing right
BODY_HB_IDX4 = _a++; // Attack4, darting across arena


Crystal_x = x;
Crystal_y = y;
//Crystal_Y1  = GROUND_Y-Form3_H_;


Door_xl             = arena_xl-$10;
Door_yt             =(GROUND_Y>>3)-$04;
Door_yt             = find_row_solid(TID_SOLID1, (Door_xl>>3)+1, (GROUND_Y>>3)-1, -1, $FF,Door_yt);
Door_yt             =(Door_yt+1)<<3;
DoorBlocks_COUNT    =(GROUND_Y-Door_yt)>>4; // 
DoorBlocks_count    = 0; // number placed so far


/*
// Energy Ball projectile
EnergyBall_PI = PI_BGR_4;
var _PAL = p.CI_BLK1_+p.CI_WHT1_+p.CI_ORG2_+p.CI_ORG1_;
var _LEN = string_length(_PAL);
var _POS = get_pal_pos(EnergyBall_PI+1)-_LEN;
change_pal(strReplaceAt(p.pal_rm_new, _POS,_LEN,_PAL));
*/

/*
var _PAL = p.CI_BLK1_+p.CI_WHT1_+p.CI_PUR3_+p.CI_VLT4_;
var _LEN = string_length(_PAL);
var _POS = get_pal_pos(Slime_PI2_BASE+1)-_LEN;
change_pal(strReplaceAt(p.pal_rm_new, _POS,_LEN,_PAL));
*/



//g.pc_lock   = PC_LOCK_ALL;
//g.pc.xScale = sign_(g.pc.x<x);


timer = 4;



if(!is_undefined(dk_spawn))
{
    if (sub_state==sub_state_PHASE2)
    {
        if (val(f.dm_quests[?_DATAKEY1]))
        {
            can_draw_self = false;
            state = 0;
            sub_state = sub_state_DONE;
            //sdm("E - sub_state==sub_state_DONE: "+string(sub_state==sub_state_DONE));
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    else
    {
        if (val(f.dm_quests[?get_defeated_dk()+dk_spawn]))
        {
            sub_state = sub_state_EXIT_RM;
        }
    }
}




//set_xy(id, x-($C<<3), y); // TESTING. skips much of the intro cutscene
//hp = $02; // TESTING




