/// Zora_init2()


GO_init_palidx(global.PI_MOB_BLU);

SPR_IDLE = spr_Zora_body_B; // legs open
SPR_WALK = spr_Zora_body_A; // legs closed
SPR_HEAD = spr_Zora_head;   // not standing
SPR_STND = spr_Zora_stand;  // attack stand


Head_xoff = 0;


projectile_OBJ = Bullet2;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;

shoot_timer = 0; // 0081,X
frwd_bkwd = facing_dir;


       COLLISION_VER=2;
switch(COLLISION_VER)
{
    // --------------------------------------------
    case 1: {
    BODY_HB_IDX_TALL    = $02;
    BODY_HB_IDX_SHRT    = $0A;
    BodyHB_idx         = BODY_HB_IDX_SHRT;
    
    CS_OFF_IDX_TALL     = $05;
    CS_OFF_IDX_SHRT     = $05;
    cs_off_idx = CS_OFF_IDX_SHRT;
    break;  }
    
    
    // --------------------------------------------
    case 2: {
    SPR_WALK = spr_Zora_Low_1a;   // legs closed
    SPR_IDLE = spr_Zora_Low_1b;   // legs open
    SPR_STND = spr_Zora_High_1a;  // standing
    GO_change_sprite_index(id, SPR_IDLE, 0,1);
    
    BODY_HB_IDX_TALL    = $2C;
    BODY_HB_IDX_SHRT    = $2B;
    BodyHB_idx          = BODY_HB_IDX_SHRT;
    
    CS_OFF_IDX_TALL     = $13;
    CS_OFF_IDX_SHRT     = $12;
    cs_off_idx = CS_OFF_IDX_SHRT;
    break;  }
}




