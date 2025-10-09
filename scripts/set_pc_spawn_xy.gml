/// set_pc_spawn_xy()


if(!g.exit_enter) exit; // !!!!!!!!!!!!!!!!!!!!!!!


with(global.pc)
{
    //spawn_xl = val(g.dm_rm[?g.exit_enter.exitName+STR_Spawn_x]) <<3;
    //spawn_yt = val(g.dm_rm[?g.exit_enter.exitName+STR_Spawn_y]) <<3;
    ///*
    var                            _scene_name = g.rm_name;
    if (global.SceneRando_enabled) _scene_name = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name);
    
    var _EXIT_NAME = _scene_name+strR(f.reen,RmName_LEN+1);
    
    spawn_xl = val(g.dm_rm[?_EXIT_NAME+STR_Spawn_x]) <<3;
    spawn_yt = val(g.dm_rm[?_EXIT_NAME+STR_Spawn_y]) <<3;
    //*/
    
    if (g.mod_PC_CUCCO_1 
    &&  g.CuccoSpell2_Active 
    &&  g.CuccoSpell2_Option )
    {
        spawn_yt += $10;
    }
    
    spawn_xl = clamp(spawn_xl, cam_xl_min()-$28,cam_xr_max()+$18);
    spawn_yt = clamp(spawn_yt, cam_yt_min()-$18,cam_yb_max()-$18);
    
    // set spawn_xl based off last x of prev room
    if (g.exit_enter.exit_type&g.EXIT_BIT_VERT1)
    {
        spawn_xl = (g.leave_rm_x>>4)<<4;
        spawn_xl = clamp(spawn_xl, g.exit_enter.xl, g.exit_enter.xr-min(ww,PC_W));
    }
    
    
    
    if (             g.exit_enter.side&$F 
    &&  is_exit_type(g.exit_enter.exit_type, g.EXIT_TYPE_ELEVATOR) )
    {
        with(Elevator)
        {
            if (ds_list_find_index(dl_exit,g.exit_enter)!=-1)
            {
                set_xlyt(id, spawn_xl,spawn_yt); // in case of Out Of Bounds reset
                other.spawn_xl = x - PC_W_;
                other.spawn_yt = yb - 8 - other.hh; // in case of Out Of Bounds reset
                
                Input.vHeld  = 0; // Don't know why or if this needs to be here..
                break;//with(Elevator)
            }
        }
    }
}




