/// Horsehead_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

   draw_sprite_(Head_sprite,0, drawX+Head_xoff, drawY,   -1, Head_xscale);
GO_draw_sprite(      sprite);
   draw_sprite_( Arm_sprite,0, drawX+ Arm_xoff, drawY,   -1, xScale);
   draw_sprite_(Legs_sprite,0, drawX,           drawY+8, -1, xScale);
//
pal_swap_reset();




