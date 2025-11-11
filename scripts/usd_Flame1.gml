


// 999F, 99BE
can_draw_self = true;

// 99A6: Blinking
// FADE_CUE1==$50, FADE_CUE2==$38, FADE_CUE3==$1C
if (timer<FADE_CUE1)
{
    var                  _val = $1; // ON 1 frames. OFF 1 frames
    if (timer<FADE_CUE2) _val = $2; // ON 2 frames. OFF 2 frames
    if (timer<FADE_CUE3) _val = $4; // ON 4 frames. OFF 4 frames
    
    can_draw_self = !(g.counter1&_val);
}


if (g.counter1&$4) xScale = -1;
else               xScale =  1;


HostileFire_udp_1();




