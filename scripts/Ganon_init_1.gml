/// Ganon_init_1()


var _i, _a;


Boss_init_1();

can_draw_self_exception = true;

off_ground_reason = 0;


Slime_W_ = sprite_get_width( g.Ganon3_SPRITE1)>>1;
Slime_H_ = sprite_get_height(g.Ganon3_SPRITE1)>>1;


PALIDX1 = global.PI_BGR4;
PALIDX2 = global.PI_MOB_RED;

timer1  = 0;
timer2  = 0;
timerA  = 0;

x_prev = x;
y_prev = y;


Crystal_sprite_state = 0; // 0: can't draw, 1: empty spr, 2: full, 3: full & flashing spr
Crystal_fade_state   = 0; // 0: Opaque, 1: Fade In, 2: Fade Out, 

Crystal_state        = 0; // 0: dead, 1: normal
Crystal_position     = 0; // 0: home, 1: attack1, 2: attack2, 3: attack3
Crystal_timer        = 0;
Crystal_can_draw     = true;
Crystal_SPRITE1      = spr_Crystal_1b; // empty/clear
Crystal_SPRITE2      = spr_Crystal_1a; // colored & flashing
Crystal_sprite       = Crystal_SPRITE1;
Crystal_PI           = global.PI_MOB_RED;
Crystal_pi           = Crystal_PI;
Crystal_xoff         = 0;
Crystal_yoff         = 0;
Crystal_x            = x;
Crystal_y            = y;


CrystalAura_SPRITE   = spr_Aura_2a_WRB;
CrystalAura_PI       = global.PI_MOB_ORG;
CrystalAura_pi       = CrystalAura_PI;

CrystalSlot_SPRITE   = spr_Stone_Crystal_Slot_1a;



Jump_SOUND1 = get_audio_theme_track(dk_WalkWater+"01"); // A: lower pitched than B
Jump_SOUND2 = get_audio_theme_track(dk_WalkWater+"02"); // B: higher pitched than A




