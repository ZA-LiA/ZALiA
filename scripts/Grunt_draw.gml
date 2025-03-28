/// Grunt_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(spr_Spear_piece1,0, drawX+spear_xoff1, drawY+spear_yoff, -1, xScale);
draw_sprite_(spr_Spear_piece2,0, drawX+spear_xoff2, drawY+spear_yoff, -1, xScale);
GO_draw_sprite(Legs_sprite);
GO_draw_sprite(sprite);

pal_swap_reset();




