/// GameObjectB_step()


if(!state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// D250,   D254
SwordHB_collidable = false;
pc_sword_collided_solid_body = false;
// F27D
GO_update_cam_vars();








switch(state)
{
    // ===========================================================================
    // -------------------------------------------------------------------
    case state_NORMAL:{
    if(!is_undefined(  scr_update))
    {   script_execute(scr_update);  }
    break;}//case state_NORMAL
    
    
    
    
    // ===========================================================================
    // -------------------------------------------------------------------
    case state_EXPLODE:{ // DCAE
    state_EXPLODE_step(id);
    break;}//case state_EXPLODE
    
    
    
    
    // ===========================================================================
    // -------------------------------------------------------------------
    case state_DROP:{
    if (is_ancestor(object_index,Target))
    {
        state = 0;
        break;
    }
    
    
    
    state_DROP_step(id);
    
    if (timer)
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    // Item drop or Boss key drop ------------------------
    var _IS_BOSS = is_ancestor(object_index,Boss);
    
    if (drop_item_obj 
    ||  _IS_BOSS )
    {   // DE23
        var _item = noone;
        
        if (_IS_BOSS)
        {
            if (g.mod_NoBossKeyDrop)
            {
                // Horizontal view lock for boss is released after arena doors are destroyed.
                if(!instance_exists(ArenaGate))
                {
                    g.view_lock &= ~g.view_lock_boss;
                    g.view_lock |=  g.view_lock_rm;
                    g.view_lock_boss = 0;
                    Audio.can_play_mus_rm_body = true;
                }
            }
            else
            {        _item = GameObject_create(xl,yt, ItmD0,1); // Key
                with(_item)
                {
                    vspd = $C;
                    set_xy(id, x,y+1);
                    IS_DROP = true;
                    aud_play_sound(get_audio_theme_track(dk_ItemDrop));
                }
            }
            
            
            if(!_item 
            &&  object_index==Carock01 
            &&  ver==2 
            &&  Item_OBJ )
            {   // PENDANT or whatever rando puts here
                     _item = GameObject_create(x-4,y-$10, Item_OBJ,Item_VER);
                with(_item)
                {
                    vspd     = 0;
                    dk_spawn = other.Item_SPAWN_DATAKEY;
                    ITEM_ID  = other.Item_ITEM_ID;
                    IS_DROP  = true;
                    aud_play_sound(get_audio_theme_track(dk_ItemDrop));
                }
            }
        }
        else // Non-boss Enemy
        {        _item = GameObject_create(xl,yt, drop_item_obj, drop_item_ver);
            with(_item)
            {
                vspd = 0;
                
                var _y = yb-1;
                if (global.dg_solid[#x>>3,_y>>3]&$FF == TID_SOLID1)
                {
                    _y = ((_y>>3)-1)<<3;
                    _y = get_ground_y(x,yb, -1, _y);
                    set_xy(id, x,_y-hh_);
                }
                
                IS_DROP = true;
                aud_play_sound(get_audio_theme_track(dk_ItemDrop));
            }
        }
    }
    
    
    
    
    
    
    // ---------------------------------------------------------
    // DD34, DD3D. 
    // respawn_type: Value representing if and when GO can respawn.
    // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
    if (respawn_type==1 
    ||  respawn_type==4 )
    {
        GOB_despawn(id);
    }
    
    if (is_ancestor(object_index,Enemy)) GOB_update_data_defeated(id);
    
    state = 0;
    break;}//case state_DROP
}//switch(state)




// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
if (g.mod_destroy_go_on_death 
&& !state )
{
    GO_destroy_1a();
}




