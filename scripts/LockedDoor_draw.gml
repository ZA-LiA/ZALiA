/// LockedDoor_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

draw_sprite_(SPR_2A,0, drawX, drawY-openYOff, -1, 1);
draw_sprite_(SPR_2A,0, drawX, drawY+openYOff, -1, 1);
GO_draw_sprite(sprite);


if (ver==2 
&&  switch_side 
&&  counter<2 )
{
    if (switch_side&$1) draw_sprite_(SPR_3A,0, drawX+SWITCH_XOFF, drawY+YOFF, -1, 1);
    if (switch_side&$2) draw_sprite_(SPR_3A,0, drawX-SWITCH_XOFF, drawY+YOFF, -1, 1);
}

pal_swap_reset();




