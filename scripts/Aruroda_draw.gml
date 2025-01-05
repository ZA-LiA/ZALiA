/// Aruroda_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

GO_draw_sprite(sprite);
GO_draw_sprite(tail_spr);
draw_sprite_(Head_sprite,0, drawX+($10*xScale), drawY, -1, xScale);

pal_swap_reset();




