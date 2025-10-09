/// SmasherTrapManager_init1()


var _i;


GameObjectB_init();


                   _i=0;
sub_state_IDLE   = _i++;
sub_state_DELAY  = _i++;
sub_state_TELL   = _i++;
sub_state_ATTACK = _i++;
sub_state_DONE   = _i++;
sub_state = sub_state_IDLE;


Smasher_SPRITE1 = spr_Block06;


Attack_DELAY0 = $0;
Attack_DELAY1 = $10;
Attack_DELAY2 = $40;
Attack_DELAY3 = $6;

Tell_DURATION0 = $18;

trigger_x = -1;
trigger_y = -1;


Trap_dg = ds_grid_create(0,$3);




