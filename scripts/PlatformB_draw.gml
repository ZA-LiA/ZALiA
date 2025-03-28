/// PlatformB_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


switch(ver)
{
    // ==============================================
    // ---------------------------------------
    case 1:{ // Cloud
    draw_sprite_(sprite,0, drawX,drawY, palidx);
    break;}
    
    
    
    
    
    // ==============================================
    // ---------------------------------------
    // TODO: Pre-process raft graphic
    case 2:{ // Raft
    pal_swap_set(p.palette_image, palidx_base);
    var _i, _x;
    for(_i=0; _i<Tile_COUNT; _i++)
    {
        _x = xl+(_i<<3);
        draw_background_part(Raft_TS, Raft_TS_X,Raft_TS_Y, 8,8, _x,yt);
    }
    pal_swap_reset();
    break;}
}




// ------------------------------------------------------------------------------
// if(!DEV)           exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// if(!g.can_draw_cs) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GO_draw_body_hb();




