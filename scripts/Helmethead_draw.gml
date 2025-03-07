/// Helmethead_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

   draw_sprite_(Head_sprite,0, drawX+Head_xoff, drawY+Head_yoff, -1, Head_xscale);
GO_draw_sprite(      sprite);
GO_draw_sprite( Legs_sprite);

pal_swap_reset();




