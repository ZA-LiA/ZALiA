


can_draw_self = true;

xScale_L = facing_dir;    // 
xScale_R = facing_dir;    // 
palIdx_L = palidx_def; // 
palIdx_R = palidx_def; // 

if (isProjSprAdjFrame())
{
    xScale_L *= -1;       // 
    palIdx_L  = global.PI_PC1; // 
}

// sprites[0]: tip, sprites[1]: pole
spr_L = dl_sprites[|facing_dir == 1]; // 
spr_R = dl_sprites[|facing_dir != 1]; // 




