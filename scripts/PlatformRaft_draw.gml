/// PlatformRaft_draw()


if (USE_SURF)
{
    if(!surface_exists(   Raft_SURF) 
    ||  surface_get_width(Raft_SURF)==1 ) // First frame
    {
        if(!surface_exists(Raft_SURF))
        {                  Raft_SURF = surface_create(1,1);  }
        surface_resize(    Raft_SURF, Tile_COUNT<<3, 8);
        
        
        surface_set_target(Raft_SURF);
        for(var _i=0; _i<Tile_COUNT; _i++) // Each plank(tile)
        {   draw_background_part(Raft_TS, Raft_TS_X,Raft_TS_Y, 8,8, _i<<3,0);  }
        surface_reset_target();
    }
}








if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




pal_swap_set(p.palette_image, palidx_base);
if (USE_SURF 
&&  surface_exists(Raft_SURF) )
{
    draw_surface(  Raft_SURF, drawX-ww_,drawY-hh_);
}
else
{
    var _i, _x;
    for(_i=0; _i<Tile_COUNT; _i++)
    {
        _x = xl+(_i<<3);
        draw_background_part(Raft_TS, Raft_TS_X,Raft_TS_Y, 8,8, _x,yt);
    }
}
pal_swap_reset();




// ------------------------------------------------------------------------------
// if(!DEV)           exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if(!g.can_draw_cs) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GO_draw_body_hb();




