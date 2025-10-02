/// Moblin_init2()


//  Moblin v1 orange
//  Moblin v2 red
//  Moblin v3 blue


projectile_OBJ = Spear;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


BVR_IDL1 = 0; // idle 1:    spear not showing
BVR_DRWL = 1; // idle 2:    spear showing
BVR_ATKL = 2; // attack 1:  low attack.  Moblin3 & Moblin4
BVR_DRWH = 3; // draw 1:    high attack draw
BVR_ATKH = 4; // attack 2:  high attack. Moblin3
BVR_THRW = 5; // throw:     throw spear. Moblin2 & Moblin4
behavior = BVR_IDL1;

DUR_ATK_STAB = $10;
DUR_ATK_DRAW = $18;


HSPD_PACE  =   2;
HSPD_CHASE = $10;
hspd       = (8 * facing_dir)&$FF; // $0071,X

VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;


counter     = 0;    // 0444,X

AGRO_DIST   = $A0;
AGRO_BOR    = $50;
agroDist    = AGRO_DIST;
ATCK_DIST1  = $60; // 96. eID $14
ATCK_DIST2  = $16; // 22. eID $15,16
attack_dist = ATCK_DIST2;


dl_sprites[|5] = spr_Moblin_Low_Stab;   // stab low
dl_sprites[|4] = spr_Moblin_Low_Draw;   // draw low
dl_sprites[|3] = spr_Moblin_High_StabB; // stab high
dl_sprites[|2] = spr_Moblin_High_StabA; // stab high
dl_sprites[|1] = spr_Moblin_High_DrawB; // draw high
dl_sprites[|0] = spr_Moblin_High_DrawA; // draw high



SPEAR_SPR1  = spr_Spear_piece1;
SPEAR_SPR2  = spr_Spear_piece2;
spear_spr1  = 0; // spr_Spear_piece1
spear_spr2  = 0; // spr_Spear_piece2

canDrawSword    = false;
spear_xscale    = 1;
spear_xoff1     = 0;
spear_xoff2     = 0;
spear_yoff      = 0;


// sword hb
SwordHB_XOFF1 =   4 + g.HB_ADJ_X; // 
SwordHB_XOFF2 =   8 + g.HB_ADJ_X; // 
SwordHB_YOFF  =   9 + g.HB_ADJ_Y; // 
SwordHB_W     =  14 + g.HB_ADJ_W; // 
SwordHB_H     =   1 + g.HB_ADJ_H; // 
SwordHB_xoff  = SwordHB_XOFF1 * facing_dir;
SwordHB_yoff  = SwordHB_YOFF;
SwordHB_w     = SwordHB_W;
SwordHB_h     = SwordHB_H;




