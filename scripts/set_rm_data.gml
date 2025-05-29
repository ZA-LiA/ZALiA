/// set_rm_data(rm name, rm music, *_data, ..)


var _i, _val,_val1,_val2,_val3, _count;
var _len, _datakey;

var                       _arg=0;
var _RM_NAME   = argument[_arg++]; // str, rm name     example: "_WestA_03"
var _MUSIC     = argument[_arg++]; // snd, rm music
var _TILE_FILE = undefined;

var _AREA   = string_copy(_RM_NAME, 1, AreaID_LEN);   // example: "_WestA_"
var _RM_NUM = string_copy(_RM_NAME, AreaID_LEN+1, RmName_LEN-AreaID_LEN); // example: "0B"
    _RM_NUM = str_hex(_RM_NUM); // example: $0B
//

var _IS_DUNGEON = !is_undefined(g.dm_dungeon[?STR_Dungeon+_AREA+STR_Name]);


// Data for Dev_RmWarper and possibly other stuff
if (is_undefined(g.dm_rm[?_RM_NAME+STR_Rm+STR_Num+STR_Game])) // if data NOT yet created for this rm
{
             _datakey  = _AREA+STR_Rm+STR_Count; // This area's rm count
    g.dm_rm[?_datakey] = val(g.dm_rm[?_datakey])+1;
    _count =                 g.dm_rm[?_datakey];
    
    g.dm_rm[?_AREA+STR_Rm+hex_str(_count)+STR_ID] = _RM_NUM;
    g.dm_rm[?_RM_NAME+STR_Rm+STR_Num+STR_Area]    = _count;
    
    
    
             _datakey  = STR_Rm+STR_Count; // Game rm count
    g.dm_rm[?_datakey] = val(g.dm_rm[?_datakey])+1;
    _count =                 g.dm_rm[?_datakey];
    
    g.dm_rm[?STR_Rm+hex_str(_count)+STR_ID]    = _RM_NUM;
    g.dm_rm[?_RM_NAME+STR_Rm+STR_Num+STR_Game] = _count;
}







town_num     = 0;
town_name    = "undefined";
dungeon_num  = 0;
dungeon_name = "undefined";


if (_IS_DUNGEON)
{
    switch(_AREA)
    {
        case Area_PalcA:{
        dungeon_num =1;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "PARAPA PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_PRPA1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_PRPA1],OWRC_DFL);
        break;}
        case Area_PalcB:{
        dungeon_num =2;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "MIDORO PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_MDRO1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_MDRO1],OWRC_DFL);
        break;}
        case Area_PalcC:{
        dungeon_num =3;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "ISLAND PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_ISLD1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_ISLD1],OWRC_DFL);
        break;}
        case Area_PalcD:{
        dungeon_num =4;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "MAZE ISLAND PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_MAZE1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_MAZE1],OWRC_DFL);
        break;}
        case Area_PalcE:{
        dungeon_num =5;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "PALACE ON THE SEA";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_POTS1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_POTS1],OWRC_DFL);
        break;}
        case Area_PalcF:{
        dungeon_num =6;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "3-EYE ROCK PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_THRE1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_THRE1],OWRC_DFL);
        break;}
        case Area_PalcG:{
        dungeon_num =7;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "GREAT PALACE";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_GRET1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_GRET1],OWRC_DFL);
        break;}
        case Area_PalcH:{
        dungeon_num =8;
        dungeon_name=val(g.dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name], STR_undefined);
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]  = dungeon_num;
        g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Name] = dungeon_name;
        g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]  = "DRAGMIRE TOWER";
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = val(global.OVERWORLD.dm[?MK_OWRC_PAL_DRAG1],OWRC_DFL);
        g.dm_rm[?_RM_NAME+STR_OWRC]             = val(global.OVERWORLD.dm[?MK_OWRC_PAL_DRAG1],OWRC_DFL);
        break;}
    }
}
else
{
           _i=_arg;
    while (_i<argument_count)
    {
        _val =argument[_i++];
        
        _datakey = STR_Town;
        if (is_string(          _val) 
        &&  string_pos(_datakey,_val) ) // if the argument has a town name in it
        {
            _len  = string_length(_datakey);
            _val1 = string_copy(_val, _len+1, string_length(_val)-_len); // town name
            _val2 = val(g.dm_town[?STR_Town+STR_Num+_val1]);
            if (_val2)
            {
                g.dm_rm[?_RM_NAME+STR_Town+STR_Num]  = _val2; // Town number (1-9)
                g.dm_rm[?_RM_NAME+STR_Town+STR_Name] = _val1;
                
                                     _val3=OWRC_DFL;
                switch(_val1){
                case STR_Rauru:     {_val3=g.OWRC_TOWN_RAUR1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_RAURU);      break;}
                case STR_Ruto:      {_val3=g.OWRC_TOWN_RUTO1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_RUTO);       break;}
                case STR_Saria:     {_val3=g.OWRC_TOWN_SARI1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_SARIA);      break;}
                case STR_Mido:      {_val3=g.OWRC_TOWN_MIDO1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_MIDO);       break;}
                case STR_Nabooru:   {_val3=g.OWRC_TOWN_NABO1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_NABOORU);    break;}
                case STR_Darunia:   {_val3=g.OWRC_TOWN_DARU1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_DARUNIA);    break;}
                case STR_New_Kasuto:{_val3=g.OWRC_TOWN_NEWK1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_NEW_KASUTO); break;}
                case STR_Old_Kasuto:{_val3=g.OWRC_TOWN_OLDK1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_KASUTO);     break;}
                case STR_Bulblin:   {_val3=g.OWRC_TOWN_BULB1; g.dm_rm[?_RM_NAME+MapAreaName_DATAKEY]=val(g.dm_town[?_val1+MapAreaName_DATAKEY], MapAreaName_BULBLIN);    break;}
                }
                //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = _val3;
                g.dm_rm[?_RM_NAME+STR_OWRC] = _val3;
                
                town_num  = _val2;
                town_name = _val1;
                break;//while (_i<argument_count)
            }
        }
    }
}









// Set a default for the scene's background color.
g.dm_rm[?_RM_NAME+dk_BackgroundColor] = p.C_BLK1;

// Set a default for view lock. Most scenes do not scroll vertically
g.dm_rm[?_RM_NAME+STR_View+STR_Data]    = $1; // $1: lock vertical scrolling

// Set a default for show ow pos. Most scenes qualify to show ow pos on map
g.dm_rm[?_RM_NAME+STR_show_ow_pos]      = true;



while (_arg<argument_count)
{
    _val =  argument[_arg++];
    
    
    _datakey = STR_Tile;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _TILE_FILE = _val1; // example: "_WestA_003".  Part of the tile data file's file name
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_Color;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+dk_BackgroundColor] = _val1; // p.dl_color index. Background color
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_View;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+STR_View+STR_Data] = _val1;
        continue;//while (_arg<argument_count)
    }
    
    
    
    // $0: horizontal.      PC faces right, map show pc facing right. PC faces left, map show pc facing left
    // $1: vertical.        PC faces right, map show pc facing down.  PC faces left, map show pc facing up
    // $2: horizontal flip. PC faces right, map show pc facing left.  PC faces left, map show pc facing right
    // $3: vertical   flip. PC faces right, map show pc facing up.    PC faces left, map show pc facing down
    _datakey = STR_ow_axis;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+STR_ow_axis] = _val1;
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_show_ow_pos;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+STR_show_ow_pos] = _val1; // When in a cave system, will menu map show where pc is in ow, or the location of the last entered cave tile?
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_OWRC;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        //global.OVERWORLD.dm[?_RM_NAME+STR_OWRC] = _val1; // OverWorld Row & Clm. This is normally set in init_overworld_data() except for dungeons
        g.dm_rm[?_RM_NAME+STR_OWRC] = _val1; // OverWorld Row & Clm. This is normally set in init_overworld_data() except for dungeons
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_Dark;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+dk_DarkRoom] = _val1; // the x-index of p.dg_pal_rm_dark so the game knows what dark palette to use
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = STR_Encounter;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        _val1 = str_hex(_val1);
        g.dm_rm[?_RM_NAME+STR_Enc_Type] = _val1; // Bits. $00: NO enc, $01: g.ENC_WEAK, $02: g.ENC_STRG, $04: g.ENC_FARY
        continue;//while (_arg<argument_count)
    }
    
    
    
    _datakey = MapAreaName_DATAKEY;
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        _len  = string_length(_datakey);
        _val1 = string_copy(_val, _len+1, string_length(_val)-_len);
        g.dm_rm[?_RM_NAME+_datakey] = _val1;
        continue;//while (_arg<argument_count)
    }
    
    
    
    // This is so the area/overworld music continues for certain audio sets.
    //_datakey = STR_Audio+STR_Exception+"01";
    _datakey = dk_SceneMusicThemeException+"01";
    if (is_string(          _val) 
    &&  string_pos(_datakey,_val) )
    {
        with(Audio) dm[?_datakey+_RM_NAME] = true;
        continue;//while (_arg<argument_count)
    }
}





if (_MUSIC!=-1)
{
    if (string_pos(STR_Dungeon,_MUSIC))
    {
        _val = val(g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num],1);
        _MUSIC = STR_Dungeon+hex_str(_val);
    }
    
    g.dm_rm[?_RM_NAME+STR_Music] = _MUSIC;
}











// -------------------------------------------------------
if(!is_undefined(_TILE_FILE)) set_rm_data_1a(_RM_NAME,_TILE_FILE); // set: tile data file, rm_w, rm_h


with(RoomData)
{
    if(!rm_w) rm_w = $01<<8;
    if(!rm_h) rm_h = $01<<8;
    rm_w_ = rm_w>>1;
    rm_h_ = rm_h>>1;
    //
    rm_num      =         _RM_NUM;
    rm_num_     =  hex_str(rm_num);
    rm_name     = _AREA +  rm_num_;
    rm          =  rm_name;
    //                              // 
    pages_x     =  rm_w>>8;
    pages_y     =  rm_h>>8;
    pages       =  pages_x * pages_y;
    //                              // 
    clms0       =  rm_w>>3;           //  rm clms
    clms1       =  clms0 + CLMS0;     // (rm clms) + (2 pages of clms)
    clm0        =  clms0 - PAGE_CLMS; // lft clm of rgt-most page
    clm1        =  clms0>>1;          // rm center clm
    clm2        =  clms0+$01;         // right exit clm
    clmA        =  clms0-$04;         // right enter clm
    //                              // 
    clmt0       =  clms0-CLMT0;
    //                              // 
    //                              // 
    //                              // 
    rows0       =  rm_h>>3;           //  rm rows
    rows1       =  rows0 + ROWS0;     // (rm rows) + (2 pages of rows)
    row0        =  rows0 - PAGE_ROWS; // top row of btm-most page
    row1        =  rows0>>1;          // rm center row
    row2        =  row0+$18;          // common spawn_y row
    //                              // 
    row_e0      =  row0-$0F; // Elevator exit up   top row
    row_e1      =  row0+$05; // Elevator exit up   pc spawn row
    row_e2      =  row0+$1F; // Elevator exit down top row
    row_e3      =  row0+$1B; // Elevator exit down pc spawn row
    row_e4      =  row0+$02; // Pit exit up pc spawn row
    row_e5      =  row0+$14; // Elevator spawn row 1
    //                              // 
    //                              // 
    //                              // 
    x0          =  rm_w_;           // xc: rm
    xt0         = DIST1;
    //xt0         = (clmt0<<3)+4;
    xt1         = rm_w-DIST1;
    //                              // 
    y0          =  row0<<3;           // yt: btm-most page
    y2          =  row2<<3;
    //                              // 
    
    
    // get this ready for data_exit() for this rm
                   _val=EXIT_NAME_GAME_START;
    exit_name_m0 = _val;
    exit_name_m1 = _val;
    exit_name_m2 = _val;
    exit_name_m3 = _val;
    //                  //
    exit_name_r0 = _val;
    exit_name_r1 = _val;
    exit_name_r2 = _val;
    exit_name_r3 = _val;
    //                  //
    exit_name_l0 = _val;
    exit_name_l1 = _val;
    exit_name_l2 = _val;
    exit_name_l3 = _val;
    //                  //
    exit_name_d0 = _val;
    exit_name_d1 = _val;
    exit_name_d2 = _val;
    exit_name_d3 = _val;
    //                  //
    exit_name_u0 = _val;
    exit_name_u1 = _val;
    exit_name_u2 = _val;
    exit_name_u3 = _val;
    //                  //
    
    
    // get this ready for data_exit() for this rm
    ds_list_clear(dl_exit);
}




