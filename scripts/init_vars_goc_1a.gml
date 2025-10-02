/// init_vars_goc_1a()

// GOC/Projectile vars


//pID         =  0; // 0087[pIndex]
disintegrate_counter = 0; // 0087[pIndex]

vspd_adj = 0; // The per frame change to vspd
vspd_MAX = $7<<4;

collided_shield = false;
reflected       = false; // if REFLECT has reversed this inst


//source_uIdx   =  0; // 045E[pIndex]
source_inst   = noone;// source instance that created the projectile
source_object = 0;    // object_index of source instance


despawn_offscreen_hor = true;
despawn_offscreen_ver = true;




