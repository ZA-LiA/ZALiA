/// Grunt_init2()


GO_init_palidx(global.PI_MOB_ORG);
dl_sprites[|1] = spr_Grunt_body2;
dl_sprites[|0] = spr_Grunt_body1;

Legs_sprite  = spr_Grunt_legs1;


VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;

// sword draw xyoff -----------------------------
spear_xoff1 =   8;
spear_xoff2 = -12;
spear_yoff  =  -8;


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




