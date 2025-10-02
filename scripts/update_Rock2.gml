
// 965A
// if havn't bounced off shield
if(!collided_shield) vspd = (-vspd_adj)&$FF;
//if (byte_dir(hspd) == facingDir) vspd = (-vspd_adj)&$FF;
Projectile_update_3a(despawn_offscreen_hor); // vspd_adj == 2;

