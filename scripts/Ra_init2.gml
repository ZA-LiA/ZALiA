/// Ra_init2()


// Put far in front so doesn't draw behind walls
GO_depth_init(DEPTH_FLYER);
//GO_depth_init(DEPTH_FG6-(TILE_DEPTHS_PAD>>1));
GO_set_sprite(id,spr_Ra2);

DRAW_YOFF = 0;


VSPD_CHANGE = 2;
vspd_change = VSPD_CHANGE;


    HSPD       = $10;
    VSPD_MAX   = $30;
    SPAWN_YOFF = $20;
//
switch(ver)
{
    case 1: { 
    HSPD       = $10;
    VSPD_MAX   = $30;
    SPAWN_YOFF = $20; 
    break;  }
    
    case 2: { 
    HSPD       = $18;
    VSPD_MAX   = $2E;
    SPAWN_YOFF = $24; 
    break;  }
    
    case 3: { 
    HSPD       = $18;
    VSPD_MAX   = $38;
    SPAWN_YOFF = $30; 
    break;  }
}




if (wINw(xl,ww, viewXL(),viewW()) 
&&  global.pc.state==global.pc.state_SPAWN 
&&  g.exit_enter.side&$3 )
{
    hspd = 0;
    vspd = 0;
    if (g.exit_enter.side&$1) set_xy(id, viewXL()-ww, y);
    else                      set_xy(id, viewXR()+ww, y);
    
    
    // To stop Ra_update() from activating Ra
    GO_update_cam_vars();
    g.view_at_rm_edge = g.exit_enter.side&$3;
}




