/// Fokka_init2()

// v1(Red), v2(Blue)


var        _behavior=0;
BVR_IDLE = _behavior++; // idle
BVR_DRWH = _behavior++; // draw high
BVR_ATKH = _behavior++; // stab high
BVR_DRWL = _behavior++; // draw low
BVR_ATKL = _behavior++; // stab low
BVR_THRW = _behavior++; // throw
behavior = BVR_IDLE;


SPR_IDLE1 = spr_Fokka_Idle1;
SPR_IDLE2 = spr_Fokka_Idle2;
SPR_WALK1 = spr_Fokka_Walk1;
SPR_WALK2 = spr_Fokka_Walk2;
SPR_JUMP1 = spr_Fokka_Jump;


HSPD_PACE   =   8; // 4
HSPD_CHASE  = $10;
HSPD_JUMP   = $18;
hspd        = HSPD_PACE; // $0071,X

JUMP_VEL    = $C8; // og $C8
INIT_VEL    = JUMP_VEL;
VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;


timer           = 1; // 1st frame after spawn is 0
DUR_PACE        = 0;
DUR_ATK_DRAW    = $18; //$0504,X
DUR_ATK_STAB    = $10; //$0504,X
// CUE_ATCK        = $40;
CUE_ATK_PHASE2  = $0C; // $0D
CUE_ATK_PHASE3  = $02; // $03

attack_tokens = 0; // $0401[uIdx].  Num of remaining quick succession attacks


projectile_OBJ = SwordBeam;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;



// Arm -------------------------------
dl_Arm_SPRITES=ds_list_create();
dl_Arm_SPRITES[|BVR_IDLE] = 0;
dl_Arm_SPRITES[|BVR_DRWH] = spr_Fokka_Draw_high;
dl_Arm_SPRITES[|BVR_ATKH] = spr_Fokka_Stab_high;
dl_Arm_SPRITES[|BVR_DRWL] = spr_Fokka_Draw_low;
dl_Arm_SPRITES[|BVR_ATKL] = spr_Fokka_Stab_low;
Arm_sprite = dl_Arm_SPRITES[|BVR_IDLE];



dg_Arm_XOFF = ds_grid_create(4,6);
// facing right
// atk high
dg_Arm_XOFF[#0,0] =  -5; // BVR_DRWH
dg_Arm_XOFF[#0,1] = -10; // BVR_DRWH
dg_Arm_XOFF[#0,2] =  -5; // BVR_DRWH
dg_Arm_XOFF[#0,3] =   9; // BVR_ATKH
dg_Arm_XOFF[#0,4] =  16; // BVR_ATKH
dg_Arm_XOFF[#0,5] =   8; // BVR_ATKH
// atk low
dg_Arm_XOFF[#1,0] =  -4; // BVR_DRWL
dg_Arm_XOFF[#1,1] =  -8; // BVR_DRWL
dg_Arm_XOFF[#1,2] =  -4; // BVR_DRWL
dg_Arm_XOFF[#1,3] =   9; // BVR_ATKL
dg_Arm_XOFF[#1,4] =  16; // BVR_ATKL
dg_Arm_XOFF[#1,5] =   8; // BVR_ATKL

// facing left
// atk high
dg_Arm_XOFF[#2,0] =   5; // BVR_DRWH
dg_Arm_XOFF[#2,1] =  10; // BVR_DRWH
dg_Arm_XOFF[#2,2] =   5; // BVR_DRWH
dg_Arm_XOFF[#2,3] =  -7; // BVR_ATKH
dg_Arm_XOFF[#2,4] = -15; // BVR_ATKH
dg_Arm_XOFF[#2,5] =  -8; // BVR_ATKH
// atk low
dg_Arm_XOFF[#3,0] =   4; // BVR_DRWL
dg_Arm_XOFF[#3,1] =   8; // BVR_DRWL
dg_Arm_XOFF[#3,2] =   4; // BVR_DRWL
dg_Arm_XOFF[#3,3] =  -7; // BVR_ATKL
dg_Arm_XOFF[#3,4] = -15; // BVR_ATKL
dg_Arm_XOFF[#3,5] =  -8; // BVR_ATKL

Arm_xoff = dg_Arm_XOFF[#0,0];


// ---------------------------------------------------
facing_dir = xScale;


abilities |= ABL_WALK;
abilities |= ABL_SHOT;




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
SwordHB_w        = SwordHB_W;
SwordHB_h        = SwordHB_H;




