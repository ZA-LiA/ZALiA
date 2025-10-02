/// Daira_init2()


// Lizard-man axe thrower

// Daira ver1(Orange)
// Daira ver2(Red)


projectile_OBJ = Axe;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;

dl_sprites[|1] = spr_Daira2; // spr_Daira2. legs open
dl_sprites[|0] = spr_Daira1; // spr_Daira1. legs closed

armXScale  = -1;
armYScale  = -1;
Arm_xoff   = 16;
Arm_yoff   = -8;
Arm_sprite =  0;


// sword hb
SwordHB_XOFF = 16 + g.HB_ADJ_X; // 
SwordHB_YOFF = 11 + g.HB_ADJ_Y; // 
SwordHB_W    = 14 + g.HB_ADJ_W; // 
SwordHB_H    =  1 + g.HB_ADJ_H; // 
SwordHB_xoff = SwordHB_XOFF * facing_dir;
SwordHB_yoff = SwordHB_YOFF;
SwordHB_w    = SwordHB_W;
SwordHB_h    = SwordHB_H;




