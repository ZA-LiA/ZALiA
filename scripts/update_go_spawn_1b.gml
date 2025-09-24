/// update_go_spawn_1b(enter room spawning)


if (g.encounter_type&g.ENC_FARY)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _GO_COUNT = ds_grid_width(g.dg_spawn_prxm);
if(!_GO_COUNT) 
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// D625
if (available_update_idx_gob(MAX_GOB1)==UIDX_NULL)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// --------------------------------------------------------------------
var _ENTER_RM_SPAWN = argument0;


var  _i, _a, _val, _w,_w_, _h,_h_;
var _obj, _ver, _obj_name;
var _inst;
var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
var _spawn_dk;
var _respawn_type = 0;
var _defeated_count = 0;
var _defeated_DK = get_defeated_dk();

if (_ENTER_RM_SPAWN)
{
    var _SpawnArea_XL = viewXL()-g.SPAWN_DIST1_X;
    var _SpawnArea_xl = _SpawnArea_XL;
    
    var _SpawnArea_YT = viewYT()-g.SPAWN_DIST1_Y;
    var _SpawnArea_yt = _SpawnArea_YT;
    
    var _SpawnArea_W  = viewW()+(g.SPAWN_DIST1_X<<1);
    var _SpawnArea_w  = _SpawnArea_W;
    
    var _SpawnArea_H  = viewH()+(g.SPAWN_DIST1_Y<<1);
    var _SpawnArea_h  = _SpawnArea_H;
}
/*
if (argument_count>4 
&&  argument[4]==1 ) // respawn type 1: off screen (inifinite respawn)
{
    _RX -= g.SPAWN_DIST2_X;
    _RW += g.SPAWN_DIST2_X<<1;
    _RY -= g.SPAWN_DIST2_Y;
    _RH += g.SPAWN_DIST2_Y<<1;
}
*/



// --------------------------------------------------------------------
for(_i=0; _i<_GO_COUNT; _i++)
{
                                    _a=0;
    _spawn_dk = g.dg_spawn_prxm[#_i,_a++]; // 
    
    
    // 1: avail to spawn, 0: spawned/can't respawn, -1: can't spawn again
    if (val(g.dm_spawn[?_spawn_dk+STR_Spawn_Permission])!=1)
    {
        continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    }
    
    if (g.encounter_type)
    {
            _val  = (!!val(g.dm_spawn[?_spawn_dk+STR_Strong+STR_Encounter]));
        if (_val != (!!(g.encounter_type&g.ENC_STRG)))
        {
            continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
    }
    
    
        _obj            = g.dg_spawn_prxm[#_i,_a++]; // 
        _obj_name       = g.dg_spawn_prxm[#_i,_a++]; // 
        _ver            = g.dg_spawn_prxm[#_i,_a++]; // 
    //                                              //
        _spawn_xl       = g.dg_spawn_prxm[#_i,_a++]; // 
        _spawn_xc       = g.dg_spawn_prxm[#_i,_a++]; // 
        _spawn_yt       = g.dg_spawn_prxm[#_i,_a++]; // 
        _spawn_yc       = g.dg_spawn_prxm[#_i,_a++]; // 
    //                                              //
        _w              = g.dg_spawn_prxm[#_i,_a++]; // 
        _w_             = g.dg_spawn_prxm[#_i,_a++]; // 
        _h              = g.dg_spawn_prxm[#_i,_a++]; // 
        _h_             = g.dg_spawn_prxm[#_i,_a++]; // 
    //                                              //
        _respawn_type   = g.dg_spawn_prxm[#_i,_a++]; // 
    //                                              //
        _defeated_count = g.dg_spawn_prxm[#_i,_a];  // 
    if(!_defeated_count)  g.dg_spawn_prxm[#_i,_a] = val(f.dm_quests[?_defeated_DK+_spawn_dk]);
        _defeated_count = g.dg_spawn_prxm[#_i,_a++]; // 
    //                                              //
    //                                              //
    
    
    // --------------------------------------------------------------------
    // D658
    if(!_respawn_type 
    &&  _defeated_count )
    {   // Has been defeated and respawn type is NEVER
        continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    }
    
    
    // --------------------------------------------------------------------
    if (_ENTER_RM_SPAWN)
    {
            _SpawnArea_xl  = _SpawnArea_XL - _w_;
            _SpawnArea_yt  = _SpawnArea_YT - _h_;
            _SpawnArea_w   = _SpawnArea_W  + _w;
            _SpawnArea_h   = _SpawnArea_H  + _h;
        if (_respawn_type==1)
        {   // respawn type 1: off screen (inifinite respawn)
            // This is done to match the extra dist in qual_spawn_3a() to fill a short area that can sometimes be missed if inst spawns in just the right spot
            _SpawnArea_xl -= g.SPAWN_DIST2_X;
            _SpawnArea_yt -= g.SPAWN_DIST2_Y;
            _SpawnArea_w  += g.SPAWN_DIST2_X<<1;
            _SpawnArea_h  += g.SPAWN_DIST2_Y<<1;
        }
        /*
        if(g.rm_name=="_DthMt_14"){
        sdm("_spawn_xc      $"+hex_str(_spawn_xc)    +", _spawn_yc      $"+hex_str(_spawn_yc));
        sdm("_SpawnArea_XL $" +hex_str(_SpawnArea_xl)+", _SpawnArea_XR  $"+hex_str(_SpawnArea_xl+_SpawnArea_w));
        sdm("_SpawnArea_YT $" +hex_str(_SpawnArea_yt)+", _SpawnArea_YB  $"+hex_str(_SpawnArea_yt+_SpawnArea_h));
        sdm("_SpawnArea_W   $"+hex_str(_SpawnArea_w) +", _SpawnArea_H   $"+hex_str(_SpawnArea_h));
        sdm("point_in_rect: "+string(point_in_rect(_spawn_xc,_spawn_yc, _SpawnArea_xl,_SpawnArea_yt,_SpawnArea_w,_SpawnArea_h)));
        }
        */
        if(!pointInRect(_spawn_xc,_spawn_yc, _SpawnArea_xl,_SpawnArea_yt,_SpawnArea_w,_SpawnArea_h))
        //if(!point_in_rect(_spawn_xc,_spawn_yc, _SpawnArea_xl,_SpawnArea_yt,_SpawnArea_w,_SpawnArea_h))
        {
            continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
    }
    else
    {
        if(!qual_spawn_3a(_spawn_xl,_w_, _spawn_yt,_h_, _respawn_type))
        {
            continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
    }
    
    
    
    
    
    // --------------------------------------------------------------------
    // Spawn GO -----------------------------------------------
    _inst = GameObject_create(_spawn_xl,_spawn_yt, _obj,_ver, _spawn_dk);
    
    
    
    if (_inst!=noone)
    {
        if(!is_undefined(g.dm_spawn[?_spawn_dk+STR_Spawn_Permission]))
        {                g.dm_spawn[?_spawn_dk+STR_Spawn_Permission] = 0;  }
        
        
        
        
        if(!_ENTER_RM_SPAWN)
        {
            // Turned this off 2022/03/19. If cam is moving fast enough, not all will spawn.
            // This happens with cam vertical movement when falling fast enough.
            // Not sure if this will break anything. The 1 per frame may have just 
            // been due to NES limitations.
            
            // OG: spawn only 1 spawn per frame
            //exit; // OG. // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
}

// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------







