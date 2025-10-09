/// PlatformRaft_update()


x_prev = x;
y_prev = y;


GO_update_cam_vars();
update_EF11();



if (dock_state==dock_state_FREE0 
||  dock_state==dock_state_FREE1 )
{
    if (hspd) updateX();
    if (vspd) updateY();
    
    
    switch(  dock_state)
    {
        case dock_state_FREE0:{ // Docked and waiting for player to get on
        
        break;}
        
        case dock_state_FREE1:{ // Docked and waiting for player to get off
        var _SIGN = sign(x-dock_xc);
        if (_SIGN==0 
        ||  _SIGN==hspd_dir )
        {
            dock_state = dock_state_DOCKED1; // Docked and waiting for player to get off
            hspd_dir = -hspd_dir;
            hspd     =(hspd1*hspd_dir) &$FF;
        }
        break;}
    }
    
    
    // In the event PC is left stranded, 
    // the RAFT will reverse its direction 
    // if it gets far enough outside the room.
    if (global.pc.cs_btm_inst!=id 
    && !wINw(xl,ww, -ww,g.rm_w+(ww<<1)) )
    //&& !rectInRect(     xl,     yt,     ww,     hh,    -ww,       -hh,g.rm_w+(ww<<1),g.rm_h+(hh<<1)) 
    //&&  rectInRect(global.pc.xl,global.pc.yt,global.pc.ww,global.pc.hh, 0,min(0,viewYT()),g.rm_w,    max(g.rm_h,viewH())) )
    {
        hspd_dir = -hspd_dir;
        hspd     =(hspd1*hspd_dir) &$FF;
        
        if (dock_xc     // if this scene has a dock
        &&  -sign(x-dock_xc) == hspd_dir )
        {
            dock_state = dock_state_FREE1
        }
    }
}
else if(!global.pc.stun_timer 
     && !global.pc.ogr )
{
    switch(  dock_state)
    {
        case dock_state_DOCKED0:{ // Docked and waiting for player to get on
        if (global.pc.cs_btm_inst==id 
        &&  inRange(global.pc.x, x-$10,x+$10) )
        {    dock_state = dock_state_FREE0;  } // Move freely not expecting to dock
        break;}
        
        case dock_state_DOCKED1:{ // Docked and waiting for player to get off
        if (global.pc.cs_btm_inst!=id)
        {    dock_state = dock_state_DOCKED0;  } // Docked and waiting for player to get on
        break;}
    }
}


















if (WaterUndulate_timer)
{
    WaterUndulate_timer--;
    if(!WaterUndulate_timer)
    {
        set_xy(id, x,y+WaterUndulate_dir);
        tile_layer_shift(g.dg_anim_liquid[#0,0], 0, WaterUndulate_dir);
        
                WaterUndulate_yoff +=  WaterUndulate_dir;
        if (abs(WaterUndulate_yoff)==2)
        {       WaterUndulate_dir   = -WaterUndulate_dir;  }
        
        //tile_layer_shift(g.dg_t_anim_liquid[#0,0], 0, WaterUndulate_dir);
        
        switch(abs(WaterUndulate_yoff)){
        case 0:{WaterUndulate_dur=WaterUndulate_DUR3; break;}
        case 1:{WaterUndulate_dur=WaterUndulate_DUR2; break;}
        case 2:{WaterUndulate_dur=WaterUndulate_DUR1; break;}
        }
        WaterUndulate_timer=WaterUndulate_dur;
    }
    
    
    
    if (DistantWater_undulate)
    {
        if!(g.counter1&$7)
        {
            tile_layer_shift(DistantWater_DEPTH,  DistantWater_xoff, 0);
            DistantWater_xoff++;
            DistantWater_xoff &= $7;
            tile_layer_shift(DistantWater_DEPTH, -DistantWater_xoff, 0);
        }
        
        
        if (WaterUndulate_timer == WaterUndulate_dur>>2)
        {
            tile_layer_shift(DistantWater_DEPTH, 0, -WaterUndulate_dir);
        }
    }
}











Platform_update_1a();
BodyHB_can_draw = true;
BodyHB_xoff    = 0;
BodyHB_yoff    = 0;
BodyHB_w       = ww;
BodyHB_h       = hh;
update_body_hb();


GO_update_cam_vars();
update_EF11();




