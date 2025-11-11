/// usd_Flame2()


// 9CCE
can_draw_self = true;


xScale = 1;
yScale = 1;

draw_yoff = 0;


if (Launch_timer 
||  has_landed )
{
    GO_set_sprite(id, SPR_FLAM);
    
    var _TIMING = $2;
    
    // 9CD6
    if (counter<FADE_CUE     // FADE_CUE == $20
    &&  g.counter1&_TIMING ) // Fade effect
    {
        // 9CE3
        can_draw_self = false;
    }
    else
    {
        // 9CEB
        // MOD. Issue fix. 
        // Issue: During fade, sprite shows same xscale bc it doesnt draw during the opposite xscale.
        if (counter<FADE_CUE) xScale = sign_(g.counter1&(_TIMING<<1));
        else                  xScale = sign_(g.counter1& _TIMING);
    }
    
    draw_yoff = -DRAW_YOFF;
    if (ver==2 
    &&  Launch_timer )
    {   // Draw a little above the lava
        draw_yoff = -6;
    }
}
else
{
    GO_set_sprite(id, SPR_BALL);
    
    // 9D18
    if (g.counter1&$2) xScale =  1;
    else               xScale = -1;
    
    if (g.counter1&$4) yScale = -1;
    else               yScale =  1;
}

// xScale *= -1; // Because the sprites are backwards in my game



HostileFire_udp_1();
/*
if (ver==2 
&&  will_slide )
{
    if!(g.counter1&$3) palidx = p.dg_PI_SEQ[#0,(g.counter1>>2)&$3];
}
*/




