/// Zora_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

GO_draw_sprite(sprite);

if (COLLISION_VER == 1 
&&  sprite != SPR_STND )
{   draw_sprite_(SPR_HEAD,0, drawX+($10*xScale)+Head_xoff, drawY, -1, xScale);  }

pal_swap_reset();




