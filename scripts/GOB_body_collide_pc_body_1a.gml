/// The check and reaction to Link body colliding with enemy body


// E4D9
var _C1 = BodyHB_idx || BodyHB_idx==BODY_HB_IDX_DYNAMIC;  // if (BodyHB_idx >= 1)
var _C2 = GO_can_collide_this_frame(update_idx) || is_ancestor(object_index,NPC); // if (NPC OR every other frame)
//var _C3 = _C1 && _C2;
//

update_body_hb_1a();
BodyHB_can_draw = (_C1 && _C2) 
               || (_C1 && react_sword && global.pc.SwordHB_collidable); 
//             || (_C1 && react_proj && !stun_timer); // TODO: This needs to check if there's a collidable proj inst
//
/*
var _C1 = (BodyHB_idx || BodyHB_idx==BODY_HB_IDX_DYNAMIC)  // if (BodyHB_idx >= 1)
       && (GO_can_collide_this_frame(uIdx) || is_ancestor(object_index, NPC)); // if (NPC OR every other frame)
//
update_body_hb_1a();
canDrawBodyHB = _C1;
*/


if (_C1                // if BodyHB_idx
&&  _C2                // if NPC OR every other frame
&& !stun_timer 
&&  ocsH2(id)            // at least 8 pixels of gob on screen
&& !(global.pc.ocs&$4)        // if pc center x is on screen
&&  state==state_NORMAL  // GOB state is NORM
&&  collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r) )
{
    cs |=  CS_BD1;
}
else
{
    cs &= ~CS_BD1; // remove CS_LBD from cs
}







/*
/// The check and reaction to Link body colliding with enemy body


// E4D9
// var _ocs = ((global.pc.ocs&$6) <<1) | ocs;
// w bits: 0001 1111, h bits: 1110 0000

var _C1 = BodyHB_idx  // if (BodyHB_idx >= 1)
     && (isAncestor(object_index,NPC) || GO_can_collide_this_frame(uIdx)); // if (NPC OR every other frame)
//
    
update_body_hb_1a();
canDrawBodyHB = _C1;


if (_C1                     // if BodyHB_idx && (NPC OR every other frame)
&& !tmr_stun 
&&  ocsH2(id)               // at least 8 pixels of gob on screen
&& !(global.pc.ocs & $4)         // $4: pc center x is on screen
&&  state == ST_NORM        // GOB state is NORM
&&  collide_pc_body(bodyX,bodyY, bodyW,bodyH, bodyR) )
{
    cs |=  CS_BD1;
}
else
{
    cs &= ~CS_BD1; // remove CS_LBD from cs
}
*/




