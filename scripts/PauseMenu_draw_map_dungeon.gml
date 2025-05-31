/// PauseMenu_draw_map_dungeon()


var _i,_j;
var _x,_y, _xl,_yt, _x_base,_y_base, _x_scale,_y_scale;
var _tsrc, _ts_xl,_ts_yt;
var _clm,_row;
var _rm_name = RM_NAME_NPALACE;
var _page;
var _AREA_NAME         = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Area], g.area_name);
var _DUNGEON_NUM       = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], g.dungeon_num);

var _Entrance_COUNT    = val(g.dm_rm[?_AREA_NAME+STR_Entrance+STR_Count]);
var _Entrance_ExitName = val(g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)], REEN_DEFAULT);
var _Entrance_ExitID   = str_hex(string_copy(_Entrance_ExitName,    RmName_LEN+1, 2));
var _Entrance_RmName   =         string_copy(_Entrance_ExitName, 1, RmName_LEN);
var _Entrance_Page     = val(g.dm_rm[?_Entrance_ExitName+STR_Page]);
var _Entrance_Open     = 0;
//var _Entrance_Open     = val(g.dm_rm[?_Entrance_ExitName+STR_Open]);


if (_Entrance_COUNT)
{
    var _dg_Entrance = ds_grid_create(_Entrance_COUNT, 5);
    for(_i=0; _i<_Entrance_COUNT; _i++)
    {
        _Entrance_ExitName  = val(g.dm_rm[?_AREA_NAME+STR_Entrance+hex_str(_i+1)], REEN_DEFAULT);
        _Entrance_ExitID    = str_hex(string_copy(_Entrance_ExitName,    RmName_LEN+1, 2));
        _Entrance_RmName    =         string_copy(_Entrance_ExitName, 1, RmName_LEN);
        _Entrance_Page      = val(g.dm_rm[?_Entrance_ExitName+STR_Page]);
        _Entrance_Open      = val(g.dm_rm[?_Entrance_ExitName+STR_Open]);
        _dg_Entrance[#_i,0] = _Entrance_ExitName;
        _dg_Entrance[#_i,1] = _Entrance_ExitID;
        _dg_Entrance[#_i,2] = _Entrance_RmName;
        _dg_Entrance[#_i,3] = _Entrance_Page;
        _dg_Entrance[#_i,4] = _Entrance_Open;
    }
}







if (MapPaper_USE_SURFACE)
{
    _x_base = 0;
    _y_base = 0;
}
else
{
    _x_base = MapArea_xl;
    _y_base = MapArea_yt;
}
_x_base += $1<<3;
_y_base += $1<<3;

var _DRAW_CLM_LFT  = _x_base>>3;        // 1st rm draw clm

var _DNGN_CLM_LFT  = _DRAW_CLM_LFT-1;   // 1st clm of drawn paper
    _DNGN_CLM_LFT += paper_drawn_clms;  // 1st clm after rgt of paper
    _DNGN_CLM_LFT -= CLMS_MAP_PAPER;    // 1st clm of paper (drawn or not)
    _DNGN_CLM_LFT += 1;                 // 1st clm of rm draw area (drawn or not)
    _DNGN_CLM_LFT += map_clm_off;       // lft most clm of dungeon (drawn or not)
//

var _DRAW_ROW_TOP  = _y_base>>3;        // 1st rm draw row

var _DNGN_ROW_TOP  = _DRAW_ROW_TOP-1;   // 1st row of drawn paper
    _DNGN_ROW_TOP += paper_drawn_rows;  // 1st row after btm of paper
    _DNGN_ROW_TOP -= ROWS_MAP_PAPER;    // 1st row of paper (drawn or not)
    _DNGN_ROW_TOP += 1;                 // 1st row of rm draw area (drawn or not)
    _DNGN_ROW_TOP += map_row_off;       // top most row of dungeon (drawn or not)
//


pal_swap_set(global.palette_image, global.PI_GUI1);
for(_i=ds_grid_width(dg_dngn_map)-1; _i>=0; _i--)
{
    // index: 5 rm_name, 6 rm page, 7 explored
    if(!dg_dngn_map[#_i,7]  // if not yet explored rm page
    && !g.dev_DungeonMapShowAll ) // if true, all rms/pages will draw regardless of explored amount
    {
        continue;//_i
    }
    
        _clm  = _DNGN_CLM_LFT + dg_dngn_map[#_i,0]; // idx 0: clm
        _row  = _DNGN_ROW_TOP + dg_dngn_map[#_i,1]; // idx 1: row
    //if(g.dungeon_num==2 && !(g.counter0&$7F)) sdm("dg_dngn_map[#_i,0] $"+hex_str(dg_dngn_map[#_i,0])+", dg_dngn_map[#_i,1] $"+hex_str(dg_dngn_map[#_i,1])+", _DNGN_CLM_LFT $"+hex_str(_DNGN_CLM_LFT)+", _DNGN_ROW_TOP $"+hex_str(_DNGN_ROW_TOP)+", _clm $"+hex_str(_clm)+", _row $"+hex_str(_row));
    if (_clm <  _DRAW_CLM_LFT 
    ||  _clm >= _DRAW_CLM_LFT+(paper_drawn_clms-2) 
    ||  _row <  _DRAW_ROW_TOP 
    ||  _row >= _DRAW_ROW_TOP+(paper_drawn_rows-2) )
    {
        continue;//_i
    }
    
    
    
    _x_scale = dg_dngn_map[#_i,3];
    _y_scale = dg_dngn_map[#_i,4];
    
    
    _x  =  _clm     <<3;
    _x += !_x_scale <<3;
    
    _y  =  _row     <<3;
    _y += !_y_scale <<3;
    
    
    _tsrc  = dg_dngn_map[#_i,2];
    _ts_xl = ((_tsrc>>0)&$F) <<3;
    _ts_yt = ((_tsrc>>4)&$F) <<3;
    draw_background_part_ext(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _x,_y, _x_scale,_y_scale, c_white,1);
    
    
    
    
    
    if (_Entrance_COUNT 
    &&  g.counter0&$20 )
    {
        _x_base  = (_clm<<3) + 4;
        _y_base  = (_row<<3) + 4;
        _rm_name = dg_dngn_map[#_i,5];
        _page    = dg_dngn_map[#_i,6];
        
        for(_j=0; _j<_Entrance_COUNT; _j++)
        {
            _Entrance_ExitName = _dg_Entrance[#_j,0];
            _Entrance_ExitID   = _dg_Entrance[#_j,1];
            _Entrance_RmName   = _dg_Entrance[#_j,2];
            _Entrance_Page     = _dg_Entrance[#_j,3];
            _Entrance_Open     = _dg_Entrance[#_j,4];
            
            if (_Entrance_RmName != _rm_name 
            ||  _Entrance_Page   != _page 
            || !_Entrance_Open )
            {
                continue;//_j
            }
            
            
            // $00-0F:  Middle/Doorway exits
            // $10-1F, $20-2F, $40-4F, $80-8F: Side exits
                _Entrance_ExitDir = (_Entrance_ExitID&$F0)>>4;
            if(!_Entrance_ExitDir) // $0:  Middle/Doorway exits
            {   // Arrow will face downward pointing a bit above the 
                // y center of the entrance exit's page.
                _EntranceArrow_SPR = dl_DngnEntranceArrow_SPR[|bitNum($4)];
            }
            else // $1(RGT), $2(LFT), $4(DWN), $8(UP)
            {   // Arrow will point AWAY from the entrance exit 
                // and be close to that exit, but outside the rm.
                _EntranceArrow_SPR = dl_DngnEntranceArrow_SPR[|bitNum(_Entrance_ExitDir)];
            }
            
            
            _x = _x_base;
            _y = _y_base;
            
            if(!_Entrance_ExitDir)
            {
                _y -= 3;
            }
            else
            {
                _x += DngnEntranceArrow_XYOff * bit_dir(_Entrance_ExitDir&$3);
                _y += DngnEntranceArrow_XYOff * bit_dir(_Entrance_ExitDir&$C);
            }
            
            
            draw_sprite_(_EntranceArrow_SPR,0, _x,_y);
        }
    }
}
pal_swap_reset();


if (_Entrance_COUNT)
{
    ds_grid_destroy(_dg_Entrance); _dg_Entrance=undefined;
}


/* // debug.  1 Line indicates the left edge of rm draw area.
var _color = c_lime;
// indicates the LEFT edge of rm draw area.
draw_line_colour( _x_base,      0, _x_base,viewYB(), _color,_color);
// indicates the TOP  edge of rm draw area.
draw_line_colour(viewXL(),_y_base,viewXR(), _y_base, _color,_color);

_color = c_aqua;
_x  = _DNGN_CLM_LFT<<3;
// indicates the LEFT edge of the dungeon
draw_line_colour( _x,           0, _x,     viewYB(), _color,_color);
// indicates the TOP  edge of the dungeon
_y  = _DNGN_ROW_TOP<<3;
draw_line_colour(viewXL(),     _y,viewXR(),       _y, _color,_color);
*/




