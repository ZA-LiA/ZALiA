/// SwitchB_init()


GO_depth_init(DEPTH_ENEMY);
//GO_depth_init(DEPTH_BG1_P4+1); // +1 so tile pal swap can work

var _PI = global.PI_BGR4;
if(!is_undefined(         dk_spawn))
{   _PI = val(g.dm_spawn[?dk_spawn+STR_pal_idx], _PI);  }
GO_init_palidx(_PI);


facing_dir = 1;

SPR_UP = spr_SwitchB_1a;
SPR_DW = spr_SwitchB_1b;

pressed  = false;
complete = false; // rm puzzle complete, stay pressed.

pressed_count = 0;


/*
orientation = 0;
// 0: RGT(0 deg), 1: UP(90 deg), 2: LFT(180 deg), 3: DWN(270 deg)
orientation &= 3; // &= 3: Just in case value was set higher than 3.

IMG_ANG = orientation * 90;

if (orientation & 2) yScale = -1;
else                 yScale =  1;
*/


GROUND_Y = yt+8;
GROUND_Y = get_ground_y(x,GROUND_Y, -1, GROUND_Y);
/*
GROUND_Y = g.rm_h - ($03<<3);
GROUND_Y = get_ground_y(x,GROUND_Y, -1, yt+8);

// *** yt is 8 ABOVE the ground.
//set_xy(id, x,GROUND_Y-8);
set_xy(id, x,GROUND_Y);
*/


BodyHB_IDX  = -1;
BodyHB_idx  = BodyHB_IDX;
BodyHB_w    = $0C;
BodyHB_h    = $03;
//BodyHB_w    = $10;
//BodyHB_h    = $04;
BodyHB_xoff = (ww-BodyHB_w)>>1;
BodyHB_yoff = GROUND_Y-yt; // si_yoff = 8
//BodyHB_yoff = si_yoff; // si_yoff = 8
//sdm(""); sdm("si_yoff "+string(si_yoff)); sdm("");

// Change tiles to solid.
tile_change_1a(0, xl+0,yt+8, -1,0, TID_SOLID1);
tile_change_1a(0, xl+8,yt+8, -1,0, TID_SOLID1);




