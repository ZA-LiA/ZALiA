/// Boggnipp_update()


if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();

/*
if (cs4())
{
    if!(g.dg_RmTile_Liquid[#x>>3,(y+4)>>3]&$FF)
    {
        //sub_state = sub_state_ON_LAND;
        update_E726(hp, false); // can't survive on land
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else
    {
        solid_clip_adj(vspd && vspd<$80);
        if (vspd<$80) vspd = 0;
    }
}
*/

var _C1 = !wINwAll(xl-RM_PAD,ww+(RM_PAD<<1), 0,g.rm_w) && hspd_impel==sign_(x>g.rm_w_);
var _C2 = 0;
if(!_C1){
    _C2 = collide_solid_grid(csRgt1X,csRgt1Y)&TID_SOLID1 
       || collide_solid_grid(csRgt2X,csRgt2Y)&TID_SOLID1 
       || collide_solid_grid(csLft1X,csLft1Y)&TID_SOLID1 
       || collide_solid_grid(csLft2X,csLft2Y)&TID_SOLID1;
}
/*
if((!wINwAll(xl-RM_PAD,ww+(RM_PAD<<1), 0,g.rm_w) && hspd_impel==sign_(x>g.rm_w_)) 
|| collide_solid_grid(csRgt1X,csRgt1Y)&TID_SOLID1 
|| collide_solid_grid(csRgt2X,csRgt2Y)&TID_SOLID1 
|| collide_solid_grid(csLft1X,csLft1Y)&TID_SOLID1 
|| collide_solid_grid(csLft2X,csLft2Y)&TID_SOLID1 )
*/
if (_C1 || _C2)
{
    hspd_impel  = -hspd_impel;
    //hspd_impel  = sign_(x<g.rm_w_);
    hspd = (min(abs8b(hspd),HSPD_PACE)*hspd_impel) &$FF;
    //if (cs3()) hspd = (min(abs8b(hspd),HSPD_PACE)*hspd_impel) &$FF;
    counter     = 0;
}


var _YT_PREV = yt;

updateX();
updateY();



facing_dir = hspd_impel;




switch(sub_state)
{
    // ============================================
    // -------------------------------------
    case sub_state_IDLE:{
        counter++;
    if!(counter&$FF) hspd_impel = -hspd_impel;
    
    if (hspd != (HSPD_PACE*hspd_impel)&$FF)
    {
        hspd += sign_(byte_to_int(hspd) < HSPD_PACE*hspd_impel);
        hspd &= $FF;
        hspd_dir = sign_(hspd<$80);
    }
    
    
    var _DIST  = abs(x-global.pc.x);
    if (_DIST <= AGRO_DIST 
    &&  abs(y-global.pc.y) <= (global.pc.hh-hh_)+$10 )
    {
        counter     = 0;
        hspd_impel  = dir_to_pc_(id);
        sub_state   = sub_state_CHARGE;
    }
    break;}
    
    
    
    
    // ============================================
    // -------------------------------------
    case sub_state_CHARGE:{
    if (hspd != (HSPD_CHARGE*hspd_impel)&$FF)
    {
        hspd += sign_(byte_to_int(hspd) < HSPD_CHARGE*hspd_impel);
        hspd &= $FF;
        hspd_dir = sign_(hspd<$80);
    }
    
    var _DIST  = ATTACK_DIST;
    if ((instance_exists(PlatformRaft) && sign_(PlatformRaft.hspd<$80)==hspd_dir)
    ||  (global.pc.hspd                     && sign_(global.pc.hspd<$80)        ==hspd_dir) )
    {   _DIST  = ATTACK_DIST>>1;  }
    /*
    if (global.pc.hspd 
    &&  sign_(global.pc.hspd<$80)==hspd_dir )
    //{   _DIST  = ATTACK_DIST>>2;  }
    {   _DIST  = ATTACK_DIST>>1;  }
    */
    
    
    if (abs(x-global.pc.x) <= _DIST)
    {
        if (abs8b(hspd) >= HSPD_CHARGE>>1)
        {
            set_xlyt(id, xl,YT_IDLE-1);
            vspd        = VSPD_JUMP;
            sub_state   = sub_state_JUMP;
        }
        else
        {   // Get better speed before attacking
            //vspd        = 0;
            sub_state   = sub_state_RESET;
        }
    }
    break;}
    
    
    
    
    // ============================================
    // -------------------------------------
    case sub_state_JUMP:{
    /*
        //vspd = (vspd+1) &$FF;
    if (vspd 
    &&  vspd<$80 
    &&  g.dg_RmTile_Liquid[#x>>3,(yb-4)>>3] )
    {
        sub_state  = sub_state_RESET;
    }
    */
    if (yt != YT_IDLE)
    {
        if (sign_(YT_IDLE-_YT_PREV) != sign_(YT_IDLE-yt))
        {
            set_xlyt(id, xl,YT_IDLE);
            vspd  = 0;
            sub_state  = sub_state_RESET;
        }
        else
        {
            vspd += sign_(yt<YT_IDLE);
            vspd &= $FF;
        }
    }
    break;}
    
    
    
    
    // ============================================
    // -------------------------------------
    case sub_state_RESET:{ // need to get far enough away before charging again
    if (hspd != (HSPD_CHARGE*hspd_impel)&$FF)
    {
        hspd += sign_(byte_to_int(hspd) < HSPD_CHARGE*hspd_impel);
        hspd &= $FF;
        hspd_dir = sign_(hspd<$80);
    }
    
    if (abs(x-global.pc.x) >= RESET_DIST)
    {
        hspd_impel  = dir_to_pc_(id);
        sub_state   = sub_state_CHARGE;
    }
    break;}
}


// So that the platforms don't change momentum
if(!is_undefined(   cs_btm_inst) 
&&  instance_exists(cs_btm_inst) 
&&      is_ancestor(cs_btm_inst.object_index,Platform) )
{                   cs_btm_inst=noone;  }




