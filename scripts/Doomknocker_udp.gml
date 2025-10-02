/// Doomknocker_udp()


can_draw_self = true;


if (cs&$4 
&&  g.counter1&$10 )
{    Legs_sprite = spr_Doomknocker_legs2;  }
else Legs_sprite = spr_Doomknocker_legs1;

if (timer) Arm_sprite = spr_Doomknocker_arm1;
else       Arm_sprite = 0;

Arm_xoff = 4 * -facing_dir;




