


dl_sprites[|1] = spr_Spear_piece2; // pole
dl_sprites[|0] = spr_Spear_piece1; // tip
GO_set_sprite(id, dl_sprites[|0]);

vspd_adj = 2; // 

spr_L = dl_sprites[|facing_dir == 1]; // 
spr_R = dl_sprites[|facing_dir != 1]; // 

// palIndex_def set in Projectile_create() before init_Spear()
palIdx_L = palidx_def;
palIdx_R = palidx_def;

xScale_L = facing_dir;
xScale_R = facing_dir;




