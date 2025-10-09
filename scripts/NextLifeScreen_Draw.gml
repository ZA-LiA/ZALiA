/// NextLifeScreen_Draw()


set_background_color(p.C_BLK1);


if (g.counter1>=SHOW_INFO_CUE)
{
    draw_text_(INFO_X,  INFO_Y, save_name);
    draw_text_(LIVES_X, INFO_Y, string(lives));
    draw_text_(TIMES_SYMBOL_X, INFO_Y, "*", -1,global.PI_GUI1);
    //draw_sprite_(TIMES_SYMBOL_SPR,0, TIMES_SYMBOL_X, INFO_Y, get_pi(PI_GUI_1));
}

if (g.counter1>=SHOW_LINK_CUE)
{
    draw_pc_skin(LINK_X+$08,LINK_Y+$10, 1,1, global.pc.behavior_IDLE, false, -1,-1, global.PI_PC1);
}




