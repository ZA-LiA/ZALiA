/// Moblin_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(spear_spr1,0, drawX + spear_xoff1, drawY + spear_yoff, -1, spear_xscale);
draw_sprite_(spear_spr2,0, drawX + spear_xoff2, drawY + spear_yoff, -1, spear_xscale);
GO_draw_sprite(sprite);

pal_swap_reset();




