/// Challenge_SwitchB_init()


var _i,_j;


                   _i=1;
STATE_IDLE       = _i++; // 
STATE_CHANGING1  = _i++; // 
STATE_CHANGING2  = _i++; // 
STATE_CHANGING3  = _i++; // 
STATE_INCOMPLETE = _i++; // 
STATE_COMPLETE1  = _i++; // 
STATE_COMPLETE2  = _i++; // 
STATE_COMPLETE   = _i++; // 
sub_state        = STATE_IDLE;


DUR_DELAY1 = $40; // Delay completion start
DUR_DELAY2 = $20; // Delay completion reward
DUR_DELAY3 = $10; // 


var         _DEPTH=DEPTH_ENEMY;
with(SwchB){_DEPTH=depth; break;}
with(PushA){_DEPTH=depth; break;}
with(SwchB) GO_depth_init(_DEPTH+1);


complete = false;


switch(ver)
{
    // =========================================================
    // ----------------------------------------------------
    case 1:{
    locked_door = noone;
    
    if (val(f.dm_challenges[?challenge_id+STR_Complete]))
    {
        complete = true;
        with(SwchB) complete = true;
        sub_state = STATE_COMPLETE;
    }
    else
    {
        complete = false;
        locked_door = GameObject_create(x,y, LoDoA,3);
    }
    break;}//case 1
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case 2:{
    complete = false;
    
    Blocks_COUNT_X = 2;
    Blocks_COUNT_Y = 2;
    Blocks_DEPTH   = DEPTH_BG4;
    Blocks_TSRC    = "EE"+"EF"+"FE"+"FF";
    //Blocks_TSRC    = "30"+"31"+"32"+"33";
    Blocks_SND_CHANGE = get_audio_theme_track(dk_BlockBreak);
    Challenge_SwitchB_update_1a(!complete);
    break;}//case 2
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case 3:{
    /*
    if (val(f.dm_challenges[?challenge_id+STR_Complete]))
    {
        complete = true;
        
        with(Exit)
        {
            if (exitNum==$00)
            {
                open = true;
                doorway_spr = g.Doorway1_SPR;
                aud_play_sound(get_audio_theme_track(STR_Open+STR_LockedDoor));
                break;//with(Exit)
            }
        }
        
        sub_state = STATE_COMPLETE;
    }
    else
    {
        complete = false;
    }
    */
    break;}//case 3
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case 4:{ // Press switch to turn off waterfall
    var _k, _x,_y, _num;
    var _datakey0;
    var _depth, _layer_name;
    var _tile_id;
    
    Water_TSRC1 = $F0;
    Water_TSRC2 = $F8;
    Water_surf1 = -1;
    Water_dm = ds_map_create();
    
    for(_i=ds_list_size(g.dl_TILE_DEPTH_NAMES)-1; _i>=0; _i--)
    {
        _datakey0   = g.dl_TILE_DEPTH_NAMES[|_i];
        _depth      = g.dm_TILE_DEPTH[?_datakey0];
        _layer_name = g.dm_tile_file[?_datakey0+STR_Depth+STR_Layer+STR_Name];
        if(!is_undefined(_depth) 
        && !is_undefined(_layer_name) 
        &&  string_pos("LIQUID_03",_layer_name) )
        {
            GO_depth_init(_depth-1);
            Water_dm[?STR_Depth] = _depth;
            //show_debug_message("Challenge_SwitchB_init(). "+"_layer_name="+_layer_name+", _depth="+string(_depth));
            break;//_i
        }
    }
    
    
    _depth = Water_dm[?STR_Depth];
    if(!is_undefined(_depth))
    {
        var _XL = 0;
        var _CLMS0 = g.rm_clms;
        if (g.view_lock_rm&$C 
        &&  g.view_y_page_min==g.view_y_page_max )
        {
            var _ROWS0 = PAGE_ROWS;
            var _YT = (g.view_y_page_max*PAGE_ROWS)<<3;
        }
        else
        {
            var _ROWS0 = g.rm_rows;
            var _YT = 0;
        }
        
        //show_debug_message("Challenge_SwitchB_init(). "+" _XL=$"+hex_str(_XL)+" _YT=$"+hex_str(_YT)+", _CLMS0=$"+hex_str(_CLMS0)+" _ROWS0=$"+hex_str(_ROWS0)+", g.view_lock_rm=$"+hex_str(g.view_lock_rm)+" g.view_y_page_min="+string(g.view_y_page_min)+" g.view_y_page_max="+string(g.view_y_page_max));
        for(_i=0; _i<_CLMS0; _i++)
        {
            _num = 0;
            for(_j=0; _j<_ROWS0; _j++)
            {
                _x = _XL + (_i<<3);
                _y = _YT + (_j<<3);
                _tile_id = tile_layer_find(_depth,_x,_y);
                if (_tile_id!=-1)
                {
                    if(!_num)
                    {
                        _datakey0 = STR_Waterfall+STR_Count;
                        _num = val(Water_dm[?_datakey0]) + 1;
                        Water_dm[?_datakey0] = _num;
                        
                        _datakey0 = STR_Waterfall+hex_str(_num);
                        Water_dm[?_datakey0+STR_Surface] = -1;
                        Water_dm[?_datakey0+"_XL"] = _x;
                        Water_dm[?_datakey0+"_YT"] = _y;
                        Water_dm[?_datakey0+STR_Clms] = 1;
                        for(_k=_i+1; _k<_CLMS0; _k++)
                        {
                            _x = _XL + (_k<<3);
                            _tile_id = tile_layer_find(_depth,_x,_y);
                            if (_tile_id==-1)
                            {
                                Water_dm[?_datakey0+STR_Clms] = _k - _i;
                                break;//_k
                            }
                        }
                        
                        //show_debug_message("Challenge_SwitchB_init(). "+" val(Water_dm[?STR_Waterfall+'01'+'_XL'])=$"+hex_str(val(Water_dm[?STR_Waterfall+'01'+'_XL']))+" val(Water_dm[?STR_Waterfall+'01'+'_YT'])=$"+hex_str(val(Water_dm[?STR_Waterfall+'01'+'_YT'])));
                    }
                    
                    Water_dm[?_datakey0+STR_Rows] = val(Water_dm[?_datakey0+STR_Rows]) + 1;
                }
            }
            
            if (_num)
            {
                Water_dm[?_datakey0+STR_Active]             = true;
                Water_dm[?_datakey0+STR_Width]              = val(Water_dm[?_datakey0+STR_Clms])<<3;
                Water_dm[?_datakey0+STR_Height]             = val(Water_dm[?_datakey0+STR_Rows])<<3;
                Water_dm[?_datakey0+STR_Current+STR_Width]  = val(Water_dm[?_datakey0+STR_Width]);
                Water_dm[?_datakey0+STR_Current+STR_Height] = val(Water_dm[?_datakey0+STR_Height]);
                Water_dm[?_datakey0+STR_Current+"_XL"]      = val(Water_dm[?_datakey0+"_XL"]);
                Water_dm[?_datakey0+STR_Current+"_YT"]      = val(Water_dm[?_datakey0+"_YT"]);
                
                _i = _k; // skip past all clms of this waterfall
            }
        }
        
        
        // `Challenge_SwitchB` will be drawing the waterfalls
        tile_layer_delete(_depth);
    }
    //show_debug_message("Challenge_SwitchB_init(). "+" val(Water_dm[?STR_Waterfall+'01'+'_XL'])=$"+hex_str(val(Water_dm[?STR_Waterfall+'01'+'_XL']))+" val(Water_dm[?STR_Waterfall+'01'+'_YT'])=$"+hex_str(val(Water_dm[?STR_Waterfall+'01'+'_YT'])));
    break;}//case 4
}//switch(ver)




