/// SpikeTrapD_init1()


var _i;


GameObjectB_init();
DRAW_YOFF = 0;


                      _i=0;
sub_state_IDLE      = _i++;
sub_state_COOLDOWN  = _i++;
sub_state_ATTACKING = _i++;
sub_state = sub_state_COOLDOWN;


Spike_surf  = -1;
Spike_depth = depth;
Spike_count = 1;
SpikeGrid_value = TID_SPIKE1;


Cooldown_duration = $60;
Cooldown_timer    = Cooldown_duration;


Attack_duration = $40;
Attack_timer    = 0;
Attack_DIST     = $10;
Attack_SPEED    = $2;
Attack_x_direction = 0;
Attack_y_direction = 0;
Attack_SOUND = get_audio_theme_track(STR_Stab);


x_move = 0;
y_move = 0;




