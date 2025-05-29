/// Ganon3_init1()


var _i, _a, _idx, _val, _count;


Ganon_init_1();

GO_sprite_init(g.Ganon3_SPRITE1);
GO_init_palidx(global.PI_MOB_PUR);


GROUND_Y = get_ground_y(g.rm_w_, (g.rm_row0+PAGE_ROWS_)<<3,1, (g.rm_row0+$1B)<<3);
set_xy(id, g.rm_w+8+ww_, GROUND_Y-hh_);


rotation = 0; // 0: 0/360, 1: 90, 2: 180, 3: 270


                               _a=1;
sub_state_PHASE1             = _a++;
sub_state_PHASE2             = _a++;
sub_state_PHASE3             = _a++;
sub_state_PHASE4             = _a++;
sub_state_RM_ENTER           = _a++;
sub_state_DIALOGUE1          = _a++;
sub_state_INTRO1             = _a++;
sub_state_INTRO2             = _a++;
sub_state_INTRO3             = _a++;
sub_state_BATTLE             = _a++;
sub_state_POST_BATTLE1       = _a++;
sub_state_POST_BATTLE2       = _a++;
sub_state_POST_BATTLE3       = _a++;
sub_state_EXPLODE_BODY       = _a++;
sub_state_DIALOGUE2          = _a++;
sub_state_FANFARE_PRE1       = _a++;
sub_state_FANFARE            = _a++;
sub_state_FANFARE_DONE       = _a++;
sub_state_EXIT_RM            = _a++;
sub_state_DONE               = _a++;
sub_state                    = sub_state_RM_ENTER;
//                                          //
                                  _a=1;
BattleState_Attack1_INIT        = _a++;
BattleState_Attack1_INIT2       = _a++;
BattleState_Attack1_IDLE        = _a++;
BattleState_Attack1_EMERGE      = _a++;
BattleState_Attack1             = _a++;
BattleState_Attack1_MERGE1      = _a++;
BattleState_Attack1_MERGE2      = _a++;
BattleState_Attack1_MERGE3      = _a++;
BattleState_Attack1_DONE        = _a++;
//                                          //
BattleState_Attack2_INIT        = _a++;
BattleState_Attack2_INIT2       = _a++;
BattleState_Attack2_IDLE        = _a++;
BattleState_Attack2_TELL        = _a++;
BattleState_Attack2_JUMP        = _a++;
BattleState_Attack2_DONE        = _a++;
//                                          //
BattleState_Attack3_INIT        = _a++;
BattleState_Attack3_IDLE        = _a++;
BattleState_Attack3_CAST        = _a++;
BattleState_Attack3_SPELL1      = _a++;
BattleState_Attack3_SPELL2      = _a++;
BattleState_Attack3_DONE        = _a++;
//                                          //
BattleState_Attack4_INIT        = _a++;
BattleState_Attack4_IDLE        = _a++;
BattleState_Attack4_POSITION1   = _a++;
//BattleState_Attack4_POSITION2   = _a++;
BattleState_Attack4_JUMP_DELAY  = _a++;
BattleState_Attack4_JUMP        = _a++;
BattleState_Attack4_LAND1       = _a++;
BattleState_Attack4_LAND2       = _a++;
BattleState_Attack4_DONE        = _a++;
//                                          //
BattleState_DECIDE_ATTACK       = _a++;
BattleState                     = BattleState_Attack2_INIT;
//                                          //


DEV_BattleEnding_current = 1;
DEV_BattleEnding_current = 2;


projectile_OBJ = Flame2;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;



              _a=1;
Attack1_ID  = _a++;
Attack2_ID  = _a++;
Attack3_ID  = _a++;
Attack4_ID  = _a++;
Attack_id   = choose(Attack2_ID,Attack3_ID,Attack4_ID);
//                                          //
_i=0;
dg_AttackChoices = ds_grid_create( _i,_a);
//                                          //
ds_grid_resize(dg_AttackChoices, ++_i,_a);
                       _idx=1;
dg_AttackChoices[#_i-1,_idx++] = Attack2_ID;
dg_AttackChoices[#_i-1,_idx++] = Attack3_ID;
dg_AttackChoices[#_i-1,_idx++] = Attack4_ID;
dg_AttackChoices[#_i-1,0]      = _idx-1;
//                                          //
ds_grid_resize(dg_AttackChoices, ++_i,_a);
                       _idx=1;
dg_AttackChoices[#_i-1,_idx++] = Attack2_ID;
dg_AttackChoices[#_i-1,_idx++] = Attack4_ID;
dg_AttackChoices[#_i-1,0]      = _idx-1;
//                                          //
//                                          //
Attack1Timeout_DURATION1 = $40 * $6;
Attack1Timeout_DURATION2 = $40 * $C;
Attack1Timeout_timer     = 0;
//                                          //


/*
Attack_round  = 1;
Attack_ROUNDS = 3;
//                                                  //
HP_IDX=$0D;
var _PER_ROUND1 = g.dl_HP[|HP_IDX] div Attack_ROUNDS; // round skull hp
var _PER_ROUND2 = $6;                                 // round slime hp

dg_AttackRounds=ds_grid_create(Attack_ROUNDS,4);
for(_i=0; _i<Attack_ROUNDS; _i++)
{
    if (_i==Attack_ROUNDS-1) dg_AttackRounds[#_i,1] = _PER_ROUND1 + (g.dl_HP[|HP_IDX] mod Attack_ROUNDS); // round skull hp default
    else                     dg_AttackRounds[#_i,1] = _PER_ROUND1;                                        // round skull hp default
    dg_AttackRounds[#_i,0] = dg_AttackRounds[#_i,1];                                                      // round skull hp current
    
    dg_AttackRounds[#_i,3] = _PER_ROUND2;              // round slime hp default
    dg_AttackRounds[#_i,2] = dg_AttackRounds[#_i,3]+2; // round slime hp current
}
*/
/*
//                                                  //
dg_AttackRounds[#0,1] = _PER_ROUND1;            // round skull hp default
dg_AttackRounds[#0,3] = $06;                   // round slime hp default
dg_AttackRounds[#0,0] = dg_AttackRounds[#0,1]; // round skull hp current
dg_AttackRounds[#0,2] = dg_AttackRounds[#0,3]; // round slime hp current
//                                                  //
dg_AttackRounds[#1,1] = _PER_ROUND1;            // round skull hp default
dg_AttackRounds[#1,3] = dg_AttackRounds[#0,3]; // round slime hp default
dg_AttackRounds[#1,0] = dg_AttackRounds[#1,1]; // round skull hp current
dg_AttackRounds[#1,2] = dg_AttackRounds[#1,3]; // round slime hp current
//                                                  //
dg_AttackRounds[#2,1] = _PER_ROUND1 + (g.dl_HP[|HP_IDX] mod Attack_ROUNDS); // round skull hp default
dg_AttackRounds[#2,3] = dg_AttackRounds[#0,3]; // round slime hp default
dg_AttackRounds[#2,0] = dg_AttackRounds[#2,1]; // round skull hp current
dg_AttackRounds[#2,2] = dg_AttackRounds[#2,3]; // round slime hp current
//                                                  //
*/
/*
                               _i=0; _count=4;
dg_AttackRounds=ds_grid_create(_i,   _count);
//                                                  //
ds_grid_resize(dg_AttackRounds, ++_i,_count);
dg_AttackRounds[#_i-1,0] = $08;                      // round skull hp current
dg_AttackRounds[#_i-1,2] = $06;                      // round slime hp current
dg_AttackRounds[#_i-1,1] = dg_AttackRounds[#_i-1,0]; // round skull hp default
dg_AttackRounds[#_i-1,3] = dg_AttackRounds[#_i-1,2]; // round slime hp default
//                                                  //
ds_grid_resize(dg_AttackRounds, ++_i,_count);
dg_AttackRounds[#_i-1,0] = dg_AttackRounds[#_i-2,0]+0; // round skull hp current
dg_AttackRounds[#_i-1,1] = dg_AttackRounds[#_i-1,0];   // round skull hp default
dg_AttackRounds[#_i-1,2] = dg_AttackRounds[#_i-2,2]+2; // round slime hp current
dg_AttackRounds[#_i-1,3] = dg_AttackRounds[#_i-1,2];   // round slime hp default
//                                                  //
ds_grid_resize(dg_AttackRounds, ++_i,_count);
dg_AttackRounds[#_i-1,0] = dg_AttackRounds[#_i-2,0]+0; // round skull hp current
dg_AttackRounds[#_i-1,1] = dg_AttackRounds[#_i-1,0];   // round skull hp default
dg_AttackRounds[#_i-1,2] = dg_AttackRounds[#_i-2,2]+2; // round slime hp current
dg_AttackRounds[#_i-1,3] = dg_AttackRounds[#_i-1,2];   // round slime hp default
//
    HP  = 0;
for(_i=Attack_ROUNDS-1; _i>=0; _i--)
{   HP += dg_AttackRounds[#_i,1];  }
hp =HP;
//                                                  //
//sdm("HP $"+hex_str(HP));                                                  //
*/


Boss_set_MusicBattle_props(STR_Ganon+"3");
//
Fanfare_THEME = dk_GameClear;
Fanfare_MUSIC = get_audio_theme_track(Fanfare_THEME);
fanfare_failsafe_timer  = round(audio_sound_length(Fanfare_MUSIC)*ROOM_SPEED_BASE);
fanfare_failsafe_timer += 8;
//fanfare_failsafe_timer = 0;
//fanfare_failsafe_timer = $108+8;


VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;


STUN_DURATION2  = STUN_DURATION1 - (STUN_DURATION1 div 3);

StunMovement_DURATION1 = $100;
StunMovement_timer     = 0;


DURATION1 = $28;
DURATION2 = $28;
DURATION3 = DURATION2+$40;
DURATION4 = $40;




COLOR0 = val(g.dm_rm[?g.rm_name+dk_BackgroundColor], p.C_BLK1);
COLOR1 = p.C_RED4;
COLOR2 = p.C_ORG4;


Oil_HP = $08;
Oil_hp = Oil_HP;


Fire_DURATION1 = $40;
Fire_DURATION2 = $0C;
Fire_DURATION3 = $0C;

dg_fire=ds_grid_create((ww>>3)*(hh>>3),6);
for(_i=ds_grid_width(dg_fire)-1; _i>=0; _i--)
{
    dg_fire[#_i,2] = 1; // 1: section is currently flammable
}
// the two top corners have no graphic
dg_fire[#        0,2] = -1; // -1: section is never flammable
dg_fire[#(ww>>3)-1,2] = dg_fire[#0,2]; // -1: section is never flammable



SlimeSpawn_DURATION1    = $40;
SlimeSpawn_timer        = 0;
SlimeSpawn_tokens       = 0;
//SPELL_COUNT1 = ds_list_size(g.dl_spell_hist);




dg_SPRITES= ds_grid_create(0,4);
ds_grid_resize(dg_SPRITES, ds_grid_width(dg_SPRITES)+1, ds_grid_height(dg_SPRITES));
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,0] = spr_Slime_Body1_Large1a; // reg
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,1] = spr_Slime_Body1_Large1b; // squished
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,2] = spr_Slime_Body1_Large1c;
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,3] = spr_Slime_Body1_Large1a_Shine1a;
ds_grid_resize(dg_SPRITES, ds_grid_width(dg_SPRITES)+1, ds_grid_height(dg_SPRITES));
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,0] = spr_Slime_Body1_Large2a; // reg
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,1] = spr_Slime_Body1_Large2b; // squished
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,2] = spr_Slime_Body1_Large2c;
dg_SPRITES[#ds_grid_width(dg_SPRITES)-1,3] = spr_Slime_Body1_Large2a_Shine1a;
dg_SPRITES_H = ds_grid_height(dg_SPRITES);
SPRITES_idx = 0;
GO_sprite_init(dg_SPRITES[#SPRITES_idx,0]);

Slime_W_   = sprite_get_width( sprite)>>1;
Slime_H_   = sprite_get_height(sprite)>>1;
Slime_CLMS = (Slime_W_<<1)<<3;
Slime_ROWS = (Slime_H_<<1)<<3;
Slime_PI1  = global.PI_BGR1;    // Scene before battle scene
Slime_PI2  = global.PI_MOB_PUR; // During battle
Slime_HP1  = $A;
Slime_hp   = Slime_HP1;

//SlimeChange_dir     = !SPRITES_idx;
SlimeChange_DUR1    = $8;
SlimeChange_DUR2    = SlimeChange_DUR1<<1;
SlimeChange_DUR3    = SlimeChange_DUR1<<2;
SlimeChange_DUR0    = SlimeChange_DUR1 + SlimeChange_DUR2 + SlimeChange_DUR3;
SlimeChange_timer   = 0;

Tell1_DURATION1     = $20;
//Tell2_DURATION1     = $28;
Tell1_timer         = 0;
//Tell2_timer         = 0;


RoarDelay_DURATION1 = $0C+1;
RoarDelay_timer     = 0;

RoarCooldown_DURATION1 = $100;
RoarCooldown_timer  = 0;





Skull_PI            = global.PI_MOB_RED;
Skull_DURATION1     = $40;
Skull_DURATION2     = $20;
Skull_can_draw      = false;
Skull_x             = 0;
Skull_y             = 0;
Skull_hit_counter   = 0;
Skull_hit_tokens    = 0;
Skull_SPEED1        = $40;
Skull_SPEED2        = Skull_SPEED1;
//Skull_SPEED2        = Skull_SPEED1+$10;
Skull_SPEED3        = $70;
Skull_SPEED4        = Skull_SPEED2-$10;

SkullOrbit_passes_x = 0;
SkullOrbit_passes_y = 0;

                          _a=0;
SkullClingState_CLING   = _a++;
SkullClingState_FREE    = _a++;
SkullClingState         = SkullClingState_CLING;

SkullAura_PI        = global.PI_MOB_ORG;
SkullAura_pi        = SkullAura_PI;
SkullAura_SPRITE    = spr_Aura_3a_1;
SkullAura_W_        = sprite_get_width( SkullAura_SPRITE)>>1;
SkullAura_H_        = sprite_get_height(SkullAura_SPRITE)>>1;
SkullAura_can_draw  = false;


_count=2;
dg_Skull_SPEED_H=0;
dg_Skull_SPEED = ds_grid_create(_count,   dg_Skull_SPEED_H);
//                                                          //
ds_grid_resize(dg_Skull_SPEED,  _count, ++dg_Skull_SPEED_H);
dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1] = $20;
dg_Skull_SPEED[#1,dg_Skull_SPEED_H-1] = dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1];
//                                                          //
ds_grid_resize(dg_Skull_SPEED,  _count, ++dg_Skull_SPEED_H);
dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1] = dg_Skull_SPEED[#0,dg_Skull_SPEED_H-2] + $10;
dg_Skull_SPEED[#1,dg_Skull_SPEED_H-1] = dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1];
//                                                          //
ds_grid_resize(dg_Skull_SPEED,  _count, ++dg_Skull_SPEED_H);
dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1] = dg_Skull_SPEED[#0,dg_Skull_SPEED_H-2] + $10;
dg_Skull_SPEED[#1,dg_Skull_SPEED_H-1] = dg_Skull_SPEED[#0,dg_Skull_SPEED_H-1];
//                                                          //
Skull_hspd = dg_Skull_SPEED[#0,irandom(dg_Skull_SPEED_H-1)];
Skull_vspd = dg_Skull_SPEED[#1,irandom(dg_Skull_SPEED_H-1)];
//                                                          //

SkullHB_W           = 10;
SkullHB_H           = 16;
SkullHB_R           =  8; // 
//SkullHB_R           =  8; // if you decide to use circle
SkullHB_XOFF        = -(SkullHB_W>>1);
SkullHB_YOFF        = -6;
SkullHB_x           = 0;
SkullHB_y           = 0;
SkullHB_can_draw    = false;
SkullHB_colliding   = 0;

SkullCS_OFFSET1     = SkullAura_W_ - $02;


Door_xl             = 0;
Door_yt             = 0;
DoorBlocks_COUNT    = 0; // 
DoorBlocks_count    = 0; // number placed so far


EXPLOSION_DUR1  = $90;
EXPLOSION_DUR2  = EXPLOSION_DUR1+$10;
EXPLOSION_DUR3  = $50;
//EXPLOSION_DUR3  = $70;
EXPLOSION_DUR4  = EXPLOSION_DUR3+$30;

//EXPLOSION_CUE1  = CrystalDeath_DUR-(DURATION3-8);
EXPLOSION_CUE1  = $40;
//EXPLOSION_CUE1  = $80;
EXPLOSION_CUE2  = EXPLOSION_DUR1-$18; // $78
EXPLOSION_CUE3  = EXPLOSION_DUR1-$30; // $60
EXPLOSION_CUE4  = EXPLOSION_CUE2-$18; // $60
EXPLOSION_CUE5  = EXPLOSION_CUE4-$30; // $30
EXPLOSION_CUE6  = $30;
EXPLOSION_CUE7  = EXPLOSION_CUE6+$18; // $48
EXPLOSION_CUE8  = EXPLOSION_CUE7+$18; // $60

//BodyExploding_DUR1  = $90;
//BodyExploding_DUR2  = EXPLOSION_DUR2;
//BodyExploding_CUE1  = BodyExploding_DUR1-$28; // $78;
Explosion_timer = 0;



ProjRain_PI         = global.PI_MOB_RED;
//ProjRain_PI         = get_pi(global.PI_MOB_RED,0);
ProjRain_DURATION1  = $100;
ProjRain_DURATION2  = $200;
ProjRain_timer      = 0;
ProjRain_cooldown   = 0;
ProjRainCast_count  = 0;
ProjRain_MAX        = $10;
dg_ProjRain = ds_grid_create(ProjRain_MAX,$6);


/*
Crystal_state           = 1; // 0: dead, 1: normal
CrystalSprite_state     = 3; // 0: can't draw, 1: empty spr, 2: full, 3: full & flashing spr
CrystalFade_state       = 0; // 0: Opaque, 1: Fade In, 2: Fade Out, 
Crystal_position        = 0; // 0: home, 1: attack1, 2: attack2, 3: attack3
//CrystalPosition_state   = 0; // 
Crystal_xoff            = dg_Positions[#Crystal_position,$00];
Crystal_yoff            = dg_Positions[#Crystal_position,$01];
Crystal_x               = x + Crystal_xoff;
Crystal_y               = y + Crystal_yoff;
Crystal_vspd            = 0;
Crystal_TERM_VEL        = $5<<4;
Crystal_Y1              = GROUND_Y-Form3_H_;
Crystal_TIMING1         = $4;
Crystal_detatched       = false;
*/

/*
DEPTH_WALL  = DEPTH_BG2; // solid wall bgr
DEPTH_BREAK = DEPTH_BG5; // break blocks
*/



f.dm_quests[?"_Has_Reached"+STR_Ganon+"3"] = true;




