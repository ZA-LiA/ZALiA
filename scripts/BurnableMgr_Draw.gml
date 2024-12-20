/// BurnableMgr_Draw()


if (!variable_instance_exists(self, "can_draw")) exit;
if(!can_draw)  exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    can_draw = false;
//

var _x,_y, _spr;

pal_swap_set(p.palette_image, FIRE_PI);

for(var _i=ds_grid_width(dg_Burnable)-1; _i>=0; _i--)
{
    if(!dg_Burnable[#_i,4]) continue;
        dg_Burnable[#_i,4] = false; // can draw
    //
    depth = dg_Burnable[#_i,1]-1;
    if (dg_Burnable[#_i,2] >= SMALL_SPR_CUE) _spr = dg_Burnable[#_i,7];
    else                                     _spr = FIRE_SPR3; // FIRE_SPR3: small sprite
    _x = dg_Burnable[#_i,5];
    _y = dg_Burnable[#_i,6] - ((sprite_get_height(_spr)-8)>>1);
    draw_sprite_(_spr,0, _x,_y, FIRE_PI, sign_(dg_Burnable[#_i,2]&4));
    //draw_sprite_(_spr,0, _x,dg_Burnable[#_i,6]+FIRE_YOFF, FIRE_PI, sign_(dg_Burnable[#_i,2]&4));
}

pal_swap_reset();




