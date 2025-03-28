/// scene_enter_add_tiles()


/*
if (0)
{
    rm_enter_set_tiles();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/






// ====================================================================================
// ====================================================================================
// TODO: Optimize tile add system. 


if(!ds_map_size(g.dm_tile_file)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




// ---------------------------------------------------------------------------------
var _i,_j, _k,_m;
var _x,_y, _idx, _val,_val2, _dir, _type, _count;
var _scale_x,_scale_y;
var _clms,_rows, _clm,_row, _clm1,_row1;
var _area_name1,_area_name2, _rm_name1,_rm_name2;
var _depth,_depth_idx;
var _pi, _permut;
var _ts, _ts_x,_ts_y, _tsrc;
var _tile_id, _tile_data, _tile_count, _layer_name, _hide_val;
var _str,_char, _name, _pos, _ts_name;
var _dk;
var _rm_has_burnables=false;

var _STR_PERMUT = "PERMUT_";
var _STR_IDX    = "_idx";
var _STR_NAME   = "_name";
var _STR_SPEED_ = string_copy(STR_SPEED, 2,string_length(STR_SPEED)-1)+"_";
var _STR_DIR_   = string_copy(STR_DIR,   2,string_length(STR_DIR)  -1)+"_";

var _PREFIX_LEN = string_length(STR_BREAK_); // Length of the prefix to any dynamic layer name

var _data_system_ver = $01;


var _CLMS = g.dm_tile_file[?"width"];
var _ROWS = g.dm_tile_file[?"height"];

var _TSRC_A1 = $48;
var _TSRC_B1 = $A8;
var _offset1 = 0;



if (global.SceneRando_enabled 
&&  g.rm_name!=val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name) )
{
    _rm_name1 = g.rm_name;
    var _IS_RANDOMIZED_SCENE = true;
}
else
{
    _rm_name1 = f.dm_rando[?STR_Boss+STR_Scene+STR_Name+g.rm_name+STR_Normal];
    var _IS_RANDOMIZED_SCENE = !is_undefined(_rm_name1) && g.rm_name!=_rm_name1;
}

if(!is_undefined(_rm_name1)) _area_name1 = string_copy(_rm_name1,1,AreaID_LEN);
else                         _area_name1 = g.area_name;




room_tile_clear(room);



// --------------------------------------------------------------
// Get tileset info ----------------------------------
var _dm_ts_info = ds_map_create();
var _dm_ts_data;
var _dl_ts_data = g.dm_tile_file[?"tilesets"];


             _count = ds_list_size(_dl_ts_data);
for(_i=0; _i<_count; _i++)
{
    _ts_name    = "";
    _dm_ts_data = _dl_ts_data[|_i];
    _str        = _dm_ts_data[?"source"];
    // _dm_ts_data[?"source"] example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
    
    if (string_pos("palette",_str)) continue;
    
    for(_j=string_length(_str); _j>=1; _j--) // go backwards through the string
    {
            _char = string_char_at(_str,_j);
        if (_char==".")
        {   // So far, it's only the file ext(.tsx), next _j starts the tileset name.
            _ts_name = "";
            continue;
        }
        
        
        if (_char=="/")
        {
            _dm_ts_info[?hex_str(_i)+_STR_NAME] = _ts_name;
            _dm_ts_info[?hex_str(_i)+_STR_IDX]  = val(g.dm_tileset[?_ts_name],g.ts_SOLID_COLORS); // asset index
            break;
        }
        
        _ts_name = _char + _ts_name;
    }
    
    ds_map_clear(_dm_ts_data);
}







// --------------------------------------------------------------
ds_grid_resize(g.dg_RmTile_solid,       _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_solid,       0);
ds_grid_resize(g.dg_RmTile_solid_def,   _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_solid_def,   0);
g.dg_RmTile_solid_w = ds_grid_width( g.dg_RmTile_solid);
g.dg_RmTile_solid_h = ds_grid_height(g.dg_RmTile_solid);

ds_grid_resize(g.dg_RmTile_Break,       _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Break,       0);
ds_grid_resize(g.dg_RmTile_Break_def,   _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Break_def,   0);

ds_grid_resize(g.dg_RmTile_Liquid,      _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Liquid,      0);
ds_grid_resize(g.dg_RmTile_Liquid_def,  _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Liquid_def,  0);

ds_grid_resize(g.dg_RmTile_Current,     _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Current,     0);
ds_grid_resize(g.dg_RmTile_Current_def, _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Current_def, 0);

ds_grid_resize(g.dg_RmTile_TempSolid,   _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_TempSolid,   0);

ds_grid_resize(g.dg_RmTile_Spike,       _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Spike,       0);
ds_grid_resize(g.dg_RmTile_Spike_def,   _CLMS, _ROWS); // unit8
ds_grid_clear (g.dg_RmTile_Spike_def,   0);

ds_list_clear(g.dl_ceiling_bottom_rc);

with(g.burnable_mgr)
{
    if (variable_instance_exists(self, "dg_RmTile_Burnable")) {
        ds_grid_resize(dg_RmTile_Burnable,     _CLMS, _ROWS); // unit8
        ds_grid_clear (dg_RmTile_Burnable,     0);
        ds_grid_resize(dg_RmTile_Burnable_def, _CLMS, _ROWS); // unit8
        ds_grid_clear (dg_RmTile_Burnable_def, 0);
        ds_grid_resize(dg_Burnable,0,ds_grid_height(dg_Burnable));
        ds_grid_clear (dg_Burnable,0);
    }
}




//_ts_name = background_get_name(ts_Man_made_1a_WRB);

var _dl_tile;

var _dl_layer_prop_data, _dm_depth_prop_data;
var _dl_rm_depth = ds_list_create();

var _dm_layer_data;

var _dl_layer_data = val(g.dm_tile_file[?"layers"]);
if(!_dl_layer_data) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




var _LAYER_COUNT = ds_list_size(_dl_layer_data);


if (g.mod_ANIMATE_LIQUID)
{
    var _dl_liquid_depth = ds_list_create();
    var _dl_liquid_speed = ds_list_create();
    var _dl_liquid_dir   = ds_list_create();
    var _dl_liquid_yoff  = ds_list_create(); // Master yoff for layer/depth
}


if (g.mod_CLOUD_MOVEMENT)
{
    var _dl_cloud_depth = ds_list_create();
    var _dl_cloud_speed = ds_list_create();
    var _dl_cloud_dir   = ds_list_create();
}



// --------------------------------------------------------------
// Determine tile data system version
for(_i=0; _i<_LAYER_COUNT; _i++)
{
    _dm_layer_data =     _dl_layer_data[|_i];
    _layer_name    = val(_dm_layer_data[?"name"], "");
    
    if (string_pos("tile_data_system",_layer_name))
    {
        _pos=string_pos("v.",_layer_name)+2;
        _data_system_ver = str_hex(string_copy(_layer_name, _pos, 2));
        break;//_i
    }
}





// --------------------------------------------------------------
// Set defaults for p.dg_depth_pi
for(_i=ds_list_size(g.dl_TILE_DEPTHS)-1; _i>=0; _i--)
{
    // dg_depth_pi contains the pi's each depth will use for THE CURRENT RM.
    // This loop sets the default pi's for each depth. PI specific to the 
    // current rm is passed to it in rm_enter_set_tiles() from file data.
    _pi = val(p.dm_depth_pi[?hex_str(abs(g.dl_TILE_DEPTHS[|_i]))], PI_BGR_1);
    
    // pi
    p.dg_depth_pi[#_i,0] = _pi;
    p.dg_depth_pi[#_i,1] = _pi;
    // permut
    p.dg_depth_pi[#_i,2] = 0;   // default
    p.dg_depth_pi[#_i,3] = p.dg_depth_pi[#_i,2]; // current
}




// --------------------------------------------------------------
var _graphic_layer_count = 0;

// Build the pi data for the depths
for(_i=0; _i<_LAYER_COUNT; _i++)
{
    _dm_layer_data = _dl_layer_data[|_i];
    _layer_name    = _dm_layer_data[?"name"];
    _layer_name    = string(_layer_name);
    
    // ------------------------------------------------------------------
    if (string_pos("BG",_layer_name) 
    ||  string_pos("FG",_layer_name) )
    {
        if (        string_pos("BG",_layer_name))
        {    _pos = string_pos("BG",_layer_name);  }
        else _pos = string_pos("FG",_layer_name);
        
        _name  = string_copy(_layer_name,_pos,4); // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
        _depth = val(g.dm_TILE_DEPTH[?_name],DEPTH_FG7);
        _idx   = ds_list_find_index(g.dl_TILE_DEPTHS, _depth);
        
        
        // The pi each depth will use for THE CURRENT RM.
        _pi  = string_copy(_layer_name, _pos+string_length(_name), 2); // bg palette num ('01', '02', '03', '04')
        _pi  = str_hex(_pi);
        _pi -= _data_system_ver==3 && _pi>5;
        _pi  = PI_BGR_1 + (_pi-1);
        
            _pos = string_pos(_STR_PERMUT,_layer_name);
        if (_pos) _permut = str_hex(string_copy(_layer_name, _pos+string_length(_STR_PERMUT), 2)); // 01-06
        else      _permut = 1;
                  _permut--; // (01 through 06)-1 = (00 through 05)
                  _permut = clamp(_permut, 0,PI_PERMUTATIONS-1); // 00-05
        //
        p.dg_depth_pi[#_idx,0] = _pi;     // pi default
        p.dg_depth_pi[#_idx,1] = _pi;     // pi current
        p.dg_depth_pi[#_idx,2] = _permut; // permut default. 00-05
        p.dg_depth_pi[#_idx,3] = _permut; // permut current. 00-05
        /*
        if (g.rm_name==RM_NAME_NPALACE){
            _str  = " rm_name "+g.rm_name + "_layer_name "+_layer_name + ", _pos "+string(_pos) + ", _depth "+string(_depth) + ", _val $"+hex_str(_val) + ", _name "+_name + ", _idx $"+hex_str(_idx);
            _str += ", p.dg_depth_pi[#_idx,1] $"+hex_str(p.dg_depth_pi[#_idx,1]) + ", p.dg_depth_pi[#_idx,3] $"+hex_str(p.dg_depth_pi[#_idx,3]);
            sdm(_str);
        }
        */
        
        // For easy access of the depth's Tiled layer name.
        // Some layer names can contain useful info.
        if (_idx!=-1)
        {
            _name = g.dl_TILE_DEPTH_NAMES[|_idx]; // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
            g.dm_tile_file[?_name+STR_Depth+STR_Layer+STR_Name] = _layer_name;
            g.dm_tile_file[?_layer_name+STR_Depth] = _depth;
            //sdm("_layer_name: "+_layer_name+", _depth "+string(_depth));
            _graphic_layer_count++;
        }
    }
}


// Some larger rooms struggle to pal swap the tiles 
// before the room reveals itself causing a type of 
// flash bang for the first frame or two. 
// This a bandaid that simply delays the room reveal.
if (g.ChangeRoom_timer)
{
    if (_graphic_layer_count>=8 
    ||  g.rm_pages_x*g.rm_pages_y>4 )
    {
        //g.ChangeRoom_timer_extra = 8;
        g.ChangeRoom_timer += 8;
    }
}





if (g.dev_use_tile_markers)
{
    tile_layer_delete_(DEPTH_SOLIDS);
    tile_layer_delete_(DEPTH_UNIQUE);
}





// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
/* // *** Dealing with the solids layer first greatly slows down the room start process ***
for(_i=0; _i<_LAYER_COUNT; _i++) // each depth/layer
{
    _depth = _dl_rm_depth[|_i];
    if (_depth==DEPTH_SOLIDS)
    {
        _dm_layer_data = _dl_layer_data[|_i];
        _dl_tile       = _dm_layer_data[?"data"];
        
                     _tile_count = ds_list_size(_dl_tile);
        for(_j=0; _j<_tile_count; _j++) // each tile of this depth
        {
                _tile_data = _dl_tile[|_j]; // 0 means no tile
            if (_tile_data==0) continue;//_j
            
            
            if (_tile_data&$80000000) _scale_x = -1;
            else                      _scale_x =  1;
            if (_tile_data&$40000000) _scale_y = -1;
            else                      _scale_y =  1;
            
            _tile_data--; // Tiled app adds 1 so it can't be 0
            _tile_data &= $3FFFFFFF; // truncate the scale xy data
            _tile_data  = abs(_tile_data);
            
            _ts   = val(_dm_ts_info[?hex_str(_tile_data>>8)+_STR_IDX], g.ts_TILE_MARKER);
            _tsrc = _tile_data&$FF;
            
            
            _clm = _j mod _CLMS;
            _row = _j div _CLMS;
            _x = (_clm+(_scale_x==-1)) <<3;
            _y = (_row+(_scale_y==-1)) <<3;
            
            
            g.dg_RmTile_solid    [#_clm,_row] = _tsrc;
            g.dg_RmTile_solid_def[#_clm,_row] = _tsrc;
            
            if (g.dev_use_tile_markers 
            &&  _tsrc )
            {
                tile_add(g.ts_TILE_MARKER, ((_tsrc>>0)&$F)<<3,((_tsrc>>4)&$F)<<3, 8,8, _x,_y, DEPTH_SOLIDS);
            }
            
            
            _hide_val = -1;
            _tile_id = tile_add_2a(_depth, _x,_y, _ts,_tsrc, _hide_val);
            //_tile_id = tile_change_1a(_depth, _x,_y, _ts,_tsrc, -1,-1, _hide_val);
            if (tile_exists(_tile_id)) tile_set_scale(_tile_id, _scale_x,_scale_y);
        }
        
        
        break;//_i
    }
}
*/







// ----------------------------------------------------------
_offset1 = -1;

//for(_i=_LAYER_COUNT-1; _i>=0; _i--) // each depth/layer.    *** WHY IS THIS SO MUCH SLOWER???? ***
for(_i=0; _i<_LAYER_COUNT; _i++) // each depth/layer
{
    _depth         = _dl_rm_depth[|_i];
    
    _dm_layer_data = _dl_layer_data[|_i];
    _dl_tile       = _dm_layer_data[?"data"];
    
    // _layer_name example: "BG0301, HIDDEN_01, BREAK__01"
    _layer_name    = _dm_layer_data[?"name"];
    //sdm("_layer_name: "+_layer_name);
    
    
    if(!string_pos("BG",    _layer_name) 
    && !string_pos("FG",    _layer_name) 
    && !string_pos("SOLIDS",_layer_name) )
    {
        continue;//_i.  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    }
    
    if (string_pos("SOLIDS",_layer_name))
    {
        _depth = DEPTH_SOLIDS;
    }
    else
    {
        if (string_pos("BG",_layer_name)) _name = string_copy(_layer_name,string_pos("BG",_layer_name),4); // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
        else                              _name = string_copy(_layer_name,string_pos("FG",_layer_name),4); // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
        _depth = val(g.dm_TILE_DEPTH[?_name],DEPTH_FG7);
    }
    
    
    // g.dl_TILE_DEPTHS is only FG/BG depths
    _depth_idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
    
    
    
    
    // ------------------------------------------------------
                 _tile_count = ds_list_size(_dl_tile);
    for(_j=0; _j<_tile_count; _j++) // each tile of this depth
    {
            _tile_data = _dl_tile[|_j]; // 0 means no tile
        if (_tile_data==0)
        {
            continue;//_j.  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
        
        
        if (string_pos("LIQUID_03",_layer_name)) // Vertical movement (like waterfalls)
        {
            if (string_pos("DIR_04",_layer_name))       _tile_data = (_tile_data&$3FFFFFFF) | choose($0,$40000000,$80000000,$C0000000);
        }
        else if (g._YxY_ && !string_pos("SOLIDS",_layer_name))
        {
                 if (g.rm_num&$1)                       _tile_data = (_tile_data&$3FFFFFFF) | choose($0,$40000000,$80000000,$C0000000);
            else if (g.dungeon_num && _tile_data&$F<$6) _tile_data = (_tile_data&$3FFFFF0F) | (irandom($F)<<4);
        }
        
        
        
        
        if (_tile_data&$80000000) _scale_x = -1;
        else                      _scale_x =  1;
        if (_tile_data&$40000000) _scale_y = -1;
        else                      _scale_y =  1;
        
        _tile_data--; // Tiled app adds 1 so it can't be 0
        _tile_data &= $3FFFFFFF; // truncate the scale xy data
        _tile_data  = abs(_tile_data);
        
        _tsrc = _tile_data&$FF;
        //if(!string_pos("SOLIDS",_layer_name) && _tsrc>1) _tsrc--; // Testing
        
        
        _ts = val(_dm_ts_info[?hex_str(_tile_data>>8)+_STR_IDX], g.ts_TILE_MARKER);
        
        if (g.dungeon_num 
        &&  string_pos(STR_Dungeon,background_get_name(_ts)) )
        {
            if (_IS_RANDOMIZED_SCENE)
            {
                switch(_area_name1){
                case Area_PalcA:{_ts=ts_DungeonA01; break;}
                case Area_PalcB:{_ts=ts_DungeonB01; break;}
                case Area_PalcC:{_ts=ts_DungeonC01; break;}
                case Area_PalcD:{_ts=ts_DungeonD01; break;}
                case Area_PalcE:{_ts=ts_DungeonE01; break;}
                case Area_PalcF:{_ts=ts_DungeonF01; break;}
                case Area_PalcG:{_ts=ts_DungeonG01; break;}
                }
            }
            
            if (val(f.dm_rando[?STR_Randomize+STR_Dungeon+STR_Tileset]))
            {
                _ts = val(f.dm_rando[?STR_Rando+STR_Tileset+background_get_name(_ts)], _ts)
            }
            //_ts = ts_DungeonAlt05; // testing
        }
        
        
        
        
        
        _clm = _j mod _CLMS;
        _row = _j div _CLMS;
        _x = (_clm+(_scale_x==-1)) <<3;
        _y = (_row+(_scale_y==-1)) <<3;
        
        
        
        if (string_pos("SOLIDS",_layer_name))
        {
            g.dg_RmTile_solid    [#_clm,_row] = _tsrc;
            g.dg_RmTile_solid_def[#_clm,_row] = _tsrc;
            
            if (g.dev_use_tile_markers 
            &&  _tsrc )
            {
                tile_add(g.ts_TILE_MARKER, ((_tsrc>>0)&$F)<<3,((_tsrc>>4)&$F)<<3, 8,8, _x,_y, DEPTH_SOLIDS);
            }
            
            continue;//_j.  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
        
        
        if(!background_exists(_ts))
        {
            continue;//_j.  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
        
        
        
        
        
        // ----------------------------------------------------------------------
             _pos = string_pos(STR_HIDDEN,_layer_name);
        if ( _pos)
        {    _hide_val = str_hex(string_copy(_layer_name, _pos+_PREFIX_LEN+1, 2));  }
        else _hide_val = -1;
        
        
        
        
        // ----------------------------------------------------------------------
        // ----------------------------------------------------------------------
        _tile_id = tile_add_2a(_depth, _x,_y, _ts,_tsrc, _hide_val);
        if (tile_exists(_tile_id)) tile_set_scale(_tile_id, _scale_x,_scale_y);
        
        if (1) // To avoid updating all the Tiled files.. Adding in extra wall center tiles
        //&&  background_exists(_ts) )
        {
            if (_ts==ts_DungeonA01 
            ||  _ts==ts_DungeonB01 
            ||  _ts==ts_DungeonC01 
            ||  _ts==ts_DungeonD01 
            ||  _ts==ts_DungeonE01 
            ||  _ts==ts_DungeonF01 
            ||  _ts==ts_DungeonG01 
            ||  _ts==ts_DungeonAlt01 
            ||  _ts==ts_DungeonAlt02 
            ||  _ts==ts_DungeonAlt03 
            ||  _ts==ts_DungeonAlt04 
            ||  _ts==ts_DungeonAlt05 
            ||  _ts==ts_DungeonAlt06 
            ||  _ts==ts_Cave01 )
            {
                if (_tsrc==_TSRC_A1+$00 
                ||  _tsrc==_TSRC_A1+$01 
                ||  _tsrc==_TSRC_A1+$10 
                ||  _tsrc==_TSRC_A1+$11 
                ||  _tsrc==_TSRC_B1+$00 
                ||  _tsrc==_TSRC_B1+$01 
                ||  _tsrc==_TSRC_B1+$10 
                ||  _tsrc==_TSRC_B1+$11 )
                {
                    _offset1 = (_tsrc>>4)&$1!=_row&$1;
                    if (_clm&$2 
                    ||  (_row+_offset1)&$2 )
                    {
                        if (_tsrc<_TSRC_B1) _tsrc += $02; // FG Wall center. $4A,4B,5A,5B
                        else                _tsrc += $24; // BG Wall center. $CC,CD,DC,DD
                    }
                }
                else
                {//G 02
                    if (inRange(_tsrc,$30,$37) 
                    ||  inRange(_tsrc,$52,$53) )
                    {
                        ds_list_add(g.dl_ceiling_bottom_rc, _tile_id);
                        //ds_list_add(g.dl_ceiling_bottom_rc, (_row<<8)|_clm);
                    }
                }
            }
        }
        // ----------------------------------------------------------------------
        // ----------------------------------------------------------------------
        
        
        
        
        
        
            _pos = string_pos(STR_VISIBLE,_layer_name);
        if (_pos)
        {
                _val = string_copy(_layer_name, _pos+string_length(STR_VISIBLE)+1, 2);
                _val = !!str_hex(_val); // 0 or 1
            if(!_val) tile_layer_hide(_depth);
        }
        
        
        
        
        
            _val = 0;
            _pos = string_pos(STR_SPIKE_,_layer_name);
        if (_pos)
        {
                   _type = string_copy(_layer_name, _pos+string_length(STR_SPIKE_)+1, 2);
            switch(_type){
            case "01":{_val=TID_SPIKE1; break;} // 
            case "02":{_val=TID_SPIKE2; break;} // 
            }
            
            if (_val)
            {
                dg_RmTile_Spike    [#_clm,_row] = (_depth_idx<<8) | _val;
                dg_RmTile_Spike_def[#_clm,_row] = dg_RmTile_Spike[#_clm,_row];
            }
        }
        
        
        
        
        
        
        
        
        
            _val = 0;
            _pos = string_pos(STR_BURNABLE,_layer_name);
        if (_pos)
        {
                _type = string_copy(_layer_name, _pos+string_length(STR_BURNABLE)+1, 2);
            if (_type=="01" 
            ||  _type=="02" )
            {
                _rm_has_burnables=true;
                
                with(g.burnable_mgr)
                {
                    if (isVal(_tsrc,$50,$51,$52,$53,$98,$99,$A8,$A9,$B1)) // vine graphics
                    {    _val=BURNABLE_A;  } // this could be BURNABLE_A or BURNABLE_B but that will have to be decided after the _i loop
                    else _val=BURNABLE_C;    // extra graphic detail around a vine graphic tile
                    dg_RmTile_Burnable    [#_clm,_row] = (_depth_idx<<8) | _val;
                    dg_RmTile_Burnable_def[#_clm,_row] = dg_RmTile_Burnable[#_clm,_row];
                }
            }
        }
        
        
        
        
        
        
        
            _val = 0;
            _pos = string_pos(STR_CURRENT,_layer_name);
        if (_pos)
        {
                   _type = string_copy(_layer_name, _pos+string_length(STR_CURRENT)+1, 2);
            switch(_type){
            case "01":{_val=TID_CURRENT1; break;} // 
            case "02":{_val=TID_CURRENT2; break;} // 
            }
            
            if (_val)
            {
                g.dg_RmTile_Current    [#_clm,_row] = (_depth_idx<<8) | _val;
                g.dg_RmTile_Current_def[#_clm,_row] = g.dg_RmTile_Current[#_clm,_row];
            }
        }
        
        
            _val = 0;
            _pos = string_pos(STR_BREAK_,_layer_name);
        if (_pos && !_val)
        {
                   _type = string_copy(_layer_name, _pos+_PREFIX_LEN+1, 2);
            switch(_type){
            case "01":{_val=TID_BREAK1; break;} // breakable block 1
            case "02":{_val=TID_BREAK2; break;} // crumble bridge 1
            case "03":{_val=TID_BREAK3; break;} // regenerating breakable block 1
            case "04":{_val=TID_BREAK4; break;} // regenerating crumble bridge 1
            }
            
            if (_val)
            {
                g.dg_RmTile_Break    [#_clm,_row] = (_depth_idx<<8) | _val;
                g.dg_RmTile_Break_def[#_clm,_row] = g.dg_RmTile_Break[#_clm,_row];
                
                if (g.dev_use_tile_markers)
                {
                    tile_add(g.ts_TILE_MARKER, ((_val>>0)&$F)<<3,((_val>>4)&$F)<<3, 8,8, _x,_y, DEPTH_UNIQUE);
                }
            }
        }
        
        
            _pos = string_pos(STR_LIQUID,_layer_name);
        if (_pos && !_val)
        {
                   _type = string_copy(_layer_name, _pos+_PREFIX_LEN+1, 2);
            switch(_type){
            case "01":{_val=TID_LQUID1; break;} // harmful body of liquid 1
            case "02":{_val=TID_LQUID2; break;} // safe body of liquid 1
            case "03":{_val=TID_LQUID3; break;} // 
            }
            
            if (_val)
            {
                g.dg_RmTile_Liquid    [#_clm,_row] = (_depth_idx<<8) | _val;
                g.dg_RmTile_Liquid_def[#_clm,_row] = g.dg_RmTile_Liquid[#_clm,_row];
                
                if (g.dev_use_tile_markers)
                {
                    tile_add(g.ts_TILE_MARKER, ((_val>>0)&$F)<<3,((_val>>4)&$F)<<3, 8,8, _x,_y, DEPTH_UNIQUE);
                }
            }
        }
        
        
            _pos = string_pos(STR_CLOUDS,_layer_name);
        if (_pos && !_val)
        {
                   _type = string_copy(_layer_name, _pos+_PREFIX_LEN+1, 2);
            switch(_type){
            case "01":{_val=TID_CLOUDS1; break;} // 
            }
        }
        
        
        if (g.mod_ANIMATE_LIQUID 
        &&  isVal(_val,TID_LQUID1,TID_LQUID2,TID_LQUID3) )
        {
                _idx = ds_list_find_index(_dl_liquid_depth,_depth);
            if (_idx+1 
            ||  string_pos(_STR_SPEED_,_layer_name) ) // if the file indicates the liquid should be animated
            {
                if!(_idx+1) // if this is a new layer
                {
                    // "DIR_01": RGT, "DIR_02": LFT, 04: DWN, 08: UP, or a combo of dirs
                        _pos = string_pos(_STR_DIR_,_layer_name);
                    if (_pos) _dir = str_hex(string_copy(_layer_name, _pos+string_length(_STR_DIR_), 2));
                    else      _dir = BIT_RGT; // RGT: default
                    
                                     _dir &= $F;
                    if (_dir&$3==$3) _dir  = (_dir&$C) | BIT_RGT;
                    if (_dir&$C==$C) _dir  = (_dir&$3) | BIT_DWN;
                    
                    
                    ds_list_add(_dl_liquid_dir, _dir);
                    
                    
                    if ( _val==TID_LQUID1 
                    && !(_dir&$C) )
                    {    _val2 = 1;  }
                    else _val2 = 0;
                    ds_list_add(_dl_liquid_yoff, _val2);
                    
                    
                    _pos  = string_pos(   _STR_SPEED_,_layer_name);
                    _pos += string_length(_STR_SPEED_);
                    ds_list_add(_dl_liquid_speed, str_hex(string_copy(_layer_name, _pos, 2)));
                    ds_list_add(_dl_liquid_depth, _depth);
                    
                    _idx = ds_list_size(_dl_liquid_depth)-1;
                }
                
                
                // In case any liquid is at edge of rm, this 
                // will prevent empty space when animating.
                // ** Note that any liquid tiles that will be animated must 
                // have an extra clm of themselves at their front.
                // Also liquid layers must have something obstructing its offset.
                if (tile_exists(_tile_id))
                {
                         _dir = bit_dir(_dl_liquid_dir[|_idx]);
                                  _clm = tile_get_x(_tile_id)>>3;
                    if ((_dir && !_clm) 
                    || (!_dir &&  _clm==_CLMS-1) )
                    {
                        if (_dir) _x = -8;
                        else      _x = _CLMS<<3;
                                  _y = tile_get_y(_tile_id);
                        tile_add(tile_get_background(_tile_id), tile_get_left(_tile_id),tile_get_top(_tile_id), 8,8, _x,_y, _depth);
                    }
                }
            }
        }
        
        
        
        if (g.mod_CLOUD_MOVEMENT 
        &&  isVal(_val,TID_CLOUDS1) )
        {
                _idx = ds_list_find_index(_dl_cloud_depth, _depth);
            if (_idx+1 
            ||  string_pos(_STR_SPEED_,_layer_name) ) // if the file indicates the clouds should be animated
            {
                if!(_idx+1) // if this is a new layer
                {
                    // "DIR_01": RGT, "DIR_02": LFT, 04: DWN, 08: UP, or a combo of dirs
                        _pos = string_pos(_STR_DIR_,_layer_name);
                    if (_pos) _val = str_hex(string_copy(_layer_name, _pos+string_length(_STR_DIR_), 2));
                    else      _val = BIT_RGT; // RGT: default
                    
                                     _val &= $F;
                    if (_val&$3==$3) _val  = (_val&$C) | $1;
                    if (_val&$C==$C) _val  = (_val&$3) | $4;
                    
                    ds_list_add(_dl_cloud_dir, _val);
                    
                    
                    _pos  = string_pos(   _STR_SPEED_,_layer_name);
                    _pos += string_length(_STR_SPEED_);
                    ds_list_add(_dl_cloud_speed, str_hex(string_copy(_layer_name, _pos, 2)));
                    ds_list_add(_dl_cloud_depth, _depth);
                    
                    _idx = ds_list_size(_dl_cloud_depth)-1;
                }
            }
        }
    }
}






// *** I had to move this down here because the solids layer is set AFTER everything else
// and setting the solids first really slows things down for some strange reason..
// *** It's important to not add solid tiles with burnable tiles in the Tiled file if there's no other reason for solids on that tile.
// Burnable tiles get set solid here instead.
// This is so when a burnable tile is burned and being removed, this system will know if that tile is supposed to be left solid or not.
if (_rm_has_burnables)
{
    with(g.burnable_mgr)
    {
        _clms=ds_grid_width( dg_RmTile_Burnable);
        _rows=ds_grid_height(dg_RmTile_Burnable);
        for(_i=(_clms*_rows)-1; _i>=0; _i--)
        {
            _clm = _i mod _clms;
            _row = _i div _clms;
            _val = dg_RmTile_Burnable[#_clm,_row];
            if (_val&$FF==BURNABLE_A)
            {
                if(!g.dg_RmTile_solid    [#_clm,_row])
                {
                    g.dg_RmTile_solid    [#_clm,_row] = TID_SOLID1;
                    g.dg_RmTile_solid_def[#_clm,_row] = TID_SOLID1;
                    
                    if (g.dev_use_tile_markers)
                    {
                        _x=_clm<<3;
                        _y=_row<<3;
                        tile_add(g.ts_TILE_MARKER, ((TID_SOLID1>>0)&$F)<<3,((TID_SOLID1>>4)&$F)<<3, 8,8, _x,_y, DEPTH_SOLIDS);
                    }
                }
                else
                {
                    dg_RmTile_Burnable    [#_clm,_row] = (_val&$FF00) | BURNABLE_B; // BURNABLE_B when removing a burnable tile, do not change the solid value
                    dg_RmTile_Burnable_def[#_clm,_row] = dg_RmTile_Burnable[#_clm,_row];
                }
            }
        }
    }
}








if(!DEV)
{
    tile_layer_delete(DEPTH_SOLIDS);
    tile_layer_delete(DEPTH_UNIQUE);
}
else if (g.dev_use_tile_markers)
{
    tile_layer_hide(DEPTH_SOLIDS);
    tile_layer_hide(DEPTH_UNIQUE);
}






if (g.mod_ANIMATE_LIQUID)
{
    ds_grid_resize(g.dg_anim_liquid, _count,7);
    ds_grid_clear( g.dg_anim_liquid,0);
                 _count=ds_list_size(_dl_liquid_depth);
    for(_i=0; _i<_count; _i++)
    {
        // 0: Depth
        g.dg_anim_liquid[#_i,0] = _dl_liquid_depth[|_i];
        // 1: Speed. Should only be 0, or a single bit: 1,2,4,8,$10,$20,..
        g.dg_anim_liquid[#_i,1] = max(0, bit1st(_dl_liquid_speed[|_i])-1);
        // 2: Movement direction
        g.dg_anim_liquid[#_i,2] = _dl_liquid_dir[|_i];
        // 3: Current x offset.
        g.dg_anim_liquid[#_i,3] = 0;
        // 4: Current y offset.
        g.dg_anim_liquid[#_i,4] = 0;
        // 5: Master  x offset.
        g.dg_anim_liquid[#_i,5] = 0;
        // 6: Master  y offset.
        g.dg_anim_liquid[#_i,6] = 0;
        
            _val=_dl_liquid_yoff[|_i]; g.dg_anim_liquid[#_i,6] = _val;
        if (_val!=0) tile_layer_shift( g.dg_anim_liquid[#_i,0],0,_val);
    }
    
    
    ds_list_destroy(_dl_liquid_depth); _dl_liquid_depth=undefined;
    ds_list_destroy(_dl_liquid_speed); _dl_liquid_speed=undefined;
    ds_list_destroy(_dl_liquid_dir);   _dl_liquid_dir  =undefined;
    ds_list_destroy(_dl_liquid_yoff);  _dl_liquid_yoff =undefined;
}



if (g.mod_CLOUD_MOVEMENT)
{
    _count = ds_list_size(_dl_cloud_depth);
    ds_grid_resize(g.dg_anim_clouds, _count,5);
    ds_grid_clear( g.dg_anim_clouds,0);
    
    for(_i=0; _i<_count; _i++)
    {
        // 0: Depth
        g.dg_anim_clouds[#_i,0] = _dl_cloud_depth[|_i];
        // 1: Speed. Should only be 0, or a single bit: 1,2,4,8,$10,$20,..
        g.dg_anim_clouds[#_i,1] = max(0, bit1st(_dl_cloud_speed[|_i])-1);
        // 2: Movement direction
        g.dg_anim_clouds[#_i,2] = _dl_cloud_dir[|_i];
        // 3: Current x offset.
        g.dg_anim_clouds[#_i,3] = 0;
        // 4: Current y offset.
        g.dg_anim_clouds[#_i,4] = 0;
    }
    
    
    ds_list_destroy(_dl_cloud_depth); _dl_cloud_depth=undefined;
    ds_list_destroy(_dl_cloud_speed); _dl_cloud_speed=undefined;
    ds_list_destroy(_dl_cloud_dir);   _dl_cloud_dir  =undefined;
}





ds_list_destroy(_dl_rm_depth); _dl_rm_depth=undefined;
ds_map_destroy( _dm_ts_info);  _dm_ts_info =undefined;













// ---------------------------------------------------------------------------------
var _anim_num, _seq, _loop;
for(_i=ds_grid_width(g.dg_tile_anim)-1; _i>=0; _i--)
{
    _anim_num = g.dg_tile_anim[#_i,0]; // 0: anim num/type. TID_BREAK1(breakable block), TID_BREAK2(crumble bridge), ...
    
                       _dk=STR_Anim+hex_str(_anim_num);
    _seq  = g.dm_TILE[?_dk+STR_Sequence];
    _loop = g.dm_TILE[?_dk+STR_Anim+STR_Loop];
    
    g.dg_tile_anim[#_i,1] = 0;     // counter. 0 means inactive
    g.dg_tile_anim[#_i,2] = _seq;  // tile id sequence
    g.dg_tile_anim[#_i,3] = 0;     // frame num
    g.dg_tile_anim[#_i,4] = _loop; // loop code
    g.dg_tile_anim[#_i,5] = 0;     // gridY gridX
    g.dg_tile_anim[#_i,6] = 0;     // default depth
    g.dg_tile_anim[#_i,7] = 1;     // animation dir (1: normal, -1: reverse)
    g.dg_tile_anim[#_i,8] = 0;     // other, special instructions or codes
}




