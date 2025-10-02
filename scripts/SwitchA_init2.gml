/// SwitchA_init2()


GO_depth_init(DEPTH_BG4+1); // +1 so tile pal swap can work


SPR_HEAD = spr_Switch_part_1a_1;
SPR_POLE = spr_Switch_part_5a;

sprite = SPR_HEAD; // for GO_draw_sprite_outline()
GO_set_sprite_index(SPR_HEAD);

facing_dir = 1;


var           _a = 0;
SUB_ST_IDLE = _a++; // Waiting to move outward if possible
SUB_ST_MOVE = _a++; // Moving 
SUB_ST_MOVI = _a++; // Moving Inward to complete
SUB_ST_MOVO = _a++; // Moving Outward from complete
// SUB_ST_HOLD = _a++; // 
SUB_ST_GOAL = _a++; // Is holding at goal
SUB_ST_COMP = _a++; // Locked at goal. Rm puzzle complete.
sub_state   = SUB_ST_IDLE;


//DUR_GOAL    = $100; // set in go_spawn_priorities()
//DUR_HOLD1   =  $80;
//DUR_HOLD2   = $100;
tmr_hold    =    0;
timer = 0;


if (!is_undefined(           dk_spawn) 
&&  val(g.dm_spawn[?         dk_spawn + STR_Duration])+1 )
{    DUR_GOAL = g.dm_spawn[? dk_spawn + STR_Duration];  }
else DUR_GOAL = $80; // Default



// 0: RGT(0 deg), 1: UP(90 deg), 2: LFT(180 deg), 3: DWN(270 deg)
if (!is_undefined(               dk_spawn) 
&&              val(g.dm_spawn[? dk_spawn + STR_Direction]) )
{    orientation  = g.dm_spawn[? dk_spawn + STR_Direction];  }
else orientation  = 0;

     orientation &= 3; // &= 3: Just in case value was set higher than 3.

if ( orientation &  2) yScale = -1;
else                   yScale =  1;

IMG_ANG = orientation * 90;




if (!is_undefined(             dk_spawn) 
&&            val(g.dm_spawn[? dk_spawn + STR_Length]) )
{    POLE_UNITS = g.dm_spawn[? dk_spawn + STR_Length];  }
else POLE_UNITS = 1;

MAX_LENGTH  = POLE_UNITS <<3;
//POLE_UNITS  =  1; // Out limit. Fully extended. set in go_spawn_priorities()
//pole_units  =  1; // Current length.


speed1     =   0;
SPD_I   = $18; // speed IN
SPD_O   = $04; // speed OUT


var _BODY_W    =  2; // width
var _BODY_L    = 14; // length
var _BODY_COFF =  8 - (_BODY_W>>1); // C: Center


GOAL_X  = x;
GOAL_Y  = y;
GOAL_XX = GOAL_X - sprite_get_xoffset(sprite_index);
GOAL_YY = GOAL_Y - sprite_get_yoffset(sprite_index);


DIR_IN = 1;


switch(orientation)
{
    case 0:{
    DIR_IN = -1;
    
    x += (MAX_LENGTH * -DIR_IN);
    
    BodyHB_w       =  _BODY_W;
    BodyHB_h       =  _BODY_L;
    BodyHB_xoff    = -(BodyHB_w>>1) + (_BODY_COFF * -DIR_IN);
    BodyHB_yoff    = -(BodyHB_h>>1);
    break;  }
    
    
    case 1: {
    DIR_IN =  1;
    
    y += (MAX_LENGTH * -DIR_IN);
    
    BodyHB_w       =  _BODY_L;
    BodyHB_h       =  _BODY_W;
    BodyHB_xoff    = -(BodyHB_w>>1);
    BodyHB_yoff    = -(BodyHB_h>>1) + (_BODY_COFF * -DIR_IN);
    break;}
    
    
    case 2:{
    DIR_IN =  1;
    
    x += (MAX_LENGTH * -DIR_IN);
    
    BodyHB_w       =  _BODY_W;
    BodyHB_h       =  _BODY_L;
    BodyHB_xoff    = -(BodyHB_w>>1) + (_BODY_COFF * -DIR_IN);
    BodyHB_yoff    = -(BodyHB_h>>1);
    break;  }
    
    
    case 3: {
    DIR_IN = -1;
    
    y += (MAX_LENGTH * -DIR_IN);
    
    BodyHB_w       =  _BODY_L;
    BodyHB_h       =  _BODY_W;
    BodyHB_xoff    = -(BodyHB_w>>1);
    BodyHB_yoff    = -(BodyHB_h>>1) + (_BODY_COFF * -DIR_IN);
    break;}
}


xl = x - 8;
yt = y - 8;


update_draw_xy();
update_body_hb_3a();




