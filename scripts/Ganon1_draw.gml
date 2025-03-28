/// Ganon1_draw()


if (can_draw_self)
{
    GameObject_draw_1a(sprite, palidx); // draw self
}




if (Blood_can_draw)
{
    draw_sprite_(spr_1x1_WHT,0, Blood_x-1,Blood_yt,   -1, 1,Blood_h, Blood_COLOR);
    draw_sprite_(spr_1x1_WHT,0, Blood_x,  Blood_yt-1, -1, 1,Blood_h, Blood_COLOR);
}


if (Crystal_can_draw)
{
    Crystal_can_draw=false;
    switch( Crystal_sprite_state){
    case 1:{Crystal_sprite=Crystal_SPRITE1; Crystal_pi=PI_MOB_BLU; break;}
    case 2:{Crystal_sprite=Crystal_SPRITE2; Crystal_pi=PI_MOB_RED; break;}
    case 3:{Crystal_sprite=Crystal_SPRITE2; Crystal_pi=PI_MOB_ORG+((g.counter1>>1)&$3); break;}
    }
    //draw_sprite_(CrystalAura_sprite,0, Crystal_x,Crystal_y, CrystalAura_pi);
    draw_sprite_(Crystal_sprite,0,     Crystal_x,Crystal_y, Crystal_pi);
}


pal_swap_set(p.palette_image, PI_MOB_RED);
if (BottleLiquid_can_draw 
&&  BottleLiquid_level )
{
    draw_sprite_(dl_BottleLiquid_SPRITES[|BottleLiquid_level-1],0, Bottle_x,Bottle_y);
}

if (Bottle_can_draw)
{
    draw_sprite_(Bottle_sprite,0, Bottle_x,Bottle_y, -1, 1,Bottle_yscale);
}
pal_swap_reset();





GameObjectB_debug_draw_1a(); // body hb, shield hb, sword hb, cs points, ocs
GO_debug_draw_1a(); // xl/yt point, spr outline
GOB_draw_hp();      // Toggle with 'V'




