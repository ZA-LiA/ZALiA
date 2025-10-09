/// Cutscene_EnterFromChimney_update(x, y)


if(!g.mod_PC_ENTER_FROM_CHIMNEY 
||  g.ChangeRoom_timer > 0 )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if(!g.cutscene 
&&  g.EnterRoom_SpawnGO_timer <= 1 
// &&  g.rm_enter_spawn_go_tmr == 1 
// &&  global.pc.ogr 
&& !(g.exit_enter.side & $F) ) // Chimney exit
{
    // g.mod_PC_ENTER_FROM_CHIMNEY |= $80;
    
    g.cutscene        = 1;
    g.cutscene_part   = 1;
}


if(!g.cutscene)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var _X      = argument0;
var _Y      = argument1;

var _DEPTH  = g.TILE_DEPTH_MAX_BACK+1;



with(global.pc)
{
    xScale      =  1;
    set_xy(id, _X, y);
    
    // locked   = PC_LOCK_ALL ^ PC_LOCK_VSPD; // Let vspd update
    g.pc_lock   = PC_LOCK_ALL ^ PC_LOCK_VSPD; // Let vspd update
    
    
    
    
    switch(g.cutscene_part)
    {
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        case 1: {
        if (g.cutscene_timer) break;
        
        depth_def  = _DEPTH;
        
        if (state != state_NORMAL) break;
        
        
        ogr = OGR_OTHR;
        set_xy(id, _X, $0A<<3);
        
        
        g.cutscene_part++;
        
        
        break;  }
        
        
        
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        case 2: {
        
        depth_def  = _DEPTH;
        
        if (g.cutscene_timer) break;
        
        
        if (yt+hh < find_row_solid(TID_SOLID1, _X>>3, (_Y>>3)+4, 1)<<3)
        // if (ogr)
        {
            break;
        }
        
        
        PC_set_behavior(behavior_CROUCH); // crouch
        
        
        g.cutscene_timer  = $08;
        g.cutscene_part++;
        
        
        break;  }
        
        
        
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        case 3: {
        
        if (landing_timer>1) depth_def = _DEPTH;
        else                 depth_def = DEPTH_PC_MAIN;
        PC_set_behavior(behavior_CROUCH); // crouch
        
        if (g.cutscene_timer) break;
        
        
        g.cutscene_timer  = $08;
        g.cutscene_part++;
        
        
        break;  }
        
        
        
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        case 4: {
        
        if (0) {
            depth_def  = DEPTH_PC_MAIN;
            PC_set_behavior(behavior_CROUCH); // crouch
            if (g.cutscene_timer) break;
                g.cutscene_timer  = $08;
        }
        
        
        g.cutscene_part++;
        
        
        break;  }
        
        
        
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        case 5: {
        
        depth_def  = DEPTH_PC_MAIN;
        PC_set_behavior(behavior_IDLE);
        
        if (g.cutscene_timer) break;
        
        g.pc_lock       = 0;
        
        // g.mod_PC_ENTER_FROM_CHIMNEY &= ~$80;
        
        g.cutscene_part = 0;
        g.cutscene      = 0;
        
        
        instance_destroy(other);
        // sdm(""); sdm("case 5"); sdm("");
        
        
        break;  }
    } // switch
} // with (global.pc)








