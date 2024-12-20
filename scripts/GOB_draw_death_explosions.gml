/// GOB_draw_death_explosions()


if(!explosion_can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    explosion_can_draw_self=false;
//


var _i, _y;
pal_swap_set(p.palette_image, PI_MOB_ORG);
for(_i=0; _i<explosion_count; _i++){
                                           _y = explosion_y + (_i<<4);
    draw_sprite_(explosion_sprite,0, drawX,_y, -1,  1,explosion_yscale); // 
    draw_sprite_(explosion_sprite,0, drawX,_y, -1, -1,explosion_yscale); // 
}
pal_swap_reset();




