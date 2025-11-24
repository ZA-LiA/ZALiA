/// HUD_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("HUD_Create() START");
}


var _GROUP_PAD_CLMS =  $01;
var _GROUP_PAD      = (_GROUP_PAD_CLMS<<3);
var _LVL_ICON_PAD   =  1;
var _LVL_ICON_DIST  = ($02+_LVL_ICON_PAD)<<3; // +1 for padding between




depth = DEPTH_HUD;

PI_MENU1 = global.PI_GUI1;

can_draw_self = true;




// Magic
MeterHead_SPRITE_MP = spr_stat_meter_head_magic;
MeterCont_SPRITE_MP = spr_HUD_magic_container;
// Life
MeterHead_SPRITE_HP = spr_stat_meter_head_life;
MeterCont_SPRITE_HP = spr_HUD_life_container;

METER_H = sprite_get_height(MeterHead_SPRITE_MP)-1; // 7




MeterContainer_count_HP = cont_cnt_hp();
MeterContainer_count_MP = cont_cnt_mp();


SPR_SLASH = spr_text_slash_forward;


// hp/mp amount per pixel
MeterFill_AMOUNT_PER_PIXEL = Container_AMT>>3;

XP_CHAR_COUNT =  4;




/*
var _YOFF  = 0;
if(!g.VIEW_PAD_YB_OFF)
{
    _YOFF  = -abs(g.VIEW_Y_TILE_OFF); // -2
    _YOFF += -1;
}

Y_LINE1  =           ($01<<3) + _YOFF; // 
Y_LINE2  = Y_LINE1 + ($01<<3); // 
Y_LINE1 -= 1; // Add some space between lines
*/
Y_LINE1 = global.HUD_YOFF1;
Y_LINE2 = Y_LINE1 + ($01<<3) + 1; // 
//                                  // 
//                                  // 
X_PAD2 = $01<<3;
//                                  // 
var _CLMS  = (1+f.CONT_MAX_MP+_GROUP_PAD_CLMS) + (1+f.CONT_MAX_HP+_GROUP_PAD_CLMS);
    _CLMS += (XP_CHAR_COUNT<<1) + 2; // +2 for slash char & next level icon
X_BASE  = g.VIEW_W_ - ((_CLMS<<3)>>1);
X_BASE2 = X_PAD2 + ($00<<3);
//                                                                          //
GROUP1_X = X_BASE + ($00<<3);
GROUP2_X = GROUP1_X + ((f.CONT_MAX_MP+1)<<3) + _GROUP_PAD;
GROUP3_X = GROUP2_X + ((f.CONT_MAX_HP+1)<<3) + _GROUP_PAD;
//                                                                          //




MP_X                  = GROUP1_X;
MP_X2                 = X_BASE2;
MeterFill_w_MP        = ceil(f.mp / MeterFill_AMOUNT_PER_PIXEL); // _w will be AT LEAST 1. ceil() rounds UP to nearest int
MeterFill_COLOR_MP    = p.C_WHT1;
MeterFill_can_draw_MP = f.mp!=0;
MeterFill_xl_MP       = 0;
MeterFill_yt_MP       = 0;
//                                                                          //
HP_X                  = GROUP2_X;
HP_X2                 = MP_X2 + (HP_X-MP_X);
MeterFill_w_HP        = ceil(f.hp / MeterFill_AMOUNT_PER_PIXEL); // _w will be AT LEAST 1. ceil() rounds UP to nearest int
MeterFill_COLOR_HP    = p.C_RED3;
MeterFill_can_draw_HP = f.hp!=0;
MeterFill_xl_HP       = 0;
MeterFill_yt_HP       = 0;
//                                                                          //




MeterCont_xl_HP = 0;
MeterCont_yt_HP = 0;

MeterCont_xl_MP = 0;
MeterCont_yt_MP = 0;




MeterHead_xl_HP = 0;
MeterHead_yt_HP = 0;

MeterHead_xl_MP = 0;
MeterHead_yt_MP = 0;




XP_X     = GROUP3_X;
XP_X2    = (viewW()-X_PAD2) - ($A<<3);
XP_text  = get_xp_str(f.xp);     // XP current
XP_text += "/";                  // XP Forward slash
XP_text += get_xp_str(f.xpNext); // XP next
XP_xl    = 0;
XP_yt    = 0;
//                                                                          //




NextLevel_can_draw = false;
NextLevel_sprite = global.SPR_ICON_ATK;
NextLevel_xscale = 1;
NextLevel_X  = XP_X + (((XP_CHAR_COUNT<<1)+1)<<3);
NextLevel_X += sprite_get_width(NextLevel_sprite)>>1;
NextLevel_X += 1; // padding
NextLevel_x  = 0
NextLevel_y  = 0;




Levels_XL    = XP_X + ($01<<3);
Levels_xl    = 0;
Levels_yt    = 0;
Level_ATK_XL = Levels_XL;
Level_ATK_xl = Level_ATK_XL;
Level_MAG_XL = Level_ATK_XL + _LVL_ICON_DIST;
Level_MAG_xl = Level_MAG_XL;
Level_LIF_XL = Level_MAG_XL + _LVL_ICON_DIST;
Level_LIF_xl = Level_LIF_XL;




SpellQueued_can_draw = false;
SpellQueued_ICON_SPR = global.SPR_ICON_MAG;
SpellQueued_ICON_X   = MP_X;
SpellQueued_TEXT_X   = SpellQueued_ICON_X + ($01<<3);
SpellQueued_NONE     = "...";
SpellQueued_text     = SpellQueued_NONE;
SpellQueued_palidx   = PI_MENU1;
SpellQueuedIcon_xl   = 0;
SpellQueuedIcon_yt   = 0;
SpellQueued_xl       = 0;
SpellQueued_yt       = 0;




Lives_can_draw = false;
Lives_text = "*"+string(lives);
Lives_xl   = 0;
Lives_yt   = 0;


Keys_can_draw = false;
Keys_text = "*"+string(f.key_count);
Keys_xl   = 0;
Keys_yt   = 0;




if (DEV)
{
    show_debug_message("HUD_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




