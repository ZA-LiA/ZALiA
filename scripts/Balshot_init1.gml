/// Balshot_init1()


var _i;


GameObjectB_init();


GO_set_sprite(id,spr_Balshot01a);
GO_init_palidx(global.PI_BGR1);


DRAW_YOFF = 0;


                       _i=0;
sub_state_ENABLED  = ++_i;
sub_state_DISABLED = ++_i;
sub_state = sub_state_ENABLED;


projectile_OBJ  = Bullet1;
projectile_VER  = 1;
projectile_obj  = projectile_OBJ;
projectile_ver  = projectile_VER;
projectile_pi   = -1;
projectile_w    = val(g.dm_go_prop[?object_get_name(projectile_obj)+STR_Width],  8);
projectile_h    = val(g.dm_go_prop[?object_get_name(projectile_obj)+STR_Height], 8);
projectile_hspd = $20;
projectile_attack_level = $3;


Shoot_cooldown = $5F;
Shoot_timer = 1;




