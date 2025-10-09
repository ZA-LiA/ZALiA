/// Kakusu005_update()


switch(sub_state)
{
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1A:{
    if ( sub_state_timer){sub_state_timer--; break;}
    
    var _complete = true;
    with(Torch)
    {
        if(!is_lit)
        {
            _complete = false;
            break;
        }
    }
    
    if (_complete)
    {
        //sub_state_timer = 4;
        sub_state = SUB_STATE_CHLG_1B;
    }
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1B:{
    if ( sub_state_timer){sub_state_timer--; break;}
    
    var _i, _x,_y, _clm,_row;
    
    // Stop any animating crumble blocks
    for(_i=ds_grid_width(g.dg_tile_anim)-1; _i>=0; _i--)
    {
        if (g.dg_tile_anim[#_i,0]==TID_BREAK2 
        ||  g.dg_tile_anim[#_i,0]==TID_BREAK4 )
        {
            g.dg_tile_anim[#_i,1] = 0; // set counter
            g.dg_tile_anim[#_i,3] = 0; // set Anim frame num
            g.dg_tile_anim[#_i,7] = 1;
        }
    }
    
    // Remove all crumble tiles
    var _ar_tid = tile_get_ids_at_depth(BreakTile_DEPTH);
    for(_i=array_length_1d(_ar_tid)-1; _i>=0; _i--)
    {
        if(!tile_exists(   _ar_tid[_i])) continue;
        
        _clm = tile_get_x( _ar_tid[_i]) >>3;
        _row = tile_get_y( _ar_tid[_i]) >>3;
        _x = _clm<<3;
        _y = _row<<3;
        
        g.dg_RmTile_Break[#_clm,_row] = 0;
        tile_change_1a(BreakTile_DEPTH, _x,_y, 0, -1, 0,0,0);
    }
    _ar_tid = 0;
    tile_layer_delete(BreakTile_DEPTH);
    
    
    // Add new ground
        _y = GROUND_ROW<<3;
    for(_i=GROUND_CLM; _i<g.rm_clms; _i++)
    {
        if (global.dg_solid[#_i,GROUND_ROW]) break;
        _x = _i<<3;
        tile_change_1a(DEPTH_BG1, _x,_y, ts_Man_made_1a_WRB,$A0, TID_ONEWY1);
    }
    
    aud_play_sound(get_audio_theme_track(dk_BlockBreak));
    aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
    
    
    
    facing_dir = sign_(x<g.rm_w_);
    
    aud_play_sound(SND_REVEAL);
    sub_state = SUB_STATE_ACTV;
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV:{
    if ( sub_state_timer){sub_state_timer--; break;}
    Kakusu_update();
    break;}
}




