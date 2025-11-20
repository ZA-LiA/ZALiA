/// Cutscene_MoaiOpenMouth_1_init_2()


var _i, _a, _val, _count;


if (x){ // x>0 if using new tile data file, Kakusu positions have moved
var _CLMS1 = $0A;
var _CLMS2 = $17;
var _CLM1  = $32;
}else{
var _CLMS1 = $0A;
var _CLMS2 = $1D;
var _CLM1  = $2F;
}
var _CLM2  = _CLM1 + _CLMS1;
var _CLM3  = _CLM2 + _CLMS2;
var _CLM4  = _CLM3 + _CLMS1;
var _row;
var _ROW0  = g.rm_rows - PAGE_ROWS;
var _ROWS1 = $07;



scr_step = Cutscene_MoaiOpenMouth_1_update;




var _MAX_KAKUSU = val(g.dm_spawn[?STR_Kakusu+STR_Count], 12);
//DEFEATED_GOAL = get_saved_value(f.file_num, STR_Kakusu+STR_Required+STR_Count, _MAX_KAKUSU);
DEFEATED_GOAL = val(global.dm_save_file_settings[?STR_Kakusu+STR_Required+STR_Count], _MAX_KAKUSU);



DEFEATED_COUNT   = 0;

TurnedIn_count   = 0;
TurnedIn_DATAKEY = "_Turned_In"+STR_Count;


// TODO: Determine which sprite each specific Kakusu uses
dg_TurnedIn = ds_grid_create(_MAX_KAKUSU, 5);
_row = _ROW0 + $18;
//                                                  //
dg_TurnedIn[#$00,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$00,3] = _CLM1<<3;
dg_TurnedIn[#$00,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$01,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$01,3] = _CLM2<<3;
dg_TurnedIn[#$01,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$02,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$02,3] = _CLM3<<3;
dg_TurnedIn[#$02,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$03,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$03,3] = _CLM4<<3;
dg_TurnedIn[#$03,4] = _row <<3;
//                                                  //
_row -= _ROWS1;
//                                                  //
dg_TurnedIn[#$04,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$04,3] = _CLM1<<3;
dg_TurnedIn[#$04,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$05,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$05,3] = _CLM2<<3;
dg_TurnedIn[#$05,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$06,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$06,3] = _CLM3<<3;
dg_TurnedIn[#$06,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$07,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$07,3] = _CLM4<<3;
dg_TurnedIn[#$07,4] = _row <<3;
//                                                  //
_row -= _ROWS1;
//                                                  //
dg_TurnedIn[#$08,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$08,3] = _CLM1<<3;
dg_TurnedIn[#$08,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$09,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$09,3] = _CLM2<<3;
dg_TurnedIn[#$09,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$0A,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$0A,3] = _CLM3<<3;
dg_TurnedIn[#$0A,4] = _row <<3;
//                                                  //
dg_TurnedIn[#$0B,1] = irandom(2); // sprite type 0,1,2
dg_TurnedIn[#$0B,3] = _CLM4<<3;
dg_TurnedIn[#$0B,4] = _row <<3;
//                                                  //
//                                                  //
_count = ds_grid_width(dg_TurnedIn);
for(_i=0; _i<_count; _i++)
{
    dg_TurnedIn[#_i,1] = val(f.dm_kakusu[?hex_str(_i+1)+STR_Sprite+STR_Type], dg_TurnedIn[#_i,1]);
}









if(!is_undefined(                     dk_spawn))
{   TurnedIn_count = val(f.dm_quests[?dk_spawn+TurnedIn_DATAKEY]);  }




if(0){// *** TESTING ***
f.kakusu_count=4+sign(TurnedIn_count); // defeated count
f.dm_kakusu[?STR_Defeated+STR_Count]=f.kakusu_count;
//DEFEATED_GOAL=7;
}


DEFEATED_COUNT = get_kakusu_count();
//DEFEATED_COUNT  = DEFEATED_GOAL; // TESTING *********************************
//DEFEATED_COUNT  = 5; // TESTING *********************************



spawn_xl = (($47<<3)+4) - ww_;
spawn_yt = (_ROW0+$1B)<<3;
set_xlyt(id, spawn_xl,spawn_yt);
//sdm("spawn_xl $"+hex_str(spawn_xl)+", spawn_yt $"+hex_str(spawn_yt));



if (TurnedIn_count>=DEFEATED_GOAL)
{
    with(Exit)
    {
        if (exitNum&$FF==g.EXIT_DIR_MID)
        {
            open = 1;
            break;//with(Exit)
        }
    }
    
    
    rows_up = ROWS;
    set_xlyt(id, xl, spawn_yt-hh);
    sub_state = SUB_STATE_DONE;
}
//sdm("hh $"+hex_str(hh)+", spawn_yt $"+hex_str(spawn_yt)+", ROWS "+string(ROWS)+", rows_up "+string(rows_up)+", rows_up<<3 $"+hex_str(rows_up<<3));

for(_i=0; _i<TurnedIn_count; _i++)
{
    dg_TurnedIn[#_i,0] = 1;
}


if (TurnedIn_count>=DEFEATED_COUNT)
{
    timer = 0;
    sub_state = SUB_STATE_DONE;
}




