/// Tektite_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(Legs_sprite,0, drawX, drawY-draw_yoff+legsYOff, -1, xScale);
GO_draw_sprite(sprite);

pal_swap_reset();




