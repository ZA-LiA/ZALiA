/// NPC_A_udp()

// Triforce Keeper & triforce


can_draw_self = true;


NPC_udp_2(); // update `RandoHint_hint_num`

xScale = sign_(x<global.pc.x);


if (tri_can_draw==2 
||  counter&$18 )
{    GO_set_sprite(id,SPR_IDLE);  }  // idle
else GO_set_sprite(id,SPR_MOVE);     // action


draw_xoff = 0;
draw_yoff = 0;

if (tri_can_draw==2)
{   // After  fight, on floor
    tri_xOff  =  2 * xScale; // centers on keeper body mass looks better
    tri_yOff  = -hh; // should sit right on top of keeper
}
else
{   // Before fight, on ledge
    tri_xOff  = -(3<<3);
    tri_yOff  =  0;
    tri_yOff--; // to counteract the +1 in ground offset
}
    tri_xOff += draw_xoff;
    tri_yOff += draw_yoff;
//    


update_draw_xy();




