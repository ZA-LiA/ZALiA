/// SmasherTrap01_init2()


var _i,_j, _idx, _val1, _data;
var _pos, _str;
var _datakey0;
var _trap_data = undefined;


GO_sprite_init(Smasher_SPRITE1);


if(!is_undefined(dk_spawn))
{
    attack_speed = val(g.dm_spawn[?dk_spawn+STR_Speed], attack_speed);
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        _str = STR_Trigger+STR_Position;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            trigger_x = str_hex(string_copy(_val1,1,4));
            trigger_y = str_hex(string_copy(_val1,5,4));
        }
        
        _str = STR_Delay;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            DELAY_timer = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _str = STR_Trap+STR_Data;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _trap_data = string_copy(_data, _pos, string_length(_data)-(_pos-1));
        }
    }
}




if(!is_undefined(_trap_data))
{
    var _CHAR_COUNT = $4;
    _i=-1;
    var _W = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    var _H = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    if (_W)
    {
        ww  = _W;
        ww_ = ww>>1;
    }
    
    if (_H)
    {
        hh  = _H;
        hh_ = hh>>1;
    }
    
    attack_x_head_start_x = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_x_head_start_y = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_x_head_end_x   = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_x_head_end_y   = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    
    attack_y_head_start_x = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_y_head_start_y = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_y_head_end_x   = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    attack_y_head_end_y   = str_hex(string_copy(_trap_data, ((++_i)*_CHAR_COUNT)+1, _CHAR_COUNT));
    
    SmasherTrap01_init3(attack_speed, attack_x_head_start_x,attack_x_head_start_y, attack_x_head_end_x,attack_x_head_end_y, attack_y_head_start_x,attack_y_head_start_y, attack_y_head_end_x,attack_y_head_end_y);
}


if (attack_x_duration)
{
    spawn_xl = (attack_x_head_start_x + (ww_*-attack_x_direction)) - ww_;
    spawn_yt =  attack_x_head_start_y - hh_;
}
else
{
    spawn_xl =  attack_y_head_start_x - ww_;
    spawn_yt = (attack_y_head_start_y + (hh_*-attack_y_direction)) - hh_;
}




switch(ver)
{
    case 1:{
    break;}//case 1
    
    
    case 2:{
    var _ts, _tsrc, _tile_id, _clm,_row, _clms,_rows;
    var _depth, _layer_name;
    Wall_dg_tsrc = ds_grid_create(0,0);
    
    if (attack_x_duration)
    {
        if (attack_x_direction) ww =          attack_x_head_start_x;
        else                    ww = g.rm_w - attack_x_head_start_x;
        ww += abs(attack_x_head_end_x-attack_x_head_start_x);
        ww_ = ww>>1;
        sprite_index_xoff = ww_; // so `set_xy` sets correct values
    }
    else
    {
        if (attack_y_direction) hh =          attack_y_head_start_y;
        else                    hh = g.rm_h - attack_y_head_start_y;
        hh += abs(attack_y_head_end_y-attack_y_head_start_y);
        hh_ = hh>>1;
        sprite_index_yoff = hh_; // so `set_xy` sets correct values
    }
    
    
    if (attack_x_duration)
    {
        spawn_xl = (attack_x_head_start_x + (ww_*-attack_x_direction)) - ww_;
        spawn_yt =  attack_x_head_start_y - hh_;
    }
    else
    {
        spawn_xl =  attack_y_head_start_x - ww_;
        spawn_yt = (attack_y_head_start_y + (hh_*-attack_y_direction)) - hh_;
    }
    
    
    set_xy(id, spawn_xl+ww_, spawn_yt+hh_);
    
    
    for(_i=ds_list_size(g.dl_TILE_DEPTH_NAMES)-1; _i>=0; _i--)
    {
        _datakey0   = g.dl_TILE_DEPTH_NAMES[|_i];
        _depth      = g.dm_TILE_DEPTH[?_datakey0];
        _layer_name = g.dm_tile_file[?_datakey0+STR_Depth+STR_Layer+STR_Name];
        if(!is_undefined(_depth) 
        && !is_undefined(_layer_name) 
        &&  string_pos("FGWALL",_layer_name) )
        {
            if ((attack_x_duration && tile_layer_find(_depth, attack_x_head_start_x-attack_x_direction,attack_x_head_start_y)!=-1) 
            ||  (attack_y_duration && tile_layer_find(_depth, attack_y_head_start_x,attack_y_head_start_y-attack_y_direction)!=-1) )
            {
                FGWALL_depth = _depth;
                GO_depth_init(FGWALL_depth-1);
                break;//_i
            }
        }
    }
    
    if (FGWALL_depth!=0)
    {
        if (attack_x_duration) _tile_id = tile_layer_find(FGWALL_depth, attack_x_head_start_x-attack_x_direction,attack_x_head_start_y);
        else                   _tile_id = tile_layer_find(FGWALL_depth, attack_y_head_start_x,attack_y_head_start_y-attack_y_direction);
        if (_tile_id!=-1)
        {
            ds_grid_resize(Wall_dg_tsrc, ww>>3,hh>>3);
            
            if (attack_x_duration)
            {
                var _ROW0  = 0;                            // inside  room. trap yt
                var _ROW1  = 0;                            // outside room. trap yt
                var _ROWS0 = ds_grid_height(Wall_dg_tsrc); // inside  room. trap yb
                var _ROWS1 = _ROWS0;                       // outside room. trap yb
                if (attack_x_direction)
                {
                    var _CLM0  = (ww-attack_x_head_start_x)>>3;        // inside  room. room xl
                    var _CLMS0 = ds_grid_width(Wall_dg_tsrc) - _CLM0;  // inside  room. 
                    var _CLM1  = 0;                                    // outside room. trap xl
                    var _CLMS1 = ds_grid_width(Wall_dg_tsrc) - _CLMS0; // outside room. 
                }
                else
                {
                    var _CLM0  = 0;                                    // inside  room. trap xl
                    var _CLMS0 = (g.rm_w-attack_x_head_start_x)>>3;    // inside  room. 
                    var _CLM1  = _CLMS0;                               // outside room. room xr
                    var _CLMS1 = ds_grid_width(Wall_dg_tsrc) - _CLMS0; // outside room. 
                }
            }
            else
            {
                var _CLM0  = 0;                           // inside  room. trap xl
                var _CLM1  = 0;                           // outside room. trap xl
                var _CLMS0 = ds_grid_width(Wall_dg_tsrc); // inside  room. trap xr
                var _CLMS1 = _CLMS0;                      // outside room. trap xr
                if (attack_y_direction)
                {
                    var _ROW0  = (hh-attack_y_head_start_y)>>3;         // inside  room. room yt
                    var _ROWS0 = ds_grid_height(Wall_dg_tsrc) - _ROW0;  // inside  room. 
                    var _ROW1  = 0;                                     // outside room. trap yt
                    var _ROWS1 = ds_grid_height(Wall_dg_tsrc) - _ROWS0; // outside room. 
                }
                else
                {
                    var _ROW0  = 0;                                     // inside  room. trap yt
                    var _ROWS0 = (g.rm_h-attack_y_head_start_y)>>3;     // inside  room. 
                    var _ROW1  = _ROWS0;                                // outside room. room yb
                    var _ROWS1 = ds_grid_height(Wall_dg_tsrc) - _ROWS0; // outside room. 
                }
            }
            
            //DEBUG_ID = id;
            //Wall_dg_tsrc_ID = string(Wall_dg_tsrc);
            //show_debug_message("DEBUG_ID="+string(DEBUG_ID)+", update_idx="+string(update_idx)+", Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc));
            //if (update_idx==0) show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+" _CLM0=$"+hex_str(_CLM0)+" _ROW0=$"+hex_str(_ROW0)+" _CLMS0=$"+hex_str(_CLMS0)+" _ROWS0=$"+hex_str(_ROWS0)+", _CLM1=$"+hex_str(_CLM1)+" _ROW1=$"+hex_str(_ROW1)+" _CLMS1=$"+hex_str(_CLMS1)+" _ROWS1=$"+hex_str(_ROWS1)+", ds_grid_width(Wall_dg_tsrc)=$"+hex_str(ds_grid_width(Wall_dg_tsrc))+" ds_grid_height(Wall_dg_tsrc)=$"+hex_str(ds_grid_height(Wall_dg_tsrc))+", _CLMS0+_CLMS1=$"+hex_str(_CLMS0+_CLMS1)+" _ROWS0+_ROWS1=$"+hex_str(_ROWS0+_ROWS1));
            
            // inside  room
            //if (update_idx==0) show_debug_message("");
            var _DEFAULT = (max(0,ds_list_find_index(g.dl_tileset,ts_Man_made_4a_WRB))<<8) | $B4; // 1x1 stone block
            var _XL = spawn_xl + (_CLM0<<3);
            var _YT = spawn_yt + (_ROW0<<3);
            for(_i=_CLM0; _i<_CLM0+_CLMS0; _i++)
            {
                for(_j=_ROW0; _j<_ROW0+_ROWS0; _j++)
                {
                    Wall_dg_tsrc[#_i,_j] = _DEFAULT;
                    _tile_id = tile_layer_find(FGWALL_depth, _XL+((_i-_CLM0)<<3), _YT+((_j-_ROW0)<<3));
                    if (_tile_id!=-1)
                    {
                        _ts = tile_get_background(_tile_id);
                        //_ts = ts_DungeonAlt05; // testing
                        _idx = ds_list_find_index(g.dl_tileset,_ts);
                        if (_idx!=-1)
                        {
                            _tsrc = ((tile_get_top(_tile_id)>>3)<<4) | (tile_get_left(_tile_id)>>3);
                            Wall_dg_tsrc[#_i,_j] = (_idx<<8) | _tsrc;
                            //if (update_idx==0) show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+", _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+", _ts="+background_get_name(_ts)+" _idx=$"+hex_str(_idx)+", _tsrc=$"+hex_str(_tsrc)+", Wall_dg_tsrc[#_i,_j]=$"+hex_str(Wall_dg_tsrc[#_i,_j]));
                        }
                    }
                    
                    //if (update_idx==0 && Wall_dg_tsrc[#_i,_j]==_DEFAULT) show_debug_message("SmasherTrap01_init2(). "+" _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+", _tile_id="+string(_tile_id)+", _idx="+string(_idx));
                }
            }
            
            
            if (attack_x_duration)
            {
                _clms = 4;
                var _CLM2  = _CLM0 + (_clms*(attack_x_direction==-1));
                var _ROW2  = 0;
                var _CLMS2 = _CLMS0-_clms;
                var _ROWS2 = _ROWS0;
            }
            else
            {
                _rows = 4;
                var _CLM2  = 0;
                var _ROW2  = _ROW0 + (_rows*(attack_y_direction==-1));
                var _CLMS2 = _CLMS0;
                var _ROWS2 = _ROWS0-_rows;
            }
            
            // outside room
            //if (update_idx==0) show_debug_message("");
            for(_i=_CLM1; _i<_CLM1+_CLMS1; _i++)
            {
                for(_j=_ROW1; _j<_ROW1+_ROWS1; _j++)
                {
                    _clm = _CLM2 + ((_i-_CLM1) mod _CLMS2);
                    _row = _ROW2 + ((_j-_ROW1) mod _ROWS2);
                    Wall_dg_tsrc[#_i,_j] = Wall_dg_tsrc[#_clm,_row];
                    //if (update_idx==0) show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+", _CLM2=$"+hex_str(_CLM2)+" _ROW2=$"+hex_str(_ROW2)+" _CLMS2=$"+hex_str(_CLMS2)+" _ROWS2=$"+hex_str(_ROWS2)+", _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+" _clm=$"+hex_str(_clm)+" _row=$"+hex_str(_row)+", _ts="+background_get_name(g.dl_tileset[|(Wall_dg_tsrc[#_clm,_row]>>8)&$FF])+" _ts idx="+string((Wall_dg_tsrc[#_clm,_row]>>8)&$FF)+", _tsrc=$"+hex_str(Wall_dg_tsrc[#_clm,_row]&$FF)+", Wall_dg_tsrc[#_i,_j]=$"+hex_str(Wall_dg_tsrc[#_i,_j]));
                }
            }
        }
        else
        {
            show_debug_message("SmasherTrap01_init2(). "+"!!!! Did not find tile at head start xy  !!!!");
        }
    }
    
    //show_debug_message("SmasherTrap01_init2(). "+"spawn_xl="+string(spawn_xl)+" spawn_yt="+string(spawn_yt)+" xl="+string(xl)+" yt="+string(yt)+" x="+string(x)+" y="+string(y)+", FGWALL_depth="+string(FGWALL_depth)+" depth="+string(depth));
    /*
    if (update_idx==0)
    {
        show_debug_message("");
        for(_i=0; _i<ww>>3; _i++)
        {
            for(_j=0; _j<hh>>3; _j++)
            {
                _ts   = g.dl_tileset[|(Wall_dg_tsrc[#_i,_j]>>8)&$FF];
                _tsrc =               (Wall_dg_tsrc[#_i,_j]>>0)&$FF; 
                show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+", _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+", _tsrc=$"+hex_str(_tsrc)+", _ts="+background_get_name(_ts)+", Wall_dg_tsrc[#_i,_j]=$"+hex_str(Wall_dg_tsrc[#_i,_j]));
            }
        }
        show_debug_message("");
    }
    */
    break;}//case 2
}//switch(ver)
/*
tile_layer_delete_at
tile_layer_find
tile_get_ids_at_depth
var _file_name = get_scene_tile_file_name(_RM_NAME, _QUEST_NUM);
global.dm_tile_layer_data[?'PalcC_002'+STR_Layer+'01'+STR_Name] = 'BG0201, STRUCTURE_FGWALL01_01, PILLAR01';
*/




set_xy(id, spawn_xl+ww_, spawn_yt+hh_);




/*
// Change tiles to solid
for(_i=0; _i<ww>>3; _i++)
{
    for(_j=0; _j<hh>>3; _j++)
    {
        tile_change_1a(0, spawn_xl+(_i<<3), spawn_yt+(_j<<3), -1,0, TID_SOLID1);
    }
}
*/




BodyHB_w = ww;
BodyHB_h = hh;




solid_type = TID_SOLID1;
add_to_solid_inst_list(id);




