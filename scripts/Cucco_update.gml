/// Cucco_update()


if (cs&CS_SW1)
{
    struck_counter++;
    
    
    if(!stun_timer)
    {
        vspd = g.pc.VSPD_DAMAGE; // $FE. Low velocity
        
        if ((cs&CS_RGT && x> g.pc.x) 
        ||  (cs&CS_LFT && x<=g.pc.x) )
        {    hspd = 0;  }
        else hspd = ($D * sign_(x>g.pc.x)) &$FF;
        
        stun_timer = g.pc.DamageFlash_DURATION;
    }
    
    
    facing_dir_timer = 0;
    
    timer       = PANIC_DUR;
    sub_state   = SUB_STATE_PANIC;
}



if (cs&CS_BTM)
{
    solid_clip_correction(false);
    vspd = 0;
}


if (facing_dir_timer)
{
    facing_dir_timer--;
    if(!facing_dir_timer)
    {
        facing_dir = sign_(irandom(1));
        facing_dir_timer = $30 + irandom($3F);
    }
}
//    counter = (counter+1)&$FF;
//if!(counter & $3F) facing_dir = sign_(irandom(1));




if (abilities&ABL_JUMP 
&& !(g.counter1&$7F) 
&& !irandom($3F) )
{   // JUMP
    vspd = $E8 | irandom(7);
    
    if(!hspd 
    &&  irandom(7) )
    {   hspd = (HSPD1*facing_dir) &$FF;  }
}

updateY();
vspd = (vspd+1)&$FF;

updateX();

GO_update_cs();


GOB_update_2();



switch(sub_state)
{
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_IDLE:{
    if (cs&CS_BTM)
    {
        hspd = 0;
        Cucco_update_1();
    }
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_WALK1:{
    if (cs&CS_BTM)
    {
        if (abilities&ABL_WALK)
        {    hspd = (HSPD1*facing_dir) &$FF;  }
        else hspd = 0;
        
        Cucco_update_1();
    }
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_HOP1:{
    Cucco_update_1();
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_PECK1:{
    if (cs&CS_BTM)
    {
        hspd = 0;
        Cucco_update_1();
    }
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_AGRO:{
    
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_PANIC:{
    if (cs&CS_BTM)
    {
        hspd = ($20*sign_(x>g.pc.x)) &$FF;
        Cucco_update_1();
        if (sub_state!=SUB_STATE_PANIC)
        {
            facing_dir_timer = 1;
        }
    }
    break;}
    
    
    
    
    
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_FURY:{
    
    break;}
    
    
    
    
    /*
    // -----------------------------------------------------------------
    // --------------------------------------------------------
    case SUB_STATE_IDLE:{
    
    break;}
    */
}




