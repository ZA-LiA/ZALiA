/// Moa_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(sprR,0, drawX+4+sprRXOff, drawY, -1, xScale,yScale);
draw_sprite_(sprL,0, drawX-4,          drawY, -1, xScale,yScale);

pal_swap_reset();




