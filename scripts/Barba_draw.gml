/// Barba_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);
for(var _i=Segment_COUNT-1; _i>0; _i--)
{   draw_sprite_(Segment_SPRITE,0, drawX+dl_xoff[|_i], drawY+(_i<<4), -1, xScale);  }
    draw_sprite_(Head_sprite,0,    drawX+dl_xoff[|0],  drawY,         -1, xScale);
pal_swap_reset();




