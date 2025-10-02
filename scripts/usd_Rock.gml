
can_draw_self = true;

if (is_ancestor(object_index, Rock1) 
&&  state == state_NORMAL 
// &&  ctr_disint < $80 
// &&  pID && pID < $80 
&&  g.counter1&$10 )
{
    if (g.counter1&$20) draw_yoff = -2;
    else                draw_yoff =  2;
}
else                    draw_yoff =  0;


xScale = facing_dir;

if (g.counter1&$4 && state==state_NORMAL) yScale = -1;
else                                      yScale =  1;
// if (g.timer0 & 4 && ctr_disint < $80) yScale = -1;
// else                                  yScale =  1;
// if (g.timer0 & 4 && pID && pID < $80) yScale = -1;
// else                                  yScale =  1;

