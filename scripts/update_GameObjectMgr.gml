/// update_GameObjectMgr()

//db_visualize_spawn_vals_1a();


// D504: JSR D5A7
var _i, _idx;




// ---------------------------------------------------------------------------
if (counter+1==MAX_GOC1) counter = 0;
else                     counter++;







// ---------------------------------------------------------------------------
// GOB2. NPC, Item, RestoreFairy, LockedDoor, Elevator, CrystalHolder, Barrier, Pushable, ...
for(_i=ds_list_size(dl_gob2)-1; _i>=0; _i--)
{
    if (is_undefined(   dl_gob2[|_i]) 
    || !instance_exists(dl_gob2[|_i]) )
    {
        continue;//_i
    }
    
    with(dl_gob2[|_i])
    {
        update_idx = _i;
        
        if (timer) timer--;
        
        if(!is_undefined(  scr_step))
        {   script_execute(scr_step);  }
    }
}





// ---------------------------------------------------------------------------
// ---------------------- MAIN GAME OBJECT UPDATE -----------------------------------
// OG executes a 'take-turn' method of updating GOB and GOC.
// 1 GOB, then 1 GOC, then to the next index and repeat.



for(update_idx=0; update_idx<UPDATE_COUNT; update_idx++)
{
    // GOB1 (Enemy, Boss) ---------------------------------
    if (update_idx >= 0 
    &&  update_idx <  MAX_GOB1 )
    {   // D5A7, D5D4, D5E0, D603
        if(!is_undefined(   dl_gob1[|update_idx]) 
        &&  instance_exists(dl_gob1[|update_idx]) 
        &&                  dl_gob1[|update_idx].state )
        {
            with(dl_gob1[|update_idx])
            {
                update_idx = other.update_idx;
                
                if (timer) timer--;
                
                if(!is_undefined(  scr_step)) // scr_step: GameObjectB_step()
                {   script_execute(scr_step);  }
            }
        }
    }
    
    
    
    // GOC1 (Hostile Projectiles) ----------------------------
    if (update_idx >= 0 
    &&  update_idx <  MAX_GOC1 )
    {
        if(!is_undefined(   dl_goc1[|update_idx]) 
        &&  instance_exists(dl_goc1[|update_idx]) 
        &&                  dl_goc1[|update_idx].state )
        {   // D577
            with(dl_goc1[|update_idx])
            {
                update_idx = other.update_idx;
                
                if (timer) timer--;
                
                if(!is_undefined(  scr_step))
                {   script_execute(scr_step);  }
            }
        }
    }
}


update_go_spawn_1b(false);




// ---------------------------------------------------------------------------
with(Challenge)
{
    if(!is_undefined(  scr_step))
    {   script_execute(scr_step);  }
}








// ---------------------------------------------------------------------------
// ---------------------  CLEAN UP  ----------------------------------
if!(g.counter1&$3) // limit frequency of this for better performance?
{
    with(GOB1)
    {
        if(!state 
        ||  ds_list_find_index(other.dl_gob1,id)==-1 )
        //&&  ds_list_find_index(other.dl_gob1,id)==-1 )
        {
            instance_destroy();
        }
    }
    
    
    with(ProjectileHostile) // Hostile Projectiles (GOC1)
    {
        if(!state 
        ||  ds_list_find_index(other.dl_goc1,id)==-1 )
        //&&  ds_list_find_index(other.dl_goc1,id)==-1 )
        {
            instance_destroy();
        }
    }
    
    
    // GOB2 cleanup ----------------------------------
    
    // Truncate all dead beyond the furthest one in the 
    // list that's alive so any alive ones don't lose 
    // their current update index.
    for(_i=ds_list_size(dl_gob2)-1; _i>=0; _i--) // iterate backwards
    {
        if(!is_undefined(   dl_gob2[|_i]) 
        &&  instance_exists(dl_gob2[|_i]) 
        &&                  dl_gob2[|_i].state )
        {   // Only remove ones beyond the furthest alive one.
            break;//_i
        }
        
        ds_list_delete(dl_gob2,_i);
    }
    
    
    with(GOB2)
    {
        //if(!state 
        //||  ds_list_find_index(other.dl_gob2,id)==-1 )
        if (ds_list_find_index(other.dl_gob2,id)==-1)
        {
            instance_destroy();
        }
    }
}




