/// Geru_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(arm,0,    drawX+Arm_xoff, drawY+Arm_yoff, -1, armXScale,armYScale);
draw_sprite_(lance1,0, drawX+Arm_xoff, drawY+Arm_yoff, -1, armXScale,armYScale);
draw_sprite_(lance2,0, drawX+Arm_xoff, drawY+Arm_yoff, -1, armXScale,armYScale);

GO_draw_sprite(sprite);

pal_swap_reset();




