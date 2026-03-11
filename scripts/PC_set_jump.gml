/// PC_set_jump(is landing frame)


if(!Input.Jump_pressed 
|| !jump_tokens 
||  g.pc_lock&PC_LOCK_VSPD 
||  g.pc_lock&PC_LOCK_JUMP )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// -----------------------------------------------------------------------
// 950D
var                           _case = 0; // 0: JUMP REGULAR
if (g.spells_active&SPL_JUMP) _case = 2; // 2: JUMP SPELL

if(!(cs&$4) && ogr==OGR_JUMP) _case = 0; // Can't use JUMP spell height until land on ground again.


var _CARRY = argument0; // if landing_timer was set this frame 
// ****** A couple notes about the following line ******
// This line makes you jump higher if hspd is high enough.
// 1: It favors moving right in OG, especially if the CARRY set.
// 2: I haven't checked, but it may be possible the CARRY is set
// in update_pc_1a() between 9379 and here. There are many 
// branches & scenarios to check.
if (g.mod_PCJumpDirBalancing)
{    if (abs8b(hspd)+_CARRY                 >= HSPD_JUMP_HIGH)    _case++;  } // 1,3 RUNNING
else if (byte( hspd +_CARRY+HSPD_JUMP_HIGH) >= HSPD_JUMP_HIGH<<1) _case++;    // 1,3 RUNNING. OG (Not even. Moving left, hspd must be at least 1 more $F2(-$14: 242))


switch(_case)
{
    case 0:{ // 0: JUMP REGULAR --------------------
    vspd      = VSPD_JUMP1;    // $FC. Regular velocity
    vspd_grav = GRAVITY_JUMP1; // $F0. Regular gravity
    break;}
    
    case 1:{ // 1: JUMP REGULAR RUNNING ------------
    vspd      = VSPD_JUMP1;        // $FC. Regular velocity
    vspd_grav = GRAVITY_JUMP1_RUN; // $80. Less gravity 
    break;}
    
    case 2:{ // 2: JUMP SPELL ----------------------
    vspd      = VSPD_JUMP2;    // $FB. More velocity
    vspd_grav = GRAVITY_JUMP2; // $80. Regular gravity 
    break;}
    
    case 3:{ // 3: JUMP SPELL RUNNING --------------
    vspd      = VSPD_JUMP2;        // $FB. More velocity
    vspd_grav = GRAVITY_JUMP2_RUN; // $00. No gravity
    break;}
}




if(!is_undefined(   cs_btm_inst) 
&&  instance_exists(cs_btm_inst) 
&&                  cs_btm_inst.solid_type 
&&                  cs_btm_inst.hspd )
{   // Maintain momentum when on something moving
    var _hspd  = cs_btm_inst.hspd;
        _hspd  = max(abs8b(_hspd)-4, min(_hspd,4));
        _hspd  = (_hspd*byte_dir(cs_btm_inst.hspd)) &$FF;
        
         hspd += _hspd;
         hspd &= $FF;
         hspd  = byte_to_int(hspd);
         hspd  = clamp(hspd, -hspd_max,hspd_max);
         hspd &= $FF;
         hspd_dir = byte_dir(hspd);
}






// 9505
attack_phase   = 0;
landing_timer  = 0;
Cucco_counter2 = $11; // set at $11 to make first flap of slowfall and jump quick


if(!ogr)
{
    if (Input.Attack_held) StabFrenzy_charge_counter = $80; // Must release 'B' first to start charging again
    else                   StabFrenzy_charge_counter =   0;
}



jump_tokens--;

ogr = OGR_JUMP;




