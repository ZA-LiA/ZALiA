/// TogglingPathDirectionA_update()


update_EF11();


switch (sub_state)
{
    // -------------------------------------------------------------
    case SUB_STATE_1:   {
    var i, _x, _y, _colliding;
    var _COUNT = ds_grid_width(dg_doors);
    
    for (i = 0; i < _COUNT; i++)
    {
        _x = dg_doors[# i,1];
        _y = dg_doors[# i,2];
        _colliding = pointInRect(global.pc.x,global.pc.cp1Y, _x-(DOOR_HB_W>>1),_y-2,DOOR_HB_W,4);
        
        if (!dg_doors[# i,0])
        {
            if (_colliding) continue;
            else dg_doors[# i,0] = 1;
        }
        
            if!(_colliding) continue;
        
        
        if (Input.Up_held                            // is holding up
        && !global.pc.ogr                            // is on ground
        && !(Input.held_0 & Input.U)            // Has released 'up' since spawning
        &&  _colliding )
        {
            if (1)
            {
                // assumes there are 4 doors
                _x = dg_doors[# (i+path_dir)&3, 1];
                _y = dg_doors[# (i+path_dir)&3, 2];
            }
            else
            {
                                        i += path_dir;
                     if (i <  0)        i = _COUNT-1;
                else if (i >= _COUNT)   i = 0;
            }
            
            set_xlyt(global.pc, _x-global.pc.ww_, _y-global.pc.hh);
            // setXY(global.pc, _x-(PC_W>>1), _y-PC_H);
            global.pc.hspd = 0;
            global.pc.vspd = 0;
            
            path_dir = -path_dir;
            g.dm_spawn[? dk_spawn+STR_Direction] = path_dir;
            
            
            for (i = 0; i < _COUNT; i++)
            {
                // Set all closed. Will set as open when 
                // confirmed PC is NOT colliding w/ door hb.
                dg_doors[# i, 0] = 0; // state. 0: closed, 1: open, 
            }
            
            
            sub_state = SUB_STATE_2;
            break; // for
        }
    }
    break;              }
    
    
    
    // -------------------------------------------------------------
    case SUB_STATE_2:   {
    sub_state = SUB_STATE_3;
    break;              }
    
    
    
    // -------------------------------------------------------------
    case SUB_STATE_3:   {
    sub_state = SUB_STATE_1;
    break;              }
}




