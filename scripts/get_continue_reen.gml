/// get_continue_reen()

// reen: Room-Entry Exit-Name


with(g)
{
    if (mod_ContinueFrom) // if can start at dungeon entrance or town last saved
    {
        if (mod_ContinueFrom & mod_ContinueFrom_DNGN 
        &&  coming_from != coming_from_FILE )
        {
            var _DATAKEY = val(dm_room_history[?STR_Last+STR_Rm+"A"+STR_Datakey], STR_undefined);
            var _RM_NAME = val(dm_room_history[?_DATAKEY+STR_RmName], RM_NAME_NPALACE);
            var _dungeon_num = get_dungeon_num(_RM_NAME); // Last rm player was in
            if (_dungeon_num)
            {
                //var _dungeon_name = g.dm_dungeon[?STR_Dungeon+hex_str(_dungeon_num)+STR_Name];
                //if(!is_undefined(_dungeon_name)) _dungeon_num = val(g.dm_dungeon[?STR_Dungeon+STR_Num+_dungeon_name], _dungeon_num);
                
                var    _exit_name = val(dm_rm[?get_dk_dungeon_entrance(_dungeon_num)], REEN_DEFAULT);
                       _exit_name = val(f.dm_rando[?_RM_NAME+STR_Dungeon+STR_Entrance], _exit_name);
                return _exit_name;
            }
        }
        
        if (mod_ContinueFrom & (mod_ContinueFrom_TWN1|mod_ContinueFrom_TWN2))
        {
            return val(dm_town[?STR_Continue+STR_Exit+STR_Town+STR_Num+hex_str(f.cont_run_town_num)], REEN_DEFAULT);
        }
    }
}


return REEN_DEFAULT;




