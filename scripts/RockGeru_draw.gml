/// RockGeru_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(global.palette_image, palidx);

draw_sprite_(arm,0,  drawX+Arm_xoff,  drawY+Arm_yoff,  -1, armXScale,armYScale);
draw_sprite_(rock,0, drawX+rockXOff, drawY+rockYOff, -1, xScale);
GO_draw_sprite(sprite);

pal_swap_reset();




