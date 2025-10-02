/// Spawner_Bullet_init2()


var _i;


projectile_OBJ = Bullet1;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


if (ver==1) facing_dir =  1; // ver 1: shoot right
if (ver==2) facing_dir = -1; // ver 2: shoot left


dg_SPEEDS = ds_grid_create(8,2);
//                          //
dg_SPEEDS[#0,0] = $06; // hspd
dg_SPEEDS[#0,1] = $16; // vspd
//                          //
dg_SPEEDS[#1,0] = $0A;
dg_SPEEDS[#1,1] = $14;
//                          //
dg_SPEEDS[#2,0] = $0D;
dg_SPEEDS[#2,1] = $13;
//                          //
dg_SPEEDS[#3,0] = $0F;
dg_SPEEDS[#3,1] = $11;
//                          //
dg_SPEEDS[#4,0] = $11;
dg_SPEEDS[#4,1] = $0F;
//                          //
dg_SPEEDS[#5,0] = $12;
dg_SPEEDS[#5,1] = $0E;
//                          //
dg_SPEEDS[#6,0] = $13;
dg_SPEEDS[#6,1] = $0D;
//                          //
dg_SPEEDS[#7,0] = $13;
dg_SPEEDS[#7,1] = $0B;
//                          //
/*
for(_i=7; _i>=0; _i--) ar_hspds[_i] = 0;
ar_hspds[0] = $06;
ar_hspds[1] = $0A;
ar_hspds[2] = $0D;
ar_hspds[3] = $0F;
ar_hspds[4] = $11;
ar_hspds[5] = $12;
ar_hspds[6] = $13;
ar_hspds[7] = $13;

for(_i=7; _i>=0; _i--) ar_vspds[_i] = 0;
ar_vspds[0] = $16;
ar_vspds[1] = $14;
ar_vspds[2] = $13;
ar_vspds[3] = $11;
ar_vspds[4] = $0F;
ar_vspds[5] = $0E;
ar_vspds[6] = $0D;
ar_vspds[7] = $0B;
*/




