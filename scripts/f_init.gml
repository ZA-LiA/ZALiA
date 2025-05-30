/// f_init()

// f: file. Save file data. Includes player stats

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("f_init() START");
}


var _i,_j, _val;
var _datakey, _name, _file_num;
var _file_name, _file, _file_data;


depth = DEPTH_f;





// SDNAME: Save Data Name
SDNAME_saveCreated          = "save_created";
SDNAME_save_name            = "save_name";


SDNAME_questNum             = "quest_num";
SDNAME_deathCount           = "death_count";

SDNAME_level_atk            = "level_atk";
SDNAME_level_mag            = "level_mag";
SDNAME_level_lif            = "level_lif";

SDNAME_cont_pieces_hp       = "cont_pieces_hp";
SDNAME_cont_pieces_mp       = "cont_pieces_mp";

SDNAME_spells               = "spells";
SDNAME_items                = "items";
SDNAME_skills               = "skills";

SDNAME_crystals             = "crystals";
SDNAME_kakusu               = "kakusu";
SDNAME_takenKeys            = "keys";
SDNAME_openedLocks          = "locks";
SDNAME_takenPBags           = "pbags";
SDNAME_linkDolls            = "link_dolls";

SDNAME_quests               = "quests";
// SDNAME_npcAdvice            = "npcAdvice";
SDNAME_exploredRooms        = "visited_rooms";
SDNAME_fastTravel           = "fast_travel";

// SDNAME_Save_Town_Num        = "_Save_Town_Num";



SDNAME_volume_sound         = "_volume_sound";
SDNAME_volume_music         = "_volume_music";








dl_FILE_NAME_PREFIX = ds_list_create();
dl_file_names = ds_list_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    ds_list_add(dl_FILE_NAME_PREFIX, "SaveFile_"+string(_i+1));
    ds_list_add(dl_file_names, dl_FILE_NAME_PREFIX[|_i]+".txt");
}




global.dm_save_file_data = ds_map_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++) // Each save file
{
    _file_name = dl_file_names[|_i];
    _file      = file_text_open_read(working_directory+_file_name);
    _file_data = file_text_read_string(_file);
                 file_text_close(      _file);
    global.dm_save_file_data[?STR_Save+STR_File+hex_str(_i+1)+"_Encoded"] = _file_data;
}




dl_save_names = ds_list_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    ds_list_add(dl_save_names, get_saved_value(_i+1, SDNAME_save_name,SAVE_NAME_NULL));
}








file_num = -1; // default -1 so I get an error if it's not in range
//save_name   = SAVE_NAME_NULL;



quest_num = 1; // 1: first game play-through, 2: beat game once (new game +)
game_completed_count = 0;
death_count = 0;


 
level_atk = 1;
level_mag = 1;
level_lif = 1;



//dm_cont = ds_map_create();

CONT_MIN             = 3;
CONT_MAX             = 9;
CONT_PIECE_PER       = 3;
CONT_PIECE_MAX       = CONT_MAX * CONT_PIECE_PER;

CONT_MIN_HP          = CONT_MIN; // Starting containers: Heart 
CONT_MAX_HP          = CONT_MAX;
CONT_PIECE_PER_HP    = CONT_PIECE_PER;
CONT_PIECE_MIN_HP    = CONT_MIN_HP * CONT_PIECE_PER_HP;
CONT_PIECE_MAX_HP    = CONT_MAX_HP * CONT_PIECE_PER_HP;

CONT_MIN_MP          = CONT_MIN; // Starting containers: Magic 
CONT_MAX_MP          = CONT_MAX;
CONT_PIECE_PER_MP    = CONT_PIECE_PER;
CONT_PIECE_MIN_MP    = CONT_MIN_MP * CONT_PIECE_PER_MP;
CONT_PIECE_MAX_MP    = CONT_MAX_MP * CONT_PIECE_PER_MP;

HP_MAX = CONT_MAX_HP * Container_AMT;
MP_MAX = CONT_MAX_MP * Container_AMT;


                                        CONT_PIECES_HP_DEF  = "";
 for(_i=1; _i<=CONT_MIN_HP;       _i++)
{for(_j=1; _j<=CONT_PIECE_PER_HP; _j++) CONT_PIECES_HP_DEF += (hex_str(_i)+hex_str(_j));}
cont_pieces_hp = CONT_PIECES_HP_DEF;


                                        CONT_PIECES_MP_DEF  = "";
 for(_i=1; _i<=CONT_MIN_MP;       _i++)
{for(_j=1; _j<=CONT_PIECE_PER_MP; _j++) CONT_PIECES_MP_DEF += (hex_str(_i)+hex_str(_j));}
cont_pieces_mp = CONT_PIECES_MP_DEF;


CONT_PIECES_HP_DEF = cont_pieces_hp;
CONT_PIECES_MP_DEF = cont_pieces_mp;


hp = get_stat_max(STR_Heart);
mp = get_stat_max(STR_Magic);

//(string_length(f.cont_pieces_hp) >>2) div f.CONT_PIECE_PER_HP;



spells = 0; // bits representing aquired spells
items  = 0; // bits representing aquired items

// SKILL_THD = $01; // Down THrust
// SKILL_THU = $02; // Up THrust
// SKILL_SPR = $04; // SPRing
// SKILL_CHS = $08; // CHarge Stab
skills = 0; // bits represent the aquired skills

                      _a=1;
CuccoSkill_THRUST_D = _a; _a=_a<<1;
CuccoSkill_THRUST_U = _a; _a=_a<<1;
CuccoSkill_BREAK1   = _a; _a=_a<<1;
CuccoSkill_PROJ1    = _a; _a=_a<<1;
CuccoSkill_PROJ2    = _a; _a=_a<<1;

Cucco_skills        = 0;
//CuccoSkillsCondition_VER = 1; // 1: Player must acquire g.CuccoSpell2_Acquired from hiding wiseman



// TODO: Should player lose the BOTTLE contents when using CONTINUE at game over?
//bottle1_state = 0;
//bottle2_state = 0;




dm_jars_DEFAULT = ds_map_create(); // 
dm_jars         = ds_map_create(); // Red bottles restock after leaving area


dm_1up_doll_DEFAULT = ds_map_create(); // 
dm_1up_doll         = ds_map_create(); // Which Link dolls have been taken


dm_PBags_DEFAULT = ds_map_create(); // 
dm_PBags         = ds_map_create(); // 
//dm_takenPBags   = ds_map_create(); // Which pBags have been taken


// datakey structure for f.dm_keys depends on the spawn source of the key.
// For a key dropped by a challenge/enemy, the key's datakey is based off 
// specifics of that challenge/enemy that dropped the key.
dm_keys_DEFAULT = ds_map_create(); // 
dm_keys         = ds_map_create(); // Which keys have been taken (defined) & if they've been used (1 unused, 0 used)
key_count       = 0; // How many keys are in Link's possesion
dm_openedLocks  = ds_map_create(); // Which locks have been opened


// kakusu: hide, conceal, be hidden
dm_kakusu       = ds_map_create(); // Which kakusu have been killed
kakusu_count    = 0; // How many kakusu have been killed


dm_explored     = ds_map_create();


dm_quests       = ds_map_create();
dm_challenges   = ds_map_create();


dm_rando        = ds_map_create(); // rando data for the current loaded save file




init_save_data1();

BuildBridge_QUAL_DK = STR_Bridge+STR_Qualified;

quests = ""; // The dm_quests map encoded



CRYSTAL_MAX = 6;
crystals    = 0; // A bit based value representing WHICH crystals have been placed


LIVES_MAX   = 99;
lives       = g.STARTING_LIVES;
xp          = 0;
xpPending   = 0;
xpNext      = 0; // 50
xpDrain     = 0; // 05E8. For enemies that drain xp


// 256,512,1024,2048,  4096,8192,16384,32768
// 0010 0111 0000 1111
// 8192+1024+512+256+15 = 9999


//              atk                mag                lif
// byte2 = "000103070B131F23"+"00010204080D1723"+"0000010305090F23"; // 9659-9670
// byte1 = "C8F4E8D0B8884028"+"642CBCB098AC7028"+"32969020DCC4A028"; // 9671-9688
dg_xp_next = ds_grid_create(3, STAT_LEVEL_MAX+1);

dg_xp_next[#STAT_ATK,$00] =   100; // $0064
dg_xp_next[#STAT_ATK,$01] =   200; // $00C8
dg_xp_next[#STAT_ATK,$02] =   500; // $01F4
dg_xp_next[#STAT_ATK,$03] =  1000; // $03E8
dg_xp_next[#STAT_ATK,$04] =  2000; // $07D0
dg_xp_next[#STAT_ATK,$05] =  3000; // $0BB8
dg_xp_next[#STAT_ATK,$06] =  5000; // $1388
dg_xp_next[#STAT_ATK,$07] =  8000; // $1F40
dg_xp_next[#STAT_ATK,$08] =  9900; // $26AC
dg_xp_next[#STAT_ATK,$09] =  XP_MAX; // 9999: $270F

dg_xp_next[#STAT_MAG,$00] =    70; // $0046
dg_xp_next[#STAT_MAG,$01] =   100; // $0064
dg_xp_next[#STAT_MAG,$02] =   300; // $012C
dg_xp_next[#STAT_MAG,$03] =   700; // $02BC
dg_xp_next[#STAT_MAG,$04] =  1200; // $04B0
dg_xp_next[#STAT_MAG,$05] =  2200; // $0898
dg_xp_next[#STAT_MAG,$06] =  3500; // $0DAC
dg_xp_next[#STAT_MAG,$07] =  6000; // $1770
dg_xp_next[#STAT_MAG,$08] =  9500; // $251C
dg_xp_next[#STAT_MAG,$09] =  XP_MAX; // 9999: $270F

dg_xp_next[#STAT_LIF,$00] =    30; // $001E
dg_xp_next[#STAT_LIF,$01] =    50; // $0032
dg_xp_next[#STAT_LIF,$02] =   150; // $0096
dg_xp_next[#STAT_LIF,$03] =   400; // $0190
dg_xp_next[#STAT_LIF,$04] =   800; // $0320
dg_xp_next[#STAT_LIF,$05] =  1500; // $05DC
dg_xp_next[#STAT_LIF,$06] =  2500; // $09C4
dg_xp_next[#STAT_LIF,$07] =  4000; // $0FA0
dg_xp_next[#STAT_LIF,$08] =  9000; // $2328
dg_xp_next[#STAT_LIF,$09] =  XP_MAX; // 9999: $270F



dg_xp_next_DEFAULT = ds_grid_create(0,0);
ds_grid_copy(dg_xp_next_DEFAULT,dg_xp_next);



/*
// see FileSelect_Step() and MiniGameA_init() to see how this is used
dm_target_game=ds_map_create();
dm_target_game[?STR_List+STR_Idx]=0;
dm_target_game[?STR_List+STR_Size]=0;
*/



cont_run_dngn_num = 0;
cont_run_town_num = 0;

// REEN: Rm Entry Exit Name
// Most of these are taken care of in g.Room_Start
REEN_NEW_FILE = EXIT_NAME_GAME_START;
reen_new_run  = REEN_NEW_FILE; // Coming from FileSelect. This will be from saved data
reen          = reen_new_run;  // The exit to spawn at

// rlen: Rm Leave Exit Name
// rlen = undefined;


//debug_changeSaveData();




if (DEV)
{
    show_debug_message("f_init() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




