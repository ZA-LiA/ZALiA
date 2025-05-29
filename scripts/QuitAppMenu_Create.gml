/// QuitAppMenu_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("QuitAppMenu_Create() START");
}


var _i, _a, _count;


PI_MENU1 = global.PI_GUI1;
gui_state_backup    = 0;

                         _a=1;
sub_state_IDLE_CLOSED  = _a++;
sub_state_OPENING1     = _a++;
sub_state_OPENING2     = _a++;
sub_state_OPENING_ANIM = _a++;
sub_state_OPEN1        = _a++;
sub_state_CLOSING1     = _a++;
sub_state_CLOSING2     = _a++;
sub_state_CLOSING_ANIM = _a++;
sub_state_CLOSING3     = _a++;
sub_state              = sub_state_IDLE_CLOSED;


TEXT_CONFIRM    = "GO TO THE CONTINUE-SAVE SCREEN?";
TEXT_WARNING    = "THIS IS CONSIDERED A GAME OVER.";
/*
TEXT_CONFIRM    = "QUIT TO THE TITLE SCREEN?";
//TEXT_CONFIRM    = "ARE YOU SURE YOU WANT TO QUIT THE APP?";
TEXT_WARNING    = "ANY UNSAVED PROGRESS WILL BE LOST.";
//TEXT_WARNING    = "YOU WILL LOSE ANY UNSAVED PROGRESS.";
//TEXT_METR  = "....." + "....."; // broke in 5's so easy to read/count
*/

cursor_option   = 0; // 0: No, 1: Yes


will_go_to_continuesave = false;


CLMS  = max(string_length(TEXT_CONFIRM),string_length(TEXT_WARNING));
CLMS += 4;
//CLMS  = g.GUI_WIN_CLMS2; // g.GUI_WIN_CLMS2 = 24
ROWS  = $0A; // 
//ROWS  = g.pm.ROWS_WIN_DEF; // 8p tall

ANIM_FRAMES_DEF = ROWS>>1; // 11
anim_frame      = 0;
cnt_draw_rows   = 0;

RequestQuit_DUR1  = $40;
RequestQuit_timer = 0;


_count = CLMS-2;
// Top & Bottom
var _TSRC_DATA1  =               "2";         // 2: corner
    _TSRC_DATA1 += string_repeat("0",_count); // 0: bar hor
    _TSRC_DATA1 +=               "2";         // 2: corner
// Mid                                          
var _TSRC_DATA2  =               "1";         // 1: bar ver
    _TSRC_DATA2 += string_repeat("&",_count); // &: blank
    _TSRC_DATA2 +=               "1";         // 1: bar ver
// Hor section bar                              
var _TSRC_DATA3  =               "1";         // 1: bar ver
    _TSRC_DATA3 += string_repeat("0",_count); // 0: bar hor
    _TSRC_DATA3 +=               "1";         // 1: bar ver
//                                              
dl_tsrc_data = ds_list_create();
for(_i=0; _i<ROWS; _i++) ds_list_add(dl_tsrc_data,_TSRC_DATA2); // Mids
dl_tsrc_data[|0]      = _TSRC_DATA1; // Top
dl_tsrc_data[|ROWS-1] = _TSRC_DATA1; // Bottom




if (DEV)
{
    show_debug_message("QuitAppMenu_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




