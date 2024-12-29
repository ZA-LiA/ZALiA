/// Elevator_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i, _x,_y;


pal_swap_set(p.palette_image, palidx);

var       _Y =  drawY - hh_ + 8;
var _Y1 = _Y + (chain_yoff_1>>CHAIN_TIMING);
var _Y2 = _Y + (chain_yoff_2>>CHAIN_TIMING);
for(_i=0; _i<CHAIN_CNT; _i++)
{
    draw_sprite_(CHAIN_SPR,0, drawX-ww_+4, _Y1+(_i<<3));
    draw_sprite_(CHAIN_SPR,0, drawX+ww_-4, _Y2+(_i<<3), -1, -1);
}


// Top
draw_sprite_(GEAR_SPR,0, drawX-ww_+4, drawY-BODY_SPR_YOFF, -1,  1, yScale);
draw_sprite_(GEAR_SPR,0, drawX+ww_-4, drawY-BODY_SPR_YOFF, -1, -1, yScale);
// Bottom
draw_sprite_(GEAR_SPR,0, drawX-ww_+4, drawY+BODY_SPR_YOFF, -1,  1,-yScale);
draw_sprite_(GEAR_SPR,0, drawX+ww_-4, drawY+BODY_SPR_YOFF, -1, -1,-yScale);


draw_sprite_(BODY_SPR,0, drawX,       drawY-BODY_SPR_YOFF, -1,  1, 1);
draw_sprite_(BODY_SPR,0, drawX,       drawY+BODY_SPR_YOFF, -1,  1,-1);

pal_swap_reset();




