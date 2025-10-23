/// Switch_init()


init_vars_go_A();

init_vars_Switch();

can_draw_self_exception = true;

// default GameObject draw YOff
DRAW_YOFF = 0;

GO_depth_init(DEPTH_BG3);


scr_step = GameObjectB_step;


// --------------------------------------------------------------
SND_PRESS_1 = get_audio_theme_track(STR_Stab);
snd_press   = SND_PRESS_1;




