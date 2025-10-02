/// IronKnuckle_init2()

// Object Name: IrKnA

// v1 Orange
// v2 Red
// v3 Blue
// v3 Rebonack Knight


BVR_IDLE = 0;
BVR_DRWH = 1; // draw high
BVR_ATKH = 2; // stab/strike high
BVR_DRWL = 3; // draw low
BVR_ATKL = 4; // stab/strike low
BVR_THRW = 5; // throw. This only happens for Fokka & Moblin
behavior = BVR_IDLE;


SPR_WALK1 = spr_Iron_Knuckle_Walk1;
SPR_IDLE1 = spr_Iron_Knuckle_Idle1;
SPR_WALK2 = spr_Iron_Knuckle_Walk2;
SPR_IDLE2 = spr_Iron_Knuckle_Idle2;
SPR_JUMP1 = SPR_WALK2;


HSPD_PACE   =   8;
HSPD_CHASE  = $10;
hspd        = HSPD_PACE; // $0071,X

JUMP_VEL    = 0;
INIT_VEL    = 0;
VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;
vspd        = 0; // $057D,X - $057E-0583

timer = 1; // 1st frame after spawn is 0
DUR_PACE        = $50; // 80 - $0504,X
DUR_ATK_DRAW    = $18; // $0504,X
DUR_ATK_STAB    = $10; // $0504,X
//CUE_ATCK        = $40;
CUE_ATK_PHASE2  = $0C; // for udd
CUE_ATK_PHASE3  = $02; // for udd

is_aggro        = is_ancestor(object_index,ReboB);
is_cucco_aware  = false;
attack_tokens   = 0; // $0401[uIdx].  Num of remaining quick succession attacks


projectile_OBJ = SwordBeam;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;





DUR_DELAY_SHIELD1   = $20; // 32  frames = 0.533s
//DUR_DELAY_SHIELD1   = $40; // 64  frames = 1.067s
//DUR_DELAY_SHIELD1   = $60; // 96  frames = 1.600s
DUR_DELAY_SHIELD2   = $04; // 
tmr_delay_shield    =   0; // Delay set shield to match PC position


delay_shield_chance =   0; // 0: 12.5%, 1: 25%, 2: 50%, 3: 93.75%
// delay_shield_chance =  -1; // 0: 12.5%, 1: 25%, 2: 50%, 3: 93.75%
var _CHANCE0 = "20"; // 12.5%
var _CHANCE1 = "40"; // 25%
var _CHANCE2 = "80"; // 50%
var _CHANCE3 = "F0"; // 93.75%
     CHANCES = _CHANCE0 + _CHANCE1 + _CHANCE2 + _CHANCE3;
//      CHANCES = _CHANCE0 + _CHANCE1 + _CHANCE2 + _CHANCE3 
//              + _CHANCE3 + _CHANCE2 + _CHANCE1 + _CHANCE0;
//



DUR_ATK_COOLDOWN1    = $60; // 96  frames = 1.600s
//DUR_ATK_COOLDOWN1   = $80; // 128 frames = 2.133s
DUR_ATK_COOLDOWN2    = DUR_ATK_COOLDOWN1>>1; // 
//DUR_ATK_COOLDOWN2   = $20; // 32  frames = 0.533s
AttackCooldown_timer = DUR_ATK_COOLDOWN1;



// shield hb
ShieldHB_IDX_LOW = 1; // low
ShieldHB_IDX_HGH = 2; // high
ShieldHB_IDX     = ShieldHB_IDX_LOW; // 
ShieldHB_idx     = ShieldHB_IDX; // 0444,X
GOB_update_shield_offsets();
update_shield_hb();



// sword hb
SwordHB_XOFF =  8 + g.HB_ADJ_X; // 
SwordHB_YOFF = 16 + g.HB_ADJ_Y; // 
SwordHB_xoff = SwordHB_XOFF * facing_dir;
SwordHB_yoff = SwordHB_YOFF;
SwordHB_W    = 14 + g.HB_ADJ_W; // 
SwordHB_H    =  1 + g.HB_ADJ_H; // 
SwordHB_w    = SwordHB_W;
SwordHB_h    = SwordHB_H;



// Arm -------------------------------
dl_Arm_SPRITES=ds_list_create();
dl_Arm_SPRITES[|BVR_IDLE] = 0;
dl_Arm_SPRITES[|BVR_DRWH] = spr_Iron_Knuckle_Attack_high_Draw;
dl_Arm_SPRITES[|BVR_ATKH] = spr_Iron_Knuckle_Attack_high_Stab;
dl_Arm_SPRITES[|BVR_DRWL] = spr_Iron_Knuckle_Attack_low_Draw;
dl_Arm_SPRITES[|BVR_ATKL] = spr_Iron_Knuckle_Attack_low_Stab;
Arm_sprite = dl_Arm_SPRITES[|BVR_IDLE];



dg_Arm_XOFF = ds_grid_create(4,6);
// facing right
// atk high
dg_Arm_XOFF[#0,0] =  -4; // BVR_DRWH
dg_Arm_XOFF[#0,1] =  -9; // BVR_DRWH
dg_Arm_XOFF[#0,2] =  -5; // BVR_DRWH
dg_Arm_XOFF[#0,3] =   9; // BVR_ATKH
dg_Arm_XOFF[#0,4] =  16; // BVR_ATKH
dg_Arm_XOFF[#0,5] =   8; // BVR_ATKH
// atk low
dg_Arm_XOFF[#1,0] =  -3; // BVR_DRWL
dg_Arm_XOFF[#1,1] =  -7; // BVR_DRWL
dg_Arm_XOFF[#1,2] =  -4; // BVR_DRWL
dg_Arm_XOFF[#1,3] =   9; // BVR_ATKL
dg_Arm_XOFF[#1,4] =  16; // BVR_ATKL
dg_Arm_XOFF[#1,5] =   8; // BVR_ATKL

// facing left
// atk high
dg_Arm_XOFF[#2,0] =   6; // BVR_DRWH
dg_Arm_XOFF[#2,1] =  10; // BVR_DRWH
dg_Arm_XOFF[#2,2] =   5; // BVR_DRWH
dg_Arm_XOFF[#2,3] =  -7; // BVR_ATKH
dg_Arm_XOFF[#2,4] = -15; // BVR_ATKH
dg_Arm_XOFF[#2,5] =  -8; // BVR_ATKH
// atk low
dg_Arm_XOFF[#3,0] =   5; // BVR_DRWL
dg_Arm_XOFF[#3,1] =   8; // BVR_DRWL
dg_Arm_XOFF[#3,2] =   4; // BVR_DRWL
dg_Arm_XOFF[#3,3] =  -7; // BVR_ATKL
dg_Arm_XOFF[#3,4] = -15; // BVR_ATKL
dg_Arm_XOFF[#3,5] =  -8; // BVR_ATKL

Arm_xoff = dg_Arm_XOFF[#0,0];



// -------------------------------------------------

abilities |= ABL_WALK;

if ( is_ancestor(object_index,ReboB) 
||  (is_ancestor(object_index,IrKnA) && ver==3) )
{
    abilities |= ABL_SHOT;
}




