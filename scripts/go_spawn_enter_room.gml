/// go_spawn_enter_room()

if (DEV)
{
    var _str  = "go_spawn_enter_room(),  ";
        _str += "gob spawn count: "+STR_PRXM+" $";
        _str += hex_str(val(g.dm_spawn[?get_spawn_datakey(g.rm_name,STR_PRXM,-1)]));
        _str += ", "+STR_PRIO+" $";
        _str += hex_str(val(g.dm_spawn[?get_spawn_datakey(g.rm_name,STR_PRIO,-1)]));
    show_debug_message(_str);
}



g.pc.state = g.pc.state_SPAWN;
//show_debug_message("g.pc.x: $"+hex_str(g.pc.x)+", g.pc.y: $"+hex_str(g.pc.y));

// ** this has been moved to g_Room_Start()
//NIAO_Room_Start();

go_spawn_priorities(); // PRIO only. Keys, Elevators, LockedDoors, etc...
update_go_spawn_1b(true); // PRXM(proximity) spawn only




// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
if (g.mod_SAFE_ENCOUNTER_ENEMIES 
&&  irandom(1) )
{
    var _ENC_TYPES = rm_get_encounter_types(g.rm_name);
    
    if(!_ENC_TYPES 
    ||  _ENC_TYPES&g.ENC_FARY )
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    with(GOB1)
    {
        if (state==state_NORMAL)
        {   // If there's an enemy spawned, this isn't a safe encounter rm.
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
        }
    }
    
    
    if(!is_safe_encounter_rm())
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
     
    
    
    // -------------------------------------------------------------------------------
    var _i, _x,_y;
    var _DIR   = sign_(g.pc.x<g.rm_w_);
    var _DIST1 =   abs(g.pc.x-g.rm_w_) + g.rm_w_;
    var _DIST2 = $3<<3;
    var          _COUNT = irandom(1)+1; // 1,2
    for(_i=0; _i<_COUNT; _i++)
    {
        _x  = max(irandom(_DIST1>>3), 8);
        _x  = g.pc.x + ((_x<<3)*_DIR);
        _x  = clamp(_x, _DIST2,g.rm_w-_DIST2);
        
        _y  = g.rm_rows-PAGE_ROWS; // first row of btm-most page
        _y += $10;
        _y  = _y<<3;
        _y  = get_ground_y(_x,_y, 1, _y);
        _y -= $10;
        with(GameObject_create(_x,_y, Bot_A,irandom(1)+1))
        {
            var _clm =  x    >>3;
            var _row = (yb-4)>>3;
            if ((g.dg_RmTile_solid[#_clm,_row]&$FF)==TID_SOLID1)
            {
                _y = _row<<3;
                _y = get_ground_y(x,_y, -1, _y);
                set_xy(id, x, _y-hh_);
            }
        }
    }
}




