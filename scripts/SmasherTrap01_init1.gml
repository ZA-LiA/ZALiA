/// SmasherTrap01_init1()


var _i;


GameObjectB_init();
DRAW_YOFF = 0;
can_draw_self_exception = true;

GO_init_palidx(global.PI_BGR1);


                   _i=0;
sub_state_IDLE   = _i++;
sub_state_DELAY  = _i++;
sub_state_TELL   = _i++;
sub_state_ATTACK = _i++;
sub_state_DONE   = _i++;
sub_state = sub_state_IDLE;


Smasher_SPRITE1 = spr_Block06;
use_wall_graphics = false;
Wall_surf = -1;
Wall_dg_tsrc = undefined;
//if (ver==2) Wall_dg_tsrc = ds_grid_create(0,0);

FGWALL_depth = 0;


Trigger_state   = 0; // 0: Not triggered, 1: Triggered
Trigger_type    = 1;
Trigger_OFFSET1 = -2;
Trigger_draw_yoff = 0;
Trigger_w       = -1;
Trigger_h       = -1;
Trigger_xl      = -1;
Trigger_yt      = -1;
TriggerHB_w     = $20;
TriggerHB_h     = $10;
TriggerHB_xl    = 0;
TriggerHB_yt    = 0;
Trigger_surf    = -1;
Trigger_dg_tsrc = undefined;
Trigger_depth   = 0;
Trigger_dg_depth_pi_idx = -1;
//Trigger_palidx = 0;
//STR_Trigger+STR_Type+"02", STR_Trigger+STR_Position+_data1, STR_Trigger+STR_Size+_data2, STR_Trigger+STR_Depth+_data3


DELAY_timer = 0;
TELL_timer = $30;


attack_speed = $01;

attack_x_direction    = 0;
attack_x_distance     = 0;
attack_x_head_x       = 0;
attack_x_head_y       = 0;
attack_x_head_start_x = 0;
attack_x_head_start_y = 0;
attack_x_head_end_x   = 0;
attack_x_head_end_y   = 0;
attack_x_time         = 0;
attack_x_duration     = 0;
attack_x_speed        = 0;
attack_x_speed_MAX    = 3;
attack_x_ACCEL_TIME   = ROOM_SPEED_BASE * 1.0; // the amount of time it takes to get to attack_x_speed_MAX

attack_y_direction    = 0;
attack_y_distance     = 0;
attack_y_head_x       = 0;
attack_y_head_y       = 0;
attack_y_head_start_x = 0;
attack_y_head_start_y = 0;
attack_y_head_end_x   = 0;
attack_y_head_end_y   = 0;
attack_y_time         = 0;
attack_y_duration     = 0;
attack_y_speed        = 0;
attack_y_speed_MAX    = 3;
attack_y_ACCEL_TIME   = ROOM_SPEED_BASE * 1.0; // the amount of time it takes to get to attack_x_speed_MAX




