/// GOB_body_collide_pc_proj()

// The check and reaction to Link projectile colliding with enemy body


// A combination of stunTimer, collide_pc_proj() in GOB_body_collide_pc_proj(), 
// and collide_pc_sword() in GOB_body_collide_pc_sword() ensure 
// that CS_SW1 will be removed from cs and damage cannot occur more than 
// once from the same attack.


// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// E48B

// react_proj = 0: means NO INTERACTION
if(!react_proj)          exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// stun_timer will stop damage for occurring every frame while proj is still colliding.
if (stun_timer)          exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (state!=state_NORMAL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ---------------------------------------------------------------------------------------------
update_body_hb_1a();


var _p = collide_pc_proj(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r);
if(!_p)
{   // E6A6
    cs &= ~CS_PR1; // remove CS_PR1(PC Proj) from cs(Colliding Sides)
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// E6AE, E6CF
var _can_push_back = false;


// PC projectile bits. 0: none, 1: Beam, 2: FIRE, 4: 
// 0 means no reaction, projectile will just move right through.
// body is vulnerable:      $0000FF
// disintigrate on body:    $00FF00
// ?                        $FF0000

// BIT_BEM1: $01, BIT_FIR1: $02
var _BITS = _p.type_bits & (_p.BIT_BEM1 | _p.BIT_FIR1);



if (react_proj & _BITS) // $0000FF. Can take damage bits
// if ( !(react_swrd & $FF00)                          // body is NOT solid
// ||    (react_proj & (_p.type_bits & _p.BIT_FIR1)) ) // vuln to FIRE && _p is FIRE
{
    // E6F3
    
    // I'm not sure why PC's behavior would dictate anything regarding pushback on 
    // a projectile collision, but it's definitely in the OG code...
    // E6F3-E6F7 could set carry and then E70C goes to an RTS ending up at E4AB.
    // BVR_DWTH/DAMG/ITM1-4  all have a higher value thn  BVR_UPTH = 8
    
    // _can_push_back = !(cs&CS_PR1) || global.pc.behavior >= global.pc.BVR_UPTH;
    _can_push_back  = !(cs&(CS_PR1|CS_SW1)) || isVal(global.pc.behavior, global.pc.behavior_STAB_UP, global.pc.behavior_STAB_DOWN, global.pc.behavior_DAMAGE, global.pc.behavior_HOLD_ITEM1, global.pc.behavior_HOLD_ITEM2, global.pc.behavior_HOLD_ITEM3, global.pc.behavior_HOLD_ITEM4);
    
    
    // Proj can only collide when stunTimer is clear, CS_PR1 is clear, CS_SW1 is clear
    if!(cs & (CS_PR1|CS_SW1))
    {   // E70E
        cs |= CS_PR1;
        damage_gob(id, global.pc.dl_ATTACK_DAMAGE[|f.level_atk], true);
    }
}


if ((react_proj>>8) & _BITS) // $00FF00. Can disintegrate bits.
{   // E6E6
    _can_push_back = true;
    
    _p.hspd       = 0;
    _p.disintegrate_counter = $F2; // 008D,Y = $F2. Start disintegrate
    _p.state      = _p.state_EXPLODE;
}


if (_can_push_back)
{   // E4AB.  *carry would be set here in this scenario
    // pushback = $F4 when _p.facingDir = -1 (left)
    // pushback = $0C when _p.facingDir =  1 (right)
    set_go_hspd_pushbback(id, ($C*_p.facing_dir)&$FF);
}





// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------















/*
/// GOB_body_collide_pc_proj()
// The check and reaction to Link projectile colliding with enemy body

update_body_hb_1a();
// canDrawBodyHB = state == ST_NRM && !(ocs & $FC);
// update_body_hb_1a();

// E488
if (state == ST_NORM 
&&  !stunTimer 
&&  !isVal(oi, ElevA, LoDoA) ) // LockedDoor & Elevator
{
    var _p = 0;
    var _can_push_back = false;
    
    // update_body_hb_1a();
    _p = collide_pc_proj(bodyX, bodyY, bodyW, bodyH);
    if (_p)
    {
        // E6AE, E6CF
        // vuln to proj && (vuln to sword || is fireball)
        if ( !(ed2 & g.ED2_IPR) 
        &&  (!(ed1 & g.ED1_SLB) || _p.isFire) )
        {
            // E6F3
            _can_push_back = !(cs & CS_SW1) || global.pc.behavior >= global.pc.BVR_UPTH;
            
            if !(cs & CS_SW1)
            {
                // E70E
                cs |= CS_SW1;
                update_E726(global.pc.ar_atk_dmg[f.level_atk], true);
            }
        }
        else
        {
            // E6E6
            _p.hspd = 0;
            _p.pID  = $F2; // 008D,Y = $F2. Start disintegrate
            _can_push_back = true;
        }
    }
    else
    {
        // E6A6
        cs &= (CS_SW1 ^ $FF); // remove CS_SW1 from cs
    }
    
    
    if (_can_push_back)
    {
        // E4AB: carry would be set here in this scenario
        // E4AF
        GOB_set_hspd_pb($C, _p.facingDir);
    }
}

*/



