/// Fenser_update()


// BCEF: JSR EF11
can_draw_self = true;
update_EF11();


// BCF2
GOB_body_collide_pc_body_1a();
if (cs&CS_BD1) enemy_collide_pc_body();


// BCF8: JSR DEB8
updateX();

GO_update_cs();



// BCFB
//  In OG, if counter makes it back to 0, head will fall back to 
//  the ground and bounce. However, because Rise_done is NOT 0, 
//  the head will not raise up to < Rise_YT. Instead, 
//  it will perform it's vertical wave motion near the ground.
if (counter < Bounce_MAX) // Bounce counter. Knocked off Helmethead, falling
{
    if (cs&$3)
    {
        hspd_dir = -sign_(cs&$1); // go opposite dir of collision side
        hspd     = (abs8b(hspd)*hspd_dir) &$FF;
        var          _AMT = 0;
        if (cs&$1)   _AMT = -(csRgt1X&$7)     - 1; // colliding on the RIGHT
        else         _AMT = -(csLft1X&$7) + 8 + 1; // colliding on the LEFT
        set_xy(id, x+_AMT, y);
        
        aud_play_sound(get_audio_theme_track(dk_HitShield));
    }
    
    
    // Head image is 8x16. 4th pixel from the btm is the btm of the head.
    var _Y_MAX = viewYB()+8;
    
    if (cs&$4 
    ||  y>=_Y_MAX )
    {
        timer = $30;
        hspd  = (hspd>>1) | (hspd&$80);
        
        
        if(!counter)
        {       Bounce_vspd = Bounce_VSPD;  }
        vspd =(-Bounce_vspd)&$FF; // $E0 -> $E8 -> $F0
                Bounce_vspd -= 8; // $20 -> $18 -> $10
        //Bounce_vspd = Bounce_vspd>>1; // OG. $20 -> $10 -> $08
        
        //if(!cs4()) vspd = (vspd>>1) | (vspd&$80); // softer bounce if below screen
        if!(cs&$4) vspd = 0;
        
        
        counter = (counter+1) &$FF;
        
        
        if (cs&$4)
        {
            aud_play_sound(get_audio_theme_track(dk_HitShield));
            set_xy(id, x, ((csBtm1Y>>3)<<3) - (csBtm1Y-y));
        }
        else// y>=_Y_MAX
        {   // For using obj in scenario other than Helmethead fight 
            // where it may fall into a pit.
            if (Rise_done) // not 1st fall
            {
                if ( g.pc.yt > Rise_YT)
                {    Rise_yt = g.pc.yt;  } // not 1st rise, wave height close to PC
                else Rise_yt = Rise_YT;
            }
            
            if(!is_from_HelmetHead) Rise_yt = Rise_YT;
            
            
            Rise_done=false;
            set_xy(id, x,_Y_MAX);
        }
        
        
        if(!(cs&$4) 
        ||  Bounce_vspd <= 8 )
        {
            counter = Bounce_MAX + !(Bounce_MAX&$1); // set counter odd, if even
        }
    }
    
    // BD21: JMP DEBE: JSR DEC8
    updateY();
    vspd = (vspd+2)&$FF;
}
else // BD24. All bounces complete
{
    if(!Rise_done 
    &&  yt >= Rise_yt ) // Raising off ground
    {   // BD2D
        hspd = 0;
        vspd = 0;
        if(!timer) set_xy(id, x,y-2);
    }
    else
    {   // BD3E. undulating
        Rise_done=true;
        updateY();
        
        var             _DIR =  1; // making wave up to down /\    Downward force
        if (counter&$1) _DIR = -1; // making wave down to up   \/    Upward force
        
            vspd =  (vspd+_DIR) &$FF;
        if (vspd == ( $18*_DIR) &$FF) // reached end of wave
        {
            counter = (counter+1) &$FF;
            if (g.mod_FenserFix1 
            || !is_from_HelmetHead )
            {   // MOD. Will go back to correct height after falling again.
                if(!counter) Rise_done=false;
            }
        }
        
        if(!g.counter1)
        {
            facing_dir = dir_to_pc(id);
            hspd = ($06*facing_dir) &$FF;
        }
        
        // BD66
        control = (control+1) &$FF;
        
        if(!(control&$7F) 
        &&  facing_dir==dir_to_pc(id) 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {   // BD6F: JSR 9BE5: JSR DBCE
            var           _idx  = goDist1();
            if (_idx&$80) _idx ^= $FF;
                          _idx  = ((_idx-$14)&$FF)>>4;
            //
            if (_idx<8)
            {   // Create Bullet1, pID $10
                with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver, id, global.PI_MOB_BLU))
                {
                    //  $16 14 13 11 0F 0E 0D 0B
                    // "161413110F0E0D0B"; // 9BD5-9BDC
                    vspd = str_hex("161413110F0E0D0B", _idx);
                    
                    //  $06 0A 0D 0F 11 12 13 13
                    // "060A0D0F11121313"; // 9BCD-9BD4
                    hspd = str_hex("060A0D0F11121313", _idx);
                    if (!facing_dir) hspd ^= $FF;
                    
                    
                    var _y1 = g.view_yt_og-8; // OG 0y
                    var _y  = other.yt - _y1;
                        _y += 5;
                    //
                    var _x  = other.xl + 4 + (_y>$FF);
                        _x += sprite_index_xoff;
                    //
                        _y &= $FF;
                        _y  = _y1+_y;
                        _y += sprite_index_yoff;
                    set_xy(id, _x,_y);
                }
            }
        }
    }
}




if (hspd) hspd_dir = sign_(hspd<$80);
//else      hspd_dir = facing_dir;
if (vspd) vspd_dir = sign_(vspd<$80);




