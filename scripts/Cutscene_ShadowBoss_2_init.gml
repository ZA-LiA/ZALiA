/// Cutscene_ShadowBoss_2_init()


var _i, _a;


Cutscene_init();
Cutscene_ShadowBoss_init();


scr_step = Cutscene_ShadowBoss_2_update;
scr_draw = Cutscene_ShadowBoss_2_draw;
//scr_iend = ;


triforce_can_draw = 0;
TRIFORCE_SPR      = spr_Triforce_1a;
p.triforce_pi     = p.TRIFORCE_PI;
//p.triforce_pi   = PI_BGR_4;


                     BOSS_SPAWN_DK = undefined;
with(BOSS_OBJ) other.BOSS_SPAWN_DK = dk_spawn;

ARENA_X = 0;
//with(BOSS_OBJ) other.ARENA_X = arena_x;


Boss_can_draw   = false;
Boss_SPR        = 0;
Boss_PI         = global.PI_GUI4; // Greyscale, like PI_GUI2
//Boss_PI         = global.PI_MOB_PUR;
Boss_pi         = Boss_PI;
Boss_x          = 0;
Boss_y          = 0;
Boss_Raise_DIST = $20;
Boss_Target_y   = 0;
Boss_vspd       = 0;

if (f.quest_num>=2)
{   
    Blood_can_draw  = false;
    Blood_COLOR     = p.C_RED3;
    Blood_x         = 0;
    Blood_yt        = 0;
    Blood_yb        = 0;
    Blood_yb_MAX    = 0;
    Blood_h         = 2;
    //Blood_h_MAX     = 0;
    
    Bottle_can_draw    = false;
    Bottle_SPR1        = spr_Item_Bottle_8d; // No top
    Bottle_SPR2        = spr_Item_Bottle_8c; // full, including liquid
    Bottle_spr         = Bottle_SPR1;
    BottleTop_SPRITE   = spr_Item_Bottle_8_Top;
    Bottle_x           = 0;
    Bottle_y           = 0;
    
    BottleLiquid_level = 0;
    BottleLiquid_SPR   = spr_Item_Bottle_8_Liquid_1a_1;
}


                          _a=0;
sub_state_BATTLE1       = _a++;
sub_state_POST_BATTLE1  = _a++;
sub_state_WALK_PC       = _a++;
sub_state_REVEAL_TK     = _a++;
sub_state_REVEAL_TK_A   = _a++;
sub_state_REVEAL_TK_B   = _a++;
sub_state_HOLD_TRIFORCE = _a++;
sub_state_REVEAL_SB     = _a++;
sub_state_FILL_BOTTLE1  = _a++;
sub_state_FILL_BOTTLE2  = _a++;
sub_state_FILL_BOTTLE3  = _a++;
sub_state_FILL_BOTTLE4  = _a++;
sub_state_FILL_BOTTLE5  = _a++;
sub_state_FILL_BOTTLE6  = _a++;
sub_state_FILL_BOTTLE7  = _a++;
sub_state_HOLD_BOTTLE   = _a++;
sub_state_DONE          = _a++;
sub_state               = sub_state_BATTLE1;


//SND_STRK_ENM1
//SND_STAB_1A
//SND_ENMY_DTH1
//SND_BOSS_EXPL
//SND_BLOK_BRK1
//SND_BRDG_CRBL
//SND_LOCK_OPN1
//SND_CAST_SPEL




