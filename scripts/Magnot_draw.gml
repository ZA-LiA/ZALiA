/// Magnot_draw()

if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(spikes_spr,0, drawX,drawY);
GO_draw_sprite(sprite);

pal_swap_reset();

draw_sprite_(spr_1x1_WHT,0, (drawX-1)+pupil_xoff, (drawY-1)+pupil_yoff, -1, 2,2, PUPIL_COLOR);
//draw_rect(PUPIL_COLOR, (drawX-1)+pupil_xoff, (drawY-1)+pupil_yoff, 2,2);



GO_draw_trig_hb_1();





