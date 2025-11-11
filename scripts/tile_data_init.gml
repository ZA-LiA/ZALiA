
var _i,_j, _count;
var _dk   = "";
var _area = "";
var _key  = "";

// ----------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// TN: Tile Name
// Tile names that are commonly written in code
var _TN05 = "94"; // crumble bridge/block last frame
var _TN06 = "95"; // crumble/breakable block 1a
var _TN07 = "96"; // crumble/breakable block 1b
var _TN08 = "97"; // crumble bridge 1a
var _TN09 = "98"; // crumble bridge 1b

// Tiles that aren't drawn due to certain conditions
// Bits of the stored value determine what hides the tile:
// 1: Hidden if room is NOT lit
// 2: Hidden if room IS lit
// 4: ...
// 8: ...
var _HIDE1 = TID_HIDE_1&$F;
var _HIDE2 = TID_HIDE_2&$F;


dm_tile[?STR_Tile_Hidden      +_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden      +_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden      +_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden      +_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden      +_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_WestA;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_EastA;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_DthMt;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_MazIs;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcA;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcB;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcC;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcD;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcE;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcF;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_PalcG;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_TownA;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b

_area = Area_TownB;
dm_tile[?STR_Tile_Hidden+_area+_TN05] = _HIDE1; // crumble bridge/block last frame
dm_tile[?STR_Tile_Hidden+_area+_TN06] = _HIDE1; // crumble/breakable block 1a
dm_tile[?STR_Tile_Hidden+_area+_TN07] = _HIDE1; // crumble/breakable block 1b
dm_tile[?STR_Tile_Hidden+_area+_TN08] = _HIDE1; // crumble bridge 1a
dm_tile[?STR_Tile_Hidden+_area+_TN09] = _HIDE1; // crumble bridge 1b



// --------------------------------------------------------------------
// -------------------------------------------------------------------------------



// -------------------------------------------------------------------------------








// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
var _dl_depth  = ds_list_create();
var _dl_rc_off = ds_list_create();
var _dl_ts     = ds_list_create();
var _dl_solid  = ds_list_create();
var _dl_unique = ds_list_create();
var _dm_data   = ds_map_create();
var _tile_count, _cue, _cues, _tsrc, _depth, _ts, _solid, _unique, _hide;
var _anim_key, _anim_key2, _frame_key, _frame_key2;



var _TSRC_EMPTY1_A = '00' + '00' + '00' + '00';
/*
var _TSRC_EMPTY1_A = '00' + '00' + '00' + '00';
var _TSRC_BREAK1_A = '90' + '91' + '92' + '93';
var _TSRC_BREAK1_B = '94' + '95' + '96' + '97';
var _TSRC_BREAK1_C = '9C' + '9C' + '9D' + '9D';
var _TSRC_BREAK2_A = '98' + '98' + '99' + '99';
var _TSRC_BREAK2_B = '9A' + '9A' + '9B' + '9B';
var _TSRC_BREAK3_A = '82' + '83' + '92' + '93';
var _TSRC_BREAK3_B = '86' + '87' + '96' + '97';
*/





// ---------------------------------------------------------------------------------------
// Crumble Bridge ------------------------------------

_anim_key  = STR_Anim+hex_str(TID_BREAK2); // crumble bridge
_frame_key = _anim_key+STR_frame;
// _cues = "07" + "17" + "20" + "27" + "30";
_cues   = "";
_depth  = -1; // -1: use depth of placed tile
_ts     = ts_Man_made_1a_WRB;
_solid  = TID_SOLID1;
_unique = $00;
_hide   = hex_str(TID_HIDE_1&$F);
_hide   = _hide + _hide + _hide + _hide; // = '01' + '01' + '01' + '01';

                           ds_list_add( _dl_rc_off, $0000,  $0001,  $0100,  $0101);
             _tile_count = ds_list_size(_dl_rc_off);
for(_i=0; _i<_tile_count; _i++) _dl_depth [|_i]=_depth;
for(_i=0; _i<_tile_count; _i++) _dl_ts    [|_i]=_ts;
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=_solid;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=_unique;



_cue = 1;



// Frame 1  (Reset).  Unbroken.
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i] = TID_BREAK2;
_tsrc = TSRC_BREAK2_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 2  Unbroken.
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=0;
_tsrc = TSRC_BREAK2_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 6;



// Frame 3  Cracked
// ----------------------------------------------
_tsrc = TSRC_BREAK2_B;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += $10;



// Frame 4  Dust
// ----------------------------------------------
_tsrc = TSRC_BREAK1_C;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 9;



// Frame 5. Dust.  Only change solid
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_solid[|_i]=0;
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 7;



// Frame 6
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=0; // 0 means remove room tile
_hide = '00' + '00' + '00' + '00'; // 0 means remove any hide properties
_tsrc = _TSRC_EMPTY1_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 9;



// Frame 7  (End)
// ----------------------------------------------
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);




dm_tile[?_anim_key+STR_Sequence]      = _cues; // cue string
dm_tile[?_anim_key+STR_Anim+STR_Loop] = $FF;   // loop type
ds_list_clear(_dl_rc_off);



















// ---------------------------------------------------------------------------------------
// Regenerating Crumble Bridge ------------------------------------
var _CRUMBLE_FLOOR_REGEN_VER = 2;
_anim_key  = STR_Anim+hex_str(TID_BREAK4); // crumble bridge
_frame_key = _anim_key+STR_frame;
// _cues = "07" + "17" + "20" + "27" + "30";
_cues   = "";
_depth  = -1; // -1: use depth of placed tile
_ts     = ts_Man_made_1a_WRB;
_solid  = TID_SOLID1;
_unique = $00;
_hide   = hex_str(TID_HIDE_1&$F);
_hide   = _hide + _hide + _hide + _hide; // = '01' + '01' + '01' + '01';

                           ds_list_add( _dl_rc_off, $0000,  $0001,  $0100,  $0101);
             _tile_count = ds_list_size(_dl_rc_off);
for(_i=0; _i<_tile_count; _i++) _dl_depth [|_i]=_depth;
for(_i=0; _i<_tile_count; _i++) _dl_ts    [|_i]=_ts;
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=_solid;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=_unique;



_cue = 1;



// Frame 1  (Reset).  Unbroken.
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i] = TID_BREAK4;
_tsrc = TSRC_BREAK4_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 2  Unbroken.
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=0;
_tsrc = TSRC_BREAK4_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 6;



// Frame 3  Cracked
// ----------------------------------------------
_tsrc = TSRC_BREAK4_B;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += $10;



// Frame 4  Dust
// ----------------------------------------------
switch(_CRUMBLE_FLOOR_REGEN_VER){
default:{_tsrc=TSRC_BREAK1_C; break;} // Dust
case  2:{_tsrc=TSRC_BREAK4_C; break;} // Shrinking object
}//switch(_CRUMBLE_FLOOR_REGEN_VER)
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 9;



// Frame 5. Dust.  Only change solid
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_solid[|_i]=0;
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 7;



// Frame 6
// ----------------------------------------------
switch(_CRUMBLE_FLOOR_REGEN_VER)
{
    default:{
    for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=0; // 0 means remove room tile
    _hide = '00' + '00' + '00' + '00'; // 0 means remove any hide properties
    _tsrc = _TSRC_EMPTY1_A;
    break;}
    
    case  2:{
    _tsrc = TSRC_BREAK4_D; // Small object
    break;}
}//switch(_CRUMBLE_FLOOR_REGEN_VER)
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += $40; // Regen delay. About 2 seconds



// Frame 7  (End)
// ----------------------------------------------
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);




dm_tile[?_anim_key+STR_Sequence]      = _cues; // cue string
dm_tile[?_anim_key+STR_Anim+STR_Loop] = $FF;   // loop type
ds_list_clear(_dl_rc_off);

/*
_anim_key  = STR_Anim+hex_str(TID_BREAK4);
_frame_key = _anim_key+STR_frame;
// _cues = "07" + "17" + "20" + "27" + "30";
_cues   = "";
_depth  = -1; // -1: use depth of placed tile
_ts     = ts_Man_made_1a_WRB;
_solid  = $00;
_unique = $00;

_hide   = string_repeat('00',4);

                           ds_list_add( _dl_rc_off, $0000,  $0001,  $0100,  $0101);
             _tile_count = ds_list_size(_dl_rc_off);
for(_i=0; _i<_tile_count; _i++) _dl_depth [|_i]=_depth;
for(_i=0; _i<_tile_count; _i++) _dl_ts    [|_i]=_ts;
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=_solid;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=_unique;




// Copy TID_BREAK2's anim
                 _anim_key2=STR_Anim+hex_str(TID_BREAK2);
_frame_key2 =    _anim_key2+STR_frame;
_cues = dm_tile[?_anim_key2+STR_Sequence];
_cues = string_copy(_cues, 1, string_length(_cues)-2); // truncate the end-anim cue
for(_i=0; _i<string_length(_cues)>>1; _i++)
{
    dm_tile[?_frame_key+hex_str(_i+1)] = dm_tile[?_frame_key2+hex_str(_i+1)];
}

_cue  = str_hex(string_copy(_cues, string_length(_cues)-1, 2));
_cue += $40; // Regen delay. About 2 seconds



// Frame 1  (Reset).  Unbroken.   Change data for the unique to TID_BREAK4
// ----------------------------------------------
ds_map_clear(_dm_data);

_tsrc = TSRC_BREAK4_A;
var _dm_frame = json_decode(dm_tile[?_frame_key2+"01"]);
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dm_frame[?hex_str(_i)+STR_Depth];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dm_frame[?hex_str(_i)+STR_rc_offset];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dm_frame[?hex_str(_i)+STR_Tileset];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dm_frame[?hex_str(_i)+STR_Solid];
    _dm_data[?hex_str(_i)+STR_unique]    = TID_BREAK4;
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = _dm_frame[?hex_str(_i)+STR_HIDDEN];
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
ds_map_destroy(_dm_frame); _dm_frame=undefined;

dm_tile[?_frame_key+"01"] = json_encode(_dm_data);
ds_map_clear(_dm_data);



// Frame 7  (End)  Empty
// ----------------------------------------------
_tsrc = _TSRC_EMPTY1_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
show_debug_message("tile_data_init(). "+"_cues="+_cues);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);



dm_tile[?_anim_key+STR_Sequence]      = _cues; // cue string
dm_tile[?_anim_key+STR_Anim+STR_Loop] = $FF;   // loop type
ds_list_clear(_dl_rc_off);
*/

















// ---------------------------------------------------------------------------------------
// Breakable Block ------------------------------------

_anim_key  = STR_Anim+hex_str(TID_BREAK1); // 
_frame_key = _anim_key+STR_frame;
// _cues = "01" + "09" + "11" + "12";
_cues   = "";
_depth  = -1; // -1: use depth of placed tile
_ts     = ts_Man_made_1a_WRB;
_solid  = TID_SOLID1;
_unique = TID_BREAK1;
_hide   = hex_str(TID_HIDE_1&$F);
_hide   = _hide + _hide + _hide + _hide; // = '01' + '01' + '01' + '01';

                           ds_list_add( _dl_rc_off, $0000,  $0001,  $0100,  $0101);
             _tile_count = ds_list_size(_dl_rc_off);
for(_i=0; _i<_tile_count; _i++) _dl_depth [|_i]=_depth;
for(_i=0; _i<_tile_count; _i++) _dl_ts    [|_i]=_ts;
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=_solid;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=_unique;



_cue = 1;



// Frame 1  (Reset).  Unbroken
// ----------------------------------------------
_tsrc = TSRC_BREAK1_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 2  Cracked
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=0;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=0;
_tsrc = TSRC_BREAK1_B;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 8;



// Frame 3.   Dust
// ----------------------------------------------
_tsrc = TSRC_BREAK1_C;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 8;



// Frame 4
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=0;
_hide = '00' + '00' + '00' + '00';
_tsrc = _TSRC_EMPTY1_A;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 5  (End)
// ----------------------------------------------
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
    _dm_data[?hex_str(_i)+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?hex_str(_i)+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?hex_str(_i)+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?hex_str(_i)+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?hex_str(_i)+STR_unique]    = _dl_unique[|_i];
    _dm_data[?hex_str(_i)+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?hex_str(_i)+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);




dm_tile[?_anim_key+STR_Sequence]      = _cues; // cue string
dm_tile[?_anim_key+STR_Anim+STR_Loop] = $FF;   // loop type
ds_list_clear(_dl_rc_off);





















// ---------------------------------------------------------------------------------------
// Regenerating Breakable Block ------------------------------------

_anim_key  = STR_Anim+hex_str(TID_BREAK3); // 
_frame_key = _anim_key+STR_frame;
// _cues = "01" + "09" + "11" + "12";
_cues   = "";
_depth  = -1; // -1: use depth of placed tile
_ts     = ts_Man_made_7a_WRB;
_solid  = TID_SOLID1;
_unique = TID_BREAK3;

_tsrc   = _TSRC_EMPTY1_A;
_hide   = string_repeat(hex_str(TID_HIDE_1&$F), 4);

                           ds_list_add( _dl_rc_off, $0000,  $0001,  $0100,  $0101);
             _tile_count = ds_list_size(_dl_rc_off);
for(_i=0; _i<_tile_count; _i++) _dl_depth [|_i]=_depth;
for(_i=0; _i<_tile_count; _i++) _dl_ts    [|_i]=_ts;
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=_solid;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=_unique;





_cue = 1;



// Frame 1  (Reset).  Unbroken
// ----------------------------------------------
_tsrc = TSRC_BREAK3_A;
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 2  Cracked
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=0;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=0;
_tsrc = TSRC_BREAK3_B;
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 8;



// Frame 3.   Dust
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=ts_Man_made_1a_WRB;
_tsrc = TSRC_BREAK1_C;
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 8;



// Frame 4
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=0;
_hide = '00' + '00' + '00' + '00';
_tsrc = _TSRC_EMPTY1_A;
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += $80; // Regen delay. About 2 seconds



// Frame 5.   Dust
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=ts_Man_made_1a_WRB;
_hide = string_repeat(hex_str(TID_HIDE_1&$F), 4);
_tsrc = TSRC_BREAK1_C; // Dust
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 8; // 8



// Frame 6  Cracked
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_ts[|_i]=ts_Man_made_7a_WRB;
_tsrc = TSRC_BREAK3_B; // Cracked
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 5;



// Frame 7   Unbroken
// ----------------------------------------------
for(_i=0; _i<_tile_count; _i++) _dl_solid [|_i]=TID_SOLID1;
for(_i=0; _i<_tile_count; _i++) _dl_unique[|_i]=TID_BREAK3;
_tsrc = TSRC_BREAK3_A; // Unbroken
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);

_cue += 1;



// Frame 8  (End)
// ----------------------------------------------
_tsrc = _tsrc;
for(_i=0; _i<_tile_count; _i++)
{
              _dk=hex_str(_i);
    _dm_data[?_dk+STR_Depth]     = _dl_depth [|_i];
    _dm_data[?_dk+STR_rc_offset] = _dl_rc_off[|_i];
    _dm_data[?_dk+STR_Tileset]   = _dl_ts    [|_i];
    _dm_data[?_dk+STR_Solid]     = _dl_solid [|_i];
    _dm_data[?_dk+STR_unique]    = _dl_unique[|_i];
    _dm_data[?_dk+STR_HIDDEN]    = str_hex(string_copy(_hide, (_i<<1)+1, 2));
    _dm_data[?_dk+STR_TSRC]      = str_hex(string_copy(_tsrc, (_i<<1)+1, 2));
}
_cues += hex_str(_cue);
dm_tile[?_frame_key+hex_str(string_length(_cues)>>1)] = json_encode(_dm_data);
ds_map_clear(_dm_data);




dm_tile[?_anim_key+STR_Sequence]      = _cues; // cue string
dm_tile[?_anim_key+STR_Anim+STR_Loop] = $FF;   // loop type
ds_list_clear(_dl_rc_off);







// Background tile animation data
tile_data_init_1();








// ------------------------------------------------------------------------
global.WallStyle02_dm = ds_map_create();
//global.WallStyle02_dm[?STR_Tileset+"01"] = ts_Man_made_8a_HMS;
var _TS_IDX1 = ds_list_find_index(dl_tileset,ts_Man_made_6a_WRB);
var _TS_IDX2 = ds_list_find_index(dl_tileset,ts_Man_made_7a_WRB);
var _TS_IDX3 = ds_list_find_index(dl_tileset,ts_Man_made_8a_HMS);
var _TS_IDX4 = ds_list_find_index(dl_tileset,ts_SolidColors01_8x8);



global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"05"] = (_TS_IDX2<<8) | $B8; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"09"] = (_TS_IDX2<<8) | $BA; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"06"] = (_TS_IDX2<<8) | $B9; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"0A"] = (_TS_IDX2<<8) | $BB; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"01"] = (_TS_IDX2<<8) | $BF; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"02"] = (_TS_IDX2<<8) | $BD; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"04"] = (_TS_IDX2<<8) | $BC; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"08"] = (_TS_IDX2<<8) | $BE; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"10"] = (_TS_IDX2<<8) | $CF; // Single(1x1)
//global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"00"+STR_Wall+"10"] = (_TS_IDX3<<8) | $BE; // Single(1x1)

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"05"] = (_TS_IDX3<<8) | $E9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"09"] = (_TS_IDX3<<8) | $E9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"01"] = (_TS_IDX3<<8) | $E9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"04"] = (_TS_IDX3<<8) | $F9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"08"] = (_TS_IDX3<<8) | $F9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"01"+STR_Wall+"10"] = (_TS_IDX3<<8) | $F9; // Horizontal Right End

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"06"] = (_TS_IDX3<<8) | $E8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"0A"] = (_TS_IDX3<<8) | $E8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"02"] = (_TS_IDX3<<8) | $E8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"04"] = (_TS_IDX3<<8) | $F8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"08"] = (_TS_IDX3<<8) | $F8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"02"+STR_Wall+"10"] = (_TS_IDX3<<8) | $F8; // Horizontal Left End

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"03"+STR_Wall+"04"] = (_TS_IDX3<<8) | $CF; // Horizontal Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"03"+STR_Wall+"08"] = (_TS_IDX3<<8) | $CF; // Horizontal Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"03"+STR_Wall+"10"] = (_TS_IDX3<<8) | $CF; // Horizontal Mid

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"05"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"06"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"01"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"02"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"04"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"04"+STR_Wall+"10"] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"09"] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"0A"] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"01"] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"02"] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"08"] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"08"+STR_Wall+"10"] = (_TS_IDX3<<8) | $CE; // Vertical Top End

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"0C"+STR_Wall+"01"] = (_TS_IDX3<<8) | $DF; // Vertical Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"0C"+STR_Wall+"02"] = (_TS_IDX3<<8) | $DF; // Vertical Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Part+"0C"+STR_Wall+"10"] = (_TS_IDX3<<8) | $DF; // Vertical Mid




global.WallStyle02_dm[?STR_TSRC+STR_Part+"05"+STR_Wall+"05"] = (_TS_IDX3<<8) | $DB; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"05"+STR_Wall+"01"] = (_TS_IDX3<<8) | $DB; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"05"+STR_Wall+"04"] = (_TS_IDX3<<8) | $DB; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"05"+STR_Wall+"10"] = (_TS_IDX3<<8) | $FB; // Corner Right-Bottom

global.WallStyle02_dm[?STR_TSRC+STR_Part+"09"+STR_Wall+"09"] = (_TS_IDX3<<8) | $CB; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"09"+STR_Wall+"01"] = (_TS_IDX3<<8) | $CB; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"09"+STR_Wall+"08"] = (_TS_IDX3<<8) | $CB; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"09"+STR_Wall+"10"] = (_TS_IDX3<<8) | $EB; // Corner Right-Top

global.WallStyle02_dm[?STR_TSRC+STR_Part+"06"+STR_Wall+"06"] = (_TS_IDX3<<8) | $DA; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"06"+STR_Wall+"02"] = (_TS_IDX3<<8) | $DA; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"06"+STR_Wall+"04"] = (_TS_IDX3<<8) | $DA; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"06"+STR_Wall+"10"] = (_TS_IDX3<<8) | $FA; // Corner Left-Bottom

global.WallStyle02_dm[?STR_TSRC+STR_Part+"0A"+STR_Wall+"0A"] = (_TS_IDX3<<8) | $CA; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"0A"+STR_Wall+"02"] = (_TS_IDX3<<8) | $CA; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"0A"+STR_Wall+"08"] = (_TS_IDX3<<8) | $CA; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"0A"+STR_Wall+"10"] = (_TS_IDX3<<8) | $EA; // Corner Left-Top

global.WallStyle02_dm[?STR_TSRC+STR_Part+"01"+STR_Wall+"01"] = (_TS_IDX2<<8) | $D9; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Part+"01"+STR_Wall+"10"] = (_TS_IDX2<<8) | $D9; // Side Right

global.WallStyle02_dm[?STR_TSRC+STR_Part+"02"+STR_Wall+"02"] = (_TS_IDX2<<8) | $D8; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Part+"02"+STR_Wall+"10"] = (_TS_IDX2<<8) | $D8; // Side Left

global.WallStyle02_dm[?STR_TSRC+STR_Part+"04"+STR_Wall+"04"] = (_TS_IDX2<<8) | $D6; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Part+"04"+STR_Wall+"10"] = (_TS_IDX2<<8) | $D6; // Side Bottom

global.WallStyle02_dm[?STR_TSRC+STR_Part+"08"+STR_Wall+"08"] = (_TS_IDX2<<8) | $D1; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Part+"08"+STR_Wall+"10"] = (_TS_IDX2<<8) | $D1; // Side Top

global.WallStyle02_dm[?STR_TSRC+STR_Part+"10"+STR_Wall+"10"] = (_TS_IDX1<<8) | $EA; // Fill

/*
_i=1;
                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"00"+hex_str( ++_j)] = (_TS_IDX2<<8) | $CE; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"00"+hex_str( ++_j)] = (_TS_IDX3<<8) | $BE; // Single(1x1)
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"00"+STR_Count]=_j;

                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $E9; // Horizontal Right End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"01"+STR_Count]=_j;
                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $E8; // Horizontal Left End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"02"+STR_Count]=_j;
                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"03"+hex_str( ++_j)] = (_TS_IDX3<<8) | $93; // Horizontal Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"03"+hex_str( ++_j)] = (_TS_IDX3<<8) | $CF; // Horizontal Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"03"+STR_Count]=_j;

                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $DE; // Vertical Bottom End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"04"+STR_Count]=_j;
                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX3<<8) | $CE; // Vertical Top End
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"08"+STR_Count]=_j;
                                                                                       _j=0;
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"0C"+hex_str( ++_j)] = (_TS_IDX3<<8) | $96; // Vertical Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"0C"+hex_str( ++_j)] = (_TS_IDX3<<8) | $DF; // Vertical Mid
global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+hex_str(_i)+STR_Part+"0C"+STR_Count]=_j;

global.WallStyle02_dm[?STR_TSRC+"_Thin"+STR_Style+STR_Count]=_i;




_i=1;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+hex_str( ++_j)] = (_TS_IDX3<<8) | $E5; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+hex_str( ++_j)] = (_TS_IDX3<<8) | $D5; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+hex_str( ++_j)] = (_TS_IDX3<<8) | $E4; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+hex_str( ++_j)] = (_TS_IDX3<<8) | $D4; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C3; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C4; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C5; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B3; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B4; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B5; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C0; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C1; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C2; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B0; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B1; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B2; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+hex_str( ++_j)] = (_TS_IDX4<<8) | $F1; // Fill
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+STR_Count]=_j;




_i++;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D7; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D3; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D4; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D0; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D9; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C4; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C5; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D8; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B4; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B5; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D5; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D6; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D1; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D2; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+hex_str( ++_j)] = (_TS_IDX1<<8) | $EA; // Fill
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+STR_Count]=_j;




_i++;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+hex_str( ++_j)] = (_TS_IDX3<<8) | $FD; // Corner Right-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+hex_str( ++_j)] = (_TS_IDX3<<8) | $ED; // Corner Right-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"09"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+hex_str( ++_j)] = (_TS_IDX3<<8) | $FC; // Corner Left-Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"06"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+hex_str( ++_j)] = (_TS_IDX3<<8) | $EC; // Corner Left-Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"0A"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C3; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C4; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+hex_str( ++_j)] = (_TS_IDX3<<8) | $C5; // Side Right
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"01"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B3; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B4; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+hex_str( ++_j)] = (_TS_IDX3<<8) | $B5; // Side Left
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"02"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $D0; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $D1; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+hex_str( ++_j)] = (_TS_IDX3<<8) | $D2; // Side Bottom
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"04"+STR_Count]=_j;
                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D1; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+hex_str( ++_j)] = (_TS_IDX2<<8) | $D2; // Side Top
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"08"+STR_Count]=_j;

                                                                               _j=0;
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+hex_str( ++_j)] = (_TS_IDX1<<8) | $EA; // Fill
global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"10"+STR_Count]=_j;


global.WallStyle02_dm[?STR_TSRC+STR_Style+STR_Count]=_i;
*/










//STR_Single, STR_Horizontal, STR_Vertical, STR_Corner, STR_Side, STR_Top, STR_Bottom
//dk_SGL, dk_HRZ, dk_VRT, dk_CRN, dk_CTR, dk_SID, dk_TOP, dk_BTM, dk_RGT, dk_LFT
//dk_WallEdge, dk_WallFill, dk_WallStyle
global.WallStyle01_dm = ds_map_create();
global.WallStyle01_dm[?STR_Tileset+"01"] = ts_WallStyle01_01;
global.WallStyle01_dm[?"_Textures"+STR_Offset] = $30;
//var _TS_IDX = ds_list_find_index(dl_tileset,ts_WallStyle01_01)<<8;

// STR_Tile+"0": Single, Horizontal Left End, or Vertical Top End
// STR_Tile+"1": Horizontal or Vertical Mid
// STR_Tile+"2": Horizontal Right End, or Vertical Bottom End

// Single --------------
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"05"] = $03; // Wall Corner Right-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"09"] = $01; // Wall Corner Right-Top
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"06"] = $02; // Wall Corner Left-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"0A"] = $00; // Wall Corner Left-Top

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"01"] = $05; // Wall Side   Right  
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"02"] = $04; // Wall Side   Left   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"04"] = $07; // Wall Side   Bottom 
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"08"] = $06; // Wall Side   Top    

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"10"] = $08; // Wall Fill   



// Horizontal --------------
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"05"] = $13; // Wall Corner Right-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"09"] = $11; // Wall Corner Right-Top
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"06"] = $12; // Wall Corner Left-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"0A"] = $10; // Wall Corner Left-Top

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"01"] = $15; // Wall Side   Right  
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"02"] = $14; // Wall Side   Left   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"04"] = $19; // Wall Side   Bottom 
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"04"] = $1A; // Wall Side   Bottom 
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"04"] = $1B; // Wall Side   Bottom 
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"08"] = $16; // Wall Side   Top    
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"08"] = $17; // Wall Side   Top    
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"08"] = $18; // Wall Side   Top    

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"10"] = $1C; // Wall Fill   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"10"] = $1D; // Wall Fill   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"10"] = $1E; // Wall Fill   



// Vertical --------------
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"05"] = $23; // Wall Corner Right-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"09"] = $21; // Wall Corner Right-Top
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"06"] = $22; // Wall Corner Left-Bottom
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"0A"] = $20; // Wall Corner Left-Top

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"01"] = $27; // Wall Side   Right  
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"01"] = $28; // Wall Side   Right  
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"01"] = $29; // Wall Side   Right  
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"02"] = $24; // Wall Side   Left   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"02"] = $25; // Wall Side   Left   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"02"] = $26; // Wall Side   Left   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"04"] = $2B; // Wall Side   Bottom 
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"08"] = $2A; // Wall Side   Top    

global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"10"] = $2C; // Wall Fill   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"10"] = $2D; // Wall Fill   
global.WallStyle01_dm[?STR_TSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"10"] = $2E; // Wall Fill   




/*
var _TS01_IDX = ds_list_find_index(dl_tileset,ts_Man_made_8a_HMS);

// Wall Corners --------------
// Right Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_BTM+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6A;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_BTM+STR_Tile+STR_Horizontal+dk_RGT] = (_TS01_IDX<<8) | $8C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_BTM+STR_Tile+STR_Vertical  +dk_BTM] = (_TS01_IDX<<8) | $8E;
// Right Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_TOP+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6F;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_TOP+STR_Tile+STR_Horizontal+dk_RGT] = (_TS01_IDX<<8) | $7C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_RGT+dk_TOP+STR_Tile+STR_Vertical  +dk_TOP] = (_TS01_IDX<<8) | $7E;
// Left Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_BTM+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_BTM+STR_Tile+STR_Horizontal+dk_LFT] = (_TS01_IDX<<8) | $8B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_BTM+STR_Tile+STR_Vertical  +dk_BTM] = (_TS01_IDX<<8) | $8D;
// Left Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_TOP+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6E;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_TOP+STR_Tile+STR_Horizontal+dk_LFT] = (_TS01_IDX<<8) | $7B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Corner+dk_LFT+dk_TOP+STR_Tile+STR_Vertical  +dk_TOP] = (_TS01_IDX<<8) | $7D;



// Wall Sides --------------
// Right
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_RGT+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_RGT+STR_Tile+STR_Horizontal+dk_RGT] = (_TS01_IDX<<8) | $7C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_RGT+STR_Tile+STR_Vertical  +dk_BTM] = (_TS01_IDX<<8) | $97;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_RGT+STR_Tile+STR_Vertical  +dk_TOP] = (_TS01_IDX<<8) | $7F;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_RGT+STR_Tile+STR_Vertical  +dk_MID] = (_TS01_IDX<<8) | $96;
// Left
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_LFT+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $81;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_LFT+STR_Tile+STR_Horizontal+dk_LFT] = (_TS01_IDX<<8) | $7B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_LFT+STR_Tile+STR_Vertical  +dk_BTM] = (_TS01_IDX<<8) | $77;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_LFT+STR_Tile+STR_Vertical  +dk_TOP] = (_TS01_IDX<<8) | $85;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_LFT+STR_Tile+STR_Vertical  +dk_MID] = (_TS01_IDX<<8) | $76;
// Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_BTM+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_BTM+STR_Tile+STR_Horizontal+dk_RGT] = (_TS01_IDX<<8) | $94;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_BTM+STR_Tile+STR_Horizontal+dk_LFT] = (_TS01_IDX<<8) | $A3;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_BTM+STR_Tile+STR_Horizontal+dk_MID] = (_TS01_IDX<<8) | $93;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_BTM+STR_Tile+STR_Vertical  +dk_BTM] = (_TS01_IDX<<8) | $8D;
// Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_TOP+STR_Tile+STR_Single]            = (_TS01_IDX<<8) | $6D;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_TOP+STR_Tile+STR_Horizontal+dk_RGT] = (_TS01_IDX<<8) | $74;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_TOP+STR_Tile+STR_Horizontal+dk_LFT] = (_TS01_IDX<<8) | $82;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_TOP+STR_Tile+STR_Horizontal+dk_MID] = (_TS01_IDX<<8) | $73;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Side+dk_TOP+STR_Tile+STR_Vertical  +dk_TOP] = (_TS01_IDX<<8) | $7D;



// Wall Fill --------------
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Single]                   = (_TS01_IDX<<8) | $71;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Horizontal+dk_RGT]        = (_TS01_IDX<<8) | $74;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Horizontal+dk_LFT]        = (_TS01_IDX<<8) | $72;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Horizontal+dk_MID]        = (_TS01_IDX<<8) | $73;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Vertical  +dk_BTM]        = (_TS01_IDX<<8) | $77;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Vertical  +dk_TOP]        = (_TS01_IDX<<8) | $75;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+STR_Fill+STR_Tile+STR_Vertical  +dk_MID]        = (_TS01_IDX<<8) | $76;
*/


/*
// Wall Corners --------------
// Right Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"05"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6A;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"05"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $8C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"05"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $8E;
// Right Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6F;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $7C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $7E;
// Left Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"06"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"06"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $8B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"06"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $8D;
// Left Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"0A"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6E;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"0A"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $7B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"0A"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $7D;

// Wall Sides --------------
// Right
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"01"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"01"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $7C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"01"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $97;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"01"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $7F;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"01"+STR_Shape+"V"+"00"] = (_TS01_IDX<<8) | $96;
// Left
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"02"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $81;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"02"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $7B;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"02"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $77;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"02"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $85;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"02"+STR_Shape+"V"+"00"] = (_TS01_IDX<<8) | $76;
// Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"04"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6C;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"04"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $94;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"04"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $A3;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"04"+STR_Shape+"H"+"00"] = (_TS01_IDX<<8) | $93;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"04"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $8D;
// Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $6D;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $74;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $82;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"H"+"00"] = (_TS01_IDX<<8) | $73;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"08"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $7D;

// Wall Fill --------------
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"S"]      = (_TS01_IDX<<8) | $71;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"H"+"01"] = (_TS01_IDX<<8) | $74;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"H"+"02"] = (_TS01_IDX<<8) | $72;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"H"+"00"] = (_TS01_IDX<<8) | $73;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"V"+"04"] = (_TS01_IDX<<8) | $77;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"V"+"08"] = (_TS01_IDX<<8) | $75;
global.WallStyle01_dm[?dk_TSTSRC+STR_Wall+"10"+STR_Shape+"V"+"00"] = (_TS01_IDX<<8) | $76;
*/

/*
// Single --------------
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"05"] = (_TS01_IDX<<8) | $6A; // Wall Corner Right-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"09"] = (_TS01_IDX<<8) | $6F; // Wall Corner Right-Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"06"] = (_TS01_IDX<<8) | $6C; // Wall Corner Left-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"0A"] = (_TS01_IDX<<8) | $6E; // Wall Corner Left-Top

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"01"] = (_TS01_IDX<<8) | $6B; // Wall Side   Right  
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"02"] = (_TS01_IDX<<8) | $81; // Wall Side   Left   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"04"] = (_TS01_IDX<<8) | $6C; // Wall Side   Bottom 
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"08"] = (_TS01_IDX<<8) | $6D; // Wall Side   Top    

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"S"+STR_Tile+"0"+STR_Wall+"10"] = (_TS01_IDX<<8) | $71; // Wall Fill   



// Horizontal --------------
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"05"] = (_TS01_IDX<<8) | $8C; // Wall Corner Right-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"09"] = (_TS01_IDX<<8) | $7C; // Wall Corner Right-Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"06"] = (_TS01_IDX<<8) | $8B; // Wall Corner Left-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"0A"] = (_TS01_IDX<<8) | $7B; // Wall Corner Left-Top

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"01"] = (_TS01_IDX<<8) | $7C; // Wall Side   Right  
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"02"] = (_TS01_IDX<<8) | $7B; // Wall Side   Left   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"04"] = (_TS01_IDX<<8) | $A3; // Wall Side   Bottom 
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"04"] = (_TS01_IDX<<8) | $93; // Wall Side   Bottom 
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"04"] = (_TS01_IDX<<8) | $94; // Wall Side   Bottom 
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"08"] = (_TS01_IDX<<8) | $82; // Wall Side   Top    
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"08"] = (_TS01_IDX<<8) | $73; // Wall Side   Top    
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"08"] = (_TS01_IDX<<8) | $74; // Wall Side   Top    

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"0"+STR_Wall+"10"] = (_TS01_IDX<<8) | $72; // Wall Fill   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"1"+STR_Wall+"10"] = (_TS01_IDX<<8) | $73; // Wall Fill   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"H"+STR_Tile+"2"+STR_Wall+"10"] = (_TS01_IDX<<8) | $74; // Wall Fill   



// Vertical --------------
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"05"] = (_TS01_IDX<<8) | $8E; // Wall Corner Right-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"09"] = (_TS01_IDX<<8) | $7E; // Wall Corner Right-Top
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"06"] = (_TS01_IDX<<8) | $8D; // Wall Corner Left-Bottom
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"0A"] = (_TS01_IDX<<8) | $7D; // Wall Corner Left-Top

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"01"] = (_TS01_IDX<<8) | $7F; // Wall Side   Right  
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"01"] = (_TS01_IDX<<8) | $96; // Wall Side   Right  
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"01"] = (_TS01_IDX<<8) | $97; // Wall Side   Right  
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"02"] = (_TS01_IDX<<8) | $85; // Wall Side   Left   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"02"] = (_TS01_IDX<<8) | $76; // Wall Side   Left   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"02"] = (_TS01_IDX<<8) | $77; // Wall Side   Left   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"04"] = (_TS01_IDX<<8) | $8D; // Wall Side   Bottom 
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"08"] = (_TS01_IDX<<8) | $7D; // Wall Side   Top    

global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"0"+STR_Wall+"10"] = (_TS01_IDX<<8) | $75; // Wall Fill   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"1"+STR_Wall+"10"] = (_TS01_IDX<<8) | $76; // Wall Fill   
global.WallStyle01_dm[?dk_TSTSRC+STR_Shape+"V"+STR_Tile+"2"+STR_Wall+"10"] = (_TS01_IDX<<8) | $77; // Wall Fill   
*/








ds_map_destroy(_dm_data); _dm_data=undefined;
ds_list_destroy(_dl_rc_off); _dl_rc_off=undefined;
ds_list_destroy(_dl_depth); _dl_depth=undefined;
ds_list_destroy(_dl_ts); _dl_ts=undefined;
ds_list_destroy(_dl_solid); _dl_solid=undefined;
ds_list_destroy(_dl_unique); _dl_unique=undefined;




