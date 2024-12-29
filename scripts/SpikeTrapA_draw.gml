/// SpikeTrapA_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

GO_draw_sprite(sprite);
//GO_draw_sprite(Skull_SPRITE); // Won't draw if Skull_SPRITE==0

pal_swap_reset();




