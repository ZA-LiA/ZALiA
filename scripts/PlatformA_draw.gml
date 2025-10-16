/// PlatformA_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




if(!surface_exists(Body_surf))
{
    Body_surf = surface_create(ww,hh);
    surface_set_target(Body_surf);
    draw_clear_alpha(c_black,0);
    
    var _Body_SPRITE = spr_Elevator_2a_WRB;
    var _clm = -1;
    draw_sprite_part(_Body_SPRITE,0, 0,0, $8,$8, (++_clm)<<3,0); // Left end
    repeat(Body_mid_segments) draw_sprite_part(_Body_SPRITE,0, $8,0, $8,$8, (++_clm)<<3,0);
    draw_sprite_part(_Body_SPRITE,0, sprite_get_width(_Body_SPRITE)-$8,0, $8,$8, ww-$8,0); // Right end
    
    surface_reset_target();
}


pal_swap_set(global.palette_image, palidx);

draw_sprite_(Gear_SPRITE,0, drawX-ww_+4, drawY, -1,  1, Gear_yscale);
draw_sprite_(Gear_SPRITE,0, drawX+ww_-4, drawY, -1, -1, Gear_yscale);

draw_surface(Body_surf, drawX-ww_, drawY-hh_);
//draw_sprite_(Body_SPRITE,0, drawX,drawY);

pal_swap_reset();




// ------------------------------------------------------------------------------
if(!g.DevTools_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!g.can_draw_cs) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


depth = DEPTH_BASE_HUD;

canDrawCSHB=true;
GO_draw_cs_points();

for(var _i=ds_grid_width(dg_path)-1; _i>=0; _i--)
{
    drawPointCross(dg_path[#_i,1],dg_path[#_i,2], c_lime , c_purple);
}
    drawPointCross(x             ,y             , c_white, c_orange);
//




