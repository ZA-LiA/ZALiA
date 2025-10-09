/// Stalfos_init2()


// behavior:   0:idle,      1:drawback,    2:stab, 3:downstab
// legs:       0:legs open, 1:legs closed, 2:jump, 3:downstab


var _i, _val,_val1,_val2;

if (isVal(g.area_name, Area_PalcC,Area_PalcD,Area_PalcF))
{
    dl_sprites[|3] = spr_Parutamu_body4; // downstab
    dl_sprites[|2] = spr_Parutamu_body3; // stab
    dl_sprites[|1] = spr_Parutamu_body2; // drawback
    dl_sprites[|0] = spr_Parutamu_body1; // idle
}
else
{
    dl_sprites[|3] = spr_Stalfos_body4; // downstab
    dl_sprites[|2] = spr_Stalfos_body3; // stab
    dl_sprites[|1] = spr_Stalfos_body2; // drawback
    dl_sprites[|0] = spr_Stalfos_body1; // idle
}


            dl_legs_sprites = ds_list_create();
ds_list_add(dl_legs_sprites,spr_Stalfos_legs1); // legs open
ds_list_add(dl_legs_sprites,spr_Stalfos_legs2); // legs closed
ds_list_add(dl_legs_sprites,spr_Stalfos_legs3); // jump
ds_list_add(dl_legs_sprites,spr_Stalfos_legs4); // downstab
Legs_sprite = dl_legs_sprites[|0];

Arm_sprite = 0;
Arm_xoff   = $10;
Arm_yoff   = 0;


VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;

hasDroppedFromSpawn = false; // 04A0[eIndex] for update sprite data

if (g.mod_STALFOS_CHAIN)
{
    can_draw_chain = true;
    
    _val = (spawn_yt>>8)<<5;
    CEILING_Y  = find_row_solid(TID_SOLID1|TID_ONEWY1, x>>3,spawn_yt>>3, -1,0, _val);
    CEILING_Y += CEILING_Y != _val; // Add one if it found a solid row
    CEILING_Y  = CEILING_Y<<3;
    
    //CHAIN_SPR   = spr_Chain_link_01a;
    CHAIN_SPR   = spr_Chain_link_02a;
    CHAIN_SPR_H = sprite_get_height(CHAIN_SPR);
    
    _val1       = (spawn_yt-CEILING_Y);
    _val2       = (CHAIN_SPR_H+1);
    CHAIN_COUNT   =  _val1 div _val2;
    //CHAIN_COUNT  += (_val1 mod _val2) > 2;
    CHAIN_COUNT++;
    
    spawn_yt = CEILING_Y + (_val2*(CHAIN_COUNT-1)) + 3;
}


// shield hb
ShieldHB_IDX_LOW = 1; // 
ShieldHB_IDX_HGH = 2; // 
ShieldHB_IDX     = ShieldHB_IDX_HGH; // 
ShieldHB_idx     = ShieldHB_IDX; // 0444,X


// sword hb
SwordHB_XOFF   = 16 + g.HB_ADJ_X; // 
SwordHB_YOFF   =  9 + g.HB_ADJ_Y; // 
SwordHB_W      = 14 + g.HB_ADJ_W; // 
SwordHB_H      =  1 + g.HB_ADJ_H; // 
SwordHB_xoff        = SwordHB_XOFF * facing_dir;
SwordHB_yoff        = SwordHB_YOFF;
SwordHB_w           = SwordHB_W;
SwordHB_h           = SwordHB_H;




