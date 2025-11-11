/// Blaze_udp()


can_draw_self = true;

if (g.counter1&ANIM_SPEED) xScale =  1;
else                       xScale = -1;


if (ver==3 
||  ver==4 
||  ver==5 )
{
    if (timer 
    &&  timer&(ANIM_SPEED>>2) )
    {
        can_draw_self = false;
    }
}


HostileFire_udp_1();




