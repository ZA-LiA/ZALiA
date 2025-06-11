/// NPC_B_init()

// MiniGame NPC


var _i,_j, _a, _x,_y, _w,_h;


GO_sprite_init(NPC_get_init_sprite(id));
update_body_hb_1a();

                       _a=1;
sub_state_IDLE       = _a++;
sub_state_OFFER      = _a++;
sub_state_LOWP       = _a++;
sub_state_UNLOCK     = _a++;
sub_state_WALK_PC    = _a++;
sub_state_PRE_GAME1  = _a++;
sub_state_PRE_GAME2  = _a++;
sub_state_GAME       = _a++;
sub_state_POST_GAME1 = _a++;
sub_state_POST_GAME2 = _a++;
sub_state_POST_GAME3 = _a++;
sub_state_POST_GAME4 = _a++;
sub_state_RESULT     = _a++;
//sub_state_WINNER     = _a++; // If a prize is won, player will have to refresh rm to play again.
sub_state_DONE       = _a++;
sub_state            = sub_state_IDLE;


hspd = 0;

dialogue_ver = "A";


game_requested  = false;
COST            = 0;


Minigame_timer  = 0;
Minigame_DUR1   = 60 * ROOM_SPEED_BASE;
Minigame_display_timer_can_draw = false;


MINIGAME_OBJ    = noone;
MINIGAME_VER    =  1;
minigame_inst   =  0;

MINIGAME_X      =  0;


PRIZE_AREA_CLMS = $06;
PRIZE_AREAS_PAD = $05;

PRIZE_1_OBJ     = noone;
PRIZE_1_VER     =  1;
prize_1_inst    = noone;
PRIZE_1_CLM     = $05;
//                          //
PRIZE_2_OBJ     = noone;
PRIZE_2_VER     =  1;
prize_2_inst    = noone;
PRIZE_2_CLM     = PRIZE_1_CLM + PRIZE_AREA_CLMS + PRIZE_AREAS_PAD;
//                          //
PRIZE_3_OBJ     = noone;
PRIZE_3_VER     =  1;
prize_3_inst    = noone;
PRIZE_3_CLM     = PRIZE_2_CLM + PRIZE_AREA_CLMS + PRIZE_AREAS_PAD;
//                          //
prize_obj       =  0;
prize_ver       =  0;
prize_num       =  0;

POINTS_PRIZE_1  =  0; // need max - val
POINTS_PRIZE_2  =  0; // need max - val
POINTS_PRIZE_3  =  0; // need max - val




// ItmF0 v1 = Bag - Points -   50
// ItmF0 v2 = Bag - Points -  100
// ItmF0 v3 = Bag - Points -  150
// ItmF0 v4 = Bag - Points -  200
// ItmF0 v5 = Bag - Points -  250
// ItmF0 v6 = Bag - Points -  300
// ItmF0 v7 = Bag - Points -  400
// ItmF0 v8 = Bag - Points -  500
// ItmF0 v9 = Bag - Points -  700
// ItmF0 vA = Bag - Points - 1000


// -------------------------------------------------------------
// -------------------------------------------------------------
switch(ver) // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
{
    // =======================================================================
    // ---------------------------------------------------------------
    // Target game 1
    case 1:{
    MINIGAME_OBJ  = MnGmA; // Target game
    MINIGAME_VER  = 1;     // Target game 1
    minigame_inst = 0;
    MINIGAME_X    = $40<<3;
    
    
    POINTS_PRIZE_1 = 0; // need: max - POINTS_PRIZE_1 (30-0=30)
    POINTS_PRIZE_2 = POINTS_PRIZE_1+2; // need: max - POINTS_PRIZE_2 (30-2=28)
    POINTS_PRIZE_3 = max(POINTS_PRIZE_1+4,POINTS_PRIZE_2+2); // need: max - POINTS_PRIZE_3 (30-4=26)
    
    
    
    var _Y = (g.rm_row0+$8)<<3;
    _w = PRIZE_AREA_CLMS<<3;
    _x = PRIZE_1_CLM<<3;
    
    
    PRIZE_1_OBJ = ItmF0; // ItmF0: PBag
    PRIZE_1_VER = 3;     // v3: 150P
    
    with(Item)
    {
        if (wINw(xc,1, _x,_w))
        {
            other.PRIZE_1_OBJ  = object_index;
            other.PRIZE_1_VER  = ver;
            other.prize_1_inst = id;
            break;
        }
    }
    
    _w = val(g.dm_go_prop[?object_get_name(PRIZE_1_OBJ)+STR_Placement_spr], spr_Placement_08x16);
    _w = sprite_get_width(_w);
    _x = (PRIZE_1_CLM<<3) + ((PRIZE_AREA_CLMS<<3)>>1) - (_w>>1);
    
    if (          prize_1_inst)
    {    set_xlyt(prize_1_inst, _x,_Y);  }
    else          prize_1_inst = GameObject_create(_x,_Y, PRIZE_1_OBJ,PRIZE_1_VER);
    
    
    
    PRIZE_2_OBJ = ItmF0;    // ItmF0: PBag
    PRIZE_2_VER = 2;        // v2: 100P
    _w = val(g.dm_go_prop[?object_get_name(PRIZE_2_OBJ)+STR_Placement_spr], spr_Placement_08x16);
    _w = sprite_get_width(_w);
    _x = (PRIZE_2_CLM<<3) + ((PRIZE_AREA_CLMS<<3)>>1) - (_w>>1);
    prize_2_inst = GameObject_create(_x,_Y, PRIZE_2_OBJ,PRIZE_2_VER);
    
    
    
    
    PRIZE_3_OBJ = ItmF0;    // ItmF0: PBag
    PRIZE_3_VER = 1;        // v1: 50P
    _w = val(g.dm_go_prop[?object_get_name(PRIZE_3_OBJ)+STR_Placement_spr], spr_Placement_08x16);
    _w = sprite_get_width(_w);
    _x = (PRIZE_3_CLM<<3) + ((PRIZE_AREA_CLMS<<3)>>1) - (_w>>1);
    prize_3_inst = GameObject_create(_x,_Y, PRIZE_3_OBJ,PRIZE_3_VER);
    
    
    COST = 60;
    //COST = 0; // testing
    
    
    // give npc a brown outline so they contrast with the black background
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_YLW4))); // C_YLW4: Darkest NES Brown
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_YLW4))); // C_YLW4: Darkest NES Brown
    break;}//case 1
    
    
    
    
    
    
    
    
    // =======================================================================
    // ---------------------------------------------------------------
    // 
    case 2:{
    MINIGAME_OBJ  = MnGmA;    // Target game
    MINIGAME_VER  = 2;        // Target game 2
    minigame_inst = 0;
    
    MINIGAME_X    = $40<<3;
    
    
    POINTS_PRIZE_1 =  0; // need max - val
    POINTS_PRIZE_2 =  4; // need max - val
    PRIZE_1_OBJ = CONT_PIECE_OBJ_HP; // Heart container
    PRIZE_1_VER = CONT_PIECE_OBJ_VER_HP; // Piece of Heart
    
    
    COST = 20;
    COST =  0; // testing
    break;}//case 2
    
    
    
    
    
    
    
    
    
    // =======================================================================
    // ---------------------------------------------------------------
    //  Downstab Pogo to the Top
    case 3:{
    scr_draw = NPC_B_draw;
    
    
    PRIZE_1_OBJ = ItmF0; // ItmF0: PBag
    PRIZE_1_VER = 5;     // PBag v5: 250
    
    
    if(!instance_exists(Item))
    {   // Heart piece didn't spawn bc player already acquired it.
        GameObject_create($37<<3,$0E<<3, PRIZE_1_OBJ,PRIZE_1_VER);
    }
    
    COST = 80;
    
    
    _x = $1C<<3;
    _y = (g.rm_rows-PAGE_ROWS+$12)<<3;
    
    
    MINIGAME_X  = $24<<3;
    Goal_XL     = $31<<3;
    Goal_YB     = $10<<3;
    
    
    Minigame_DUR1   = 60 * ROOM_SPEED_BASE;
    
    
    SND_GAME_START  = get_audio_theme_track(STR_Encounter+STR_Enter);
    SND_GAME_DONE   = get_audio_theme_track(STR_Encounter+STR_Leave);
    
    MUS_GAME_THEME  = dk_Minigame+"01";
    MUS_GAME_ACTIVE = get_audio_theme_track(MUS_GAME_THEME);
    //MUS_GAME_ACTIVE = get_audio_theme_track(STR_Battle+"01");
    
    
    // give npc a brown outline so they contrast with the black background
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_YLW4))); // C_YLW4: Darkest NES Brown
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_YLW4))); // C_YLW4: Darkest NES Brown
    break;}////case 3
    
    
    
    
    
    
    
    
    
    
    // =======================================================================
    // ---------------------------------------------------------------
    //  
    case 4:{
    break;}//case 4
}//switch(ver)
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




