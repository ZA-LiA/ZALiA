/// init_Flame2()


SPR_BALL = spr_Fireball2;
SPR_FLAM = spr_Flame1;
GO_sprite_init(SPR_BALL);
GO_init_palidx(global.PI_MOB_RED);


despawn_offscreen_hor = false;


vspd_adj = 1; // 
has_landed = false; // 045E[pIndex]

VSPD_BOUNCE = $F0;
// min vspd required to bounce
BOUNCE_REQ = $20;

//brightness = 1;

FADE_CUE = $20;

HSPD1 = ($10*facing_dir) &$FF;
VSPD1 = $E0;

Launch_timer = 0;

switch(ver)
{
    case 1:{
    will_slide = false;
    //sound_cue1 = FADE_CUE;
    //SOUND_CUE1 = FADE_CUE;
    //SOUND_CUE2 = 
    Launch_timer = 0;
    break;}//case 1
    
    case 2:{
    will_slide = !irandom(9);
    Launch_timer = $10;
    
    HSPD1 = ($0E*facing_dir) &$FF;
    VSPD1 = $D4;
    hspd  = 0;
    vspd  = 0;
    vspd_adj = 0;
    break;}//case 2
}//switch(ver)




