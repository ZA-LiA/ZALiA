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
//Wall_dg_tsrc = 0;
//if (ver==2) Wall_dg_tsrc = ds_grid_create(0,0);

FGWALL_depth = 0;


trigger_x = -1;
trigger_y = -1;


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



xchangeprev=0; // debug
xchangeprevdiff=0; // debug
