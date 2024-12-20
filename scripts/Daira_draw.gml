/// Daira_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);
draw_sprite_(Arm_sprite,0, drawX+Arm_xoff,drawY+Arm_yoff, -1, armXScale,armYScale);
draw_sprite_(    sprite,0, drawX,         drawY,         -1, xScale,   yScale);
pal_swap_reset();




