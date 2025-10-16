/// PlatformA_init_1()


Platform_init_1();


Body_surf = -1;
Body_mid_segments = max(0, (sprite_get_width(spr_Elevator_2a_WRB)>>3)-2);
//Body_SPRITE = spr_Elevator_2a_WRB;
//BODY_SPR = spr_Elevator_1A;
//BODY_SPR = spr_Elevator_2a_WRB;


ww  = $10 + (Body_mid_segments<<3);
ww_ = ww>>1;
hh  = $8;
hh_ = hh>>1;


BodyHB_w = ww;
BodyHB_h = hh;


Gear_SPRITE  = spr_Elevator_gear_1a_WRB;
Gear_yscale  = 1;
Gear_TIMING1 = $8;
//Gear_TIMING1 = $10;


HSPD  = $10;
VSPD  = $10;
hspd1 = HSPD;
vspd1 = VSPD;


dg_path = ds_grid_create(1,3);


DELAY1_DUR = $40;
DELAY2_DUR = $10;


radius = 0;
angle  = 0;

// Duration (in seconds) it takes to make a full revolution
REV_DUR = 6;
rev_dur = REV_DUR;

// degree change per frame
SPEED1 = 1;




