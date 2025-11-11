/// update_tile_anims()


// D510: JSR A6D2, A6D6: JSR A6DD
var _i, _clm,_row, _val, _dir;
var _datakey1;
var _count, _counter, _cue,_cues,_CUE_END, _anim_frame,_anim_dir;


var          _COUNT=ds_grid_width(g.dg_tile_anim);
for(_i=0; _i<_COUNT; _i++)
//for(_i=0; _i<g.T_ANIM_MAX; _i++) // 1st $10 rows reserved for crumble bridge & breakable blocks
{
        _counter = g.dg_tile_anim[#_i,1]; // anim frame
    if(!_counter) continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    
    // ------------------------------------------------------------------
    _datakey1  = STR_Anim+hex_str(g.dg_tile_anim[#_i,0]); // 0: anim name
    _cues = g.dm_tile[?_datakey1+STR_Sequence];
    
    _anim_frame = g.dg_tile_anim[#_i,3]; // 3: Anim frame num
    _anim_dir   = g.dg_tile_anim[#_i,7]; // 7: 1(normal), -1(reverse)
    
    // 1: Play anim in reverse at end of anim once.
    // 2: Play anim in reverse at end of anim endlessly.
    _val        = g.dg_tile_anim[#_i,8]; // 8: other, special instructions or codes
    
    // increment counter
    _counter += _anim_dir;
    g.dg_tile_anim[#_i,1] = _counter;
    
    
    _CUE_END = str_hex(string_copy(_cues, string_length(_cues)-1, 2)); // last cue
    
    // Check for end anim
    if (_anim_dir)  _cue = _CUE_END;
    else            _cue = 0; // reverse anim
    if (_counter == _cue) // End of anim 
    {
        if (g.dg_tile_anim[#_i,4]==$FE  // FE: will loop
        ||  _val==1 )                   // 1: play anim in opposite dir once
        {
            if (_val==1)   _anim_dir   = -_anim_dir;
            
            if (_anim_dir) _counter    = 1;
            else           _counter    = _CUE_END;
            if (_anim_dir) _anim_frame = 1;
            else           _anim_frame = (string_length(_cues)>>1)-1;
            
            if (_val!=1 
            &&  _val!=2 )
            {
                _clm  = (g.dg_tile_anim[#_i,5]>>0) &$FF; // rm clm
                _row  = (g.dg_tile_anim[#_i,5]>>8) &$FF; // rm row
                _datakey1 += STR_frame+hex_str(_anim_frame);
                tile_anim_change_frame(_i, _datakey1, _clm,_row);
            }
            
            
            if (_val==1) g.dg_tile_anim[#_i,8] = 0; // 8:other, special instructions or codes
        }
        else
        {
            _counter    = 0;
            _anim_frame = 0;
            _anim_dir   = 1;
        }
        
        g.dg_tile_anim[#_i,1] = _counter;     // set counter
        g.dg_tile_anim[#_i,3] = _anim_frame;  // set Anim frame num
        g.dg_tile_anim[#_i,7] = _anim_dir;
    }
    else
    {   // Check for change tile
        if (_anim_dir 
        ||  _anim_frame-1 ) // Need to be >= 2. In reverse, 1 is last anim frame.
        {
                _cue  = _anim_frame - (!_anim_dir);
                _cue  = str_hex(string_copy(_cues, (_cue<<1)+1,2));
                //_cue  = str_hex(string_copy(_cues, ((_anim_frame - !_anim_dir)<<1)+1, 2));
            if (_cue == _counter)
            {
                // TODO: if changing from clear to solid, 
                // make sure a falling block(BlckB) is not
                // in the way.
                // Otherwise, don't let a falling block rest 
                // where there could be a pending tile anim 
                // that will change solid states.
                //if (tile_anims_upadate_1a(_anim_frame,_anim_frame+_anim_dir) != 1  // if changing from clear to solid
                                        _anim_frame += _anim_dir;
                g.dg_tile_anim[#_i,3] = _anim_frame; // Anim frame num
                
                _clm  = (g.dg_tile_anim[#_i,5]>>0) &$FF; // rm clm
                _row  = (g.dg_tile_anim[#_i,5]>>8) &$FF; // rm row
                
                _datakey1 += STR_frame+hex_str(_anim_frame);
                tile_anim_change_frame(_i, _datakey1, _clm,_row);
            }
        }
    }
}








if (g.mod_ANIMATE_LIQUID)
{
    for(_i=ds_grid_width(g.dg_anim_liquid)-1; _i>=0; _i--)
    {
        if (g.counter1 & g.dg_anim_liquid[#_i,1]) continue;
        
        
            _dir = g.dg_anim_liquid[#_i,2];
        if (_dir&$3)
        {
                g.dg_anim_liquid[#_i,3]++;
                g.dg_anim_liquid[#_i,3] &= $7;
                                               _val  = bit_dir(_dir&$3); // shift 1, -1 
            if!(g.dg_anim_liquid[#_i,3] &  $7) _val *= -7; // Position reset to default.
            
            tile_layer_shift(g.dg_anim_liquid[#_i,0], _val,0);
        }
        
        if (_dir&$C)
        {
                g.dg_anim_liquid[#_i,4]++;
                g.dg_anim_liquid[#_i,4] &= $7;
                                               _val  = bit_dir(_dir&$C); // shift 1, -1 
            if!(g.dg_anim_liquid[#_i,4] &  $7) _val *= -7; // Position reset to default.
            
            tile_layer_shift(g.dg_anim_liquid[#_i,0], 0,_val);
        }
    }
}




if (g.mod_CLOUD_MOVEMENT)
{
    for(_i=ds_grid_width(g.dg_anim_clouds)-1; _i>=0; _i--)
    {
        if (g.counter1 & g.dg_anim_clouds[#_i,1]) continue;
        
        
            _dir = g.dg_anim_clouds[#_i,2];
        if (_dir&$3)
        {
                g.dg_anim_clouds[#_i,3]++;
                g.dg_anim_clouds[#_i,3] &= $7;
                                               _val  = bit_dir(_dir&$3); // shift 1, -1 
            if!(g.dg_anim_clouds[#_i,3] &  $7) _val *= -7; // Position reset to default.
            
            tile_layer_shift(g.dg_anim_clouds[#_i,0], _val,0);
        }
        
        if (_dir&$C)
        {
                g.dg_anim_clouds[#_i,4]++;
                g.dg_anim_clouds[#_i,4] &= $7;
                                               _val  = bit_dir(_dir&$C); // shift 1, -1 
            if!(g.dg_anim_clouds[#_i,4] &  $7) _val *= -7; // Position reset to default.
            
            tile_layer_shift(g.dg_anim_clouds[#_i,0], 0,_val);
        }
    }
}





if (BackgroundTileAnimations_VER)
{
    _count = ds_list_size(dl_scene_anims);
    if (_count)
    {
        var _datakey2;
        var _ts1,_ts2;
        var _game_frame, _anim_duration;
        for(_i=0; _i<_count; _i++)
        {
            _datakey1 = dl_scene_anims[|_i];
            _ts1 = dm_TILE_ANIM[?_datakey1+STR_Tileset];
            if(!is_undefined(     _ts1) 
            &&  background_exists(_ts1) )
            {
                _anim_duration = val(dm_TILE_ANIM[?_datakey1+STR_Duration]);
                if (_anim_duration)
                {
                    _game_frame = counter1 mod _anim_duration;
                    _datakey2 = dm_TILE_ANIM[?_datakey1+STR_Cue+hex_str(_game_frame)+STR_Frame+STR_Datakey];
                    if(!is_undefined(_datakey2))
                    {
                        _ts2 = dm_TILE_ANIM[?_datakey2+STR_Tileset];
                        if(!is_undefined(     _ts2) 
                        &&  background_exists(_ts2) )
                        {
                            background_assign(_ts1,_ts2);
                        }
                    }
                }
            }
        }
    }
}
/*
else
{
    // Fire pit, 
    //if (g.counter1&$8) background_assign(ts_Anim_1,ts_Anim_1a);
    //else               background_assign(ts_Anim_1,ts_Anim_1b);
}
*/




