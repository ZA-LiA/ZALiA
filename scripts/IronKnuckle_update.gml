/// IronKnuckle_update()

// Object Resource Name: IrKnA

// v1 Orange $18
// v2 Red    $19
// v3 Blue   $1A
// v3 ReboB  $0A. Rebonack Knight


var _RAND = rand();
var _REBO = is_ancestor(object_index,ReboB);
var _VER3 = is_ver(id,IrKnA,3) || _REBO;



// 9C8C
update_EF11();



// ---------------------------------------------------------------------------------------
// BVR_IDLE = 0;
// BVR_DRWH = 1; // draw high
// BVR_ATKH = 2; // stab high
// BVR_DRWL = 3; // draw low
// BVR_ATKL = 4; // stab low
// BVR_THRW = 5; // throw. This only happens for Fokka & Moblin

// 9C99
if (behavior) // if attacking
{   // 9C9D
    if (behavior==BVR_ATKH 
    ||  behavior==BVR_ATKL )
    {
        if (abilities&ABL_SHOT 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {   // IronKnuckle Blue, RebonackB --------------------
            var _XL = xl;
            var _YT = yt + ($A * (behavior==BVR_ATKL));
            GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver);
            behavior = 0;
        }
        else
        {   // IronKnuckle Orange, Red, Blue if Proj slot unavail ----------------------
            // 9CC3: JSR E563: JSR E5F3
            if(!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
            {   //       E579: JSR E5F3
                GOB_sword_collision_1a(); // handles BODY   collision check & reaction
            }
        }
    }
    
    
    
    // 9CC6
    if(!timer)
    {
             if (behavior==BVR_DRWH) behavior = BVR_ATKH;
        else if (behavior==BVR_DRWL) behavior = BVR_ATKL;
        else                         behavior = 0;
        
        if (behavior) timer = DUR_ATK_STAB; // $10: 0.267s
    }
}







// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// PC projectile/sword to GOB shield ------------------------

// 9CE3: JSR E617. handles GOB shield collision
if (GOB_shield_collision_1a()) // if Link sword collided enemy shield
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ---------------------------------------------------------------------------------------
// PC sword did NOT collide GOB shield --------------------------------------

// 9CE6, 9CE9
GO_update_cs();
GO_update_cam_vars();

if (yt >= cam_yb_max()+$18)
{
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9CFA, 9D0C: JSR E48B (body collision)
if (ocsH3(id)  // ocsH3(): true if ALL width is w/in ocs area width
||  _REBO )    // RebonackB. He can go off screen & come back
{
    GOB_update_2a(); // PC proj+swrd+body collision, despawn check
}


if (pc_sword_collided_solid_body)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if(!is_cucco_aware 
&&  cs&CS_SW1 
&&  pc_is_cucco() )
{   // IronKnuckle took damage from cucco
    is_cucco_aware = true; // Is aware cucco is a threat. Will now treat cucco as human Link
}




// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

if (cs&CS_BD1) enemy_collide_pc_body();

// 9D18
updateY();

if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}


// 9D24
GOB_update_1(true); // update hspdPB

GO_update_cs();

if!(cs&$3) updateX();




// -----------------------------------------------------------------------
// 9D27
if (stun_timer==2) attack_tokens = $4 | (_RAND&$3); // result 4,5,6,7


// 9D38
// RebonackB. He can go off screen & come back
// !(ocs&$4): at least half w inside ocs area w
// var _C1 = !(ocs&$4) || object_index==ReboB;

var                             _MAX = 41; // OG
if (g.mod_IronKnuckle_AggroAI2) _MAX = 47;
var                             _MIN =  0; // OG
if (g.mod_IronKnuckle_AggroAI3) _MIN = -7;

switch(g.mod_IronKnuckle_AggroAI)
{   // -------------------------------------------------------------------
    case 0:{   // OG. 
    var                     _ATTACK_DIST = $1C;
    if (abilities&ABL_SHOT) _ATTACK_DIST = $60; // IronKnuckleBlue, RebonackB
    
    var _IN_DIST_Y      = inRange(yt-g.pc.yt, _MIN,_MAX);
    var _IN_DIST_ATTACK = byte(goDist1() + _ATTACK_DIST + !facing_dir) < byte(_ATTACK_DIST<<1);
    
    var _QUAL_ATTACK    = _IN_DIST_Y && _IN_DIST_ATTACK;
    
    var _QUAL_AGGRO     = _IN_DIST_Y;
    break;}
    
    
    // -------------------------------------------------------------------
    case 1:{   // MOD. Must face PC to aggro
    var                     _ATTACK_DIST = $1C;
    if (abilities&ABL_SHOT) _ATTACK_DIST = $60; // IronKnuckleBlue, RebonackB
    
    var _IN_DIST_Y      = inRange(yt-g.pc.yt, _MIN,_MAX);
    var _IN_DIST_ATTACK = abs(x-g.pc.x) <= _ATTACK_DIST;
    
    var _QUAL_ATTACK    = _IN_DIST_Y && _IN_DIST_ATTACK;
    
    //var _QUAL_AGGRO      = _IN_DIST_Y && ocsH2(id) && (is_aggro || is_facing_pc_(id));
    var _QUAL_AGGRO     = ocsH2(id) && (is_aggro || (_IN_DIST_Y && is_facing_pc_(id)));
    break;}
    
    
    // -------------------------------------------------------------------
    case 2:{   // MOD. Must face PC to aggro, if outside of og view area. Does not attack nor aggro cucco until provoked
    var _C1 = !pc_is_cucco() || is_cucco_aware;
    
    var                     _ATTACK_DIST = $1C;
    if (abilities&ABL_SHOT) _ATTACK_DIST = $60; // IronKnuckleBlue, RebonackB
    
    var _IN_DIST_X1      = wINw(x,1,g.view_xl_og,VIEW_W_OG);
    var _IN_DIST_Y       = inRange(yt-g.pc.yt, _MIN,_MAX);
    var _IN_DIST_ATTACK  = abs(x-g.pc.x) <= _ATTACK_DIST;
    var _IN_DIST_ATTACK_OG = byte(goDist1() + _ATTACK_DIST + !facing_dir) < byte(_ATTACK_DIST<<1);
    
    var _QUAL_ATTACK     = _IN_DIST_Y && _IN_DIST_ATTACK && (_C1 || _REBO);
    
    if (_REBO)
    {
        var _QUAL_AGGRO  = true;
    }
    else
    {
        var _QUAL_AGGRO  = _C1 && _IN_DIST_Y && ocsH2(id);
        if (_QUAL_AGGRO)
        {
            _QUAL_AGGRO &= is_facing_pc_(id) || _IN_DIST_X1;
        }
        /*
        var _QUAL_AGGRO = _IN_DIST_Y && ocsH2(id);
        if (_QUAL_AGGRO)
        {
            var _IN_OG_VIEW = wINw(x,1,g.view_x l_og,VIEW_W_OG);
            if (is_facing_pc_(id)) _QUAL_AGGRO &= _C1 || _IN_OG_VIEW;
            else                   _QUAL_AGGRO &= _C1 && _IN_OG_VIEW;
        }
        */
    }
    break;}
    
    
    // -------------------------------------------------------------------
    case 3:{   // MOD. Must face PC to aggro if outside of og view area, No special behavior towards cucco
    var                     _ATTACK_DIST = $1C;
    if (abilities&ABL_SHOT) _ATTACK_DIST = $60; // IronKnuckleBlue, RebonackB
    
    var _IN_DIST_X1        = wINw(x,1,g.view_xl_og,VIEW_W_OG);
    var _IN_DIST_Y         = inRange(yt-g.pc.yt, _MIN,_MAX);
    var _IN_DIST_ATTACK    = abs(x-g.pc.x) <= _ATTACK_DIST;
    var _IN_DIST_ATTACK_OG = byte(goDist1() + _ATTACK_DIST + !facing_dir) < byte(_ATTACK_DIST<<1);
    
    var _QUAL_ATTACK     = _IN_DIST_Y && _IN_DIST_ATTACK;
    
    if (_REBO)
    {
        var _QUAL_AGGRO  = true;
        //var _QUAL_AGGRO  = _IN_DIST_Y;
    }
    else
    {
        var _QUAL_AGGRO  = _IN_DIST_Y && ocsH2(id);
        if (_QUAL_AGGRO)
        {
            _QUAL_AGGRO &= is_facing_pc_(id) || _IN_DIST_X1;
        }
    }
    break;}
}



if(!_QUAL_ATTACK)
{
    delay_shield_chance = -1; // -1: 100% chance will match shield w/ PC level
    tmr_delay_shield    =  0;
}



is_aggro = _REBO;




if (_QUAL_AGGRO 
||  _QUAL_ATTACK )
{   // 9D52, 9D67. ----------- SET shld_hb_idx --------------------
    IronKnuckle_update_ShieldHB_idx();
    
    
    // 9D7B. ----------------------------------------------------------
    facing_dir = dir_to_pc(id);
    hspd = (HSPD_CHASE*facing_dir) &$FF;
    
    is_aggro = is_aggro || _QUAL_AGGRO;
    
    
    
    // 9D84 
    //if (_QUAL_ATTACK)
    if (_IN_DIST_ATTACK)
    {   // 9D91. ---------- SET hspd ------------------
             if (g.pc.hspd)      hspd = g.pc.hspd;
        else if (g.counter1&$40) hspd = ( HSPD_PACE)&$FF;
        else                     hspd = (-HSPD_PACE)&$FF;
        
        if (abilities&ABL_SHOT  // IronKnuckle-Blue, RebonackB
        || !g.pc.ogr )
        {
            hspd = (hspd>>1) | (hspd&$80);
        }
        
        
        
        // 9DB0. ----------- Check for and start attack -----------------
        if (behavior==BVR_IDLE    // 0: BVR_IDLE
        //&&  (_REBO || !(ocs&$4)) ) // ReboB can be w/in atk dist but off screen
        //&&  (_REBO || ocsH2(id)) ) // ReboB can be w/in atk dist but off screen
        && !(ocs&$4) )            // ReboB can be w/in atk dist but off screen
        {
            var _can_attack = false;
            
            switch(g.mod_IronKnuckle_AttackAI)
            {   // -------------------------------------------------------------------
                case 0:{   // OG
                if(!attack_tokens) counter = (counter+1)&$FF;
                
                if (attack_tokens 
                || !(counter&$3F) ) // atk every 64 frames. 1.067 sec
                {
                         if (attack_tokens) attack_tokens--;
                    else if!(_RAND&$F) counter = $20; // 1 in 16 chance (6.25%). Only $20 (instead of $40) until next atk
                    
                    _can_attack = true;
                }
                break;}
                
                
                // -------------------------------------------------------------------
                case 1:{   // MOD. Reduced attack frequency
                if(!attack_tokens 
                &&  AttackCooldown_timer )
                {   AttackCooldown_timer--;  }
                
                if (attack_tokens 
                || !AttackCooldown_timer ) // 
                {
                         if (attack_tokens) attack_tokens--;
                    else if!(_RAND&$F) AttackCooldown_timer = DUR_ATK_COOLDOWN2; // 1 in 16 chance (6.25%). Only $20 until next atk
                    else               AttackCooldown_timer = DUR_ATK_COOLDOWN1; // 
                    
                    _can_attack = true;
                }
                break;}
            }
            
            
            
            if (_can_attack)
            {   // 9DD2. ------------ START ATTACK ---------------
                if!(_RAND&$1)
                {
                    if (_RAND&$4)    behavior = BVR_DRWL; // 3: BVR_DRWL
                    else             behavior = BVR_DRWH; // 1: BVR_DRWH
                }
                else
                {
                    if (Input.dHeld) behavior = BVR_DRWL; // 3: BVR_DRWL
                    else             behavior = BVR_DRWH; // 1: BVR_DRWH
                }
                
                timer = DUR_ATK_DRAW; // $18
            }
        }
    }
}
else
{   // 9DEE
    if (counter&$1) hspd = 0;
    else            hspd = (HSPD_PACE*facing_dir) &$FF;
    
    
    if(!timer)
    {   // 9E0F
        timer = DUR_PACE; // $50
        if (counter&$1) facing_dir = -facing_dir;
        counter = (counter+1)&$FF;
    }
}








/* // Keeping this old code here for reference just in case
/// update_IronKnuckle()

// v1 Orange $18
// v2 Red    $19
// v3 Blue   $1A
// v3 ReboB  $0A


var _VER3 = (isAncestor(oi, IrKnA) && ver == 3) || isAncestor(oi, ReboB);



// 9C8C
update_EF11();



// ---------------------------------------------------------------------------------------
// BVR_IDLE = 0;
// BVR_DRWH = 1; // draw high
// BVR_ATKH = 2; // stab high
// BVR_DRWL = 3; // draw low
// BVR_ATKL = 4; // stab low
// BVR_THRW = 5; // throw. This only happens for Fokka & Moblin

// 9C99
if (behavior) // if attacking
{
    // 9C9D
    if (isVal(behavior, BVR_ATKH, BVR_ATKL)) // 2, 4
    {
        if (abilities & ABL_SHOT 
        &&  avail_uidx_goc(MAX_GOC) != UIDX_NULL )
        {
            // IronKnuckle Blue, RebonackB --------------------
            var _x = xx;
            var _y = yy + (10 * (behavior == BVR_ATKL));
            Projectile_create(_x, _y, facing_dir, projectile);
            behavior = 0;
        }
        else
        {
            // IronKnuckle Orange, Red, Blue if Proj slot unavail ----------------------
            // 9CC3: JSR E563: JSR E5F3
            if (!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
            {
                //       E579: JSR E5F3
                GOB_sword_collision_1a();  // handles BODY   collision check & reaction
            }
        }
    }
    
    
    
    // 9CC6
    if (!timer)
    {
             if (behavior == BVR_DRWH) behavior = BVR_ATKH;
        else if (behavior == BVR_DRWL) behavior = BVR_ATKL;
        else                           behavior = 0;
        
        if (behavior) timer = DUR_ATK_STAB; // $10: 0.267s
    }
}







// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// PC projectile/sword to GOB shield ------------------------

// 9CE3: JSR E617. handles GOB shield collision
if (GOB_shield_collision_1a()) // if Link sword collided enemy shield
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ---------------------------------------------------------------------------------------
// PC sword did NOT collide GOB shield --------------------------------------

// 9CE6, 9CE9
GOB_update_cs();
GO_update_cam_vars();

if (yy >= cam_yb_max() + $18)
// if ((yy - (g.camYT-8)) > $FF)
{
    despawn_gob(id);
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9CFA, 9D0C: JSR E48B (body collision)
if (ocsH3(id)           // ocsH3(): true if ALL width is w/in ocs area width
||  g.cam_lock & 3 )    // RebonackB boss eID $0A. He can go off screen & come back
{
    GOB_update_2a();    // PC proj+swrd+body collision, despawn check
}


if (pc_sword_collided_solid_body)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

if (cs & CS_BD1) enemy_collide_pc_body();

// 9D18
updateY3();
if (cs4()) vspd = 0;
if (cs4()) adjClipFloor();


// 9D24
GOB_update_1a(true); // update hspdPB

GOB_update_cs();

if (!cs3()) updateX();




// -----------------------------------------------------------------------
// 9D27
if (tmr_stun == 2) attack_tokens = 4 | (rand() & 3); // result 4,5,6,7


// 9D38
// RebonackB boss eID $0A. He can go off screen & come back
// !(ocs & 4): at least half w inside ocs area w
// var _C1 = !(ocs & 4) || oi == ReboB;


if (inRange(yy - g.pc.yy, 0, 41))
{
    // 9D52, 9D67. ----------- SET shieldState --------------------
    if (yy != g.pc.yy)
    {
        if (g.pc.yy + $A >= yy) shld_hb_idx = SHLD_HB_IDX_LOW; // 1
        else                    shld_hb_idx = SHLD_HB_IDX_HGH; // 2
    }
    else if (Input.pB && rand() & (3 >>_VER3))
    {
        if (Input.dHeld)        shld_hb_idx = SHLD_HB_IDX_LOW; // 1
        else                    shld_hb_idx = SHLD_HB_IDX_HGH; // 2
    }
    
    
    
    // 9D7B
    facing_dir = dir_to_pc(id);
    
    hspd = byte(HSPD_CHASE * facing_dir);
    
    
    
    
    // 9D84 
    var                       _ATTACK_DIST = $1C;
    if (abilities & ABL_SHOT) _ATTACK_DIST = $60; // IronKnuckleBlue, RebonackB
    if (byte(goDist1() + _ATTACK_DIST + !facing_dir) < byte(_ATTACK_DIST <<1))
    {
        
        // 9D91. ---------- SET hspd ------------------
             if (g.pc.hspd)      hspd = g.pc.hspd;
        else if (g.timer0 & $40) hspd = byte( HSPD_PACE);
        else                     hspd = byte(-HSPD_PACE);
        
        if (abilities & ABL_SHOT || !g.pc.ogr) // IronKnuckleBlue, RebonackB
        {
            hspd = (hspd >>1) | (hspd & $80);
        }
        
        
        
        
        // 9DB0. ----------- Check for and start attack -----------------
        if (behavior == BVR_IDLE    // 0: BVR_IDLE
        &&  !(ocs & 4) )            // ReboB can be w/in atk dist but off screen
        {
            if (!attack_tokens)     counter = byte(counter+1);
            
            
            if ( attack_tokens || !(counter & $3F)) // atk every 64 frames. 1.067 sec
            {
                     if (attack_tokens)   attack_tokens--;
                else if !(rand() & $F) counter = $20; // 1 in 16 chance (6.25%). Only $20 (instead of $40) until next atk
                
                
                // 9DD2. ------------ START ATTACK ---------------
                if !(rand() & 1)
                {
                    if (rand() & 4)     behavior = BVR_DRWL; // 3: BVR_DRWL
                    else                behavior = BVR_DRWH; // 1: BVR_DRWH
                }
                else
                {
                    if (Input.dHeld)    behavior = BVR_DRWL; // 3: BVR_DRWL
                    else                behavior = BVR_DRWH; // 1: BVR_DRWH
                }
                
                timer = DUR_ATK_DRAW; // $18
            }
        }
    }
}
else
{
    // 9DEE
    if (counter & 1) hspd = 0;
    else             hspd = byte(HSPD_PACE * facing_dir);
    
    
    if (!timer)
    {
        // 9E0F
        timer = DUR_PACE; // $50
        
        if (counter & 1) facing_dir = -facing_dir;
        
        counter = byte(counter+1);
    }
}
*/




