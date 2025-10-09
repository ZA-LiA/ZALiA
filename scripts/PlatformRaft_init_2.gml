/// PlatformRaft_init_2()


if!(f.items&ITM_RAFT)
{
    instance_destroy();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _i, _a, _val;
var _PATH  = 0;
var _START = 0;



GO_depth_init(DEPTH_PC_MAIN-1);
//GO_sprite_init(spr_Placement_64x08);

Raft_TS     = ts_Man_made_1a_WRB;
Raft_TSRC1  = $A0;
Raft_TS_X   = ((Raft_TSRC1>>0)&$F)<<3;
Raft_TS_Y   = ((Raft_TSRC1>>4)&$F)<<3;
Tile_COUNT  = ww>>3;


USE_SURF    = true;
//USE_SURF    = false;
Raft_SURF   = surface_create(1,8);



dock_state = dock_state_FREE0;


if(!is_undefined(dk_spawn))
{
    if(!is_undefined(   g.dm_spawn[?dk_spawn+STR_pal_idx])){
            _val =      g.dm_spawn[?dk_spawn+STR_pal_idx];
        if (_val+1) GO_init_palidx(_val);
        //palidx_permut = 4; // 4:SHM.  Sharing water palette
    }
    
    hspd_dir = sign(val(g.dm_spawn[?dk_spawn+STR_Direction]));
    
    if(!is_undefined(   g.dm_spawn[?dk_spawn+STR_Start]))
    {      _START = val(g.dm_spawn[?dk_spawn+STR_Start]);  }
    
    
    
    if(!is_undefined(g.dm_spawn[?dk_spawn+STR_Path]))
    {   _PATH  =     g.dm_spawn[?dk_spawn+STR_Path];  }
    
    // If this is a rm w/ a dock,
    // Is raft waiting for player or 
    // is player already riding raft 
    // going towards the dock?
    // Compare the raft dock launch dir to the 
    // side of g.exit_enter to determine.
    if (_PATH==STR_Dock)
    {
        if (g.exit_enter 
        &&  g.exit_enter.side&$3 
        &&  g.exit_enter.side&$3 != dir8b(hspd_dir) ) // The exit dir is opposite of raft travel dir, raft will be docked waiting for player.
        {   // Wait for player to board raft.
            //standby = true;
            dock_state = dock_state_DOCKED0; // Wait for player to board
        }
        else
        {   dock_state = dock_state_FREE1;  } // Player riding raft toward dock.
        
        dock_xc = x;
    }
}


hspd1   = $01<<3;
hspd    =(hspd1*hspd_dir) &$FF;




switch(ver)
{
    // ==================================================
    // --------------------------------------------
    case 1:{ // RAFT
    if (isVal(dock_state, dock_state_FREE0,dock_state_FREE1))
    {
        //setXY( id, spawn_x,yt);
        set_xy(id, global.pc.x,y);
    }
    
    
    
    if (g.exit_enter 
    &&  g.exit_enter.side&$3 )
    {    hspd_dir = -sign_(g.exit_enter.side&$1);  }
    //else hspd_dir = -sign_(g.exit_enter.side&$1);
    //hspd_dir    = -sign_(g.exit_enter && g.exit_enter.exitNum&$10);
    var _SPEED  = $03;
    //var _SPEED  = $01;
    //var _SPEED  = $04;
    hspd1   = $0C;
    //hspd1   = _SPEED<<3;
    hspd    =(hspd1*hspd_dir) &$FF;
    
    
    
    
    WaterUndulate_DUR1  = $30;
    WaterUndulate_DUR2  = $14;
    WaterUndulate_DUR3  = $0C;
    WaterUndulate_dur   = WaterUndulate_DUR1;
    WaterUndulate_timer = WaterUndulate_dur;
    
    WaterUndulate_yoff_MAX  = 2; // -2,-1,0,1,2
    WaterUndulate_yoff      = WaterUndulate_yoff_MAX;
    WaterUndulate_dir       = -sign_(WaterUndulate_yoff);
    //set_xy(id, x,y+2);
    //set_xy(id, x,y+WaterUndulate_yoff);
    //WaterUndulate_level = -2; // -2,-1,0,1,2
    //WaterUndulate_phase = 0;
    //water_yoff  = 0;
    
    DistantWater_DEPTH      = DEPTH_BG7;
    DistantWater_xoff       = 0;
    DistantWater_undulate   = ds_list_find_index(g.dl_pal_swap_depths, DistantWater_DEPTH) + 1;
    DistantWater_undulate   = false;
    if (DistantWater_undulate) tile_layer_shift(DistantWater_DEPTH, 0, -4);
    break;}
}




