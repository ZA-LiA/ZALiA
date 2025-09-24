/// set_pc_spawn_xy()


if(!g.exit_enter) exit; // !!!!!!!!!!!!!!!!!!!!!!!


with(g.pc)
{
    //spawn_x = val(g.dm_rm[?g.exit_enter.exitName+STR_Spawn_x]) <<3;
    //spawn_y = val(g.dm_rm[?g.exit_enter.exitName+STR_Spawn_y]) <<3;
    ///*
    var                            _scene_name = g.rm_name;
    if (global.SceneRando_enabled) _scene_name = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name);
    
    var _EXIT_NAME = _scene_name+strR(f.reen,RmName_LEN+1);
    
    spawn_x = val(g.dm_rm[?_EXIT_NAME+STR_Spawn_x]) <<3;
    spawn_y = val(g.dm_rm[?_EXIT_NAME+STR_Spawn_y]) <<3;
    //*/
    
    if (g.mod_PC_CUCCO_1 
    &&  g.CuccoSpell2_Active 
    &&  g.CuccoSpell2_Option )
    {
        spawn_y += $10;
    }
    
    spawn_x = clamp(spawn_x, cam_xl_min()-$28,cam_xr_max()+$18);
    spawn_y = clamp(spawn_y, cam_yt_min()-$18,cam_yb_max()-$18);
    
    // set spawn_x based off last x of prev room
    if (g.exit_enter.exit_type&g.EXIT_BIT_VERT1)
    {
        spawn_x = (g.leave_rm_x>>4)<<4;
        spawn_x = clamp(spawn_x, g.exit_enter.xl, g.exit_enter.xr-min(ww,PC_W));
    }
    
    
    
    if (             g.exit_enter.side&$F 
    &&  is_exit_type(g.exit_enter.exit_type, g.EXIT_TYPE_ELEVATOR) )
    {
        with(Elevator)
        {
            if (ds_list_find_index(dl_exit,g.exit_enter)!=-1)
            {
                set_xlyt(id, spawn_x,spawn_y); // in case of Out Of Bounds reset
                other.spawn_x = x - PC_W_;
                other.spawn_y = yb - 8 - other.hh; // in case of Out Of Bounds reset
                
                Input.vHeld  = 0; // Don't know why or if this needs to be here..
                break;//with(Elevator)
            }
        }
    }
}




