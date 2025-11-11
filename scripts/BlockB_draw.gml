/// BlockB_draw()


if (Chain_hang 
&&  Chain_connected )
{
    if(!surface_exists(ChainLink_surf))
    {
        // Create surface
        ChainLink_surf = surface_create(ChainLink_W,ChainLink_H);
        surface_set_target(ChainLink_surf);
        draw_clear_alpha(c_black,0);
        
        var _XL = -4;
        draw_background_part(ts_Man_made_1a_WRB, $5<<3,$1<<3, 8,8, _XL,0);
        draw_background_part(ts_Man_made_1a_WRB, $6<<3,$1<<3, 8,8, _XL+8,0);
        
        surface_reset_target();
    }
    
    if (Chain_can_draw)
    {
        pal_swap_set(global.palette_image, Chain_PI);
        for(var _i=0; _i<ChainLink_COUNT; _i++) draw_surface(ChainLink_surf, Chain_XL, Chain_YT+(ChainLink_H*_i));
        pal_swap_reset();
    }
}


GameObjectB_draw_2();




