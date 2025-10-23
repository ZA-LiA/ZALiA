/// ElevatorA_init_1()


var _OBJ_NAME = object_get_name(object_index);
TYPE = string_char_at(_OBJ_NAME, string_length(_OBJ_NAME));

can_draw_self_exception = true;

exit_dirs   = $0; // bits of which dirs the elev can exit.


BODY_SPR = spr_Elevator_2a_WRB;
BODY_SPR_YOFF = (ELEV_H>>1) - 4;


CHAIN_SPR = spr_Elevator_chain_2a_WRB;

CHAIN_CNT  = (ELEV_H>>3)-1;
chain_yoff_1 = 0;
chain_yoff_2 = 0;

//CHAIN_TIMING = 0; // $3.  1 pixel every   frame
//CHAIN_TIMING = 1; // $7.  1 pixel every 2 frames
CHAIN_TIMING = 2; // $F.  1 pixel every 4 frames


GEAR_SPR = spr_Elevator_gear_1a_WRB;



HSPD    = $18;
VSPD    = $18;
hspd1   = HSPD;
vspd1   = VSPD;


// pc x diff from elev when, and if, pc x movement is 
// locked during elevator movement.
pc_xoff = 0;




// pc_lock: $1: hspd, $2: jump, 
// $10: stab high, $20: stab low, 
// $40: thrust down, $80: thrust up, 
var                    _LOCK_BITS1 = PC_LOCK_JUMP|PC_LOCK_ATK3|PC_LOCK_ATK4;
switch(TYPE){
case "A":{pc_lock_bits=_LOCK_BITS1; break;}
case "B":{pc_lock_bits=_LOCK_BITS1|PC_LOCK_HSPD; break;}
}




