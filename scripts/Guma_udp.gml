/// Guma_udp()


can_draw_self = true;

if (cs&$4 && g.counter1&$10) sprite = spr_Guma2;
else                         sprite = spr_Guma1;

    arm = 0;
if (timer)
{
    arm     = spr_Guma_arm;
    Arm_xoff = 4 * -facing_dir;
}




