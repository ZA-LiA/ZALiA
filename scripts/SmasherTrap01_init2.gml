/// SmasherTrap01_init2()


var _i,_j, _idx, _val1, _data, _xl,_yt, _dist1;
var _ts, _tsrc, _tile_id, _clm,_row, _clms,_rows;
var _pos;
var _datakey0;
var _trap_data = undefined;
DEBUG1=false;


GO_sprite_init(Smasher_SPRITE1);


facing_dir = 1;


if(!is_undefined(dk_spawn))
{
    attack_speed = val(g.dm_spawn[?dk_spawn+STR_Speed], attack_speed);
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        
        _datakey0 = STR_Delay;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            DELAY_timer = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = STR_Trap+STR_Data;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _trap_data = string_copy(_data, _pos, string_length(_data)-(_pos-1));
        }
        
        
        
        
        _datakey0 = STR_Trigger+STR_Type;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            Trigger_type = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = STR_Trigger+STR_Depth;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            Trigger_depth = real(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
            //show_debug_message("SmasherTrap01_init2(). "+"Trigger_depth="+string(Trigger_depth)+" DEPTH_BG3="+string(DEPTH_BG3));
        }
        
        _datakey0 = STR_Trigger+STR_Position;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            Trigger_xl = str_hex(string_copy(_val1,1,4));
            Trigger_yt = str_hex(string_copy(_val1,5,4));
        }
        
        _datakey0 = STR_Trigger+STR_Size;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            Trigger_w = str_hex(string_copy(_val1,1,4));
            Trigger_h = str_hex(string_copy(_val1,5,4));
        }
    }
}



switch(Trigger_type)
{
    default:{
    TriggerHB_w   = $20;
    TriggerHB_h   = $10;
    TriggerHB_xl  = Trigger_xl;
    TriggerHB_yt  = Trigger_yt;
    TriggerHB_yt += Trigger_OFFSET1;
    break;}//default
    
    
    
    
    case 2:{
    if (Trigger_depth!=0 
    &&  Trigger_w>>3 
    &&  Trigger_h>>3 )
    {
        TriggerHB_w   = Trigger_w;
        TriggerHB_h   = Trigger_h;
        TriggerHB_xl  = Trigger_xl;
        TriggerHB_yt  = Trigger_yt;
        TriggerHB_yt += Trigger_OFFSET1;
        
        
        _idx = ds_list_find_index(g.dl_TILE_DEPTHS, Trigger_depth);
        if (_idx!=-1) Trigger_dg_depth_pi_idx = _idx;
        /*
        _idx = ds_list_find_index(g.dl_TILE_DEPTHS, _depth);
        p.dg_depth_pi[#_idx,0] = _pi;     // pi default
        p.dg_depth_pi[#_idx,1] = _pi;     // pi current
        p.dg_depth_pi[#_idx,2] = _permut; // permut default. 00-05
        p.dg_depth_pi[#_idx,3] = _permut; // permut current. 00-05
        */
        
        Trigger_dg_tsrc = ds_grid_create(Trigger_w>>3,Trigger_h>>3);
        ds_grid_clear(Trigger_dg_tsrc, (max(0,ds_list_find_index(g.dl_tileset,ts_Man_made_4a_WRB))<<8) | $B4); // 1x1 stone block
        
        for(_i=0; _i<ds_grid_width(Trigger_dg_tsrc); _i++)
        {
            for(_j=0; _j<ds_grid_height(Trigger_dg_tsrc); _j++)
            {
                _tile_id = tile_layer_find(Trigger_depth, Trigger_xl+(_i<<3), Trigger_yt+(_j<<3));
                if (_tile_id!=-1)
                {
                    _ts = tile_get_background(_tile_id);
                    _idx = ds_list_find_index(g.dl_tileset,_ts);
                    if (_idx!=-1)
                    {
                        _tsrc = ((tile_get_top(_tile_id)>>3)<<4) | (tile_get_left(_tile_id)>>3);
                        Trigger_dg_tsrc[#_i,_j] = (_idx<<8) | _tsrc;
                    }
                }
            }
        }
    }
    break;}//case 2
}//switch(Trigger_type)




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


if (attack_x_direction!=0)
{
    spawn_xl = (attack_x_head_start_x + (ww_*-attack_x_direction)) - ww_;
    spawn_yt =  attack_x_head_start_y - hh_;
}
else
{
    spawn_xl =  attack_y_head_start_x - ww_;
    spawn_yt = (attack_y_head_start_y + (hh_*-attack_y_direction)) - hh_;
}


if (DEBUG1)
{
    show_debug_message("SmasherTrap01_init2()."+" attack_x_head_x=$"+hex_str(attack_x_head_x,4)+" attack_x_head_y=$"+hex_str(attack_x_head_y,4)+" attack_x_direction="+string(attack_x_direction)+" attack_x_distance=$"+hex_str(attack_x_distance,4)+" attack_x_duration=$"+hex_str(attack_x_duration,4));
    show_debug_message("SmasherTrap01_init2()."+" attack_y_head_x=$"+hex_str(attack_y_head_x,4)+" attack_y_head_y=$"+hex_str(attack_y_head_y,4)+" attack_y_direction="+string(attack_y_direction)+" attack_y_distance=$"+hex_str(attack_y_distance,4)+" attack_y_duration=$"+hex_str(attack_y_duration,4));
    show_debug_message("");
    show_debug_message("SmasherTrap01_init2()."+" BodyHB_xoff="+string(BodyHB_xoff)+" BodyHB_yoff="+string(BodyHB_yoff)+" BodyHB_w$="+hex_str(BodyHB_w,4)+" BodyHB_h$="+hex_str(BodyHB_h,4)+" ww=$"+hex_str(ww,4)+" hh=$"+hex_str(hh,4)+" spawn_xl=$"+hex_str(spawn_xl,4)+" spawn_yt=$"+hex_str(spawn_yt,4)+" xl=$"+hex_str(xl,4)+" yt=$"+hex_str(yt,4)+" Trigger_xl=$"+hex_str(Trigger_xl,4)+" Trigger_yt=$"+hex_str(Trigger_yt,4));
    show_debug_message("");
    show_debug_message("");
    show_debug_message("");
}




switch(ver)
{
    case 1:{
    break;}//case 1
    
    
    case 2:{
    var _depth, _layer_name;
    Wall_dg_tsrc = ds_grid_create(0,0);
    
    // so `set_xy` sets correct values
    sprite_index_xoff = ww_;
    sprite_index_yoff = hh_;
    
    
    if (attack_x_direction!=0)
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
            if ((attack_x_direction!=0 && tile_layer_find(_depth, attack_x_head_start_x-attack_x_direction,attack_x_head_start_y)!=-1) 
            ||  (attack_y_direction!=0 && tile_layer_find(_depth, attack_y_head_start_x,attack_y_head_start_y-attack_y_direction)!=-1) )
            {
                FGWALL_depth = _depth;
                GO_depth_init(FGWALL_depth-3);
                break;//_i
            }
        }
    }
    
    
    if (FGWALL_depth!=0)
    {
        if (attack_x_direction!=0) _tile_id = tile_layer_find(FGWALL_depth, attack_x_head_start_x-attack_x_direction, attack_x_head_start_y);
        else                       _tile_id = tile_layer_find(FGWALL_depth, attack_y_head_start_x, attack_y_head_start_y-attack_y_direction);
        if (_tile_id!=-1)
        {
            var _Wall_DEFAULT_TSRC = (max(0,ds_list_find_index(g.dl_tileset,ts_Man_made_4a_WRB))<<8) | $B4; // 1x1 stone block
            var _CLMS0 = ww>>3;
            var _ROWS0 = hh>>3;
            ds_grid_resize(Wall_dg_tsrc, _CLMS0,_ROWS0);
            ds_grid_clear( Wall_dg_tsrc, _Wall_DEFAULT_TSRC);
            
            
            // Whether this will be accurate positioning of a repeating tile block depends on the tileset/texture-style used
            //var _DIR = attack_x_direction + attack_y_direction; // Either attack_x_direction or attack_y_direction should be 0
            if (attack_x_direction!=0) var _COUNT1 = min(4,_CLMS0-2) &$E; // clm count of repeating tile block
            else                       var _COUNT1 = min(4,_ROWS0-2) &$E; // row count of repeating tile block
            
            
            if (attack_x_direction!=0)
            {
                _xl = g.rm_w * !attack_x_direction;
                _xl = clamp(_xl, spawn_xl, spawn_xl+ww);
                var _CLMA = abs(_xl-spawn_xl)>>3; // first or first+_COUNT1 clm, local to the Smasher, of a repeating tile block
                var _ROWA = 0;                    // first or first+_COUNT1 row, local to the Smasher, of a repeating tile block
            }
            else
            {
                _yt = g.rm_h * !attack_y_direction;
                _yt = clamp(_yt, spawn_yt, spawn_yt+hh);
                var _CLMA = 0;                    // first or first+_COUNT1 clm, local to the Smasher, of a repeating tile block
                var _ROWA = abs(_yt-spawn_yt)>>3; // first or first+_COUNT1 row, local to the Smasher, of a repeating tile block
            }
            
            var _CLMB = (spawn_xl+(_CLMA<<3)) >>3; // first or first+_COUNT1 clm, local to the room, of a repeating tile block
            var _ROWB = (spawn_yt+(_ROWA<<3)) >>3; // first or first+_COUNT1 row, local to the room, of a repeating tile block
            
            
            for(_i=0; _i<_CLMS0; _i++)
            {
                for(_j=0; _j<_ROWS0; _j++)
                {
                    _xl = spawn_xl + (_i<<3);
                    if (_xl<0 
                    ||  _xl>=g.rm_w )
                    {
                        _clms = _COUNT1 - (abs(_i-_CLMA) mod _COUNT1);
                        _xl = (_CLMB<<3) + ((_clms<<3)*sign_(_xl<0)); // _CLMB is either 0 or the first clm outside the room(g.rm_w<<3)
                    }
                    
                    _yt = spawn_yt + (_j<<3);
                    if (_yt<0 
                    ||  _yt>=g.rm_h )
                    {
                        _rows = _COUNT1 - (abs(_j-_ROWA) mod _COUNT1);
                        _yt = (_ROWB<<3) + ((_rows<<3)*sign_(_yt<0)); // _ROWB is either 0 or the first row outside the room(g.rm_h<<3)
                    }
                    
                    _tile_id = tile_layer_find(FGWALL_depth, _xl,_yt);
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
                }
            }
            /*
            _dist1 = _COUNT1<<3;
            if (attack_x_direction!=0)
            {
                _xl  = attack_x_head_start_x + ((4<<3)*-attack_x_direction); // skip detail tiles
                _xl += (_dist1>>1) * -attack_x_direction; // xc of repeating tile block
                _xl -=  _dist1>>1;                        // xl of repeating tile block
                _xl  = clamp(_xl, 0, g.rm_w-_dist1);
                var _CLMA = abs(_xl-spawn_xl)>>3; // start clm, local to the Smasher, of a repeating tile block
                var _ROWA = 0;                    // start row, local to the Smasher, of a repeating tile block
            }
            else
            {
                _yt  = attack_y_head_start_y + ((2<<3)*-attack_y_direction); // skip detail tiles
                _yt += (_dist1>>1) * -attack_y_direction; // yc of repeating tile block
                _yt -=  _dist1>>1;                        // yt of repeating tile block
                _yt  = clamp(_yt, 0, g.rm_h-_dist1);
                var _CLMA = 0;                    // start clm, local to the Smasher, of a repeating tile block
                var _ROWA = abs(_yt-spawn_yt)>>3; // start row, local to the Smasher, of a repeating tile block
            }
            
            var _CLMB = (spawn_xl+(_CLMA<<3)) >>3; // start clm, local to the room, of a repeating tile block
            var _ROWB = (spawn_yt+(_ROWA<<3)) >>3; // start row, local to the room, of a repeating tile block
            
            
            for(_i=0; _i<_CLMS0; _i++)
            {
                for(_j=0; _j<_ROWS0; _j++)
                {
                    _xl = spawn_xl + (_i<<3);
                    if(!inRange(_xl, 0,g.rm_w)) _xl = (_CLMB+(abs(_CLMA-_i) mod _COUNT1)) <<3;
                    
                    _yt = spawn_yt + (_j<<3);
                    if(!inRange(_yt, 0,g.rm_h)) _yt = (_ROWB+(abs(_ROWA-_j) mod _COUNT1)) <<3;
                    
                    _tile_id = tile_layer_find(FGWALL_depth, _xl,_yt);
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
                }
            }
            */
            
            
            
            /*
            if (attack_x_direction!=0)
            {
                var _ROW1  = 0;                            // inside  room. trap yt
                var _ROW2  = 0;                            // outside room. trap yt
                var _ROWS1 = ds_grid_height(Wall_dg_tsrc); // inside  room. trap yb
                var _ROWS2 = _ROWS1;                       // outside room. trap yb
                if (attack_x_direction)
                {
                    var _CLM1  = (ww-attack_x_head_start_x)>>3;        // inside  room. room xl
                    var _CLMS1 = ds_grid_width(Wall_dg_tsrc) - _CLM1;  // inside  room. 
                    var _CLM2  = 0;                                    // outside room. trap xl
                    var _CLMS2 = ds_grid_width(Wall_dg_tsrc) - _CLMS1; // outside room. 
                }
                else
                {
                    var _CLM1  = 0;                                    // inside  room. trap xl
                    var _CLMS1 = (g.rm_w-attack_x_head_start_x)>>3;    // inside  room. 
                    var _CLM2  = _CLMS1;                               // outside room. room xr
                    var _CLMS2 = ds_grid_width(Wall_dg_tsrc) - _CLMS1; // outside room. 
                }
            }
            else
            {
                var _CLM1  = 0;                           // inside  room. trap xl
                var _CLM2  = 0;                           // outside room. trap xl
                var _CLMS1 = ds_grid_width(Wall_dg_tsrc); // inside  room. trap xr
                var _CLMS2 = _CLMS1;                      // outside room. trap xr
                if (attack_y_direction)
                {
                    var _ROW1  = (hh-attack_y_head_start_y)>>3;         // inside  room. room yt
                    var _ROWS1 = ds_grid_height(Wall_dg_tsrc) - _ROW1;  // inside  room. 
                    var _ROW2  = 0;                                     // outside room. trap yt
                    var _ROWS2 = ds_grid_height(Wall_dg_tsrc) - _ROWS1; // outside room. 
                }
                else
                {
                    var _ROW1  = 0;                                     // inside  room. trap yt
                    var _ROWS1 = (g.rm_h-attack_y_head_start_y)>>3;     // inside  room. 
                    var _ROW2  = _ROWS1;                                // outside room. room yb
                    var _ROWS2 = ds_grid_height(Wall_dg_tsrc) - _ROWS1; // outside room. 
                }
            }
            
            //DEBUG_ID = id;
            //Wall_dg_tsrc_ID = string(Wall_dg_tsrc);
            //show_debug_message("DEBUG_ID="+string(DEBUG_ID)+", update_idx="+string(update_idx)+", Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc));
            //if (update_idx==0) show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+" _CLM1=$"+hex_str(_CLM1)+" _ROW1=$"+hex_str(_ROW1)+" _CLMS1=$"+hex_str(_CLMS1)+" _ROWS1=$"+hex_str(_ROWS1)+", _CLM2=$"+hex_str(_CLM2)+" _ROW2=$"+hex_str(_ROW2)+" _CLMS1=$"+hex_str(_CLMS1)+" _ROWS2=$"+hex_str(_ROWS2)+", ds_grid_width(Wall_dg_tsrc)=$"+hex_str(ds_grid_width(Wall_dg_tsrc))+" ds_grid_height(Wall_dg_tsrc)=$"+hex_str(ds_grid_height(Wall_dg_tsrc))+", _CLMS1+_CLMS2=$"+hex_str(_CLMS1+_CLMS2)+" _ROWS1+_ROWS2=$"+hex_str(_ROWS1+_ROWS2));
            
            // inside  room
            //if (update_idx==0) show_debug_message("");
            var _XL = spawn_xl + (_CLM1<<3);
            var _YT = spawn_yt + (_ROW1<<3);
            for(_i=_CLM1; _i<_CLM1+_CLMS1; _i++)
            {
                for(_j=_ROW1; _j<_ROW1+_ROWS1; _j++)
                {
                    Wall_dg_tsrc[#_i,_j] = _Wall_DEFAULT_TSRC;
                    _tile_id = tile_layer_find(FGWALL_depth, _XL+((_i-_CLM1)<<3), _YT+((_j-_ROW1)<<3));
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
                    
                    //if (update_idx==0 && Wall_dg_tsrc[#_i,_j]==_Wall_DEFAULT_TSRC) show_debug_message("SmasherTrap01_init2(). "+" _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+", _tile_id="+string(_tile_id)+", _idx="+string(_idx));
                }
            }
            
            
            if (attack_x_direction!=0)
            {
                _clms = 4;
                var _CLM3  = _CLM1 + (_clms*(attack_x_direction==-1));
                var _ROW3  = 0;
                var _CLMS3 = _CLMS1-_clms;
                var _ROWS3 = _ROWS1;
            }
            else
            {
                _rows = 4;
                var _CLM3  = 0;
                var _ROW3  = _ROW1 + (_rows*(attack_y_direction==-1));
                var _CLMS3 = _CLMS1;
                var _ROWS3 = _ROWS1-_rows;
            }
            
            // outside room
            //if (update_idx==0) show_debug_message("");
            for(_i=_CLM2; _i<_CLM2+_CLMS3; _i++)
            {
                for(_j=_ROW2; _j<_ROW2+_ROWS3; _j++)
                {
                    _clm = _CLM3 + ((_i-_CLM2) mod _CLMS3);
                    _row = _ROW3 + ((_j-_ROW2) mod _ROWS3);
                    Wall_dg_tsrc[#_i,_j] = Wall_dg_tsrc[#_clm,_row];
                    //if (update_idx==0) show_debug_message("SmasherTrap01_init2(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+", _CLM3=$"+hex_str(_CLM3)+" _ROW3=$"+hex_str(_ROW3)+" _CLMS3=$"+hex_str(_CLMS3)+" _ROWS3=$"+hex_str(_ROWS3)+", _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+" _clm=$"+hex_str(_clm)+" _row=$"+hex_str(_row)+", _ts="+background_get_name(g.dl_tileset[|(Wall_dg_tsrc[#_clm,_row]>>8)&$FF])+" _ts idx="+string((Wall_dg_tsrc[#_clm,_row]>>8)&$FF)+", _tsrc=$"+hex_str(Wall_dg_tsrc[#_clm,_row]&$FF)+", Wall_dg_tsrc[#_i,_j]=$"+hex_str(Wall_dg_tsrc[#_i,_j]));
                }
            }
            */
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




if (DEBUG1)
{
    show_debug_message("SmasherTrap01_init2()."+" attack_x_head_x=$"+hex_str(attack_x_head_x,4)+" attack_x_head_y=$"+hex_str(attack_x_head_y,4)+" attack_x_direction="+string(attack_x_direction)+" attack_x_distance=$"+hex_str(attack_x_distance,4)+" attack_x_duration=$"+hex_str(attack_x_duration,4));
    show_debug_message("SmasherTrap01_init2()."+" attack_y_head_x=$"+hex_str(attack_y_head_x,4)+" attack_y_head_y=$"+hex_str(attack_y_head_y,4)+" attack_y_direction="+string(attack_y_direction)+" attack_y_distance=$"+hex_str(attack_y_distance,4)+" attack_y_duration=$"+hex_str(attack_y_duration,4));
    show_debug_message("");
    show_debug_message("SmasherTrap01_init2()."+" BodyHB_xoff="+string(BodyHB_xoff)+" BodyHB_yoff="+string(BodyHB_yoff)+" BodyHB_w$="+hex_str(BodyHB_w,4)+" BodyHB_h$="+hex_str(BodyHB_h,4)+" ww=$"+hex_str(ww,4)+" hh=$"+hex_str(hh,4)+" spawn_xl=$"+hex_str(spawn_xl,4)+" spawn_yt=$"+hex_str(spawn_yt,4)+" xl=$"+hex_str(xl,4)+" yt=$"+hex_str(yt,4)+" Trigger_xl=$"+hex_str(Trigger_xl,4)+" Trigger_yt=$"+hex_str(Trigger_yt,4));
}

//show_debug_message("SmasherTrap01_init2()."+" palidx_def=$"+hex_str(palidx_def)+" palidx_base=$"+hex_str(palidx_base)+" palidx=$"+hex_str(palidx)+" global.PI_BGR1=$"+hex_str(global.PI_BGR1));




