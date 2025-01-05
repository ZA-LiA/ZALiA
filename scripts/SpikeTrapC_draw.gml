/// SpikeTrapC_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx); // NEED THIS AFTER CHAIN LINKS

if(1)
{
    // units of 8 (Less links. 1 link gap between each.)
    var _i, _x,_y;
    for(_i=chain_length; _i>=0; _i--)
    {
        _x = spawn_x + round(lengthdir_x(_i<<3, angle));
        _y = spawn_y + round(lengthdir_y(_i<<3, angle));
        draw_sprite_(CHAIN_SPR,0, _x,_y);
    }
}
else
{
    // units of 4 (More linke. No space between links.)
    var _i, _x,_y;
    for(_i=chain_length<<1; _i>=0; _i--)
    {
        _x = spawn_x + round(lengthdir_x(_i<<2, angle));
        _y = spawn_y + round(lengthdir_y(_i<<2, angle));
        draw_sprite_(CHAIN_SPR,0, _x,_y);
    }
}


GO_draw_sprite(sprite);

pal_swap_reset();



//if (g.can_use_dev_tools1) drawPointCross(spawn_x,spawn_y);




