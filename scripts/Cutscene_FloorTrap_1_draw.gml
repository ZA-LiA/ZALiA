/// Cutscene_FloorTrap_1_draw()


if (sub_state!=sub_state_DONE)
{
    var _DIST = Trigger_DIST+($03<<3);
    if (inRange(g.pc.x, Zelda_X-_DIST,Zelda_X+_DIST))
    {    var _SPR = Zelda_SPR1;  }
    else var _SPR = Zelda_SPR2;
    //if (g.pc.x > Trigger_X-$18) var _SPR = Zelda_SPR1;
    //else                        var _SPR = Zelda_SPR2;
    draw_sprite_(_SPR,0, Zelda_X,Zelda_Y, Zelda_PI, Zelda_XSCALE);
}









if (sub_state!=sub_state_ACTIVE) exit; // !!!!!!!!!!!!!!!!!


if (CrumbleGround_state==2 
||  CrumbleGround_state==3 )
{
    depth = CrumbleGround_DEPTH;
    
    var _i,_j, _idx, _count, _x,_y, _clm,_row;
    var _tsrc, _ts, _ts_x,_ts_y;
    var _IDX = CrumbleGround_state==3; // 0,1
    
    if (CrumbleGround_state==2) _ts = CrumbleGround1_TS;
    else                        _ts = CrumbleGround2_TS;
    
    pal_swap_set(p.palette_image, PI_BGR_1);
    _count = CrumbleGround_Block_CLMS * CrumbleGround_Block_ROWS;
    for(_i=0; _i<_count; _i++)
    {
        _clm = CrumbleGround_CLM + ((_i mod CrumbleGround_Block_CLMS) <<1);
        _row = CrumbleGround_ROW + ((_i div CrumbleGround_Block_CLMS) <<1);
        for(_j=0; _j<4; _j++)
        {
            _x = _clm+(_j&1);
            _x = _x<<3;
            _y = _row+(_j>1);
            _y = _y<<3;
            
            if (CrumbleGround_state==3 
            &&  timer <= CrumbleGround2_DUR>>1 ) // mix them around 2nd half of their time
            {    _idx = (_j^1) | (_j&2); }
            else _idx = _j;
            
            _tsrc = dg_TSRC[#_IDX,_idx];
            _ts_x = ((_tsrc>>0)&$F)<<3;
            _ts_y = ((_tsrc>>4)&$F)<<3;
            draw_background_part(_ts, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
    pal_swap_reset();
    
    
    
    
    
    
    pal_swap_set(p.palette_image, PI_BGR_2);
    for(_i=0; _i<MetalBlock_COUNT; _i++)
    {
        _clm = MetalBlock_CLM + (_i<<1);
        _row = MetalBlock_ROW;
        if (_clm > g.rm_clms-$2) break;
        
        for(_j=0; _j<4; _j++)
        {
            _x = (_clm+(_j&1)) <<3;
            _y = (_row+(_j>1)) <<3;
            
            if (CrumbleGround_state==3 
            &&  timer <= CrumbleGround2_DUR>>1 ) // mix them around 2nd half of their time
            {    _idx = (_j^1) | (_j&2); }
            else _idx =  _j;
            
            _tsrc = dg_TSRC[#_IDX,_idx];
            _ts_x = ((_tsrc>>0)&$F)<<3;
            _ts_y = ((_tsrc>>4)&$F)<<3;
            draw_background_part(_ts, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
    pal_swap_reset();
}




