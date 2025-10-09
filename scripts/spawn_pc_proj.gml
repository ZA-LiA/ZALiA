/// spawn_pc_proj(GO_Mgr ar_god index)


if(!(argument0+1) 
||   argument0>=ds_list_size(g.go_mgr.dl_goc2) )
{
    return noone;
}


var                 _projectile = g.go_mgr.dl_goc2[|argument0];
if (is_undefined(   _projectile)  
|| !instance_exists(_projectile) )
{
    return noone;
}

with(_projectile)
{
    var _CUCCO_BEAM = 0;
    var _CUCCO_FIRE = 0;
    var _CUCCO = pc_is_cucco();
    if (_CUCCO)
    {
        _CUCCO_BEAM  = f.CuccoSkill_PROJ1 * g.CUCCO_CAN_BEAM;
        _CUCCO_BEAM &= f.Cucco_skills;
        
        _CUCCO_FIRE  = f.CuccoSkill_PROJ2 * g.CUCCO_CAN_FIRE;
        _CUCCO_FIRE &= f.Cucco_skills;
        
        if!(_CUCCO_BEAM|_CUCCO_FIRE)
        {
            return noone;
        }
    }
    
    var _FIRE  = g.spells_active&SPL_FIRE  &&  (!_CUCCO || _CUCCO_FIRE);
    
    if(!_FIRE && g.pc_lock&PC_LOCK_PRJ1) return noone;
    if (_FIRE && g.pc_lock&PC_LOCK_PRJ2) return noone;
    
    
    
    
    state = state_NORMAL;
    disintegrate_counter  = 0;
    
    
    if (_FIRE) type_bits = BIT_FIR1;
    else       type_bits = BIT_BEM1;
    
               TypeID    = TypeID_BEAM;
    if (_FIRE) TypeID    = TypeID_FIRE;
    
    
    switch(TypeID)
    {
        case TypeID_BEAM:{
        if (f.items&ITM_SWRD)
        {    timeout = timeout_BEAM2;  } // $C2
        else timeout = timeout_BEAM1;    // $D2
        break;}
        
        case TypeID_FIRE:{
        timeout = timeout_FIRE1; // $00
        break;}
        
        default:{
        timeout = 0;
        break;}
    }
    
    
    
    
    var                     _XOFF  = -3;
    
    var                     _YOFF  =  0;
    if (_FIRE){
        if (global.pc.stab_type) _YOFF  =  4; // Stab high
        else                _YOFF  = 13; // Stab low
        //if(!Input.dHeld)    _YOFF =  4; // Stab high
        //else                _YOFF = 13; // Stab low
        if (_CUCCO)         _YOFF  = 13 - 16 + 2;
    }else{
        if (global.pc.stab_type) _YOFF  =  0; // Stab high
        else                _YOFF  = 10; // Stab low
        if (_CUCCO)         _YOFF  = 10 - 16 + 2;
    }
    set_xlyt(id, global.pc.x+_XOFF, global.pc.yt+_YOFF);
    
    facing_dir = global.pc.xScale;
    xScale    = facing_dir;
    hspd      = ($20*facing_dir) &$FF;
    
    update_body_hb();
    update_draw_xy();
    
    
    if(!_FIRE) aud_play_sound(get_audio_theme_track(STR_Sword+STR_Beam));
    else       aud_play_fire(true); // 
    
    
    return id;
}


return noone;




