/// LockedDoor_update()


// D991: JSR DE40
GOB_update_2();


// D994
if (counter) // Opening
{
    counter++;
    if (counter>=$12)
    {
        if (avail_uidx_goc(MAX_GOC1)!=UIDX_NULL)
        {
            with(GOC1_create(xl, yt+$10-3, global.pc.xScale, ProjectileHostile))
            {
                state = state_EXPLODE;
                disintegrate_counter = $F0; // Disintegrate;
            }
        }
        
        
        
        g.pc_lock = 0;
        
        switch(respawn_type)
        {
            default:{
            if(!is_undefined(dk_spawn)) f.dm_openedLocks[?dk_spawn] = 1;
            break;}
            
            case 1:{ // respawns with room refresh
            if(!is_undefined(dk_spawn)) g.dm_spawn[?dk_spawn+STR_Spawn_Permission] = 1;
            break;}
        }
        
        
        state = 0;
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ------------------------------------------------------------------
// D9BA
global.pc.colliding_locked_door = $0; // 05E7

if (cs&CS_BD1)
{   // D9C3
    if(!pc_is_fairy()) pushback_pc_and_go(id);
    
    if (x<global.pc.x) global.pc.colliding_locked_door = $2;
    else               global.pc.colliding_locked_door = $1;
    
    facing_dir = dir_to_pc(id);
}
else if (isVal(ver,1,2))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
switch(ver)
{
    // =========================================================================
    // ------------------------------------------------------------
    case 1:{ // Need key -----------------------
    var _qual = false;
    
    if (f.items&ITM_SKEY)
    {
        _qual = true;
    }
    else if (f.key_count)
    {
        var _i, _key_id, _dungeon_num;
        var _DATAKEY = STR_Dungeon+hex_str(g.dungeon_num);
        
        var _COUNT = val(g.dm_spawn[?_DATAKEY+STR_Key+STR_Count]);
        for(_i=0; _i<_COUNT; _i++)
        {   // key_datakey example: "0203", "0601"
            _key_id = STR_KEY+hex_str(g.dungeon_num)+hex_str(_i+1);
            //sdm(_key_id+", dungeon num "+string(val(f.dm_keys[?_key_id+STR_Dungeon+STR_Num]))+", acquired "+string(val(f.dm_keys[?_key_id+STR_Acquired]))+", used "+string(val(f.dm_keys[?_key_id+STR_Used])));
            if (val(f.dm_keys[?_key_id+STR_Acquired]) 
            && !val(f.dm_keys[?_key_id+STR_Used]) )
            {   // Doesn't matter which room the key was obtained.
                    f.dm_keys[?_key_id+STR_Used] = true;
                f.key_count = get_key_count(g.dungeon_num);
                _qual = true;
                break;
            }
        }
    }
    
    if (_qual)
    {
        counter = 1; // Starts opening process
    }
    break;}
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------
    case 2:{ // Switch --------------------------
    var _C1  =  switch_side==($1|$2)            // $1: right, 2: left
            || (switch_side== $1 && x< global.pc.x) 
            || (switch_side== $2 && x>=global.pc.x);
    //
    if (_C1 
    &&  global.pc.cs&CS_BTM )
    {
        counter = 1; // Starts opening process
    }
    break;}
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------
    case 3:{ //  -------------------------
    if (counter==-1)
    {   counter = 1;  } // Starts opening process
    break;}
}








if(!counter) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (cs&CS_BD1)
{
    global.pc.hspd = 0;
    global.pc.vspd = 0;
    
    g.pc_lock = PC_LOCK_ALL; // Lock all
}


switch(respawn_type)
{
    default:{
    if(!is_undefined(dk_spawn)) f.dm_openedLocks[?dk_spawn] = 1;
    break;}
    
    case 1:{ // respawns with room refresh
    if(!is_undefined(dk_spawn)) g.dm_spawn[?dk_spawn+STR_Spawn_Permission] = 1;
    break;}
}


aud_play_sound(get_audio_theme_track(STR_Open+STR_LockedDoor));




