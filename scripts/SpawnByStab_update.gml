/// SpawnByStab_update()


var _can_spawn_jar = false;



switch(behavior)
{
    // --------------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    case 0:{    // AF61
    if (ocs) break; // if any width is outside the view. #################################################
    
    
    
    if (g.mod_SpawnByStab_Block)
    {   // MOD: *******************************************
        // It makes more sense that only breaking the block 
        // would activate the spawn.
        
        BodyHB_can_draw = true;
        
        
        
        if (IS_BREAK_BLOCK) // Breakable block
        {
            if(!g.pc.SwordHB_collidable 
            || !(f.items&ITM_GLOV) 
            || !pointInRect(g.pc.SCS_x,g.pc.SCS_y, (xl>>3)<<3,(yt>>3)<<3,$10,$10) )
            {
                break; // #################################################
            }
        }
        else
        {
            GOB_body_collide_pc_sword();
            if!(cs&CS_SW1)
            {
                break; // #################################################
            }
        }
    
    }
    else
    {
        // ------------------------------------------------------------------------
        // AF65: JSR E677
        GOB_body_collide_pc_sword();
        BodyHB_can_draw = true;
        
        // MOD. *******************************************
        // It's possible to break the block w/out activating 
        // SpawnByStab bc scs is not inside swrd hb.
        var _colliding = cs&CS_SW1;
        
        if(!_colliding 
        &&  ver == 1    // Breakable block
        &&  g.pc.SwordHB_collidable )
        {
            _colliding = pointInRect(g.pc.SCS_x,g.pc.SCS_y, (xl>>3)<<3,(yt>>3)<<3,$10,$10);
        }
        
        if(!_colliding) break; // #################################################
    }
    
    
    
    
    // ------------------------------------------------------------------------
    stun_timer = 0;
    behavior = BVR_STBD;
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    break;}
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    case BVR_STBD:{ // STBD: STaBbed
    switch(ver)
    {
        // --------------------------------------------------
        // -------------------------------------------
        case $01:{ // Guarantee Jar
        _can_spawn_jar = true;
        break;} // #################################################
        
        
        // --------------------------------------------------
        // -------------------------------------------
        case $02:{ // Jar or Knight
        var   _MOD = g.mod_SpawnByStab_DungeonEntrance;
        if (( _MOD && irandom(99)>14)  // 
        ||  (!_MOD && rand()<$80) )
        {
            // JAR: MAGIC FULL
            _can_spawn_jar = true;
        }
        else
        {
            // IRONKNUCKLE OR FOKKA
            var _obj = IrKnA;
            var _ver = 2;       // IronKnuckle red
            
            if (g.area_name==Area_PalcG) 
            {
                _obj = FokkA;
                _ver = 1;       // Fokka Red
            }
            
            
                 spawned_inst = GameObject_create(xl+3,yt, _obj,_ver);
            with(spawned_inst)
            {
                HP_IDX      = $0D; // g.dl_HP_DEFAULT[|$0D] = $18
                hp          = g.dl_HP[|HP_IDX];
                //hp          = $18;
                counter   = $11;
                facing_dir = other.facing_dir;
                hspd      = other.hspd;
                stun_timer= 8;
                cs        = other.cs;
                
                
                // respawn_type: Value representing if and when GO can respawn.
                // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                RESPAWN_TYPE     = 0;
                respawn_type     = RESPAWN_TYPE;
                
                SpawnByStab_inst = other;
            }
        }
        break;} // #################################################
    }
    
    
    behavior = BVR_AFTR;
    break;}
    
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    case BVR_AFTR:{
    if(!g.mod_destroy_go_on_death)
    {
        if!(spawned_inst+1) // If nothing was spawned
        {
            state = 0;
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
        
        
        // Because the spawned_inst is, in a sense, still the 
        // SpawnByStab obj, specific checks need to be done to 
        // make sure the spawned_inst has been used/taken/completed/defeated.
        // It's possible the spawned_inst can be despawned without 
        // being used, like when falling into a pit, therefor it 
        // needs to be confirmed that it has been used.
        if (is_ancestor(spawned_inst.object_index, Item) 
        &&              spawned_inst.cs & CS_SW1 
        &&             !spawned_inst.state )
        {
            behavior = BVR_CFRM;
            break;
        }
        
        
        if (is_ancestor(spawned_inst.object_index, Enemy) 
        &&              spawned_inst.state == spawned_inst.state_EXPLODE )
        {
            behavior = BVR_CFRM;
            break;
        }
    }
    break;}
    
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    case BVR_CFRM:{
    if(!g.mod_destroy_go_on_death)
    {
        if (is_undefined(   spawned_inst) 
        || !instance_exists(spawned_inst) 
        ||                 !spawned_inst.state )
        {
            state = 0;
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    break;}
}













// -------------------------------------------------------------------------------
if (_can_spawn_jar)
{   // JAR: MAGIC FULL
         spawned_inst = GameObject_create(xl+3, yt, ItmE0,1); // Full Magic Jar
    with(spawned_inst)
    {
        hp        = 0;
        facing_dir = 1;
        hspd      = other.hspd;
        stun_timer= $18; // OG: 8
        cs        = other.cs;
        
        
        // respawn_type: Value representing if and when GO can respawn.
        // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
        RESPAWN_TYPE     = 0;
        respawn_type     = RESPAWN_TYPE;
        
        SpawnByStab_inst = other;
    }
}




