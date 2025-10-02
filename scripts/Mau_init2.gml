/// Mau_init2()


dl_sprites[|0] = spr_Mau1;
GO_init_palidx(global.PI_MOB_RED);
GO_depth_init(DEPTH_FLYER);

//DRAW_YOFF = 1; // Does it get +1 in-ground??

facing_dir = dir_to_pc_(id);

counter = $FF;


projectile_OBJ = Bullet1;
projectile_VER = 2;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


var     _SPEED = $08;
HSPD1 = _SPEED;
VSPD1 = _SPEED;

if (ver==2)
{
    hspd  = (HSPD1*facing_dir)&$FF;
    //vspd  = (VSPD1*facing_dir)&$FF;
    
    MIN_DIST = $18;
}




