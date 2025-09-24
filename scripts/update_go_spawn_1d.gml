/// update_go_spawn_1d(object_index, version, inst spawn datakey)


var _OBJ      = argument0;
var _VER      = argument1;
var _SPAWN_DK = argument2;

var _datakey  = get_defeated_dk()+_SPAWN_DK;
var _DEFEATED_COUNT = val(f.dm_quests[?_datakey]); // num of times defeated boss in this rm

// respawn_type: Value representing if and when GO can respawn.
// 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
_datakey = object_get_name(_OBJ)+hex_str(_VER)+STR_Respawn;
var _RESPAWN_TYPE = val(g.dm_go_prop[?_datakey]);

if(!_RESPAWN_TYPE 
&&  _DEFEATED_COUNT )
{
    return true; // Has been defeated and never respawns
}

    return false;
//




