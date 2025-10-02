/// Atta_init2()


GO_init_palidx(global.PI_MOB_RED);
DRAW_YOFF = 0;

dl_sprites[|1] = spr_Atta_1b_2;
dl_sprites[|0] = spr_Atta_1a_1;
GO_set_sprite(id,dl_sprites[|0]);


projectile_OBJ = Flame2;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


facing_dir = 1;


DUR_COOLDOWN = $C0;




