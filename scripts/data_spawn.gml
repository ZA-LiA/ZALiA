/// data_spawn(spawn_datakey base, object_index, version, XL, YT, *data, ..)


var _i, _a, _val,_val1,_val2,_val3, _count, _num, _idx;
var _datakey,_datakey1, _len;
var _depth;


var                        _arg=0;
var _SPAWN_DATA = argument[_arg++]; // rm_name + STR_PRIO,STR_PRXM
var _OBJECT     = argument[_arg++]; // object_index
var _VERSION    = argument[_arg++]; // version
var _XL         = argument[_arg++]; // X Left
var _YT         = argument[_arg++]; // Y Top


var _OBJ_NAME    = object_get_name(_OBJECT); // "ItmA0", "ItmC1", "ItmF4", ...
var _OBJVER      = _OBJ_NAME+hex_str(_VERSION);

var _RM_NAME     = string_copy(_SPAWN_DATA, 1,RmName_LEN);
var _DUNGEON_NUM = val(g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]);
var _TOWN_NUM    = val(g.dm_rm[?_RM_NAME+STR_Town+STR_Num]);
var _TOWN_NAME   = g.dm_town[?STR_Town+STR_Name+hex_str(_TOWN_NUM)];
var _OWRC        = val(g.dm_rm[?_RM_NAME+STR_OWRC]); // owrc (likely already set in init_data_overworld())

var _ITEM_TYPE   = val(g.dm_ITEM[?_OBJ_NAME+STR_Item+STR_Type]);
var _IS_ITEM     = is_string(_ITEM_TYPE);
var _ITEM_ID     =    string(_ITEM_TYPE);





if (_IS_ITEM)
{
    if (_ITEM_TYPE==STR_KEY 
    ||  _ITEM_TYPE==STR_1UP 
    ||  _ITEM_TYPE==STR_PBAG 
    ||  _ITEM_TYPE==STR_JAR )
    {
        _XL+=3;
    }
}




var _PALETTE_IDX = -1;
for(_i=_arg; _i<argument_count; _i++)
{
    _val=argument[_i];
    
    _datakey = STR_Palette;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _PALETTE_IDX = str_hex(_val1);
        break;//_i
    }
}




//-------------------------------------------------
if (string_pos(    STR_PRXM,_SPAWN_DATA))
{    var _TRIGGER= STR_PRXM;  }
else var _TRIGGER= STR_PRIO;

var _SPAWN_DATAKEY = data_spawn_3a(_RM_NAME+_TRIGGER, _OBJECT,_VERSION, _XL,_YT, _PALETTE_IDX);
//-------------------------------------------------







//-------------------------------------------------
if (_IS_ITEM)
{
    switch(_ITEM_TYPE)
    {
        // -------------------------------------------------------
        case STR_HEART:{
                    if (cont_piece_count_hp >=  f.CONT_PIECE_MAX_HP) return -1;
        _val = hex_str((cont_piece_count_hp div f.CONT_PIECE_PER_HP)+1)  // container num
             + hex_str((cont_piece_count_hp mod f.CONT_PIECE_PER_HP)+1); // piece num
                        cont_piece_count_hp++;
        //
        _ITEM_ID = _ITEM_TYPE+hex_str(_val);
        
        _count = val(g.dm_spawn[?STR_Container+STR_Piece+STR_Count])+1;
        g.dm_spawn[?STR_Container+STR_Piece+STR_Count] = _count;
        
        g.dm_spawn[?STR_Container+STR_Piece+hex_str(_count)+STR_Item+STR_ID] = _ITEM_ID;
        g.dm_spawn[?STR_Container+STR_Piece+hex_str(_count)+dk_SpawnDatakey] = _SPAWN_DATAKEY;
        g.dm_spawn[?_ITEM_ID+dk_SpawnDatakey]     = _SPAWN_DATAKEY;
        g.dm_spawn[?_ITEM_ID+STR_Dungeon+STR_Num] = _DUNGEON_NUM;
        //sdm(_ITEM_ID+", "+_RM_NAME);
        break;}
        
        
        
        
        // -------------------------------------------------------
        case STR_MAGIC:{
                    if (cont_piece_count_mp >=  f.CONT_PIECE_MAX_MP) return -1;
        _val = hex_str((cont_piece_count_mp div f.CONT_PIECE_PER_MP)+1)  // container num
             + hex_str((cont_piece_count_mp mod f.CONT_PIECE_PER_MP)+1); // container piece num
                        cont_piece_count_mp++;
        //
        _ITEM_ID = _ITEM_TYPE+hex_str(_val);
        
        _count = val(g.dm_spawn[?STR_Container+STR_Piece+STR_Count])+1;
        g.dm_spawn[?STR_Container+STR_Piece+STR_Count] = _count;
        
        g.dm_spawn[?STR_Container+STR_Piece+hex_str(_count)+STR_Item+STR_ID] = _ITEM_ID;
        g.dm_spawn[?STR_Container+STR_Piece+hex_str(_count)+dk_SpawnDatakey] = _SPAWN_DATAKEY;
        g.dm_spawn[?_ITEM_ID+dk_SpawnDatakey]     = _SPAWN_DATAKEY;
        g.dm_spawn[?_ITEM_ID+STR_Dungeon+STR_Num] = _DUNGEON_NUM;
        //sdm(_ITEM_ID+", "+_RM_NAME);
        break;}
        
        
        
        
        // -------------------------------------------------------
        case STR_KEY:{
        g.dm_spawn[?STR_Key+STR_Count] = val(g.dm_spawn[?STR_Key+STR_Count])+1;
        _count                         = val(g.dm_spawn[?STR_Key+STR_Count]);
        
        _datakey = STR_Key+hex_str(_count);
        g.dm_spawn[?_SPAWN_DATAKEY+STR_Key+STR_Num] = _count;
        
        _datakey1 = STR_Dungeon+hex_str(_DUNGEON_NUM);
        
        _count = val(g.dm_spawn[?_datakey1+STR_Key+STR_Count])+1;
        g.dm_spawn[?_datakey1+STR_Key+STR_Count] = _count;
        
        _ITEM_ID = STR_KEY+hex_str(_DUNGEON_NUM)+hex_str(_count);
        
        g.dm_spawn[?_datakey+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
        g.dm_spawn[?_datakey+STR_Item+STR_ID]       = _ITEM_ID;
        g.dm_spawn[?_RM_NAME+STR_Key +STR_ID]       = _ITEM_ID;
        
        f.dm_keys_DEFAULT[?_ITEM_ID+STR_Acquired]          = 0;
        f.dm_keys_DEFAULT[?_SPAWN_DATAKEY+STR_Num]  = _count;
        f.dm_keys_DEFAULT[?_ITEM_ID+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
        f.dm_keys_DEFAULT[?_ITEM_ID+STR_Dungeon+STR_Num]   = _DUNGEON_NUM;
        break;}
        
        
        
        
        // -------------------------------------------------------
        case STR_1UP:{
        g.LifeDoll_MAX++;
        _num = g.LifeDoll_MAX;
        
        _ITEM_ID += hex_str(_num);
        
        f.dm_1up_doll_DEFAULT[?_ITEM_ID+STR_Acquired]         = 0;
        f.dm_1up_doll_DEFAULT[?_SPAWN_DATAKEY+STR_Num]        = g.LifeDoll_MAX;
        f.dm_1up_doll_DEFAULT[?hex_str(_num)+STR_Item+STR_ID] = _ITEM_ID;
        break;}
        
        
        
        
        // -------------------------------------------------------
        case STR_PBAG:{
        f.dm_PBags_DEFAULT[?STR_Count] = val(f.dm_PBags_DEFAULT[?STR_Count]) + 1;
        _num =                           val(f.dm_PBags_DEFAULT[?STR_Count]);
        
        _ITEM_ID += hex_str(_num);
        
        f.dm_PBags_DEFAULT[?_ITEM_ID+STR_Acquired]               = 0;
        f.dm_PBags_DEFAULT[?hex_str(_num)+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
        f.dm_PBags_DEFAULT[?hex_str(_num)+STR_Rm+STR_Name]       = _RM_NAME;
        f.dm_PBags_DEFAULT[?hex_str(_num)+STR_Version]           = _VERSION;
        f.dm_PBags_DEFAULT[?hex_str(_num)+"_x"]                  = _XL;
        f.dm_PBags_DEFAULT[?hex_str(_num)+"_y"]                  = _YT;
        break;}
        
        
        
        
        // -------------------------------------------------------
        case STR_JAR:{
        f.dm_Jars_DEFAULT[?STR_Count] = val(f.dm_Jars_DEFAULT[?STR_Count]) + 1;
        _num =                          val(f.dm_Jars_DEFAULT[?STR_Count]);
        
        _ITEM_ID += hex_str(_num);
        
        f.dm_Jars_DEFAULT[?_ITEM_ID+STR_Acquired]               = 0;
        f.dm_Jars_DEFAULT[?hex_str(_num)+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
        f.dm_Jars_DEFAULT[?hex_str(_num)+STR_Rm+STR_Name]       = _RM_NAME;
        f.dm_Jars_DEFAULT[?hex_str(_num)+STR_Version]           = _VERSION;
        f.dm_Jars_DEFAULT[?hex_str(_num)+"_x"]                  = _XL;
        f.dm_Jars_DEFAULT[?hex_str(_num)+"_y"]                  = _YT;
        break;}
    }//switch(_ITEM_TYPE)
    
    
    
    
    
    
    //-------------------------------------------------
    if (_ITEM_TYPE==STR_HEART 
    ||  _ITEM_TYPE==STR_MAGIC 
    ||  _ITEM_TYPE==STR_PBAG 
    ||  _ITEM_TYPE==STR_1UP 
    ||  _ITEM_TYPE==STR_KEY 
    ||  val(g.dm_ITEM[?_ITEM_TYPE+STR_Bit]) )
    {
        _count=val(g.dm_spawn[?               STR_Rando+STR_Location+STR_Count])+1;
                   g.dm_spawn[?               STR_Rando+STR_Location+STR_Count] = _count;
                   g.dm_spawn[?               STR_Rando+STR_Location+hex_str(_count)+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
                   g.dm_spawn[?_SPAWN_DATAKEY+STR_Rando+STR_Location+STR_Num]   = _count;
    }
    
    
    
    
    
    
    
    
    //-------------------------------------------------
    g.dm_spawn[?_SPAWN_DATAKEY+STR_Item+STR_Type]   = _ITEM_TYPE;
    g.dm_spawn[?_SPAWN_DATAKEY+STR_Item+STR_ID]     = _ITEM_ID;    
    g.dm_spawn[?_SPAWN_DATAKEY+STR_Dungeon+STR_Num] = _DUNGEON_NUM;
    
    g.dm_spawn[?_ITEM_ID+STR_Item+STR_Type]       = _ITEM_TYPE;
    g.dm_spawn[?_ITEM_ID+STR_Object]              = _OBJECT;
    g.dm_spawn[?_ITEM_ID+STR_Version]             = _VERSION;
    g.dm_spawn[?_ITEM_ID+STR_Spawn+STR_Datakey]   = _SPAWN_DATAKEY;
    g.dm_spawn[?_ITEM_ID+STR_Dungeon+STR_Num]     = _DUNGEON_NUM;
    
    
    
    
    
    
    
    //-------------------------------------------------
    _datakey = STR_Item+STR_Count;
    g.dm_spawn[?_datakey] = val(g.dm_spawn[?_datakey])+1;
    _num  =                 val(g.dm_spawn[?_datakey]);
    
    _datakey = STR_Item+hex_str(_num);
    g.dm_spawn[?_datakey+dk_SpawnDatakey]     = _SPAWN_DATAKEY;
    g.dm_spawn[?_datakey+STR_Dungeon+STR_Num] = _DUNGEON_NUM;
    g.dm_spawn[?_datakey+STR_Item+STR_Type]   = _ITEM_TYPE;
    g.dm_spawn[?_datakey+STR_Item+STR_ID]     = _ITEM_ID;
    
    
    _datakey = STR_Dungeon+hex_str(_DUNGEON_NUM)+STR_Item+STR_Count;
    g.dm_spawn[?_datakey] = val(g.dm_spawn[?_datakey])+1;
    _num  =                 val(g.dm_spawn[?_datakey]);
    
    _datakey = STR_Dungeon+hex_str(_DUNGEON_NUM)+STR_Item+hex_str(_num);
    g.dm_spawn[?_datakey+dk_SpawnDatakey]     = _SPAWN_DATAKEY;
    g.dm_spawn[?_datakey+STR_Dungeon+STR_Num] = _DUNGEON_NUM;
    g.dm_spawn[?_datakey+STR_Item+STR_Type]   = _ITEM_TYPE;
    g.dm_spawn[?_datakey+STR_Item+STR_ID]     = _ITEM_ID;
    //sdm("Item. "+_SPAWN_DATAKEY+", _ITEM_TYPE '"+_ITEM_TYPE+"'"+string_repeat(" ",8-string_length(_ITEM_TYPE))+", _ITEM_ID '"+_ITEM_ID+"'");
}
else if (is_ancestor(_OBJECT,Kakusu))
{
    _count = val(g.dm_spawn[?STR_Kakusu+STR_Count])+1;
    g.dm_spawn[?STR_Kakusu+STR_Count] = _count;
    
                _ITEM_ID = STR_Kakusu+hex_str(_count);
    g.dm_spawn[?_ITEM_ID+STR_Rm+STR_Name]       = _RM_NAME;
    g.dm_spawn[?_ITEM_ID+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
    g.dm_spawn[?_ITEM_ID+STR_OWRC]              = val(g.dm_rm[?_RM_NAME+STR_OWRC]);
    g.dm_spawn[?_ITEM_ID+STR_Object]            = _OBJECT;
    g.dm_spawn[?_ITEM_ID+STR_Version]           = _VERSION;
    g.dm_spawn[?_ITEM_ID+"_x"]                  = _XL;
    g.dm_spawn[?_ITEM_ID+"_y"]                  = _YT;
    
    g.dm_spawn[?_ITEM_ID+STR_Item+STR_Type]     = STR_Kakusu;
}
else if (is_ancestor(_OBJECT,NPC_D)) // NPC_D: Merchant (Nabooru & NewKasuto MAP items)
{
    _count=val(g.dm_spawn[?STR_Merchant+STR_Count])+1;
               g.dm_spawn[?STR_Merchant+STR_Count] = _count;
               g.dm_spawn[?_SPAWN_DATAKEY+STR_Merchant+STR_Num] = _count;
    
                _datakey=STR_Merchant+hex_str(_count);
    g.dm_spawn[?_datakey+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
    g.dm_spawn[?_datakey+STR_Rm+STR_Name]       = _RM_NAME;
}









//-------------------------------------------------
_datakey1 = STR_Qualified+STR_Quest+STR_Nums;

// this spawn qualifies for both quests unless specified otherwise in the following loop
              g.dm_spawn[?_SPAWN_DATAKEY+_datakey1] = "01"+"02";
if (_IS_ITEM) g.dm_spawn[?_ITEM_ID      +_datakey1] = "01"+"02";


g.dm_spawn[?_SPAWN_DATAKEY+STR_Strong+STR_Encounter] = false;







var _data_num=1;
for(_i=_arg; _i<argument_count; _i++)
{
    _val = argument[_i];
    
    _datakey = STR_Data+hex_str(_data_num++);
                  g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val;
    if (_IS_ITEM) g.dm_spawn[?_ITEM_ID      +_datakey] = _val;
    
    
    
    
    //-------------------------------------------------
    _datakey = _datakey1; // _datakey1: STR_Qualified+STR_Quest+STR_Nums
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
                      g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        if (_IS_ITEM) g.dm_spawn[?_ITEM_ID      +_datakey] = _val1;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Depth;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = real(string_digits(_val1));
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Strong+STR_Encounter;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = true;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Arena+"_x";
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Treasure+STR_Map;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        
        if (_IS_ITEM 
        ||  is_ancestor(_OBJECT,Kakusu) )
        {
            if (ds_list_find_index(g.dl_MapItem_ITEM_IDS,_ITEM_ID)==-1) ds_list_add(g.dl_MapItem_ITEM_IDS,_ITEM_ID);
                    _datakey=_ITEM_ID;
        }
        else        _datakey=_SPAWN_DATAKEY;
        
        g.dm_spawn[?_datakey+STR_Map+STR_Num] = _val1;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Direction;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val2 = string_lettersdigits(_val1);
        _val2 = str_hex(_val2);
        if (string_pos("-",_val1)) _val2 = -_val2;
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val2;
        continue;//_i
    }
    
    
    
    _datakey = STR_Speed;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    _datakey = STR_Duration;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    _datakey = STR_Distance;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Lit;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = true;
        continue;//_i
    }
    
    
    _datakey = STR_Brightness;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        continue;//_i
    }
    
    
    
    
    //data_spawn(rm+STR_PRIO,NPC_5,$1,  x3,y3,  STR_Dialogue+DK0500,STR_Sprite+STR_Zoey,STR_Quest+STR_ID+hex_str(QUEST_SPELL_PROTECT)); // Quest
    _datakey = STR_Sprite;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey+STR_Datakey] = _val1;
        continue;//_i
    }
    
    
    
    _datakey = STR_Dialogue;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey+STR_Datakey] = _val1;
        
        if (val(g.dm_RandoHints[?_val1]))
        {
                     g.dm_RandoHints[?STR_Hint+STR_Count]=val(g.dm_RandoHints[?STR_Hint+STR_Count])+1;
            _num=val(g.dm_RandoHints[?STR_Hint+STR_Count]);
            
            g.dm_RandoHints[?hex_str(_num)+STR_Dialogue+STR_Datakey]=_val1;
            g.dm_RandoHints[?hex_str(_num)+STR_Spawn+STR_Datakey]=_SPAWN_DATAKEY;
            if (_TOWN_NUM) _val2=_TOWN_NAME;
            else           _val2=STR_Other;
            g.dm_RandoHints[?hex_str(_num)+STR_Area]=_val2;
            g.dm_RandoHints[?hex_str(_num)+STR_Rm+STR_Name]=_RM_NAME;
            
            if(0){_val2+=string_repeat(" ",string_length(STR_Old_Kasuto)-string_length(_val2));
            _val3=val(g.DIALOGUE_WINDOW.dm_dialogue[?_val1+"A"], _val1+"A");
            sdm("Hint_"+hex_str(_num)+". "+"Area: "+_val2+", Rm: "+_RM_NAME+".  '"+_val3+"'");
            }
        }
        continue;//_i
    }
    
    
    
    
    _datakey = STR_Quest+STR_ID; // The town spell quests
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = str_hex( _val1);
        continue;//_i
    }
    
    
    
    
    //data_spawn(rm+STR_PRIO,NPC_7,1,  x3,y3,  -1, STR_Dialogue+STR_Datakey+DK0700, STR_Sprite+STR_Datakey+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_PRTC)); // 
    _datakey = STR_Spell+STR_ID;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1); // the spell bit / spell id
        g.dm_spawn[?_SPAWN_DATAKEY+_datakey] = _val1;
        
        var _SPELL_NAME = g.dm_Spell[?hex_str(_val1)+STR_Name];
        if(!is_undefined(_SPELL_NAME))
        {
            var _DIALOGUE_DATAKEY = val(g.dm_spawn[?_SPAWN_DATAKEY+STR_Dialogue+STR_Datakey], "undefined");
            if (_OBJECT==NPC_7)
            {
                switch(_VERSION)
                {   // ---------------------------------------------
                    case 1:{
                    g.dm_spawn[?STR_Spell+STR_Spawn   +STR_Datakey+_SPELL_NAME] = _SPAWN_DATAKEY;
                    g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+_SPELL_NAME] = _DIALOGUE_DATAKEY;
                    if(!is_undefined(_TOWN_NAME)) g.dm_spawn[?"_Wise"+"_Man"+STR_Spawn+STR_Datakey+_TOWN_NAME] = _SPAWN_DATAKEY;
                    break;}
                    
                    // ---------------------------------------------
                    case 2:{// v2: CUCCO Spell. _SPELL_NAME is also _FAIRY
                    g.dm_spawn[?STR_Spell+STR_Spawn   +STR_Datakey+STR_Cucco] = _SPAWN_DATAKEY;
                    g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+STR_Cucco] = _DIALOGUE_DATAKEY;
                    break;}
                }
            }
            
            g.dm_spawn[?STR_Spell+STR_Bit                 +_SPAWN_DATAKEY] = _val1;
            g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+_SPAWN_DATAKEY] = _DIALOGUE_DATAKEY;
        }
        continue;//_i
    }
    
    
    
    
    _datakey = object_get_name(Eyenocc)+"_"+STR_Sequence;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        g.dm_spawn[?_SPAWN_DATAKEY+STR_Sequence] = _val1;
        continue;
    }
}






//-------------------------------------------------
return _SPAWN_DATAKEY;
//-------------------------------------------------




