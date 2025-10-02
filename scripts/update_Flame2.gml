/// update_Flame2()

// Gooma, Atta, Fokkeru, Kakusu, 
// Barba.Attack3, 


if (Launch_timer)
{
    Launch_timer--;
    hspd = 0;
    vspd = 0;
    aud_play_fire(true);
    if(!Launch_timer)
    {
        hspd = HSPD1;
        vspd = VSPD1;
        vspd_adj = 1;
        aud_play_combo1($13); // Launch sound
    }
}
// 9BE1
else if (collisionProjCS(0,hh_))
{
    switch(ver)
    {
        // ---------------------------------
        case 1:{
        if (counter>=FADE_CUE) aud_play_fire(true); // mod. Reduce sound duration
        //aud_play_fire(true); // OG. No condition
        break;}//case 1
        
        // ---------------------------------
        case 2:{
        break;}//case 2
    }//switch(ver)
    
    
    
    var _Y=y;
    set_xy(id, x,(y>>3)<<3); // 11/08/23. This works like OG but only rounds to $08 instead of $10
    if (collisionProjCS(0,hh_-1))
    {
        if (_Y&$7  // if a clip correction happened
        //|| (!has_landed && vspd) )
        || !has_landed )
        {
            set_xy(id, x,y-8);
        }
    }
    /*
    if (_Y&$7  // if a clip correction happened
    &&  collisionProjCS(0,hh_-1) )
    {
        set_xy(id, x,y-8);
    }
    */
    //Proj_solid_clip_adj_2a(vspd && vspd<$80);
    
    // MOD. Bounce anytime vspd great enough when landing.
    if (vspd <  $80 
    &&  vspd >= BOUNCE_REQ )
    {
        // Bounce
        vspd = VSPD_BOUNCE; // $F0
        
        // MOD. Guarantee bounce. 
        // Certain grav values(like $F0) will cancel bounce.
        vspd_sub = $10; // grav = $10;
    }
    else
    {
        vspd = -vspd_adj &$FF; // counteract the upcoming adj
    }
    
    
    // 9BF2
    if(!has_landed)
    {
        has_landed = true;
        //brightness = 1;
        /*
        var _str  = " Flame2. ";
            _str += "hspd $"+hex_str(hspd)+", vspd $"+hex_str(vspd)+", ";
            _str += "yt $"+hex_str(yt)+", ";
            _str += "vspd_sub $"+hex_str(vspd_sub)+", ";
        sdm(_str);
        */
        
        if (ver==1) will_slide = !(rand()&$3);
        
        if (will_slide) facing_dir = sign_(xl<g.pc.xl-8);
        
        if (will_slide) hspd = ($10*facing_dir) &$FF;
        else            hspd = 0;
        
        
        if (will_slide) counter = $FF;
        else            counter = $30;
        
        // Bounce
        // vspd = $F0;
        
        // MOD. Guarantee bounce. 
        // Certain grav values(like $F0) will cancel bounce.
        // grav = $10;
    }
    else
    {   // 9C23
        if (counter)
        {
            if(!(counter&$7) 
            &&  hspd )
            {
                if (hspd<$80) hspd = (hspd-1)&$FF;
                else          hspd = (hspd+1)&$FF;
            }
            
            counter--;
            
            // 9C3D
            //vspd = $FF; // counteract the upcoming adj
        }
        else
        {   // 9C5B
            state = 0;
        }
    }
}



// 9C45
if (state)
{
    Projectile_update_3a(despawn_offscreen_hor); // Projectile_update_1a(pID != 7);
}




