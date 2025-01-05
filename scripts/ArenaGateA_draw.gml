/// ArenaGateA_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!counter)       exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);
var _Y = DOOR_Y + (GATE_SPR_H>>1);
for(var _i=0; _i<counter; _i++)
{
    draw_sprite_(GATE_SPR,0, drawX, _Y + (_i*GATE_SPR_H));
}
pal_swap_reset();




