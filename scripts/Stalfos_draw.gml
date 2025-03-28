/// Stalfos_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

if (g.mod_STALFOS_CHAIN 
&&  can_draw_chain )
{
    var _i, _y;
    var _Y = CEILING_Y + 1 + (CHAIN_SPR_H>>1);
    for(_i=0; _i<CHAIN_COUNT; _i++)
    {
        _y  = _Y + ((CHAIN_SPR_H+1)*_i);
        draw_sprite_(CHAIN_SPR,0, drawX,_y);
    }
}

draw_sprite_(Arm_sprite,0, drawX+Arm_xoff, drawY+Arm_yoff, -1, xScale);
GO_draw_sprite(Legs_sprite);
GO_draw_sprite(sprite);

pal_swap_reset();




