/// Surface_Draw_GUI_End()


if (global.QuestTimer_can_draw)
{
    global.QuestTimer_can_draw = false;
    draw_text_(global.QuestTimer_xl,global.QuestTimer_yt, global.QuestTimer_text);
}


/* This is here so it's the last thing that happens 
so `srf_app_paused_frame` can catch everything that 
drew this frame.
*/
update_app_pause();




