/// Bot_draw()

if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);
GO_draw_sprite(sprite);
draw_sprite_(spr_eyes,0, drawX, drawY+eyes_yoff, -1, xScale,yScale);
pal_swap_reset();

Bot_draw_cover();




