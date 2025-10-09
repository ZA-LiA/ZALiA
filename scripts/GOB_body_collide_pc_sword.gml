/// GOB_body_collide_pc_sword()

// E677 - PC sword to enemy body
// The check and reaction to PC_sword colliding with GOB_body



// A combination of stunTimer, collide_pc_proj() in GOB_body_collide_pc_proj(), 
// and collide_pc_sword() in GOB_body_collide_pc_sword() ensure 
// that CS_SW1 will be removed from cs and damage cannot occur more than 
// once from the same attack.




// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
if(!global.pc.SwordHB_collidable 
|| !react_sword            // Spawners, NPCs, etc.. have no reaction to PC sword
||  state != state_NORMAL )
{
    cs &= ~CS_SW1; // remove CS_SW1 (PC's SWord) from cs (Colliding Sides)
    global.pc.SwordHB2_colliding  = noone;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





var _react_sword = react_sword;


// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
update_body_hb_1a();
PC_update_sword_hb();


// SwordHB2_colliding is for keys, pbags, jars
if (cs&CS_BTM 
&& !vspd 
&& !global.pc.ogr 
&&  global.pc.SwordHB2_collidable 
&&  rectInRect(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, global.pc.SwordHB2_xl,global.pc.SwordHB2_yt, global.pc.SwordHB2_w,global.pc.SwordHB2_h) )
{    global.pc.SwordHB2_colliding = id;  }
else global.pc.SwordHB2_colliding = noone;


var _HB1_COLLIDING = collide_pc_sword(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r);
if(!_HB1_COLLIDING 
&&  global.pc.SwordHB2_colliding != id )
{
    cs &= ~CS_SW1; // remove CS_SW1 (PC's SWord) from cs (Colliding Sides)
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// E6AE

// GOB var 'react_sword': -------------------------
//      Each byte is reaction type. 
//      Each bit of a byte is sword atk type

//      $01: stab high,      $02: stab low,      $04: thrust dw,     $08: thrust up, 
//      $10: ,               $20: ,              $40: ,              $80: 

//      $0000FF: take dmg, 
//      $00FF00: body is like a shield/solid, 
//      $FF0000: extra pushback/bounce
// -----------------------------------------------

// global.pc.attack_bits is from PREVIOUS frame's behavior
var _ATK_BITS = global.pc.attack_bits;





// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
//BIT_ATK1: stab stand
//BIT_ATK2: stab crouch
//BIT_ATK3: downthrust
//BIT_ATK4: upthrust
// ** OG data shows only Tektite & Zora have solid body ($00FF00)
if ((_react_sword>>8)&_ATK_BITS)  // If body IS a solid to this type of sword strike
{
    if (f.items&ITM_SWRD  // ITM_SWRD can pierce solid body
    && (!pc_is_cucco() || g.CuccoSpell2_Active) 
    && !is_ancestor(object_index,SpikeTrap) )
    {
        _react_sword |= (_react_sword>>8)&_ATK_BITS;
    }
    else
    {
        // A flag for skipping certain parts of GOB update this frame.
        pc_sword_collided_solid_body = true;
        
        // E654 - same as E654 in GOB_shield_collision_1a
        pc_sword_colliding_solid_body(); // g.SND_STRK_SLD1, set_bounce_vel() for DWTH or pushback_pc_and_gob()
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}





// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
var _REACT_BITS = _react_sword & _ATK_BITS;



if(!_REACT_BITS) // if NOT vuln to current attack type
{
    cs &= ~CS_SW1; // remove CS_SW1 (PC's SWord) from cs (Colliding Sides)
    global.pc.SwordHB2_colliding = noone;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// E6BE

// Only Item I know of that gets a stunTimer set 
// is a red bottle spawned from SpawnByStab.
// I think this is to give a chance for the bottle 
// to drop since PC swrd hb already colliding right here.
if (is_ancestor(object_index,Item) 
&&  stun_timer ) // if is an Item that's stunned
{
    global.pc.SwordHB2_colliding = noone;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// E6FD

// I'm not sure what the purpose of this is. I can't think of a scenario where 
// PC.yt would be above GO.yt while upthrust sword hb is colliding w/ GO body hb.
// Possibly it's some game mechanic/rule that wants upthrust only for hitting 
// a GO's underside. Although, I still don't see how it'd get to here...

// Maybe some sort of y offset for the upthrust hb?...
// Horsehead is only one w/ body hb above yt, but i don't think 
// OG devs would've considered upthrust at Horsehead.

// This may have something to do with pc.swrdY_base,swrdX_base being updated 
// at the end of the game update which gives sword hb coords a 1 frame lag. 
// This can cause some of sword hb during upthrust to be greater than pc.yt 
// (toward screen bottom) when it's supposed to be 1 pixel above. 
// Also, pc.swrd_collidable is still true on the 1st frame pc.behavior is not 
// an attack anymore. This makes upthust-hb-y +7 from pc.yt. There are other 
// scenarios as well, like when switching from one attack to another in mid air.

// Another possibility is spawning a jar from SpawnByStab block

if (global.pc.behavior==global.pc.behavior_STAB_UP  // OG right here uses CURRENT frame's behavior
&&  global.pc.yt < yt )                // if PC.yt is ABOVE GO.yt
{   // E6A6
    cs &= ~CS_SW1; // remove CS_SW1 (PC's SWord) from cs (Colliding Sides)
    global.pc.SwordHB2_colliding  = noone;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}










// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------




if(!_HB1_COLLIDING)
{
    cs &= ~CS_SW1; // remove CS_SW1 (PC's SWord) from cs (Colliding Sides)
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





if (global.pc.behavior==global.pc.behavior_STAB_UP) // OG right here uses CURRENT frame's behavior
{
    global.pc.vspd = 0;
}


// E708
if!(cs &  CS_SW1) // if NOT already colliding PC SWord or PC Proj
{
    cs |= CS_SW1;
    
    
    // OG right here uses CURRENT frame's behavior
    if (global.pc.behavior==global.pc.behavior_STAB_DOWN)
    {
        PC_set_bounce(); // Downthrust
    }
    
    // E726
    // $FF000000. These bits indicate the only reaction needed 
    // is (cs |= CS_SW1) so that this obj's reaction to this collision 
    // can be handled later in the update for a more specific reaction. 
    // An example is FaBlA(Falling Block).
    if!((_react_sword>>$18) & _REACT_BITS)
    {
        damage_gob(id, get_pc_attack_damage(), false);
    }
}




// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------











// GOB var 'react_swrd': Each byte is reaction type. Each bit of a byte is sword atk type
// $01: stab high,      $02: stab low,      $04: thrust dw,     $08: thrust up, 
// $10: ,               $20: ,              $40: ,              $80: 
// $0000FF: take dmg, 
// $00FF00: body is like a shield/solid, 
// $FF0000: extra pushback/bounce


// var _BIT_ATK1  = (global.pc.behavior == global.pc.BVR_ATK1) <<0; // $01. High stab
// var _BIT_ATK2  = (global.pc.behavior == global.pc.BVR_ATK2) <<1; // $02. Low  stab
// var _BIT_DWTH  = (global.pc.behavior == global.pc.BVR_DWTH) <<2; // $04. Down stab
// var _BIT_UPTH  = (global.pc.behavior == global.pc.BVR_UPTH) <<3; // $08. Up   stab

    // $ 00 00(FF) - Set bits 1st byte
// var _ATK_BITS  = _BIT_ATK1 | _BIT_ATK2 | _BIT_DWTH | _BIT_UPTH;
    // $ 00(FF)FF  - Include 2nd byte
//     _ATK_BITS |= (_ATK_BITS <<8);
    // $(FF)FF FF  - Include 3rd byte
//    _ATK_BITS |= (_ATK_BITS <<8);




