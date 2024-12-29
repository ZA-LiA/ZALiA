/// Cutscene_ShadowBoss_2_draw()


if (f.quest_num==1)
{
    if (triforce_can_draw)
    {
        draw_sprite_(TRIFORCE_SPR,0, g.pc.drawX, g.pc.drawY-g.pc.hh_-8, p.triforce_pi);
    }
}
else
{
    if (Boss_can_draw)
    {
        draw_pc_skin(Boss_x+4,Boss_y, 1,1, g.pc.behavior_DAMAGE, false, 1,1, Boss_pi,Boss_pi);
    }
    
    if (Blood_can_draw)
    {
        draw_sprite_(spr_1x1_WHT,0, Blood_x-1,Blood_yt, -1, 1,Blood_h-1, Blood_COLOR);
        draw_sprite_(spr_1x1_WHT,0, Blood_x,  Blood_yt, -1, 1,Blood_h,   Blood_COLOR);
    }
    
    pal_swap_set(p.palette_image, PI_MOB_RED);
    if (BottleLiquid_level)
    {
        draw_sprite_part(BottleLiquid_SPR,0,  0,$10-(BottleLiquid_level+1),  8,BottleLiquid_level,  Bottle_x-4,Bottle_y+$8-(BottleLiquid_level+1));
    }
    
    if (Bottle_can_draw)
    {
        draw_sprite_(Bottle_spr,0, Bottle_x,Bottle_y);
    }
    pal_swap_reset();
}




