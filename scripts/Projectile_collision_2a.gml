/// Projectile_collision_2a()


if(!reflected)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if(!GO_can_collide_this_frame(update_idx))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if(!g.mod_REFLECT_more_obj 
&& !is_ancestor(object_index, SoundWave) )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var _collided = false;
var _OBJVER = object_get_name(object_index)+hex_str(ver);
update_body_hb_1a();

for(var _i=ds_list_size(g.go_mgr.dl_gob1)-1; _i>=0; _i--)
{
    if(!(g.go_mgr.dl_gob1[|_i]+1) 
    ||   g.go_mgr.dl_gob1[|_i].state != g.go_mgr.dl_gob1[|_i].state_NORMAL )
    {
        continue;
    }
    /*
    if(!instance_exists(g.go_mgr.dl_gob1[|_i]) 
    ||                  g.go_mgr.dl_gob1[|_i].state != g.go_mgr.dl_gob1[|_i].ST_NORM )
    {
        continue;
    }
    */
    
    
    with(g.go_mgr.dl_gob1[|_i])
    {
        if (ShieldHB_idx)
        {
            GOB_update_shield_offsets();
            update_shield_hb();
                 if(!ShieldHB_r &&  other.BodyHB_r) _collided=rectInCirc(other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_r, ShieldHB_x,ShieldHB_y,ShieldHB_w,ShieldHB_h);
            else if( ShieldHB_r && !other.BodyHB_r) _collided=rectInCirc(ShieldHB_x,ShieldHB_y,ShieldHB_r, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_w,other.BodyHB_h);
            else if( ShieldHB_r &&  other.BodyHB_r) _collided=circInCirc(ShieldHB_x,ShieldHB_y,ShieldHB_r, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_r);
            else                                    _collided=rectInRect(ShieldHB_x,ShieldHB_y,ShieldHB_w,ShieldHB_h, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_w,other.BodyHB_h);
        }
        
        
        if(!_collided)
        {
            update_body_hb_1a();
                 if(!BodyHB_r &&  other.BodyHB_r) var _C1=rectInCirc(other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_r, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h);
            else if( BodyHB_r && !other.BodyHB_r) var _C1=rectInCirc(BodyHB_xl,BodyHB_yt,BodyHB_r, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_w,other.BodyHB_h);
            else if( BodyHB_r &&  other.BodyHB_r) var _C1=circInCirc(BodyHB_xl,BodyHB_yt,BodyHB_r, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_r);
            else                                  var _C1=rectInRect(BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_w,other.BodyHB_h);
            if (_C1 
            &&  ds_list_find_index(dl_ProjVuln,_OBJVER)+1 ) // if this gob inst is vulnerable to the REFLECTed projectile
            {
                _collided = true;
                damage_gob(id, get_pc_attack_damage(), true); // damage enemy
            }
        }
    }
    
    
    if (_collided)
    {
        if ((react_shield>>$10)&$FF == 2) 
        {   // Axe, Bolo, Mace. 
            aud_play_sound(get_audio_theme_track(dk_StrikeSolid));
        }
        else
        {
            aud_play_sound(get_audio_theme_track(dk_HitShield));
        }
        
        set_xy(id, x, y-2);
        disintegrate_counter = $F2;
        state      = state_EXPLODE;
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




