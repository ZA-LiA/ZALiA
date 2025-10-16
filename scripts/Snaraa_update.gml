/// Snaraa_update()


BodyHB_idx = 0;


if (stun_timer)
{
    Snaraa_update_4(); // GO_update_cam_vars(), update_EF11(), GOB_update_2b()
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// --------------------------------------------------------------------------------------
switch(sub_state)
{
    // =======================================================================
    // ------------------------------------------------------------------
    case SUB_STATE_IDLE:{
    hspd = 0;
    
    if (timer 
    || !ocsHV4(id)      // if NOT all w AND NOT all h in ocs area
    || !ocsHV4(global.pc)    // if NOT all w AND NOT all h in ocs area
    || !is_facing_pc_(id) 
    ||  abs(x-global.pc.x)>agro_distance 
    || !inRange(y, global.pc.yt, global.pc.yt+global.pc.hh) )
    {
        break;
    }
    
    timer = AGRO_DUR;
    sub_state = SUB_STATE_AGRO;
    break;}
    
    
    
    // =======================================================================
    // ------------------------------------------------------------------
    case SUB_STATE_AGRO:{
    if (timer) break;
    
    hspd = (HSPD_MIN * bit_dir(path_dir&$3)) &$FF;
    // if (facing_dir) path_dir = $1; // 1: RGT
    // else           path_dir = $2; // 2: LFT
    
    timer = $10; // Delay mouth open full.
    sub_state = SUB_STATE_ATK1;
    break;}
    
    
    
    // =======================================================================
    // ------------------------------------------------------------------
    case SUB_STATE_ATK1:{
    BodyHB_idx = BodyHB_IDX;
    
    var _x = 0;
    var _DIR = bit_dir(path_dir&$3);
    
    hspd = clamp(abs8b(hspd)+1, HSPD_MIN,HSPD_MAX);
    hspd = (hspd*_DIR) &$FF;
    
    
    if (byte(global.dg_solid[#rc_b2&$FF, rc_b2>>8]) != TID_SOLID1)
    {   // Just in case target no longer solid.
        _x  = (rc_a&$FF)<<3;
        path_dist = Snaraa_update_1(_x>>3);
        _x += (path_dist*_DIR);
        rc_b  = (rc_b&$FF00) | (_x>>3);
        rc_b2 = rc_b + _DIR - !_DIR;
    }
    
    
    var _DIST = (path_dist>>2);
    _x  = ((rc_b&$FF)<<3) + (_DIST * -_DIR);
    
    if!((_x-x)*_DIR)
    {
        dist_remain_landing_start = abs(x - ((rc_b&$FF)<<3));
        hspd_landing_start = abs8b(hspd);
        
        sub_state = SUB_STATE_LNDG;
    }
    break;}
    
    
    
    // =======================================================================
    // ------------------------------------------------------------------
    case SUB_STATE_LNDG:{
    BodyHB_idx = BodyHB_IDX;
    
    var _DIR  = bit_dir(path_dir&$3);
    var _dist_remain = Snaraa_update_3();
    var _dist_target = ($04<<3) * (facing_dir==_DIR); // num or 0
    
    
    var _MIN  = 4;
    var _hspd = _MIN;
    if (_dist_remain)
    {
        _hspd = (hspd_landing_start-_MIN) * (_dist_remain / dist_remain_landing_start); // (dist remaining) / (dist remaining at landing start)
        _hspd = min(round(_MIN+_hspd), HSPD_MAX);
    }
         hspd = (_hspd*_DIR) &$FF;
    //
    
    if (_dist_remain <= _dist_target)
    {
        facing_dir = -_DIR;
        
        if(!_dist_target)
        {
            set_xy(id, (rc_b&$FF)<<3, y);
            
            vspd = 0;
            hspd = 0;
            hspd_landing_start = 0;
            dist_remain_landing_start = 0;
            
            
            path_dir  = path_dir^$3;
            path_dist = Snaraa_update_1(x>>3);
            Snaraa_update_2();
            
            _DIR = bit_dir(path_dir&$3);
            if (byte(global.dg_solid[#rc_a2&$FF, rc_a2>>8]) != TID_SOLID1)
            {
                timer = $40;
                sub_state = SUB_STATE_ATK1;
            }
            else
            {
                timer = SETTLE_DUR;
                sub_state = SUB_STATE_SETL;
            }
        }
    }
    break;}
    
    
    
    
    // =======================================================================
    // ------------------------------------------------------------------
    case SUB_STATE_SETL:{
    if (timer) break;
    
    timer = COOLDOWN_DUR;
    sub_state = SUB_STATE_IDLE;
    break;}
}



// ------------------------------------------------------------------
Snaraa_update_4(); // GO_update_cam_vars(), update_EF11(), GOB_update_2b()

if (sub_state!=SUB_STATE_IDLE 
&&  cs&CS_BD1 )
{
    enemy_collide_pc_body();
}

if (hspd) updateX();
if (vspd) updateY();




