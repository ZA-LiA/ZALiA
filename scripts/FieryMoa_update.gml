/// FieryMoa_update()


// B909
if (counter&$3)
{   // Vertical sway
    if (g.counter1&$10) vspd = ( $04)&$FF; // $10: dur 0.267s
    else                vspd = (-$04)&$FF; // $10: dur 0.267s
    
    updateY();
    updateX();
    
    GOB_update_cs_2a(); // checks both left & right to prevent Flame spawning in solid wall
    
    GOB_update_2();
    if (cs&CS_BD1) enemy_collide_pc_body();
}




// ---------------------------------------------------------
// B929
switch(counter&$3)
{
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case 0:{ // B93C
    if (timer) break;
    
    // This enemy's behavior is to appear at the edge of the 
    // view PC is moving towards, move towards PC, turn around 
    // at PC and move back to the view edge it appeared, leaving 
    // flames in the PC's path.
    
    hspd           = ($20 * -sign_(global.pc.hspd_dir)) &$FF;
    set_hspd_dir();
    hspd_dir_reset = hspd_dir;
    facing_dir     = hspd_dir;
    
    
    var                 _X  = viewXR()-ww_;
    if (hspd_dir)       _X  = viewXL()+ww_;
    
    var                 _Y  = RESET_Y;
    //var                 _Y  = clamp(global.pc.y>>8, 0, g.rm_pages_y-1) + 1;
    //                    _Y  = (_Y<<8) - $6B;
    if (cam_yt_range()) _Y  = global.pc.yt - $2B;
    //var                _Y  = g.view_yt_og + $8D + 8;
    set_xy(id, _X,_Y);
    
    // Duration until turn around.
    if (global.pc.hspd) timer = $10; // $10: 0.267s
    else                timer = $50; // $50: 1.333s
    
    // Because these durations are based off the og view width, 
    // with wideview it'll take longer for Moa to 
    // make it to the PC. This will add a percentage of the 
    // timer equal to the difference in view widths.
    var _extra = 0;
        _extra = abs(1-(VIEW_W_OG/VIEW_W_WD));
        _extra = round(timer*_extra);
    //
    if (1){ // MOD.  Start outside of view instead of inside.
        if (hspd_dir) set_xy(id, viewXL()-ww_, y);
        else          set_xy(id, viewXR()+ww_, y);
        _extra += (abs(x-_X) div (abs8b(hspd)>>4));
    }
    
    /* sdm("");
    sdm("FieryMoa. timer $"+hex_str(timer)+" + extra time $"+hex_str(_extra)+" = $"+hex_str(timer+_extra)+", "
       +"hspd $"+hex_str(hspd)+", "
       +"xy $"+hex_str(x)+" $"+hex_str(y)+", "
       +"pc xy $"+hex_str(global.pc.x)+" $"+hex_str(global.pc.y)+", "
       +"view xl&xr $"+hex_str(viewXL())+" $"+hex_str(viewXR())+", ");
    sdm(""); */
    
    
    timer += _extra;
    counter = (counter+1)&$FF;
    break;}
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case 1:{ // B96D.  Moving towards PC
    if (timer) break;
    
    timer = $40; // $40: 1.067s
    counter = (counter+1)&$FF;
    break;}
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case 2:{ // B97C.  Turning around
    if (timer)
    {
        set_xy(id, x, y-1);
        hspd     = (hspd + -hspd_dir_reset) &$FF;
        hspd_dir = byte_dir(hspd);
    }
    else
    {   // B98E
        counter = (counter+1)&$FF;
    }
    break;}
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case 3:{ // B991.  Moving towards view edge
    // $00,10, $40,50, $80,90, $C0,D0
    //if !((g.timer0 & $2F) | cs) // OG. Prevent spawn proj in solid. 
    if(!(g.counter1&$2F) 
    && !(cs&$4)              // Prevent spawn proj in solid. This might work better
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver))
        {
            hspd = 0;
        }
    }
    
    
    
    if(!wINw(xl,ww, viewXL(),viewXR()))
    //if (ocs) // OG
    {
        timer = $BF; // $BF(191): 3.183s
        counter = (counter+1)&$FF;
    }
    break;}
}



/*
0000 0000 *
0001 0000 *
0010 0000
0011 0000

0100 0000 *
0101 0000 *
0110 0000
0111 0000

1000 0000 *
1001 0000 *
1010 0000
1011 0000

1100 0000 *
1101 0000 *
1110 0000
1111 0000
*/




