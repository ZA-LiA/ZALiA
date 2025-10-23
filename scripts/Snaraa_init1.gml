/// Snaraa_init1()


GameObjectB_init();

can_draw_self_exception = true;


pal_bgr = global.PI_BGR3;
GO_init_palidx(global.PI_MOB_BLU);
palidx = pal_bgr;

DRAW_YOFF = 0;


var               _a = 1;
SUB_STATE_IDLE  = _a++; // IDLE
SUB_STATE_AGRO  = _a++; // AGgRO
//SUB_STATE_SHAK  = _a++; // SHAKe
SUB_STATE_ATK1  = _a++; // ATtacK
SUB_STATE_LNDG  = _a++; // LaNDinG
SUB_STATE_SETL  = _a++; // SETtLe
//SUB_STATE_COOL  = _a++; // COOLdown
sub_state       = SUB_STATE_IDLE;


if (0){
SPR_1 = spr_Snaraa_1a_1_WRB;
SPR_2 = spr_Snaraa_1a_2_WRB;
SPR_3 = spr_Snaraa_1a_3_WRB;
}else{
SPR_1 = spr_Snaraa_1a_3_WRB;
SPR_2 = spr_Snaraa_1a_2_WRB;
SPR_3 = spr_Snaraa_1a_1_WRB;
}


HSPD_MIN = $04;
HSPD_MAX = $30;
hspd = 0;
hspd_landing_start = 0;
//hspd_highest = 0;

path_dir  = 0;
path_dist = 0;

// a: start location, b: target location
// rc_a  & rc_b   are the rc of id.x
// rc_a2 & rc_b2  are the rc of solid tiles
rc_a  = 0;
rc_b  = 0;
rc_a2 = 0;
rc_b2 = 0;


dist_remain_landing_start = 0;


AGRO_DIST0 = $C0;
agro_distance = AGRO_DIST0;
//DIST_ATCK = $C0;

AGRO_DUR     = $30;
SETTLE_DUR   = $1C;
COOLDOWN_DUR = $C0 - SETTLE_DUR;




