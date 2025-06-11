/// NPC_update_3(x,y)

// For Mido fairy, Bagu, Talo


if (is_talking)
{   // Right after this inst's dialogue window closes
    if (g.gui_state==g.gui_state_NONE 
    ||  g.menu_state==g.DIALOGUE_WINDOW.SUB_STATE_CLOS1 ) // prevents pc from jumping away before they can pick up item
    {
        if(!is_undefined(Item_SPAWN_DATAKEY))
        {
            with(GameObject_create(argument0,argument1, Item_OBJ,Item_VER, Item_SPAWN_DATAKEY))
            {
                if (IS_HOLD_ITEM)
                {
                    set_xy(id, xl,yt); // because argument0,1 are x,y, not xl,yt
                }
                else
                {
                    // So the NPC does not obstruct the item.
                    // If stabbing activates dialogue, the player will have to stab the item in mid air so dialogue does not activate.
                    GO_depth_init(other.depth-1);
                    /*
                    var _x,_y, _dist;
                    _dist  = max(other.BodyHB_w>>1, other.ww_); // outside of talk hb and sprite
                    //_dist  = other.ww_;
                    _dist += ww_;
                    _dist += 4; // padding
                    //_dist += 8; // padding
                    
                    _y  = other.yb;
                    _y -= hh_;
                    _y -= 8; // ground pad
                    
                    _x  = other.x;
                    _x += _dist * other.facingDir;
                    
                    if (collide_solid_grid(_x,_y))
                    {
                        _x  = other.x;
                        _x += _dist * -other.facingDir;
                        
                        if (collide_solid_grid(_x,_y))
                        {   // There's no room on either side of the NPC.
                            _x  = other.x;
                            //_x += ww_ * other.facingDir;
                            
                            other.state = 0; // because trying to stab the item would activate dialogue instead.
                            //GO_depth_init(other.depth-1);
                        }
                    }
                    
                    set_xy(id, _x,_y);
                    */
                }
                
                vspd    = 1;
                ITEM_ID = other.Item_ITEM_ID;
            }
            
            aud_play_sound(get_audio_theme_track(dk_ItemDrop));
            Item_SPAWN_DATAKEY = undefined; // so item wont spawn again if player talks to NPC again
            return true;
        }
    }
}


return false;




