/// file_load(file num)


var _i,_j,_k,_m, _idx1,_idx2, _num;
var _val, _val1,_val2,_val3,_val4;
var _count,_count1,_count2;
var _datakey,_datakey1,_datakey2,_dk1,_dk2,_dk3;
var _str1,_str2,_str3, _pos, _len;
var _rm_name, _scene_name, _ver;
var _spell;


var _FILE_NUM  = clamp(argument0, 1,SAVE_FILE_MAX);
var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];

if(!file_exists(_FILE_NAME))
{
    show_debug_message("");
    show_debug_message("!!!! WARNING! CANNOT LOAD FILE "+string(_FILE_NUM)+"  '"+_FILE_NAME+"'.  FILE DOES NOT EXIST !!!!");
    show_debug_message("");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
var _FILE_DATA = file_text_read_string(_FILE);
                 file_text_close(      _FILE);
var _dm_file_data = json_decode(_FILE_DATA);

if (_dm_file_data==-1) // `json_decode` returns -1 if it fails
{
    show_debug_message("");
    show_debug_message("!!!! WARNING! file_load(). `_dm_file_data` failed to get data from '"+_FILE_NAME+"' !!!!");
    show_debug_message("");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








//                                                                              // 
// f.saveCreated           = _dm_file_data[?f.SDNAME_saveCreated];
//                                                                              // 
//f.ar_SAVE_NAMES[_FILE_NUM-1] =  val(_dm_file_data[?f.SDNAME_save_name], SAVE_NAME_NULL);
//f.save_name             =       val(_dm_file_data[?f.SDNAME_save_name], SAVE_NAME_NULL);
f.quest_num             = clamp(val(_dm_file_data[?f.SDNAME_questNum]), 1,2);
f.game_completed_count  =       val(_dm_file_data[?STR_Game+STR_Complete+STR_Count]);
f.death_count           =       val(_dm_file_data[?f.SDNAME_deathCount]);
//                                                                              // 
f.level_atk             = clamp(val(_dm_file_data[?f.SDNAME_level_atk]), 1,STAT_LEVEL_MAX);
f.level_mag             = clamp(val(_dm_file_data[?f.SDNAME_level_mag]), 1,STAT_LEVEL_MAX);;
f.level_lif             = clamp(val(_dm_file_data[?f.SDNAME_level_lif]), 1,STAT_LEVEL_MAX);
//                                                                              // 
f.cont_pieces_hp        =       val(_dm_file_data[?f.SDNAME_cont_pieces_hp], f.CONT_PIECES_HP_DEF);
f.cont_pieces_mp        =       val(_dm_file_data[?f.SDNAME_cont_pieces_mp], f.CONT_PIECES_MP_DEF);
//sdm("f.cont_pieces_hp $"+hex_str(f.cont_pieces_hp)+", f.cont_pieces_mp $"+hex_str(f.cont_pieces_mp));
//                                                                              // 
f.spells                =       val(_dm_file_data[?f.SDNAME_spells]);
f.items                 =       val(_dm_file_data[?f.SDNAME_items]);
f.skills                =       val(_dm_file_data[?f.SDNAME_skills]);
f.Cucco_skills          =       val(_dm_file_data[?STR_Skill+STR_Cucco]);
g.CuccoSpell2_Acquired  =       val(_dm_file_data[?STR_Cucco+STR_Spell+"02"+STR_Acquired]);
//g.CuccoSpell2_Acquired  =       val(_dm_file_data[?STR_Cucco+STR_Permanant]);
//                                                                              // 
f.crystals              =       val(_dm_file_data[?f.SDNAME_crystals]);
var _kakusu             =       val(_dm_file_data[?f.SDNAME_kakusu]);
var _taken_keys         =       val(_dm_file_data[?f.SDNAME_takenKeys]);
var _opened_locks       =       val(_dm_file_data[?f.SDNAME_openedLocks]);
var _1up_dolls          =       val(_dm_file_data[?f.SDNAME_linkDolls]);
//                                                                              // 
var _taken_pbags        =       val(_dm_file_data[?f.SDNAME_takenPBags]);
var _pbags              =       val(_dm_file_data[?STR_PBAG]);
//                                                                              // 
var _quests             =       val(_dm_file_data[?f.SDNAME_quests]);
var _explored_rooms     =       val(_dm_file_data[?f.SDNAME_exploredRooms]);
//f.fastTravel            =       val(_dm_file_data[?f.SDNAME_fastTravel]);
//                                                                              // 
if (g.mod_ContinueFrom&g.mod_ContinueFrom_TWN2)
{   f.cont_run_town_num =       val(_dm_file_data[?STR_Save+STR_Town+STR_Num]);  }
//                                                                              // 
f.xp                    =       val(_dm_file_data[?STR_XP]);
//                                                                              // 




ds_map_clear(f.dm_1up_doll);
             f.dm_1up_doll    = json_decode(_1up_dolls);
//show_debug_message("file_load(). ds_map_size(f.dm_1up_doll)="+string(ds_map_size(f.dm_1up_doll)));
//
ds_map_clear(f.dm_kakusu);
             f.dm_kakusu      = json_decode(_kakusu);
//
ds_map_clear(f.dm_keys);
             f.dm_keys        = json_decode(_taken_keys);
//
ds_map_clear(f.dm_openedLocks);
             f.dm_openedLocks = json_decode(_opened_locks);
//
ds_map_clear(f.dm_PBags);
             f.dm_PBags       = json_decode(_pbags);
//
ds_map_clear(f.dm_explored);
             f.dm_explored    = json_decode(_explored_rooms);
//
ds_map_clear(f.dm_quests);
             f.dm_quests      = json_decode(_quests);
//


ds_map_clear(g.dm_room_history);
ds_map_clear(g.dm_RandoHintsRecorder);








// ===================================================================
// RANDO -----------------------------------------------------------
ds_map_clear(f.dm_rando);
var _QUEST_KEY = STR_Quest+hex_str(f.quest_num);

var              _rando_data = _dm_file_data[?_QUEST_KEY+STR_Rando+STR_Data];
if(!is_undefined(_rando_data))
{
    var _dm_rando = json_decode(_rando_data);
    ds_map_copy(f.dm_rando,_dm_rando);
    ds_map_destroy(_dm_rando); _dm_rando=undefined;
}




// Hints ---------------------------------------------------------
ds_map_clear(g.dm_RandoHintsRecorder);
var _FOUND_HINTS = _dm_file_data[?STR_Found+STR_Hint];
if(!is_undefined(_FOUND_HINTS)) g.dm_RandoHintsRecorder = json_decode(_FOUND_HINTS);




// Overworld Biomes ----------------------------------------------
_val = f.dm_rando[?STR_Overworld+STR_TSRC+STR_Randomized];
if(!is_undefined(_val))
{
    ds_map_clear(global.OVERWORLD.dm_Rando_TSRC);
    global.OVERWORLD.dm_Rando_TSRC = json_decode(_val);
}




// Dungeon Tileset Rando
_val = f.dm_rando[?STR_Randomized+"_Tiles"+"01"];
if(!is_undefined(_val))
{
    ds_map_read(global.dm_randomized_tiles01, _val);
}
//dm_save_data[?STR_Randomized+"_Tiles"+"01"] = ds_map_write(_dm_randomized_tiles);




if (val(_dm_file_data[?STR_Rando+STR_Active]))
//if (val(_dm_file_data[?_QUEST_KEY+STR_Rando+STR_Active]))
{
    var _DEBUG_RANDO = true;
    
    var              _rando_data = _dm_file_data[?_QUEST_KEY+STR_Rando+STR_Data];
    if(!is_undefined(_rando_data))
    {
        var _obj, _str;
        var _item_id, _item_datakey,_item_datakey1, _item_datakey_base, _spawn_datakey,_spawn_datakey1;
        var _town_name;
        
        
        f.dm_rando[?STR_Rando+STR_Active] = true;
        
        
        
        
        // Enemy HP ----------------------------------------------
        _datakey=STR_Enemy+STR_HP;
        if (val(f.dm_rando[?STR_Randomize+_datakey]))
        {
            for(_i=ds_list_size(g.dl_HP)-1; _i>=0; _i--)
            {
                g.dl_HP[|_i] = val(f.dm_rando[?_datakey+hex_str(_i)]);
            }
        }
        
        
        
        
        // Enemy Damage -------------------------------------------
        _datakey=STR_Enemy+STR_Damage;
        if (val(f.dm_rando[?STR_Randomize+_datakey]))
        {
            var _EnemyDamage_level_COUNT=ds_grid_height(g.dg_enemy_damage);
            for(_i=ds_grid_width(g.dg_enemy_damage)-1; _i>=0; _i--) // LIFE Level
            {
                for(_j=_EnemyDamage_level_COUNT-1; _j>=0; _j--) // Enemy Damage Level
                {
                    g.dg_enemy_damage[#_i,_j] = val(f.dm_rando[?_datakey+hex_str(_i)+hex_str(_j)], g.dg_enemy_damage[#_i,_j]);
                }
            }
        }
        
        
        
        
        // Level Costs ----------------------------------------------
        _datakey=STR_Level+STR_Cost;
        if (val(f.dm_rando[?STR_Randomize+_datakey]))
        {
            _count1 = ds_grid_width( f.dg_xp_next);
            _count2 = ds_grid_height(f.dg_xp_next);
            for(_i=0; _i<_count1; _i++)
            {
                for(_j=0; _j<_count2; _j++)
                {
                    _datakey1 = _datakey+hex_str(_i)+hex_str(_j);
                    f.dg_xp_next[#_i,_j] = val(f.dm_rando[?_datakey1], f.dg_xp_next[#_i,_j]);
                }
            }
        }
        
        
        
        
        // XP ----------------------------------------------
        _datakey=STR_XP;
        if (val(f.dm_rando[?STR_Randomize+_datakey]))
        {
            for(_i=ds_list_size(g.dl_XP)-1; _i>=0; _i--)
            {
                g.dl_XP[|_i] = val(f.dm_rando[?_datakey+hex_str(_i)]);
            }
        }
        
        
        
        
        // Spell Costs -------------------------------------------------
        _datakey=STR_Spell+STR_Cost;
        if (val(f.dm_rando[?STR_Randomize+_datakey]))
        {
            _count1 = ds_grid_width( g.dg_spell_cost);
            _count2 = ds_grid_height(g.dg_spell_cost);
            for(_i=0; _i<_count1; _i++)
            {
                _spell = sign(_i)<<max(_i-1,0); // spell bit
                for(_j=0; _j<_count2; _j++)
                {
                        _val = val(f.dm_rando[?_datakey+hex_str(_i)+hex_str(_j)]);
                    if (_val)
                    {
                        _val1 = val(g.dm_Spell[?hex_str(_spell)+STR_Rando+STR_Cost+STR_Max], _val);
                        _val  = min(_val,_val1);
                        g.dg_spell_cost[#_i,_j] = _val;
                    }
                }
            }
        }
        
        
        
        
        // Spell Locations ------------------------------------------------
        if (val(f.dm_rando[?STR_Randomize+STR_Spell+STR_Locations]))
        {                                                              _i=0;
            while(!is_undefined(g.dm_town[?STR_Town+STR_Name+hex_str(++_i)]))
            {
                _town_name =    g.dm_town[?STR_Town+STR_Name+hex_str(  _i)];
                _spawn_datakey = g.dm_spawn[?"_Wise"+"_Man"+STR_Spawn+STR_Datakey+_town_name];
                if(!is_undefined(_spawn_datakey))
                {
                    _spell_name = val(f.dm_rando[?_town_name+STR_Spell], "undefined");
                    _val = val(g.dm_Spell[?STR_Bit+_spell_name]);
                    if (_val)
                    {
                        g.dm_spawn[?STR_Spell+STR_Bit+_spawn_datakey] = _val;
                        _str = string_repeat(" ", string_length(STR_Old_Kasuto)-string_length(_town_name));
                        //sdm(_town_name+_str+_spell_name+",      "+_spawn_datakey);
                    }
                }
            }
        }
        
        
        
        
        // Items ----------------------------------------------------
        if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]))
        {
            var           _COUNT = val(f.dm_rando[?STR_Total+STR_Location+STR_Count]);
            for(_i=1; _i<=_COUNT; _i++)
            {   // change spawn data to match what was randomized on file creation
                _datakey1 = STR_Location+hex_str(_i);
                
                _spawn_datakey = f.dm_rando[?_datakey1+STR_Spawn+STR_Datakey];
                _item_id       = f.dm_rando[?_datakey1+STR_Item+STR_ID+STR_Randomized];
                if(!is_undefined(_spawn_datakey) 
                && !is_undefined(_item_id) )
                {
                    g.dm_spawn[?_spawn_datakey+STR_Item+STR_ID+STR_Randomized] = _item_id;
                    g.dm_spawn[?_item_id+STR_Spawn+STR_Datakey+STR_Randomized] = _spawn_datakey;
                }
                //sdm("ITEM: "+string(val(_item_id))+".  "+"location_num: $"+hex_str(_i)+", _spawn_datakey '"+string(val(_spawn_datakey))+"'");
            }
        }
        
        
        
        
        if (val(f.dm_rando[?STR_Randomize+STR_Spell+STR_Locations]) 
        ||  val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) 
        ||  val(f.dm_rando[?STR_Randomize+STR_Spell+STR_Cost]) )
        {
            _count1 = ds_grid_width( g.dg_spell_cost);
            _count2 = ds_grid_height(g.dg_spell_cost);
            for(_i=0; _i<_count1; _i++) // each spell
            {
                _spell = sign(_i)<<max(_i-1,0); // spell bit
                for(_j=0; _j<_count2; _j++) // each magic level
                {
                    _val  = g.dg_spell_cost[#_i,_j];
                    _val1 = val(g.dm_Spell[?hex_str(_spell)+STR_Rando+STR_Cost+STR_Max], _val);
                    g.dg_spell_cost[#_i,_j] = min(_val,_val1);
                }
            }
        }
    }
    
    
    
    
    /*if (_DEBUG_RANDO){var _debug_data = _dm_file_data[?_QUEST_KEY+STR_Rando+STR_Debug+STR_Data];
        if(!is_undefined( _debug_data))
        {   var        _dm_debug_data = json_decode(_debug_data);
            _count=val(_dm_debug_data[?STR_Data+'01'+STR_Count]);
            for(_i=1; _i<=_count; _i++){
                _val = _dm_debug_data[?STR_Data+'01'+hex_str(_i)];
                if (is_undefined(_val)) sdm(string(_val));
            }
            ds_map_destroy(_dm_debug_data); _dm_debug_data=undefined;
        }
    }*/
}








var _dk_dialogue;
_dk2 = STR_Spell+STR_Sequence;
_dk1 = _dk2+STR_Dialogue+STR_Datakey;
_count = val(f.dm_quests[?_dk2+STR_Dialogue+STR_Count]);
var _WILL_CHANGE_FOR_RANDO = val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) && global.Rando_SpellSequence_SPELL_COUNT<_count;
/*
sdm("_FILE_NUM "+string(_FILE_NUM)+", _FILE_NAME "+_FILE_NAME+", "+STR_Dialogue+STR_Count+" "+string(_count)+", "+"string_pos(STR_Dialogue+STR_Hylian,_quests)!=0: "+string(string_pos(STR_Dialogue+STR_Hylian,_quests)!=0));
//sdm("g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'01']: "+val(g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'01'],"undefined")+", "+"g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'02']: "+val(g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'02'],"undefined")+", "+"g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'03']: "+val(g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+'03'],"undefined"));
for(_i=1; _i<=3; _i++){
_dk3=_dk2+hex_str(_i);
sdm(_dk3+STR_Dialogue+STR_Hylian+": "+val(f.dm_quests[?_dk3+STR_Dialogue+STR_Hylian],"UNDEFINED"));
sdm(_dk3+STR_Dialogue+           ": "+val(f.dm_quests[?_dk3+STR_Dialogue],"UNDEFINED"));
sdm(_dk3+                        ": "+val(f.dm_quests[?_dk3],"00"));
}
*/
for(_i=0; _i<_count; _i++)
{
    _dk_dialogue = g.DIALOGUE_WINDOW.dm_dialogue[?_dk1+hex_str(_i+1)];
    if(!is_undefined(_dk_dialogue))
    {
        _dk3 = _dk2+hex_str(_i+1);
        
        _val1 = f.dm_quests[?_dk3+STR_Dialogue+STR_Hylian];
        _val2 = f.dm_quests[?_dk3+STR_Dialogue];
        _val3 = f.dm_quests[?_dk3];
        
        if(!is_undefined(_val1) 
        && !is_undefined(_val2) 
        && !is_undefined(_val3) )
        {
            g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+"A"]  = _val1;
            g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+"B"]  = _val2;
            g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+_dk2] = _val3;
        }
    }
}








f.file_num = _FILE_NUM;




ds_map_destroy(_dm_file_data); _dm_file_data=undefined;



show_debug_message("");
show_debug_message("FILE '"+_FILE_NAME+"'  LOADED!");
//show_debug_message("file num "+string(f.file_num)+"  LOADED!");
show_debug_message("");


/*
var _dl = ds_list_create();

var _FILE1_NAME = "SaveFile_2.txt";
var _file1      = file_text_open_read(working_directory+_FILE1_NAME);
var _file1_data = file_text_read_string(_file1);
                  file_text_close(      _file1);
var _dm_file1 = json_decode(_file1_data);

_dk1 = STR_Quest+"01"+STR_Rando+STR_Data;
var _rando_data = _dm_file1[?_dk1];

if(!is_undefined(_rando_data))
{
    var _dm_rando = json_decode(_rando_data);
    
    _dm_rando[?Area_TownA+"01"+"01"+STR_Open] = false;
    
    //_dm_rando[?Area_TownA+"4A"+STR_file_name+STR_Quest+"01"] = "TownA_086";
    
    _rando_data = json_encode(_dm_rando);
    _dm_file1[?_dk1] = _rando_data;
    
    _file1_data = json_encode(_dm_file1);
    _file1 = file_text_open_write(working_directory+_FILE1_NAME);
             file_text_write_string(_file1, _file1_data);
             file_text_close(       _file1);
}

ds_map_destroy(_dm_file1); _dm_file1=undefined;
ds_list_destroy(_dl); _dl = undefined;
*/




