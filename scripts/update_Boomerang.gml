/// update_Boomerang()


var _COLLIDED_SHIELD = byte_dir(hspd) != facing_dir;

if(!_COLLIDED_SHIELD) // if havn't bounced off shield
{   // 9667
    if (g.counter1&$1)
    {
        if(!audio_is_playing(get_audio_theme_track(dk_Boomerang)))
        {   aud_play_sound(  get_audio_theme_track(dk_Boomerang));  }
        
        if (vspd) vspd = (vspd + -byte_dir(vspd))&$FF;
    }
    
    // 9680.  counter=$20 at spawn
    if (counter<$80)
    {
        if(!counter) // In process of reversing dir
        {   // 9687
            if(!isHighAttack) vspd = byte(-4);
            else              vspd = byte( 4);
            
            hspd = (hspd + -facing_dir_spawn)&$FF;
            
            facing_dir = byte_dir(hspd);
            
            // 96A4
            if (hspd&$3F == $20) counter = $FF; // Finished reversing dir
        }
        else
        {   // 96B1
            counter--;
        }
    }
    
    // 96B4: JSR 96FF
}


// 96F9, 96FF: JSR DED4, 9702
if(!_COLLIDED_SHIELD) vspd = (vspd-vspd_adj)&$FF; // vspd_adj == 2;
Projectile_update_3a(despawn_offscreen_hor);


if(!_COLLIDED_SHIELD)  // if havn't bounced off shield
{   // 96B7.  counter=$20 at spawn
    if (isVal(counter,0,$FF)          // if has($FF) OR is(0) reversing dir
    && !is_undefined(   source_inst) 
    &&  instance_exists(source_inst) 
    &&  source_inst.state == source_inst.state_NORMAL )
    {
        update_body_hb_1a();
        
        // 96C7: Goriya catch boomerang
        can_draw_catch_hb = true;
        
        catchX = source_inst.xl + 2;
        catchY = source_inst.yt + 3;
        
        if (rectInRect(BodyHB_x,BodyHB_y,BodyHB_w,BodyHB_h, catchX,catchY,CATCH_W,CATCH_H))
        {
            state = 0;
        }
    }
}




