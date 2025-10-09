/// Challenge_IntermittentPlatformSequence_update()


var _i,_j, _idx;
var _x,_y, _w,_h;


for(_i=ds_grid_width(dg_restart)-1; _i>=0; _i--)
{
    _x = dg_restart[#_i,1];
    _y = dg_restart[#_i,2];
    _w = dg_restart[#_i,3];
    _h = dg_restart[#_i,4];
    
    if (rectInRect(_x,_y,_w,_h, global.pc.BodyHB_xl,global.pc.BodyHB_yt,global.pc.BodyHB_w,global.pc.BodyHB_h) 
    &&  seq_dir != dg_restart[#_i,0] )
    {
        var _ready = true;
        
        for(_j=PLATFORMS-1; _j>=0; _j--)
        {
            if ( dg_platform[#_j,0] == State_SLEEP) continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            
            _x = dg_platform[#_j,2] <<3;
            _y = dg_platform[#_j,3] <<3;
            _w = dg_platform[#_j,4] <<3;
            _h = dg_platform[#_j,5] <<3;
            
            if(!rectInView(_x,_y, _w,_h))
            {   // Set any platforms off screen to State_SLEEP so 
                // they don't activate others.
                dg_platform[#_j,0] = State_SLEEP;
                dg_platform[#_j,1] = 0;
            }
            else
            {   // This platform is on screen and is not finished.
                _ready = false;
            }
        }
        
        
        
        if(!_ready) break; // Platform(s) are on screen and not finished.
        
        
        
        
        // All platforms on screen have finished.
            seq_dir = dg_restart[#_i,0];
        if (seq_dir)     _idx = 0;
        else             _idx = PLATFORMS-1;
        
        if(!dg_platform[#_idx,1] 
        ||  dg_platform[#_idx,1] > DUR_START )
        {
            dg_platform[#_idx,1] = DUR_START;
        }
        
        
        break;
    }
}














// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------

for(_i=0; _i<PLATFORMS; _i++)
{
    if (seq_dir) _idx = _i;
    else         _idx = (PLATFORMS-1)-_i;
    
    if (dg_platform[#_idx,1]) // dg_platform[#_idx,1]: timer
    {   dg_platform[#_idx,1]--;  }
    
    
    switch(dg_platform[#_idx,0]) // dg_platform[#_idx,0]: state
    {
        // ------------------------------------------------------------
        // ------------------------------------------------------------
        case State_SLEEP:{
        
        dg_platform[#_idx,6] = 0; // 6: SOLID state
        
        if(!_i) // Only 1st platform wakes up by timer.
        {
            if(!dg_platform[#_idx,1]) // 1: timer
            {
                dg_platform[#_idx,0] = State_TELL;
                dg_platform[#_idx,1] = DUR_TELL;
            }
        }
        else
        {
            if (dg_platform[#_idx + -seq_dir, 0] == State_FULL 
            &&  dg_platform[#_idx + -seq_dir, 1] <= $20+(DUR_TELL+DUR_ANIM) )
            // &&  dg_platform[#_idx + -seq_dir, 1] <= DUR_FULL-(DUR_FULL>>2) )
            {
                dg_platform[#_idx,0] = State_TELL;
                dg_platform[#_idx,1] = DUR_TELL;
            }
        }
        
        break;}
        
        
        
        
        
        
        // ------------------------------------------------------------
        // ------------------------------------------------------------
        case State_TELL:{
        
        if(!dg_platform[#_idx,1]) // 1: timer
        {
            dg_platform[#_idx,0] = State_ANIM_IN;
            dg_platform[#_idx,1] = DUR_ANIM;
        }
        
        break;}
        
        
        
        
        
        
        // ------------------------------------------------------------
        // ------------------------------------------------------------
        case State_ANIM_IN:{ // Animation In
        
        if(!dg_platform[#_idx,1]) // 1: timer
        {
            var _CLM  = dg_platform[#_idx,2];
            var _ROW  = dg_platform[#_idx,3];
            var _CLMS = dg_platform[#_idx,4];
            var _ROWS = dg_platform[#_idx,5];
            
            var _clm, _row;
            for(_j=(_CLMS*_ROWS)-1; _j>=0; _j--)
            {
                _clm = _CLM+(_j mod _CLMS);
                _row = _ROW+(_j div _CLMS);
                global.dg_solid[#_clm,_row] = TID_SOLID1;
                dg_platform[#_idx,6] = TID_SOLID1; // 6: SOLID state
                
                g.dg_RmTile_TempSolid[#_clm,_row] = TID_SOLID1; // tells Rescue Fairy to not use these solid tiles
            }
            
            
            
            if (rectInView(_CLM<<3,_ROW<<3, _CLMS<<3,_ROWS<<3)) 
            {   aud_play_sound(get_audio_theme_track(dk_BlockBreak));  }
            
            dg_platform[#_idx,0] = State_FULL;
            dg_platform[#_idx,1] = DUR_FULL;
        }
        
        break;}
        
        
        
        
        
        
        // ------------------------------------------------------------
        // ------------------------------------------------------------
        case State_FULL:{
        
        dg_platform[#_idx,6] = TID_SOLID1; // 6: SOLID state
        
        if(!dg_platform[#_idx,1]) // 1: timer
        {
            var _CLM  = dg_platform[#_idx,2];
            var _ROW  = dg_platform[#_idx,3];
            var _CLMS = dg_platform[#_idx,4];
            var _ROWS = dg_platform[#_idx,5];
            
            
            if (rectInView(_CLM<<3,_ROW<<3, _CLMS<<3,_ROWS<<3)) 
            {   aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));  }
            
            dg_platform[#_idx,0] = State_ANIM_OUT;
            dg_platform[#_idx,1] = DUR_ANIM;
        }
        
        break;}
        
        
        
        
        
        
        // ------------------------------------------------------------
        // ------------------------------------------------------------
        case State_ANIM_OUT:{ // Animation Out
        
        if(!dg_platform[#_idx,1]) // 1: timer
        {
            var _CLM  = dg_platform[#_idx,2];
            var _ROW  = dg_platform[#_idx,3];
            var _CLMS = dg_platform[#_idx,4];
            var _ROWS = dg_platform[#_idx,5];
            
            var _clm, _row;
            for(_j=(_CLMS*_ROWS)-1; _j>=0; _j--)
            {
                _clm = _CLM+(_j mod _CLMS);
                _row = _ROW+(_j div _CLMS);
                global.dg_solid[#_clm,_row] = 0;
                dg_platform[#_idx,6] = 0; // 6: SOLID state
                
                g.dg_RmTile_TempSolid[#_clm,_row] = 0;
            }
            
            
            
            dg_platform[#_idx,0] = State_SLEEP;
            dg_platform[#_idx,1] = DUR_SLEEP * !_i; // Only 1st platform wakes up by timer.
        }
        
        break;}
    }
}




