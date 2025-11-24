/// Cutscene_GameEnd_1B_init()


var _i, _a, _idx;
var _text;


Cutscene_init();


scr_step     = Cutscene_GameEnd_1B_update;
scr_draw     = Cutscene_GameEnd_1B_draw;
scr_inst_end = Cutscene_GameEnd_1B_end;


with(HUD) instance_destroy();




                      _a=1;
SUB_STATE_INIT_1A   = _a++; // INItialize 1
SUB_STATE_INIT_2A   = _a++; // INItialize 2
//                              // 
SUB_STATE_DLOG_1A   = _a++; // DiaLoGue 1
SUB_STATE_DLOG_1B   = _a++; // DiaLoGue 2
//                              // 
SUB_STATE_CURT_1A   = _a++; // CUrtains move down 1 DELAY
SUB_STATE_CURT_1B   = _a++; // CUrtains move down 1
SUB_STATE_CURT_2A   = _a++; // CUrtains move down 2 DELAY
SUB_STATE_CURT_2B   = _a++; // CUrtains move down 2
SUB_STATE_CURT_3A   = _a++; // CUrtains move   up 1 DELAY
SUB_STATE_CURT_3B   = _a++; // CUrtains move   up 1
//                              // 
SUB_STATE_OTHR_1A   = _a++; // OTHer 1.  Add 'THE END' text
SUB_STATE_OTHR_1B   = _a++; // 
// SUB_STATE_OTH2 = _a++; // OTHer 2.  
// SUB_STATE_OTH3 = _a++; // OTHer 3.  
// SUB_STATE_OTH4 = _a++; // OTHer 4.  
//                              // 
SUB_STATE_KISS_1A   = _a++; // KiSs. 
SUB_STATE_KISS_1B   = _a++; // KiSs. 
//                              // 
SUB_STATE_CRDT_1A   = _a++; // CReDiTs. Delay
SUB_STATE_CRDT_1B   = _a++; // CReDiTs. 
//                              // 
SUB_STATE_TRIF_1A   = _a++; // Triforce draws after credits
//                              // 
SUB_STATE_RPLY_1A   = _a++; // RePLaY. Waiting for start button.
//                              // 
SUB_STATE_RSET_1A   = _a++; // ReSET. Draw solid black for x frames before going to title screen.
//                              // 
// SUB_STATE_   = _a++; // 
//                              // 
//




g.game_end_state = 1;




CURTAIN_CLMS = viewW()>>3;

// CURTAIN_CLM: The first clm of the curtains that animates.
// ** NOTE: rm_center(0) may return the wrong value if used before view_wview[0] has been set for the current rm.
CURTAIN_CLM = (g.rm_w_>>3) - (CURTAIN_CLMS>>1);
CURTAIN_TS  = ts_Man_made_1a_WRB;

curtain_lowest_row = 0;

dg_curtain = ds_grid_create(CURTAIN_CLMS,6);

var _TSRC1 = $6C;              // mid
var _TSRC2 = _TSRC1 + 2;       // frame 4
var _TSRC3 = _TSRC1 + $10 - 2; // frame 1
var _TSRC4 = _TSRC3 + 2;       // frame 2
var _TSRC5 = _TSRC4 + 2;       // frame 3

dl_curtain_tsrc = ds_list_create();
ds_list_add(dl_curtain_tsrc,_TSRC1); // Mid
ds_list_add(dl_curtain_tsrc,_TSRC3); // Anim frame 1
ds_list_add(dl_curtain_tsrc,_TSRC4); // Anim frame 2
ds_list_add(dl_curtain_tsrc,_TSRC5); // Anim frame 3
ds_list_add(dl_curtain_tsrc,_TSRC2); // Anim frame 4

CURTAIN_FRAMES = 4;
curtain_frame = CURTAIN_FRAMES;




DLG_DEPTH_DEF = g.DIALOGUE_WINDOW.depth; // backup
DLG_DEPTH     = 0; // So curtain is in front of text.



THE_END_can_draw = 0;
THE_END_TEXT     = "THE END";
THE_END_PI       = global.PI_GUI1;

// writ_dlg            = "";

can_draw_L_and_Z = false;




var _DATAKKEY1 = STR_Palette+STR_Position;

var _CA1 = color_str(p.C_WHT1);
var _CA2 = color_str(p.C_BLK1);
//var _CA2 = color_str(p.C_GRN0);
var _CA3 = color_str(p.C_GRY1);
var _CA4 = color_str(p.C_GRY3);

var _CB1 = color_str(p.C_PNK4);
var _CB2 = color_str(p.C_PNK3);
var _CB3 = color_str(p.C_PNK2);

var _CC1 = color_str(p.C_BLU4);
var _CC2 = color_str(p.C_VLT3);
var _CC3 = color_str(p.C_VLT2);

CREDITS_STAF_PI      = global.PI_MOB_BLU;
CREDITS_STAF_PAL_POS = get_pal_pos(CREDITS_STAF_PI);
CREDITS_STAF_PAL1    = _CA1+_CA3+_CA4;

// $05,05,16,  $15,05,16,  $25,05,16,  $30,15,16
CREDITS_TITL_PI      = global.PI_MOB_PUR;
CREDITS_TITL_PAL_POS = get_pal_pos(CREDITS_TITL_PI);
CREDITS_TITL_PAL1    = _CB1+_CB1+_CB1;
CREDITS_TITL_PAL2    = _CB2+_CB1+_CB1;
CREDITS_TITL_PAL3    = _CB3+_CB1+_CB1;
CREDITS_TITL_PAL4    = _CA1+_CB1+_CB2;

// $02,02,16,  $12,02,16,  $22,02,16,  $30,12,16
CREDITS_NAME_PI      = global.PI_GUI1;
CREDITS_NAME_PAL_POS = get_pal_pos(CREDITS_NAME_PI);
CREDITS_NAME_PAL1    = _CC1+_CC1+_CC1;
CREDITS_NAME_PAL2    = _CC2+_CC1+_CC1;
CREDITS_NAME_PAL3    = _CC3+_CC1+_CC1;
CREDITS_NAME_PAL4    = _CA1+_CC1+_CC2;

PAL_LEN = string_length(CREDITS_TITL_PAL1);




CREDITS_DUR0  = $C0;
CREDITS_DUR1  = CREDITS_DUR0;
CREDITS_DUR1 -= $10; // Speeding up credits b/c of many Patreon names
//CREDITS_DUR1    = CREDITS_DUR1-(CREDITS_DUR1>>2); // Speeding up credits b/c of many Patreon names
CREDITS_DUR2  = $08;
CREDITS_DUR3  = $07;
//CREDITS_DUR4  = CREDITS_DUR1-(CREDITS_DUR1>>2);
/*
CREDITS_CLM1 = (viewXC()>>3)-6; // NAME, "STAFF"
CREDITS_CLM2 = (viewXC()>>3)-8; // JOB TITLE
CREDITS_CLM2++; // MOD
*/

CREDITS_CLM1 = (viewXC()>>3) - 5; // NAME, "STAFF"
CREDITS_CLM2 = CREDITS_CLM1  - 4; // JOB TITLE
CREDITS_CLM2++; // MOD



//INDICATOR1 = "~";


credits_idx    = 0;

CREDITS_COUNT1 = 1;
//CREDITS_COUNT1 = 11;
//CREDITS_COUNT1 = 10;
CREDITS_COUNT2 = 7;
//CREDITS_COUNT2 = 6;
dg_CREDITS = ds_grid_create(0,CREDITS_COUNT2);
_idx = ds_grid_width(dg_CREDITS)-1;
//                                                  // 
//                                                  // 
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
//sdm("_idx $"+hex_str(_idx)+", ds_grid_width(dg_CREDITS): $"+hex_str(ds_grid_width(dg_CREDITS)));
dg_CREDITS[#0,0] = 0; // dg_CREDITS grid x idx
dg_CREDITS[#0,1] = 0; // state
dg_CREDITS[#0,2] = 0; // timer
dg_CREDITS[#0,3] = 0; // "STAFF" can draw
dg_CREDITS[#0,4] = 0; // title can draw
dg_CREDITS[#0,5] = 0; // name  can draw
//                                                  //
//                                                  //
//                                                  //
// ------------------- ME -------------------
_text="LINK IS ADVENTURESOME CREATOR";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "HOVERBAT";         // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  // 
//                                                  //
//                                                  //
//                                                  //
// ------------------- MADE WITH -------------------
_text="MADE WITH";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "GAMEMAKER STUDIO";
dg_CREDITS[#_idx,2] = "TILED MAP EDITOR";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "PALETTE SWAPPER BY PIXELATED POPE";
dg_CREDITS[#_idx,2] = "GMSCHED BY SKYFLOOGLE";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
//                                                  // 
//                                                  //
//                                                  //
//                                                  //
// ------------------- ADDITIONAL MUSIC -------------------
_text="ADDITIONAL MUSIC AND SOUND";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "BROOMIETUNES";
dg_CREDITS[#_idx,2] = "ISABELLE CHIMING (VRC6 OST)";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "NIKOS8BITSTEREO (NIKOTENGOKU)";
dg_CREDITS[#_idx,2] = SteelCrescents_NAME;
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "WYNG (ORCHESTRAL SOUNDTRACK)";
dg_CREDITS[#_idx,2] = "KOJI KONDO (ZELDA 1 AUDIO)";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
//                                                  //
//                                                  //
//                                                  //
// ------------------- PATRONS -------------------
_text="PATRONS";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
//dg_CREDITS[#_idx,1] = "WOLFZEN SKIIGH";  
dg_CREDITS[#_idx,1] = "WOLFZEN 'XIB' SKIIGH";  
dg_CREDITS[#_idx,2] = "CAPTAIN BOZO"; // 
dg_CREDITS[#_idx,3] = "GUARDIAN";  
dg_CREDITS[#_idx,4] = "BLACKMAGE14"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "X570 BELMONT";            //
dg_CREDITS[#_idx,2] = "TECHTONIC IMPROV"; // BREN 
dg_CREDITS[#_idx,3] = "ROBIN AM"; // 
dg_CREDITS[#_idx,4] = "KOEBI"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "FLUFFY TAIL"; // 
dg_CREDITS[#_idx,2] = "REINEKE"; // 
dg_CREDITS[#_idx,3] = "JERBERJER"; // JERBINS JARMAN
dg_CREDITS[#_idx,4] = "DRALKKIN"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "JACOB THE MOO"; // 
dg_CREDITS[#_idx,2] = "ATOMIC DRACULA"; // 
dg_CREDITS[#_idx,3] = "AARON"; // 
dg_CREDITS[#_idx,4] = "ZABII"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
//                                                  //
//                                                  //
//                                                  //
// ------------------- SPECIAL THANKS -------------------
_text="SPECIAL THANKS";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "MOM"; // 
dg_CREDITS[#_idx,2] = "DAD"; // 
dg_CREDITS[#_idx,3] = "PATRICK"; // 
dg_CREDITS[#_idx,4] = "ERIN"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "VINNY"; // 
dg_CREDITS[#_idx,2] = "SCHMIDTTYGAMES"; // 
dg_CREDITS[#_idx,3] = "TRAILZ"; // 
dg_CREDITS[#_idx,4] = "ALTERNA4091"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "SOPHILAUTIA"; // 
dg_CREDITS[#_idx,2] = "BROOMIETUNES"; // 
dg_CREDITS[#_idx,3] = "ANARKHYA"; // 
dg_CREDITS[#_idx,4] = SteelCrescents_NAME; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit textdg_CREDITS[#_idx,6] = 1; // Center credit text
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,1] = "LINK IS ADVENTURESOME COMMUNITY"; // 
dg_CREDITS[#_idx,2] = "AND ANYONE ELSE THAT I MISSED!"; // 
dg_CREDITS[#_idx,5] = _text; // 5: staff text
dg_CREDITS[#_idx,6] = 1; // Center credit text
//                                                  //
//                                                  //
//                                                  //
// ------------------- ORIGINAL GAME STAFF -------------------
var _USE_PSEUDO_NAMES = false;
_text="ORIGINAL GAME STAFF";
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "EXECUTIVE PRODUCER"; // 
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "H.YAMAUCHI";
else                   dg_CREDITS[#_idx,1] = "HIROSHI YAMAUCHI";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "PRODUCER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "MIYAHON";
else                   dg_CREDITS[#_idx,1] = "SHIGERU MIYAMOTO";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "DIRECTOR";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "SUGIYEN";
else                   dg_CREDITS[#_idx,1] = "TADASHI SUGIYAMA";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,2] = "YAMAHEN";
else                   dg_CREDITS[#_idx,2] = "YASUHISA YAMAMURA";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "DESIGNER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "ISSHIN";  
else                   dg_CREDITS[#_idx,1] = "KAZUNOBU SHIMIZU";  
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "SOUND COMPOSER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "TSUKASAN";
else                   dg_CREDITS[#_idx,1] = "AKITO NAKATSUKA";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "PROGRAMER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "MORIKAZU";
else                   dg_CREDITS[#_idx,1] = "KAZUAKI MORITA";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,2] = "MARUMARU";
else                   dg_CREDITS[#_idx,2] = "TATSUO NISHIYAMA";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "PROGRAMER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "SHIGECHAN";
else                   dg_CREDITS[#_idx,1] = "SHIGEHIRO KASAMATSU";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,2] = "NISHIYAN";
else                   dg_CREDITS[#_idx,2] = "YASUNARI NISHIDA";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  //
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "PROGRAMER";
if (_USE_PSEUDO_NAMES) dg_CREDITS[#_idx,1] = "NAKAZOO";
else                   dg_CREDITS[#_idx,1] = "TOSHIHIKO NAKAGO";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  // 
//                                                  // 
//                                                  // 
ds_grid_resize(dg_CREDITS, (++_idx)+1, CREDITS_COUNT2);
dg_CREDITS[#_idx,0] = "THANKS A MILLION!";  // MOD
//dg_CREDITS[#_idx,0] = "THANKS A MILLION.";  // OG
dg_CREDITS[#_idx,1] = "START  - 2ND QUEST";
dg_CREDITS[#_idx,2] = "SELECT - DO NOT SAVE";
dg_CREDITS[#_idx,5] = _text; // 5: staff text
//                                                  // 
//                                                  // 
//                                                  // 
CREDITS_COUNT1 = ds_grid_width(dg_CREDITS);
//show_debug_message("_idx $"+hex_str(_idx)+", ds_grid_width(dg_CREDITS): $"+hex_str(ds_grid_width(dg_CREDITS)));


triforce_can_draw = 0;
TRIFORCE_SPR      = spr_Triforce_1a;
//p.triforce_pi     = PI_MOB_PUR;
p.triforce_pi     = global.PI_BGR3;
//p.triforce_pi     = PI_BGR_4;




