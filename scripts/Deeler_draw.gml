/// Deeler_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);
if (Web_can_draw)
{
    for(var _i=ds_list_size(dl_Web_y)-1; _i>=0; _i--)
    {   draw_sprite_(spr_Deeler_web1,0, drawX, dl_Web_y[|_i]);  }
}

GO_draw_sprite(sprite);
pal_swap_reset();




