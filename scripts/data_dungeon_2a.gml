/// data_dungeon_2a(to exit_name, from exit_name)


var _exit_curr = argument[0];
var _exit_from = argument[1];

var _exit_num, _exit_name, _exit_name1, _exit_name2;


var _i,_j,_k,_m, _idx, _val, _count,_count2, _j_count,_k_count, _type;

var _dir, _dirs, _x_scale, _y_scale;
var _horz, _vert;

var _datakey, _dk,_dk1,_dk2,_dk3;
var _str;

var _rm_name = RM_NAME_NPALACE;
var _RM_NAME = get_exit_rm_name(_exit_curr);
var _AREA_NAME = string_copy(_RM_NAME,1,AreaID_LEN);
var _DUNGEON_NUM = get_dungeon_num(_RM_NAME);
var _VIEW_DATA = val(g.dm_rm[?_RM_NAME+STR_View+STR_Data]);

var _clm, _clm1;
var _row, _row1;
var _rc = 0;


var _TSRC_BASE = $30;
var _TSRC_ELEV = TSRC_ELEVATOR_SHAFT;
var _tsrc;


var _PAGES_X = max(1, rm_get_wh(_RM_NAME,0)>>8);
var _PAGES_Y = max(1, rm_get_wh(_RM_NAME,1)>>8);
var _PAGES   = _PAGES_X * _PAGES_Y;

var _page, _page_x, _page_y;

var _dg_exit_dirs = ds_grid_create(_PAGES_X,_PAGES_Y);

var _grid_clm;
//var _dg_dungeon_map_ROWS = ds_grid_height(g.PAUSE_MENU.dg_dngn_map);




// TODO: Build system so each quest(1&2) both have their own unique data.



// ------------------------------------------------------------------------------------
if (_exit_from==-1)
{   // First rm of dungeon
    _exit_num = val(g.dm_rm[?_exit_curr+STR_Num]); // curr rm
    
    _clm1 = 0;
    _row1 = 0;
    
    if (_exit_num&$10) _clm1 = _PAGES_X-1;
    
    _exit_from = _exit_curr;
}
else
{
    _dk1  = STR_Dungeon+hex_str(_DUNGEON_NUM);
    _dk1 += get_exit_rm_name(_exit_from);
    _dk1 += STR_Page;
    
    _exit_num = val(g.dm_rm[?_exit_curr+STR_Num]); // curr rm
    
    _dk    =    val(g.dm_rm[?_exit_from+STR_Page]);
    _dk    =    _dk1+hex_str(_dk);
    
    _clm1  =    val(g.dm_rm[?_dk+STR_Map+STR_Clm]);       // from rm exit's clm
    _clm1 -=    val(g.dm_rm[?_exit_curr+STR_Page+"_x"]);  // curr rm's left most clm
    if (_exit_num&$30) _clm1 += sign_(_exit_num&$20); // RGT or LFT need +-1 adj
    
    
    //_dk1 Example: "_Dungeon01_PalcA_08_Page"
    //_dk  Example: "_Dungeon01_PalcA_08_Page03"
    //_dk = _dk1+hex_str(val(g.dm_rm[?_exit_from+STR_Page]));
    _row1  =    val(g.dm_rm[?_dk+STR_Map+STR_Row]);         // from rm exit's row
    _row1 -=    val(g.dm_rm[?_exit_curr+STR_Page+"_y"]);    // curr rm's --- most row
    if (_exit_num&$C0) // _exit_curr
    {
        //_dk    = STR_Destination+STR_Clm+STR_Count;
        //_clm1 += val(g.dm_rm[?_exit_curr+_dk]);
        //_count = max(abs(val(g.dm_rm[?_exit_from+_dk])), abs(val(g.dm_rm[?_exit_curr+_dk])));
        //_clm1 += (_count * sign_(_exit_num&$20));
        
        _dk    = STR_Destination+STR_Row+STR_Count;
        _count = max(abs(val(g.dm_rm[?_exit_from+_dk])), abs(val(g.dm_rm[?_exit_curr+_dk])));
        _row1 += (_count * sign_(_exit_num&$80));
    }
}




// ------------------------------------------------------------------------------------
_dk1  = STR_Dungeon+hex_str(_DUNGEON_NUM);
_dk1 += _RM_NAME;
_dk1 += STR_Page;

_dk2  = STR_Dungeon+hex_str(_DUNGEON_NUM)+STR_Map;

for(_i=0; _i<_PAGES; _i++)
{
    _page = _i;
    
    _dk = _dk1+hex_str(_page)+STR_Map;
    
    
    _page_x = _page mod _PAGES_X;
    
    _dk3 = _dk+STR_Clm;
    _clm = _clm1 + _page_x;
    g.dm_rm[?_dk3] = _clm;
    
    if (map_clm_lft > _clm )
    {   map_clm_lft = _clm;  }
    
    if (map_clm_rgt < _clm )
    {   map_clm_rgt = _clm;  }
    
    g.dm_rm[?_dk2+STR_Clm+STR_Count] = (map_clm_rgt-map_clm_lft) + 1;
    
    
    
    _page_y = _page div _PAGES_X;
    
    //_dk1 Example: "_Dungeon01_PalcA_08_Page"
    //_dk  Example: "_Dungeon01_PalcA_08_Page02_Map"
    //_dk3 Example: "_Dungeon01_PalcA_08_Page02_Map_Row"
    _dk3 = _dk+STR_Row;
    _row = _row1 + _page_y;
    g.dm_rm[?_dk3] = _row;
    
    if (map_row_btm < _row )
    {   map_row_btm = _row;  }
    
    if (map_row_top > _row )
    {   map_row_top = _row;  }
    
    g.dm_rm[?_dk2+STR_Row+STR_Count] = (map_row_btm-map_row_top) + 1;
    
    
    
    for(_j=0; _j<4; _j++) // side exits: RGT, LFT, BTM, TOP
    {
        for(_k=0; _k<$10; _k++)
        {
            _exit_num   = ($1<<_j)<<4;
            _exit_num  |= _k;
            _exit_name1 = _RM_NAME+hex_str(_exit_num);
            
            if (is_undefined(g.dm_rm[?_exit_name1+STR_Type]) 
            ||   _page  !=   g.dm_rm[?_exit_name1+STR_Page] )
            {
                continue;//_k
            }
            
            _dg_exit_dirs[#_page_x,_page_y] |= (_exit_num>>4);
            break;//_k.  move on to next side(next _j)
        }
    }
}





// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------
var _dl_elev_shaft_exits = ds_list_create();

for(_i=0; _i<2; _i++)
{
    for(_j=0; _j<$10; _j++)
    {
        _exit_name1 = _RM_NAME+hex_str(($40<<_i)+_j);
        _type       = g.dm_rm[?_exit_name1+STR_Type];
        if (is_undefined(_type)) break;//_j
        
        if (is_exit_type(_type, g.EXIT_TYPE_ELEVATOR))
        {
            ds_list_add(_dl_elev_shaft_exits, _exit_name1);
        }
    }
    
}





// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------
var _C0, _C1, _C2, _C3;


for(_i=0; _i<_PAGES_Y; _i++)
{
    for(_j=0; _j<_PAGES_X; _j++)
    {
        _page = (_i*_PAGES_X) + _j;
        
        
        _C0 = !_j;
        _C1 =  _j == _PAGES_X-1;
        _C2 = !_i;
        _C3 =  _i == _PAGES_Y-1;
        
        
        _dirs  = _dg_exit_dirs[#_j,_i]; // exit dirs for this page
        _count = bitCount(_dirs);
        
        /*
        if (_RM_NAME==Area_PalcA+"00"){
            _str  = ", _j " + string(_j);
            _str += ", _i " + string(_i);
            _str += ", _dirs $" + hex_str(_dirs);
            _str += ", _count $" + hex_str(_count);
            sdm(_str);
        }
        */
        
        _horz = _dirs&$3;
        _vert = _dirs&$C;
        
        _x_scale = -sign_( _dirs&$2);
        _y_scale = -sign_((_dirs&$C)==$8);
        
        
        
        _tsrc = _TSRC_BASE; // $30; Single page, 0 exits
        
        
        if (_PAGES==1)
        {   // Single page rm
            switch(_count){
            case 1:{_tsrc += ($1 + sign(_vert));                  break;}
            case 2:{_tsrc += ($4 + sign(_vert) + (_horz&&_vert)); break;}
            case 3:{_tsrc += ($8 + (_vert==$C));                  break;}
            case 4:{_tsrc +=  $C;                                 break;}
            }
        }
        else if (_PAGES_Y==1)
        {   // Hallway-Horizontal
            _tsrc += $10; // $40. 0 exits
            
            if (_C0   // !_i                  First horz page of this row(_j)
            ||  _C1 ) //  _i == _PAGES_X-1    Last  horz page of this row(_j)
            {   // End: RGT or LFT
                if (_C0) _x_scale = -1; // LFT
                
                if (_dirs)
                {
                    _tsrc++;                  // $41
                    _tsrc += ((_count>1)<<1); // $43
                    _tsrc += ((_count>2)<<1); // $45
                    _tsrc += !_horz;          // $42,44
                }
            }
            else
            {   // Hallway-Horizontal-Open
                _tsrc += $10;        // $50.  0 exits
                _tsrc += (_count>0); // $51.  1 exits
                _tsrc += (_count>1); // $52.  2 exits
            }
        }
        else if (_PAGES_X==1)
        {   // Hallway-Vertical
            _tsrc += $18; // 0 exits
            
            if (_C2   // !_i
            ||  _C3 ) //  _i == _PAGES_Y-1
            {   // End: BTM or TOP
                if (_C2) _y_scale = -1; // TOP
                
                if (_dirs)
                {
                    _tsrc++;
                    _tsrc += ((_count>1)<<1);
                    _tsrc += ((_count>2)<<1);
                    _tsrc += sign(_vert);
                }
            }
            else
            {   // Hallway-Vertical-Open
                _tsrc += $8; // 0 exits
                _tsrc += (_count>0);
                _tsrc += (_count>1);
            }
        }
        else if (_C0 || _C1 || _C2 || _C3)
        {   // Large rm
            _tsrc += $28; // 0 exits
            
            if(!_j) _x_scale = -1; // LFT
            if(!_i) _y_scale = -1; // TOP
            
            if ((_C0 && _C2)   // TOP-LFT. !_j               && !_i;
            ||  (_C1 && _C2)   // TOP-RGT.  _j == _PAGES_X-1 && !_i;
            ||  (_C0 && _C3)   // BTM-LFT. !_j               &&  _i == _PAGES_Y-1;
            ||  (_C1 && _C3) ) // BTM-RGT.  _j == _PAGES_X-1 &&  _i == _PAGES_Y-1;
            {   // Corner
                _tsrc += sign(_horz);
                _tsrc += sign(_vert)<<1;
                // _tsrc += (_horz && _vert);
            }
            else
            {   // Wall
                _tsrc += $4;                 // RGT or LFT wall
                _tsrc += ((_C2 || _C3) <<1); // BTM or TOP wall
                _tsrc += sign(_dirs);        // there is an exit
            }
        }
        
        
        // dg_dngn_map: 0:clm, 1:row, 2:tsrc, 3: xscale, 4: yscale, 5: rm_name, 6: rm page, 7: explored, 8: if tsrc is elevator shaft, this is a string of each exit name
        // MAP_DATAKEY1 = STR_Map+STR_Tile;
        _datakey = MAP_DATAKEY1+_RM_NAME+STR_Page+hex_str(_page);
        
        if(!is_undefined( g.dm_rm[?_datakey+STR_TSRC]))
        {   _tsrc =       g.dm_rm[?_datakey+STR_TSRC];  } // Special exception
        
        if(!is_undefined( g.dm_rm[?_datakey+STR_ScaleX]))
        {_x_scale = sign_(g.dm_rm[?_datakey+STR_ScaleX]);  } // Special exception
        
        if(!is_undefined( g.dm_rm[?_datakey+STR_ScaleY]))
        {_y_scale = sign_(g.dm_rm[?_datakey+STR_ScaleY]);  } // Special exception
        
        
        
        
        _clm = _clm1+_j;
        _row = _row1+_i;
        dm_dungeon_map_rc[?STR_Clm+string(_clm)+STR_Row+string(_row)] = _tsrc;
        
        _grid_clm = ds_grid_width(g.PAUSE_MENU.dg_dngn_map);
        g.dm_rm[?_RM_NAME+STR_Page+hex_str(_page)+STR_Map+STR_Idx] = _grid_clm;
        
        ds_grid_resize(g.PAUSE_MENU.dg_dngn_map, _grid_clm+1, g.PAUSE_MENU.DUNGEON_MAP_ROWS_DEFAULT);
                                            _idx=0;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _clm;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _row;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _tsrc;    // tsrc
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _x_scale;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _y_scale;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _RM_NAME;
        g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _page;    // rm page
        
        
        if (_dirs&$C)
        {
            _dk1 = _RM_NAME+STR_Page+hex_str(_page)+STR_Map+STR_Elevator+STR_Idx;
            _dk2 = STR_Destination+STR_Row+STR_Count;
            
            for(_k=ds_list_size(_dl_elev_shaft_exits)-1; _k>=0; _k--)
            {
                _exit_name1 =   _dl_elev_shaft_exits[|_k];
                _exit_name2 = val(g.dm_rm[?_exit_name1+STR_goto_reen]);
                _exit_name2 = string(_exit_name2);
                
                /*
                if (_RM_NAME==Area_PalcE+"0C"){
                    _str  = "_exit_name1: ";
                    _str += _exit_name1;
                    _str += ", exit page $" + hex_str(g.dm_rm[?_exit_name1+STR_Page]);
                    _str += ", rm page $" + hex_str(_page);
                    _str += ", _dirs $" + hex_str(_dirs) + ", exit dir $" + hex_str(val(g.dm_rm[?_exit_name1+STR_Num]) >>4);
                    sdm(_str);
                    _str  = ", elev tile cnt: " + string(g.dm_rm[?_exit_name1+_dk2]);
                    _str += ", _row1 $" + hex_str(_row1);
                    _str += ", _clm1 $" + hex_str(_clm1);
                    _str += ", _row $" + hex_str(_row);
                    _str += ", _clm $" + hex_str(_clm);
                    // _str += ", dl_dngn_map_clm idx: " + string(ds_list_find_index(dl_dngn_map_clm, _clm));
                    // _str += ", dl_dngn_map_row idx: " + string(ds_list_find_index(dl_dngn_map_row, _row+1));
                    // _str += ", _rc1 $" + hex_str(_rc);
                    // _rc = ((_row + 1) <<8) | _clm;
                    // _str += ", _rc2 $" + hex_str(_rc);
                    // _str += ", dl_elev_shaft_rc idx: " + string(ds_list_find_index(dl_elev_shaft_rc, _rc));
                    // _str += ", dl_dngn_map_rc idx: " + string(ds_list_find_index(dl_dngn_map_rc, _rc));
                    // _str += ", " + hex_str();
                    sdm(_str);
                }
                */
                
                
                
                
                if (g.dm_rm[?_exit_name1+STR_Page] != _page) continue;//_k
                
                
                
                
                
                _dir = val(g.dm_rm[?_exit_name1+STR_Num])>>4;
                if!(_dirs&_dir) continue;//_k
                _dir = sign_(_dir&$4);
                
                
                
                
                
                
                _count = abs(val(g.dm_rm[?_exit_name1+_dk2]));
                
                for(_m=1; _m<_count; _m++)
                {
                    _row = (_row1+_i) + (_m*_dir);
                    
                    _dk = STR_Clm+string(_clm)+STR_Row+string(_row);
                    if(!is_undefined(dm_dungeon_map_rc[?_dk])) continue;//_m
                    dm_dungeon_map_rc[?_dk] = _TSRC_ELEV;
                    
                    
                    _grid_clm = ds_grid_width(g.PAUSE_MENU.dg_dngn_map);
                    // _dk1 = _RM_NAME+STR_Page+hex_str(_page)+STR_Map+STR_Elevator+STR_Idx;
                    _count2 = val(g.dm_rm[?_dk1+STR_Count]);
                                  g.dm_rm[?_dk1+STR_Count] = _count2+1;
                                  g.dm_rm[?_dk1+hex_str(_count2)] = _grid_clm;
                    //
                    
                    ds_grid_resize(g.PAUSE_MENU.dg_dngn_map, _grid_clm+1, g.PAUSE_MENU.DUNGEON_MAP_ROWS_DEFAULT);
                                                        _idx=0;
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _clm;
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _row;
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _TSRC_ELEV; // elev shaft tsrc
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = 1;          // xscale
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = 1;          // yscale
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _RM_NAME;
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,_idx++] = _page;      // rm page
                    g.PAUSE_MENU.dg_dngn_map[#_grid_clm,8] = _exit_name1+_exit_name2; // the 2 exit names this elevator shaft is connected to
                }
            }
        }
    }
}


ds_grid_destroy(_dg_exit_dirs);        _dg_exit_dirs        = undefined;
ds_list_destroy(_dl_elev_shaft_exits); _dl_elev_shaft_exits = undefined;














// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------
for(_i=0; _i<4; _i++) // side exits: RGT $10, LFT $20, BTM $40, TOP $80
{
    for(_j=0; _j<$10; _j++) // Each possible exit of this side
    {
        _exit_num   = ((1<<_i)<<4) + _j;
        _exit_name1 = _RM_NAME+hex_str(_exit_num);
        if (is_undefined(g.dm_rm[?_exit_name1+STR_Type]))
        {
            break;//_j
        }
        
        
        if (_exit_num&$C0 
        &&  is_undefined(g.dm_rm[?_exit_name1+STR_Destination+STR_Row+STR_Count]) )
        {   // Skip bc there's another path to the linked exit.
            continue;//_j
        }
        
        
        _exit_name2 = val(g.dm_rm[?_exit_name1+STR_goto_reen], REEN_DEFAULT);
        _rm_name = get_exit_rm_name(_exit_name2);
        if (_exit_name1 == _exit_curr 
        ||  _exit_name2 == _exit_from 
        ||  _rm_name == _RM_NAME 
        || !get_dungeon_num(_rm_name) 
        ||  string_pos(Area_OvrwA, _exit_name2) )
        {
            continue;//_j
        }
        
        
        
        _val = g.dm_rm[?_exit_name2+STR_Page+"_x"];
        if (is_undefined(_val)) // 
        {
            continue;//_j
        }
        
        
        _dk1  = STR_Dungeon+hex_str(_DUNGEON_NUM);
        _dk1 += _rm_name;
        _dk1 += STR_Page;
        
        _dk   = _dk1+hex_str(_val);
        _dk  += STR_Map+STR_Clm;
        if(!is_undefined(g.dm_rm[?_dk])) // rm already done
        {
            continue;//_j
        }
        
        
        
        data_dungeon_2a(_exit_name2, _exit_name1);
    }
}




