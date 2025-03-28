/// Thunderbird_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(spr_Thunderbird_Wings_1a,0, drawX, drawY+ Wings_yoff,     -1, xScale);
draw_sprite_(spr_Thunderbird_Wings_1b,0, drawX, drawY+(Wings_yoff<<1), -1, xScale);

GO_draw_sprite(spr_Thunderbird_Body_1a);
GO_draw_sprite(Face_sprite);

pal_swap_reset();




