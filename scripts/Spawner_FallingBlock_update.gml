/// Spawner_FallingBlock_update()


// AB98
// ver 1(OG) w is $10 at 6th(out of 10) clm of block grid
if(!is_active 
|| !ocsH1(id)      // if NO w in ocs area
||  g.counter1&$F )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _SPAWNED_MAX = SPAWNED_MAX;
if (ver==1)
{   // MOD. Simulate OG spawn rate
    _SPAWNED_MAX = SPAWNED_MAX-instance_number(GameObjectB);
    _SPAWNED_MAX = max(4,_SPAWNED_MAX);
}
else
{
    _SPAWNED_MAX = SPAWNED_MAX-1; // 12/10/06: Trying to lessen falling rate
}


var             _count  = 0;
with(SPAWN_OBJ) _count += state!=0;
if (            _count >= _SPAWNED_MAX)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _i, _x,_y, _c1;
var _Y1 = ((viewYT()+$18)>>4)<<4;
var _Y2 =   viewYT()-$10; // MOD

for(_i=0; _i<_SPAWNED_MAX; _i++) // Number of chances to spawn a block this frame.
{
    if (ver==2 
    &&  irandom($F)<$6 )
    {
        continue; // Simulate OG.
    }
    
    
    if (ver==1)
    {
        // $F0-$60 = $90. Means 10 clms(0-9) of falling 
        // blocks starting at $100 + rand val
        // OG: All BlockSpawner spawn_x = $1B0
        // OG: _x = $100 + (g.ar_rand[1+_i] & $F0)
        //_x += (xx & $F00);
        //_y  = $1F; // OG
        _x  = g.dl_RandomOG[|1+_i] & $F0; // must be >= ($100-(CLMS<<4)). (OG: $60). $60-F0
        _x -= $100-(CLMS<<4); // OG: x -= ($100-$A0). (OG: $60)
        
        // if rand was out of range, do NOT spawn
        if (_x<0) continue;//_i
    }
    else
    {
        _x = irandom(CLMS-1)<<4;
    }
    
    if (_x>>3 < 0 
    ||  _x>>3 > global.dg_solid_w-1 )
    {
        continue;
    }
    
    _x += GRID_XL;
    
    
        _c1 = global.dg_solid[#_x>>3, _Y1>>3];
    if(!_c1)
    {   _c1 = global.dg_solid[#_x>>3,(_Y1>>3)+2] && collideRect(_x,_Y2,$10,$30, SPAWN_OBJ);  }
    
    if (_c1)
    {
        //break; //_i. OG
        continue;//_i.  MOD: bc OG would've spawned one just to immediatley de-spawn it.
    }
    
    _y = _Y2; // MOD
    with(GameObject_create(_x,_y-1, SPAWN_OBJ,1))
    {
        is_from_spawner = true;
        
        vspd    = $10;
        counter = 0;
    }
    
    
    break;//_i.  Spawn only 1 every x frames
}









/*
/// update_BlockSpawner()


// AB98
// var  _C1 = !ocs 
//       ||   (ver == 2 && inRange(g.camXL, GRID_X+$30, GRID_X+((CLMS-3)<<4)));
var  _C1  = !ocs;
     _C1 |= (ver == 2 && inRange(g.camXL, GRID_X+$20, GRID_X+((CLMS-2)<<4)));

if (!_C1 || g.timer0 & $F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




var          _count  = 0;
with (FaBlA) _count += (state != 0);
if (         _count >= SPAWNED_MAX)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _i, _x, _y;
                _count = ds_list_size(g.go_mgr.dl_gob);
for (_i = 0; _i < _count; _i++)
// for (_i = 0; _i < MAX_GOB; _i++)
{
    if (g.go_mgr.dl_gob[| _i].state) 
    {               continue;  } // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    
    // calculate xoff of GRID_X
    _x  = g.ar_rand[1 + _i] & $F0; // must be >= ($100 - (CLMS<<4)). (OG: $60). $60-F0
    _x -= ($100 - (CLMS<<4)); // OG: x -= ($100 - $A0). (OG: $60)
    // _x  = g.ar_rand[1 + _i] & $F0;
    
    // if rand was out of range, do NOT spawn
    if (_x < 0)     continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // if (!_o.state && _x >= $60)
    
    
    // ABB9
    // $F0 - $60 = $90. Means 10 clms(0-9) of falling 
    // blocks starting at $100 + rand val
    // OG: All BlockSpawner spawn_x = $1B0
    // OG: _x = $100 + (g.ar_rand[1 + _i] & $F0)
    // _x += (xx & $F00);
    // _y  = $1F; // OG
    
    _x += GRID_X;
    _y  = ((g.camYT-8) + $20) & $FF0;
    // _y--;
    
    
    if (g.dg_rt_solid[#_x>>3, _y>>3])
    {
             if (ver == 1) break;
        else if (ver == 2) continue;
    }
    // if (g.dg_rt_unique[#_x>>3, _y>>3] & $FF == TID_BREAK1)
    // {               continue;  } // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    with (GameObjectB_create(_x, _y-1, FaBlA, 1))
    {
        is_from_spawner = true;
        
        // hp        = $FF;
        vspd      = 0;
        counter   = 0;
        
        GOB_update_cs();
        
        if (cs4()) state = 0;
        // if (cs4()) despawn_gob(id);
    }
    
    
    
    break; // 
}
*/








/*
// AB98
if (!ocs 
&&  !(g.timer0 & $F) )
{
    var _i, _o, _x, _y;
    for (_i = 0; _i < MAX_GOB; _i++)
    {
        _o = g.go_mgr.dl_gob[| _i];
        // _x  = g.ar_rand[1 + _i] & $F0;
        
        // calculate xoff of CLM
        _x  = g.ar_rand[1 + _i] & $F0; // must be >= ($100 - (CLMS<<4)). (OG: $60). $60-F0
        _x -= ($100 - (CLMS<<4)); // OG: x -= ($100 - $A0)
        
        
        if (!_o.state && _x >= 0) // means rand qualified
        // if (!_o.state && _x >= $60)
        {
            // ABB9
            // $F0 - $60 = $90. Means 10 clms(0-9) of falling 
            // blocks starting at $100 + rand val
            // OG: All BlockSpawner spawn_x = $1B0
            // OG: _x = $100 + (g.ar_rand[1 + _i] & $F0)
            // _x += (xx & $F00);
            // _y  = $1F; // OG
            
            _x += CLM;
            _y  = ((g.camYT-8) + $20) & $FF0;
            _y--;
            
            with GameObjectB_create(_x, _y, FaBlA, 1)
            {
                is_from_spawner = true;
                
                spawnData_idx = -1;
                // spawnData_idx = $FF;
                hp            = $FF;
                vspd          = 0;
                counter       = 0;
                
                GOB_update_cs();
                
                if (cs4()) despawn_gob(id);
            }
            
            break;
        }
    }
}
*/






/* OG
// AB98
if (!ocs && !(g.timer0 & $F))
{
    var _i, _e, _x, _y;
    for (_i = 5; _i >= 0; _i--)
    {
        _e = g.eMgr.entities[_i];
        _x = g.og_rnd[1 + _i] & $F0;
        if (!_e.state && _x >= $60)
        {
            // ABB9
            _x += $100;
            _y  = $1F;
            _e  = GameObjectB_create(_x, _y, FaBlA, 1);
            
            _e.spawnData_idx = $FF;
            _e.hp            = $FF;
            _e.vspd          = 0;
            _e.counter       = 0;
            
            with _e GOB_update_cs();
            
            if (_e.cs & CS_BOT) despawn_gob(_e);
            
            break;
        }
    }
}
*/




