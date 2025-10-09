/// Boss_update_start()


if (g.view_lock_boss)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if (viewXC()>>3 != (arena_x>>3)-(!g.view_dir_x))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ------------------------------------------------------------------------------
var _i;


set_camera_xy(arena_x-viewW_(), viewYT()); // Snap to arena
g.view_lock_boss = $3;
g.view_lock     |= g.view_lock_boss; // 3: cam left & right locked



            start_timer = 0;
switch(object_index){
case ReboA:{start_timer = $FF; break;}
//case ReboA:{start_timer = $FF - ((BRIDGE_TILE_CNT*($1<<S1)) * !bridge_ver); break;}
case CaroA:{start_timer = $40; break;}
case BarbA:{start_timer = $FF; break;}
case ThunA:{start_timer = $90; break;}
}


if (object_index!=ThunA 
&&  object_index!=ShLiA 
&&  object_index!=Ganon )
{
    with(ArenaGate)
    {
        var _clm=0;
        var _row=0;
        
        sub_state = SUB_STATE_TRIG;
        g.pc_lock = PC_LOCK_ALL; // Only lock PC if there are gates?
        
        // --------------------------------------------
        if (global.pc.RescueDropOff_rc<0)
        {
            _clm = other.arena_x>>3;
            _row = viewYC()>>3;
        }
        else
        {
            _clm = (global.pc.RescueDropOff_rc>>0)&$FF;
            _row = (global.pc.RescueDropOff_rc>>8)&$FF;
        }
        
        _clm = clamp(_clm, ((other.arena_xl+global.pc.ww_)>>3)+1, ((other.arena_xr-global.pc.ww_)>>3)-1);
        _clm = clamp(_clm,   ((cam_xl_min()+global.pc.ww_)>>3)+1,   ((cam_xr_max()-global.pc.ww_)>>3)-1);
        _row = clamp(_row,   ((cam_yt_min()+global.pc.hh) >>3)+0,    (cam_yb_max()          >>3)-1);
        global.pc.RescueDropOff_rc = (_row<<8) | _clm;
        //global.pc.RescueDropOff_rc = -1; // In case the last rc was outside of the arena gates.
    }
    /*
    for(_i=ds_list_size(dl_gate)-1; _i>=0; _i--)
    {
        if(!dl_gate[|_i]) continue;
        
            dl_gate[|_i].sub_state = dl_gate[|_i].SUB_STATE_TRIG;
        //
        g.pc_lock = PC_LOCK_ALL; // Only lock PC if there are gates?
        global.pc.RescueDropOff_rc = -1; // In case the last rc was outside of the arena gates.
    }
    */
}




Boss_play_battle_music();




