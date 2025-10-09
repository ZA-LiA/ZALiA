/// Carock_init2()

//ver=1: Normal, ver=2: PENDANT Carock


var _i, _a;


Boss_init_2();

if (ver==2)
{
    var _CLMS = $4;
    spawn_xl  = ((arena_w>>1)>>3) - _CLMS - (ww_>>3);
    spawn_xl  = _CLMS + irandom(spawn_xl);
    spawn_xl  = spawn_xl<<3;
    spawn_xl *= sign_(global.pc.x<arena_x);
    spawn_xl  = arena_x + spawn_xl;
    spawn_xl -= ww_;
    set_xy(id, spawn_xl+sprite_index_xoff, spawn_yt+sprite_index_yoff);
    
    NPC_catch_item();
}


GO_init_palidx(global.PI_MOB_RED);

// placement sprite: spr_Carock_1a(32x48)
SPRITE_IDLE    = spr_Carock_1a;
SPRITE_ATTACK  = spr_Carock_1b;
SPRITE_FORWARD = spr_Carock_2a_1_v2_WRB;
//SPRITE_FORWARD = spr_Carock_2a_WRB;



// GROUND_Y set in Boss_init_2().
GROUND_Y = (((viewYC()>>8)+1)<<8) - ($3<<3);
GROUND_Y = get_ground_y(arena_xl+$08,GROUND_Y, -1,GROUND_Y);
spawn_yt  = GROUND_Y - hh;
set_xy(id, x, spawn_yt+sprite_index_yoff);


Boss_init_2b(-1); // Determine & set the side of the arena to start on.


projectile_OBJ = SoundWave;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


Attack2_PROJECTILE = Flame1;
Attack2_DURATION1  = $FF; // cooldown duration
Attack2_SPACING    = $04<<3;
Attack2_xl         = arena_xl;
Attack2_YT             = (g.rm_rows-PAGE_ROWS+$08)<<3;
if (ver==2) Attack2_YT = ((viewYT()>>3)      +$03)<<3;

Attack2_TIMING = $01<<3;
Attack2_CUE0   = $D0;
Attack2_CUE1   = Attack2_CUE0 - $38; // $D0 - $38 = $98
Attack2_CUE2   = Attack2_CUE1 - ((arena_w div Attack2_SPACING) * Attack2_TIMING); // $98 - (($1C0 div $20) * 8) = $98 - $70 = $28
Attack2_CUE3   = Attack2_CUE2 - $18; // $28 - $18 = $10
Attack2_CUE4   = $00;
Attack2_CUE5   = min(Attack2_CUE1+$18, Attack2_CUE0); // Attack2_CUE1+$18 = $B0

Attack2_dir    = sign_(irandom(1)); // 1,-1.  Spawn from left-to-right or vice-versa
Carock_set_Attack2x();




FlameSmall_SPRITE   = spr_Flame_Small_1a;
FlameSmall_SPRITE_Y = GROUND_Y-(sprite_get_height(FlameSmall_SPRITE)>>1);


Attack3_PROJECTILE = Flame1;
Attack3_Y          = GROUND_Y-8;

Attack3_DURATION0  = $100;
Attack3_DURATION1  = $A0;
Attack3_DURATION2  = $18;

Attack3_CUE0       = $10;
Attack3_CUE1       = Attack3_DURATION0 - $20;
Attack3_CUE2       = Attack3_CUE0 + Attack3_DURATION2;
Attack3_CUE3       = Attack3_CUE1 - Attack3_DURATION2;
Attack3_CUE4       = Attack3_DURATION0 - $10;




dg_Attack3 = ds_grid_create(0,3);
_a=0;
for(_i=0; _i<7; _i++)
{
    ds_grid_resize(dg_Attack3, ds_grid_width(dg_Attack3)+2,ds_grid_height(dg_Attack3));
                                            _a+=5;
    dg_Attack3[#(_i<<1)+0,0] = arena_xl + ((_a++)<<3) + 4;
    dg_Attack3[#(_i<<1)+1,0] = arena_xl + ((_a++)<<3) + 4;
}


DURATION1 = $10;
DURATION2 = $20;
DURATION3 = $D0;
DURATION4 = $20;
DURATION5 = DURATION4+DURATION4;

// DURATION6: Increases the time Carock is vulnerable 
// to compensate for the larger arena which makes it 
// less likely to collide with the projectile.
DURATION6 = $05; // 2024/07/14
//DURATION6 = $03;
//DURATION6 = floor(DURATION1*($100/arena_w)); // Result is $0A
//sdm("DURATION6 "+string(DURATION6)+", arena_w "+string(arena_w));

// Minimum attack1 duration. For ver-2(PENDANT Carock).
DURATION7 = $13F; // 2025/03/22
//DURATION7 = $FF;
// Added to attack1 duration but as a random number from 0-DURATION8
DURATION8 = $FF;
attack_timer = DURATION7 + irandom(DURATION8); // For Attack2, Attack3


                      _a=1;
sub_state_ATTACK_1A = _a++; // Fade in
sub_state_ATTACK_1B = _a++; // Shoot SoundWave
sub_state_ATTACK_1C = _a++; // Fade out
sub_state_ATTACK_1D = _a++; // Find/set new x
//                              //
sub_state_ATTACK_2A = _a++; // Atk 2
sub_state_ATTACK_2B = _a++; // Delay next atk after atk 2
//                              //
sub_state_ATTACK_3A = _a++; // Atk 3
sub_state_ATTACK_3B = _a++; // Delay next atk after atk 3
sub_state           = sub_state_ATTACK_1A;
sub_state_timer     = DURATION1;
//                              //



BodyHB_color = c_yellow;



if (f.quest_num>1)
{
    XP_IDX += $02;
    xp = g.dl_XP[|XP_IDX];
}


Boss_set_MusicBattle_props(STR_Boss+"01");




