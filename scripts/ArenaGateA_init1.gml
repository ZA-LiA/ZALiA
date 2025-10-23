/// ArenaGateA_init1()


GameObjectB_init();
scr_step = ArenaGateA_step;

can_draw_self_exception = true;

ST_CTRL = state_DROP+1;




HEAD_SPR = spr_arena_gate_head_1a_WRB;
GATE_SPR = spr_arena_gate_piece_1a_WRB;
//GATE_SPR = spr_Locked_Door1A;
GATE_SPR_H = sprite_get_height(GATE_SPR);


var                   _a=1;
SUB_STATE_OPEN      = _a++; // Open, waiting
SUB_STATE_TRIG      = _a++; // Triggered
SUB_STATE_CLOS      = _a++; // Closing process
SUB_STATE_CLSD      = _a++; // Closed, delay done
SUB_STATE_DONE      = _a++; // Done closing
SUB_STATE_DSTR      = _a++; // Destroy. Remove solid tiles and explode.
sub_state           = SUB_STATE_OPEN;


GROUND_Y = 0;

DOOR_ROWS   = 0;
DOOR_Y      = 0;

TIMING = 3;
//TIMING = 2;

boss = noone;




