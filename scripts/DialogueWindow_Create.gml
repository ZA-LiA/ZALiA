/// DialogueWindow_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("DialogueWindow_Create() START");
}


var _i, _a, _val;


g.DIALOGUE_WINDOW = id;


                  _a = 1;
// SUB_STATE_ = _a++; // 
SUB_STATE_OPEN0 = _a++; // OPENing delay 1. Save game(if applies)
SUB_STATE_OPEN1 = _a++; // OPENing. Play sound
// SUB_STATE_OPEN2 = _a++; // OPENing. Constructing window
// SUB_STATE_OPEN2 = _a++; // OPENing delay 2. 
// SUB_STATE_OPEN3 = _a++; // OPENing delay 3.
// SUB_STATE_OPEN4 = _a++; // OPENing delay 4.
SUB_STATE_CSTR1 = _a++; // ConSTRuct window
SUB_STATE_DLG_0 = _a++; // DiaLoGue get dlg
SUB_STATE_DLG_1 = _a++; // DiaLoGue delay 1
SUB_STATE_TALK1 = _a++; // DiaLoGue talk. One letter at a time
SUB_STATE_ACTN0 = _a++; // ACTioN 0. Decide which action to go to
SUB_STATE_ACTN1 = _a++; // ACTioN 1. Restore LIF/MAG, Give SPELL/SKILL
SUB_STATE_ACTN2 = _a++; // ACTioN 2. Bagu, Mirror, Fountain
SUB_STATE_CLOS0 = _a++; // CLOSing gui. Start closing delay
// SUB_STATE_CLOS1 = _a++; // CLOSing gui. Deconstructing window
SUB_STATE_CLOS1 = _a++; // CLOSing gui. NPC transform to monster, Last sub_state
// SUB_STATE_CLOS = _a++; // 
SUB_STATE_DSTR1 = _a++; // DeconSTRuct. Deconstructing window
//                          // 
sub_state = 0;


dialogue_ver = "A";

                  _a=0;
SkipType_CLOSE  = _a++; // Close dlg window anytime
//SkipType_ALL    = _a++; // 
SkipType_TOEND  = _a++; // Skip to end of dlg
SkipType_NONE   = _a++; // Cannot skip at all


                _a=1;
TYPE_HEART  =   _a++;
TYPE_MAGIC  =   _a++;
TYPE_SAVER  =   _a++;
TYPE_SKILL  =   _a++;
TYPE_SPELL  =   _a++;
TYPE_QUEST  =   _a++;
TYPE_MIROR  =   _a++;
TYPE_WATER  =   _a++;
TYPE_BAGU   =   _a++;
TYPE_RVMAN  =   _a++;
TYPE_SPLSQ  =   _a++; // Spell Sequence
TYPE_BOKSQ  =   _a++; // BOOK Sequence
TYPE_BLDRS  =   _a++; // Boulder circle sequence
TYPE_GAME1  =   _a++; // Target game 1
TYPE_GAME2  =   _a++; // Target game 2
TYPE_GAME3  =   _a++; // Pogo to top game 1
TYPE_SHOP1  =   _a++;
TYPE_ZLDA1  =   _a++;
TYPE_ZLDA2  =   _a++;


dm_dialogue = ds_map_create();
//                                                                  // 
dm_dialogue[?object_get_name(NPC_4)+'01'+STR_Type] = TYPE_HEART;   // 
dm_dialogue[?object_get_name(NPC_4)+'02'+STR_Type] = TYPE_MAGIC;   // 
dm_dialogue[?object_get_name(NPC_4)+'03'+STR_Type] = TYPE_SAVER;   // 
//                                                                  // 
dm_dialogue[?object_get_name(NPC_6)+'01'+STR_Type] = TYPE_SKILL;   // 
dm_dialogue[?object_get_name(NPC_6)+'02'+STR_Type] = TYPE_SKILL;   // 
//                                                                  // 
dm_dialogue[?object_get_name(NPC_7)+'01'+STR_Type] = TYPE_SPELL;   // Spell Giver
dm_dialogue[?object_get_name(NPC_7)+'02'+STR_Type] = TYPE_SPELL;   // Spell Giver
dm_dialogue[?object_get_name(NPC_7)+'03'+STR_Type] = TYPE_SPELL;   // Spell Giver
//                                                                  // 
dm_dialogue[?object_get_name(NPC_5)+'01'+STR_Type] = TYPE_QUEST;   // 
//                                                                  // 
dm_dialogue[?object_get_name(NPC_0)+'03'+STR_Type] = TYPE_MIROR;   // 
dm_dialogue[?object_get_name(NPC_0)+'04'+STR_Type] = TYPE_WATER;   // Fountain
//                                                                  // 
dm_dialogue[?object_get_name(NPC_9)+'01'+STR_Type] = TYPE_BAGU;    // Bagu
dm_dialogue[?object_get_name(NPC_9)+'02'+STR_Type] = TYPE_RVMAN;   // Riverman
//                                                                  // 
dm_dialogue[?object_get_name(NPC_9)+'0A'+STR_Type] = TYPE_BOKSQ;    // Anju's friend 1
dm_dialogue[?object_get_name(NPC_9)+'0B'+STR_Type] = TYPE_BOKSQ;    // Anju
dm_dialogue[?object_get_name(NPC_9)+'0C'+STR_Type] = TYPE_BOKSQ;    // Anju's friend 2
//                                                                  // 
dm_dialogue[?object_get_name(NPC_C)+'01'+STR_Type] = TYPE_SPLSQ;   // Spell Sequence
dm_dialogue[?object_get_name(NPC_C)+'02'+STR_Type] = TYPE_SPLSQ;   // Spell Sequence
dm_dialogue[?object_get_name(NPC_C)+'03'+STR_Type] = TYPE_SPLSQ;   // Spell Sequence
//                                                                  // 
dm_dialogue[?object_get_name(NPC_B)+'01'+STR_Type] = TYPE_GAME1;   // Mini game
dm_dialogue[?object_get_name(NPC_B)+'02'+STR_Type] = TYPE_GAME2;   // Mini game
dm_dialogue[?object_get_name(NPC_B)+'03'+STR_Type] = TYPE_GAME3;   // Mini game
//                                                                  // 
dm_dialogue[?object_get_name(NPC_D)+'01'+STR_Type] = TYPE_SHOP1;   // Shop Owner
dm_dialogue[?object_get_name(NPC_D)+'02'+STR_Type] = TYPE_SHOP1;   // Shop Owner
//                                                                  // 
dm_dialogue[?object_get_name(Zelda)+'01'+STR_Type] = TYPE_ZLDA1;   // 
dm_dialogue[?object_get_name(Zelda)+'02'+STR_Type] = TYPE_ZLDA2;   // 
//                                                                  // 


init_data_dialogue();


SPR_CURSOR = spr_Menu_Selector_arrow_1a;
cursor_option = 0;
CURSOR_X_OFF = 8;
TEXT_ACCEPT  = "YES";
TEXT_DECLIN  = "NO";


//AdvanceDialogue_SOUND = Audio.SND_WLK_WTR1A;
//AdvanceDialogue_SOUND = Audio.SND_TYPE_CHR1;
//AdvanceDialogue_SOUND = Audio.SND_CRSR_MVE1;


// offset from drawX, drawY
TEXT_X_OFF  =  $10;
TEXT_Y_OFF  =  $10;
text_x_off  =  TEXT_X_OFF;
text_y_off  =  TEXT_Y_OFF;

// The last(4th) line of text is awkwardly right against the window border.
// **** Vertically centering wouldn't work bc as the dlg window closes, the 
//      bottom half of the text would be outside of the window.
// TEXT_Y_OFF +=   -4; 

CLMS    = g.GUI_WIN_CLMS1; // 14
clms    = CLMS;

ROWS_DEF    = $0A;          // Default, OG. 
ROWS_SHOP   = ROWS_DEF + 2; // Shop offer
rows        = ROWS_DEF;

CHAR_PER_LINE_MAX = CLMS-4; // 10(OG)


ANIM_FRAMES_DEF = rows>>1;
anim_frame      = 0;
cnt_draw_rows   = 0;




// g.mod_DLG_SPEED is the x index
dg_DIALOGUE_DELAYS = ds_grid_create(0,5);
_a=-1;
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $05; // next char delay
dg_DIALOGUE_DELAYS[#_a,0] = $2A; // used once before first char
dg_DIALOGUE_DELAYS[#_a,2] = $0B; // next line delay
dg_DIALOGUE_DELAYS[#_a,3] = $2D; // long next line delay
dg_DIALOGUE_DELAYS[#_a,4] = $10; // Zelda end game dlg
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $04; // next char delay
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $03; // next char delay
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $02; // next char delay
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $01; // next char delay
ds_grid_resize(dg_DIALOGUE_DELAYS, (++_a)+1,ds_grid_height(dg_DIALOGUE_DELAYS));
dg_DIALOGUE_DELAYS[#_a,1] = $00; // next char delay
for(_i=1; _i<=_a; _i++)
{
    _val = dg_DIALOGUE_DELAYS[#_i,1] / dg_DIALOGUE_DELAYS[#0,1];
    dg_DIALOGUE_DELAYS[#_i,0] = max($0A, floor(dg_DIALOGUE_DELAYS[#0,0]*_val)); // used once before first char
    dg_DIALOGUE_DELAYS[#_i,2] = max($02, floor(dg_DIALOGUE_DELAYS[#0,2]*_val)); // next line delay
    dg_DIALOGUE_DELAYS[#_i,3] = max($08, floor(dg_DIALOGUE_DELAYS[#0,3]*_val)); // long next line delay
    dg_DIALOGUE_DELAYS[#_i,4] = dg_DIALOGUE_DELAYS[#0,4]; // Zelda end game dlg
}





add_char_tmr = 0;   // 0566




dialogue_DEF        = "UNDEFINED";
dialogue            = dialogue_DEF;
// dialogue            = "";
dlg_line_cnt        = 0; // num of possible lines to write in current dialogue
writ_char_pos       = 0; // char pos of last char written
writ_line_idx       = 0; // 048A. line num of writ_char_pos
writ_line_char_pos  = 0; // 0489. char pos of writ_line_num
writ_dlg            = ""; // what's been written so far
writ_snd            = get_audio_theme_track(dk_TypeChar);
// writ_snd_can_play = true;

MAX_LINES = (rows-2)>>1; // = 4

dl_lines_written = ds_list_create();
repeat(MAX_LINES)
{
    ds_list_add(dl_lines_written,"");
}


dg_dlg = ds_grid_create(0,2);


// TODO: implement system that allows more dlg per conversation.
dg_dlg_idx = 0;
// dg_dlg = ds_grid_create(0,MAX_LINES);

// init_data_dialogue();



//CHAR_BLANK     = "_"; //  
//CHAR_END_LINE1 = "<"; //  '<' End line
//CHAR_END_LINE2 = ">"; //  '>' End line with extra delay



WINDOW_FRAME1_SRF = surface_create(1, ROWS_DEF <<3);
WINDOW_FRAME2_SRF = surface_create(1, ROWS_SHOP<<3);


var _cnt = clms - 2;

// Top & Bottom
TSRC_DATA1  =               "2";           // 2: corner
TSRC_DATA1 += string_repeat("0", _cnt);    // 0: bar hor
TSRC_DATA1 +=               "2";           // 2: corner
// Mid                                          
TSRC_DATA2  =               "1";           // 1: bar ver
TSRC_DATA2 += string_repeat("&", _cnt);    // &: blank
TSRC_DATA2 +=               "1";           // 1: bar ver





/*
chars = ds_map_create();
ds_map_add(chars, "32", "'");
ds_map_add(chars, "34", "?");
ds_map_add(chars, "36", "!");
ds_map_add(chars, "CF", ".");
ds_map_add(chars, "D7", " "); // Don't know what D7 is
ds_map_add(chars, "DA", "A");
ds_map_add(chars, "DB", "B");
ds_map_add(chars, "DC", "C");
ds_map_add(chars, "DD", "D");
ds_map_add(chars, "DE", "E");
ds_map_add(chars, "DF", "F");
ds_map_add(chars, "E0", "G");
ds_map_add(chars, "E1", "H");
ds_map_add(chars, "E2", "I");
ds_map_add(chars, "E3", "J");
ds_map_add(chars, "E4", "K");
ds_map_add(chars, "E5", "L");
ds_map_add(chars, "E6", "M");
ds_map_add(chars, "E7", "N");
ds_map_add(chars, "E8", "O");
ds_map_add(chars, "E9", "P");
ds_map_add(chars, "EA", "Q");
ds_map_add(chars, "EB", "R");
ds_map_add(chars, "EC", "S");
ds_map_add(chars, "ED", "T");
ds_map_add(chars, "EE", "U");
ds_map_add(chars, "EF", "V");
ds_map_add(chars, "F0", "W");
ds_map_add(chars, "F1", "X");
ds_map_add(chars, "F2", "Y");
ds_map_add(chars, "F3", "Z");
ds_map_add(chars, "F4", " ");

dlgData = ds_map_create();
ds_map_add(dlgData, 'A380', 'E9E5DEDAECDEF4E5DEEDFDE6DEF4E1DEE5E9FDF2E8EECFF4DCE8E6DEFDE2E7ECE2DDDECFFF');
ds_map_add(dlgData, 'A3A5', 'E2F4DCDAE7FDEBDEECEDE8EBDEFDF2E8EEEBF4E5E2DFDECFFF');
ds_map_add(dlgData, 'A3BE', 'ECEDE8E9F4DAE7DDFDEBDEECEDF4E1DEEBDECFFF');
ds_map_add(dlgData, 'A3D2', 'E2F4DCDAE7F4E0E2EFDEFDF2E8EEF4E6DAE0E2DCCFFEDCE8E6DEF4DBDADCE4FDDAE7F2EDE2E6DECFFF');
ds_map_add(dlgData, 'A3FB', 'E2F4DAE6F4E6EEDCE1FDEDE8E8F4DBEEECF2FDEDE8F4EDDAE5E4F4EDE8FDDAF4ECEDEBDAE7E0DEEBCFFF');
ds_map_add(dlgData, 'A425', 'E1DEE5E5E836FF');
ds_map_add(dlgData, 'A42C', 'E1DEE5E5E8FDF2E8EEE7E0FDDFDEE5E5E8F0CFFF');
ds_map_add(dlgData, 'A440', 'ECE8EBEBF2CFFDE2F4E4E7E8F0FDE7E8EDE1E2E7E0CFFF');
ds_map_add(dlgData, 'A457', 'DEDADCE1F4EDE8F0E7FDE1DAECF4DAF4F0E2ECDEFDE6DAE7CFF4E5DEDAEBE7FDDFEBE8E6F4E1E2E6CFFF');
ds_map_add(dlgData, 'A481', 'DFE2E7DDF4EDE1DEFDE1DEDAEBEDF4E2E7FDECE8EEEDE1DEEBE7FDE9DAEBDAE9DACFFF');
ds_map_add(dlgData, 'A4A4', 'E8E7E5F2F4EDE1DEFDE1DAE6E6DEEBF4DCDAE7FDDDDEECEDEBE8F2F4DAFDEBE8DADDDBE5E8DCE4CFFF');
ds_map_add(dlgData, 'A4CD', 'F0DEE5DCE8E6DEFDF4F4EDE8FDF4EBDAEEEBEEFF');
ds_map_add(dlgData, 'A4E1', 'E0DEEDF4DCDAE7DDE5DEFDE2E7F4E9DAEBDAE9DAFDE9DAE5DADCDECFFDE0E8F4F0DEECEDCFFF');
ds_map_add(dlgData, 'A507', 'E0E8EBE2F2DAF4E8DFFDEDDAE7EDDAEBE2FDECEDE8E5DEF4E8EEEBFDEDEBE8E9E1F2CFFF');
ds_map_add(dlgData, 'A52B', 'F2E8EEF4ECDAEFDEDDFDEDE1DEF4EDEBE8E9E1F2FEDCE8E6DEF4ECDEDEFDE6F2F4EEE7DCE5DECFFF');
ds_map_add(dlgData, 'A553', 'E2E7F4E9DAEBDAE9DAFDDDDEECDEEBEDF4EEECDEFDEDE1E2ECF4E6DAE0E2DCFDEDE8F4ECEEEBEFE2EFDEFF');
ds_map_add(dlgData, 'A57E', 'E2F4DCDAE7E7E8EDFDE1DEE5E9F4F2E8EEFDDAE7F2E6E8EBDECFFDE0E8F4E7E8F0CFFF');
ds_map_add(dlgData, 'A5A1', 'E1DAE6E6DEEBCFCFCFFEECE9DEDCEDDADCE5DEFDEBE8DCE4CFCFCFFDDDDEDAEDE1F4E6EDE7CFFF');
ds_map_add(dlgData, 'A5C8', 'DDE8F4E7E8EDF4E0E8FDECE8EEEDE1FDF0E2EDE1E8EEEDF4DAFDDCDAE7DDE5DECFFF');
ds_map_add(dlgData, 'A5EA', 'DFE2E7DDF4E6DAE0E2DCFDE2E7F4DAF4DCDAEFDEFDECE8EEEDE1F4E8DFFDEDE1DEF4DCDAECEDE5DECFFF');
ds_map_add(dlgData, 'A614', 'EDE8F0E7FDF4E8DFFDEBEEEDE8FF');
ds_map_add(dlgData, 'A622', 'E2F4DFE8EEE7DDF4DAFDE6E2EBEBE8EBFDEEE7DDDEEBF4EDE1DEFDEDDADBE5DECFFF');
ds_map_add(dlgData, 'A644', 'E2F4E5E8ECEDFDE6F2F4E6E2EBEBE8EBCFFF');
ds_map_add(dlgData, 'A656', 'E8E136F4F2E8EEFDDFE8EEE7DDF4E6F2FDE6E2EBEBE8EB36FDDFE8E5E5E8F0F4E6DECFFF');
ds_map_add(dlgData, 'A67A', 'F0E2EDE1F4EDE1E2ECFDF2E8EEF4DCDAE7FDE3EEE6E9F4EFDEEBF2FDE1E2E0E1CFFF');
ds_map_add(dlgData, 'A69C', 'E2F4DAE6FDDEEBEBE8EBCFFF');
ds_map_add(dlgData, 'A6A8', 'ECE8EEEDE1F4E8DFFDE4E2E7E0ECF4EDE8E6DBFDE2E7F4E6E2DDE8F4E2ECFDDAF4EDEEE7E7DEE5CFFF');
ds_map_add(dlgData, 'A6D1', 'E2E7F4E6E2DDE8EBE8FDECF0DAE6E9F4DFE2E7DDFDDAF4E1DAE7DDF2FDE0E5E8EFDECFFF');
ds_map_add(dlgData, 'A6F5', 'DEF2DEECF4E8DFFDE0DAE7E8E7F4DAEBDEFDDEEFDEEBF2F0E1DEEBDEFDDBDEF4DCDAEBDEDFEEE5FF');
ds_map_add(dlgData, 'A71D', 'F0DAEDDEEBF4EDE8F0E7FDF4F4F4F4E8DFFDF4F4ECDAEBE2DAFF');
ds_map_add(dlgData, 'A737', 'E2DFF4DAE5E5FDDEE5ECDEF4DFDAE2E5ECFDEEECDEF4DFE2EBDECFFF');
ds_map_add(dlgData, 'A753', 'E7E8EDE1E2E7E0CFFF');
ds_map_add(dlgData, 'A75C', 'EBDEEDEEEBE7F4EDE1DEFDDCEBF2ECEDDAE5F4EDE8FDEDE1DEF4E9DAE5DADCDEFDE2E7F4E9DAEBDAE9DACFFF');
ds_map_add(dlgData, 'A788', 'EEECDEF4E4DEF2ECFDE2E7F4E9DAE5DADCDEECFDEDE1DEF2F4DAEBDEFDDFE8EEE7DDF4E2E7CFFF');
ds_map_add(dlgData, 'A7AF', 'EDDAE5E4F4F0E2EDE1FDE6F2F4DFDAEDE1DEEBFDDBDEDFE8EBDEF4F2E8EEFDE5DEDAEFDEF4EDE8F0E7FF');
ds_map_add(dlgData, 'A7D9', 'EEECDEF4EDE1E2ECFDE6DAE0E2DCF4EDE8FDEBDEECEDE8EBDEFDF2E8EEEBF4E5E2DFDECFFF');
ds_map_add(dlgData, 'A7FE', 'E8E7E5F2F4EDE8F0E7FDDFE8E5E4F4E6DAF2FDDCEBE8ECECF4EDE1E2ECFDEBE2EFDEEB36FF');
ds_map_add(dlgData, 'A823', 'F2E8EEF4E4E7E8F0FDDBDAE0EE34F4EDE1DEE7FDE2F4DCDAE7F4E1DEE5E9FDF2E8EEF4DCEBE8ECECCFFF');
ds_map_add(dlgData, 'A84D', 'E7E8F4E8E7DEF4E2ECFDE1DEEBDEF4DBEEEDF4DAFDDCE1EEEBDCE1DBDEE5E5FDF0E2E5E5F4EBE2E7E0CFFF');
ds_map_add(dlgData, 'A878', 'EDE1DEF4E2ECE5DAE7DDFDE9DAE5DADCDEF4E2E7FDEDE1DEF4ECE8EEEDE1FDE1DAECF4DAF4EBDADFEDFF');
ds_map_add(dlgData, 'A8A2', 'DFE2E7DDF4E6DAE0E2DCFDE2E7F4DAF4DCDAEFDEFDE2E7F4E6E8EBEEE0DEFDECF0DAE6E9CFFF');
ds_map_add(dlgData, 'A8C8', 'E1DAEBDBE8EBFDF4EDE8F0E7FDF4F4E8DFFDF4E6E2DDE8FF');
ds_map_add(dlgData, 'A8E0', 'EDE1DEF4DDE8E8EBFDF0E2E5E5F4E7E8EDFDE8E9DEE7CFF4E2EDECFDEFDEEBF2F4EAEEE2DEEDFF');
ds_map_add(dlgData, 'A907', 'E9E5DEDAECDECFF4E6F2FDDDDAEEE0E1EDDEEBFDE2ECF4ECE2DCE4CFFDE1DEE5E9F4E1DEEB36FF');
ds_map_add(dlgData, 'A92E', 'EDE1DEF4F0DAEDDEEBFDE8DFF4E5E2DFDE36FDEAEEE2DCE4F4DCE8E6DEFDF0E2EDE1F4E6DECFFF');
ds_map_add(dlgData, 'A955', 'DAECE4F4DEEBEBE8EBFDE8DFF4EBEEEDE8FDDADBE8EEEDF4EDE1DEFDE9DAE5DADCDECFFF');
ds_map_add(dlgData, 'A979', 'EDE1E2ECF4E6DAE0E2DCFDF0E8EBDDF4F0E2E5E5FDE0E2EFDEF4F2E8EEFDE9E8F0DEEBCFFF');
ds_map_add(dlgData, 'A99E', 'F0E1DEE7F4F2E8EEFDE3EEE6E9F4E9EBDEECECFDDDE8F0E7F0DAEBDDFDEDE8F4ECEDDADBCFFF');
ds_map_add(dlgData, 'A9C4', 'DBDAE0EEF4E2ECF4E6F2FDE7DAE6DECFF4ECE1E8F0FDE6F2F4E7E8EDDEF4EDE8FDEBE2EFDEEBF4E6DAE7CFFF');
ds_map_add(dlgData, 'A9F0', 'F3F3F3CFCFCFFF');
ds_map_add(dlgData, 'A9F7', 'E5DEEDF4E6DEF4DBDE36FDE6DAECEDDEEBF4E2ECFDE2E7F4F0E8E8DDECFDE7F4E8DFF4EBE2EFDEEBFF');
ds_map_add(dlgData, 'AA20', 'EDE1E2ECF4E2ECFDE4E2E7E0ECF4EDE8E6DBFF');
ds_map_add(dlgData, 'AA33', 'ECEDE8E9F4DBF2FDDFE8EBF4DAF0E1E2E5DEFF');
ds_map_add(dlgData, 'AA46', 'EBDEEFE2EFDEDD36FF');
ds_map_add(dlgData, 'AA4F', 'EBDEECEDF4E1DEEBDECFFF');
ds_map_add(dlgData, 'AA5A', 'E1E8F0F4DADBE8EEEDFDEDE1DAED34F4E2EDECFDE6F2F4ECE9DEDCE2DAE5FDE6DEDDE2DCE2E7DECFFF');
ds_map_add(dlgData, 'AA83', 'E2F4E4E7E8F0FDE7E8EDE1E2E7E0CFFF');
ds_map_add(dlgData, 'AA93', 'E9E5DEDAECDEFDECDAEFDEF4E8EEEBFDEDE8F0E736FF');
ds_map_add(dlgData, 'AAA9', 'F2E8EEF4E6EEECEDFDECDAEFDEFDE1F2EBEEE5DE36FF');
ds_map_add(dlgData, 'AABF', 'E2F4DCDAE7F4E7E8EDFDE1DEE5E9F4F2E8EECFFF');
ds_map_add(dlgData, 'AAD3', 'EDE1DEF4EBE2EFDEEBFDDDDEEFE2E5F4DEDAEDECFDEDE1E8ECDEF4F0E1E8FDDAEBDEF4F0DEDAE4CFFF');
ds_map_add(dlgData, 'AAFC', 'E3EEE6E9F4E2E7F4DAFDE1E8E5DEF4E2E7FDEDE1DEF4E9DAE5DADCDEFDE2DFF4F2E8EEF4E0E8CFFF');
ds_map_add(dlgData, 'AB24', 'F0DEE5DCE8E6DEFDF4F4EDE8FDE7DADBE8E8EBEEFF');
ds_map_add(dlgData, 'AB39', 'F0DAE7EDF4EDE8FDE0DEEDF4ECE8E6DEFDF0DAEDDEEB34FF');
ds_map_add(dlgData, 'AB51', 'ECDEDEF4DAF4E6DAE7FDE2E7F4DDDAEBEEE7E2DAFDDBDEDFE8EBDEF4EDE1DEFDE2ECE5DAE7DDECCFFF');
ds_map_add(dlgData, 'AB7A', 'E2F4DAE6FDEDE1E2EBECEDF2CFFF');
ds_map_add(dlgData, 'AB88', 'F2E8EEF4E1DAEFDEFDF0DAEDDEEBCFFDDCE8E6DEF4EDE8FDE6F2F4E1E8EEECDECFFF');
ds_map_add(dlgData, 'ABAA', 'F0E2EDE1F4DBE8E8EDECFDE2F4DCE8EEE5DDFDF0DAE5E4F4E8E7FDEDE1DEF4F0DAEDDEEBCFFF');
ds_map_add(dlgData, 'ABD0', 'DEDAECEDF4E8DFFDEDEBE2E9E5DEF4DEF2DEFDEBE8DCE4F4DAEDFDECDEDAECE1E8EBDECFFF');
ds_map_add(dlgData, 'ABF5', 'DCE8E6DEF4DBDADCE4FDF0E1DEE7F4F2E8EEFDDAEBDEF4EBDEDADDF2CFFF');
ds_map_add(dlgData, 'AC13', 'EDE1E2ECF4E6DAE0E2DCFDF0E2E5E5F4E6DAE4DEFDF2E8EEEBF4ECF0E8EBDDFDECE1E8E8EDF4DFE2EBDEFF');
ds_map_add(dlgData, 'AC3E', 'F2E8EEF4E4E7E8F0FDDAE5E5F4E2F4DCDAE7FDEDDEDADCE1F4F2E8EECFFDE0E8CFFF');
ds_map_add(dlgData, 'AC60', 'EDE1DEF4DDDEEFE2E5FDDDE8DEECF4E7E8EDFDE5E2E4DEF4E7E8E2ECDEFF');
ds_map_add(dlgData, 'AC7E', 'DAF4E9E8F0DEEBDFEEE5FDE4E7E2E0E1EDFDE5E2EFDEECF4E2E7FDEDE1E2ECF4EDE8F0E7CFFF');
ds_map_add(dlgData, 'ACA4', 'E6DAE0E2DCF4E4DEF2FDEBDEDADDECCFCFCFFEEDEBDEDAECEEEBDEFDE8DFF4E4DAECEEEDE8FF');
ds_map_add(dlgData, 'ACCA', 'EDE1DEF4E9DAE5DADCDEFDE1DAECF4DAFDDFDAE5ECDEF4F0DAE5E5FF');
ds_map_add(dlgData, 'ACE6', 'E6E8EEE7EDDAE2E7FDF4EDE8F0E7F4E8DFFDF4DDDAEBEEE7E2DAFF');
ds_map_add(dlgData, 'AD01', 'E2EDF4E2ECF4ECDAE2DDFDEDE1DEF4DEDAECEDFDE8DFF4E7DADBE8E8EBEEFDE1DAECCFCFCFFF');
ds_map_add(dlgData, 'AD27', 'EDE1DEEBDEF4E2ECFDECE8E6DEE8E7DEFDDBDEE1E2E7DDF4EDE1DEFDDDE8E8EB36FF');
ds_map_add(dlgData, 'AD49', 'EBDEECDCEEDEF4EDE1DEFDE4E2DDE7DAE9E9DEDDFDDCE1E2E5DDF4E8E7FDEDE1DEF4E2ECE5DAE7DDFF');
ds_map_add(dlgData, 'AD72', 'F2E8EEF4DAEBDEF4DAFDE1DEEBE8F4DFE8EBFDECDAEFE2E7E0F4E6F2FDDCE1E2E5DDCFDCE8E6DEFF');
ds_map_add(dlgData, 'AD9A', 'EDE1E2ECF4E6DAE0E2DCFDF0E2E5E5FDECEDEBDEE7E0EDE1DEE7FDDAF4ECE1E2DEE5DDCFFF');
ds_map_add(dlgData, 'ADBF', 'F0E1DEE7F4F2E8EEFDE3EEE6E9F4E9EBDEECECFDEEE9F4EDE8F4ECEDDADBCFFF');
ds_map_add(dlgData, 'ADDF', 'F0DEF4E1DADDFDEDE8F4DFE5DEDEFDE4DAECEEEDE8CFFF');
ds_map_add(dlgData, 'ADF6', 'EDE1DEF4E8E5DDFDE6DAE7F4F0E1E8FDEBDEE6DAE2E7ECFDE1DAECF4E6DAE0E2DCCFFF');
ds_map_add(dlgData, 'AE19', '3232323232FF');
ds_map_add(dlgData, 'AE1F', 'E1E2DDDDDEE7FDF4EDE8F0E7FDF4F4E8DFFDE4DAECEEEDE8FF');
ds_map_add(dlgData, 'AE38', 'E5E8E8E4ECF4E5E2E4DEFDE2F4DCDAE7F4E0DEEDFDE2E7F4EDE1DEFDDFE2EBDEE9E5DADCDECFFF');
ds_map_add(dlgData, 'AE5F', 'DCDAE5E5F4DFE8EBFDE1DEE5E9F4DAEDFDEDE1DEF4EDE1EBDEDEFDDEF2DEF4EBE8DCE4ECCFFF');
ds_map_add(dlgData, 'AE85', 'EDE1DEF4E1E8E5DEFDE2E7F4E9DAE5DADCDEFDE2ECF4DEE7DDE5DEECECFDEDEBDAE9CFFF');
ds_map_add(dlgData, 'AEA9', 'DDE8F4F2E8EEFDE1DAEFDEF4EDE1DEFDD7F4E6DAE0E2DCFDDCE8E7EDDAE2E7DEEBECFF');
ds_map_add(dlgData, 'AECC', 'F2E8EEFDDDDEECDEEBEFDEFDE6F2F4E1DEE5E9CFFDDFE8E5E5E8F0F4E6DECFFF');
ds_map_add(dlgData, 'AEEC', 'EDE1DEEBDEF4E2ECFDDAF4ECDEDCEBDEEDFDDAEDF4DEDDE0DEFDE8DFF4EDE8F0E7CFFF');
ds_map_add(dlgData, 'AF0F', 'EBDEE6DEE6DBDEEBFDEDE1DEF4E6DAE0E2DCFDF0E8EBDDCFFF');
ds_map_add(dlgData, 'AF28', 'E4DAECEEEDE8CFFDECEDEBDAE7E0DECFCFCFFEE2EDF4E2ECFDDDDEECDEEBEDDEDDCFFF');
ds_map_add(dlgData, 'AF4B', 'EDE1DEF4EDE8F0E7FDE2ECF4DDDEDADDCFFEE5E8E8E4F4DEDAECEDFDE2E7F4F0E8E8DDECCFFF');
ds_map_add(dlgData, 'AF71', 'E2F4DCDAE7F4E0E2EFDEFDF2E8EEF4E6E8ECEDFDE9E8F0DEEBDFEEE5FDE6DAE0E2DCCFFF');
ds_map_add(dlgData, 'AF95', 'F2E8EEF4DAEBDEFDE9DEEBECE2ECEDDEE7EDFDDFE2E7DDF4E1DEDAEBEDFDE8EFDEEBF4E8DCDEDAE7FF');
*/




if (DEV)
{
    show_debug_message("DialogueWindow_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




