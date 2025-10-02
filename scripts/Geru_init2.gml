/// Geru_init2()

// ver 1. Geru orange,  weapon: Lance
// ver 2. Geru red,     weapon: Club
// ver 3. Geru blue     weapon: Mace1 (Projectile)


projectile_OBJ = Mace1;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;


dl_sprites[|3] = spr_Geru_2B; // shield up,   legs closed
dl_sprites[|2] = spr_Geru_2A; // shield up,   legs open
dl_sprites[|1] = spr_Geru_1B; // shield down, legs closed
dl_sprites[|0] = spr_Geru_1A; // shield down, legs open


// 9F35
// X =      2, 3, 5, 6
// 9ED4,X: -6,-2, 6, 2
armXOff1 = 8 + g.HB_ADJ_X; // behavior 1, 4
armXOff2 = 6; // behavior 2, 5
armXOff3 = 2; // behavior 3, 6
// armXOff1 = 8; // behavior 1, 4
// armXOff2 = 3; // behavior 2, 5
// armXOff3 = 2; // behavior 3, 6

armXScale   = -1;
armYScale   =  1;
Arm_xoff    = armXOff1;
Arm_yoff    = -8;
arm         =  0;
lance1      =  0;
lance2      =  0;


// shield hb
ShieldHB_IDX_LOW = 1; // 
ShieldHB_IDX_HGH = 2; // 
ShieldHB_IDX     = ShieldHB_IDX_LOW; // 
ShieldHB_idx     = ShieldHB_IDX; // 0444,X


// sword hb
SwordHB_XOFF =  6 + g.HB_ADJ_X; // 
SwordHB_YOFF =  9 + g.HB_ADJ_Y; // 
SwordHB_W    = 14 + g.HB_ADJ_W; // 
SwordHB_H    =  1 + g.HB_ADJ_H; // 
SwordHB_xoff = SwordHB_XOFF * facing_dir;
SwordHB_yoff = SwordHB_YOFF;
SwordHB_w    = SwordHB_W;
SwordHB_h    = SwordHB_H;




