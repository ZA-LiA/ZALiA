/// Growkke_update()


var _i,_j, _a, _idx, _val, _count;


var _PAD = 3;
BodyHB_w =  8;
BodyHB_h = (Segment_CanDraw_cnt<<3) - (_PAD<<1);
BodyHB_xl =  x - (BodyHB_w>>1);
BodyHB_yt = GROUND_Y - _PAD - BodyHB_h + draw_yoff;
GOB_update_2();


if (cs&(CS_SW1|CS_PR1))
{
    // Remove a random segment.
    // The first and last are locked
    _idx = -1;
    // _val = irandom(Segment_CanDraw_cnt-2-1);
    _val = irandom(Segment_CanDraw_cnt-2-1)+1;
    for(_i=ds_grid_width(dg_segments)-2; _i>=1; _i--)
    {
        if (dg_segments[#_i,IDX_STATE])
        {
                _val--;
            if(!_val)
            {
                dg_segments[#_i,IDX_STATE] = 0;
                
                _idx = _i;
                
                aud_play_combo1(LoseSegmentSound_NUM);
                break; // _i
            }
        }
    }
    
    
    if (Segment_CanDraw_cnt == SEGMENT_MIN 
    ||  _idx == -1 )
    {
        hp = 0;
        state = state_EXPLODE;
    }
    
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (cs&CS_BD1)
{
    enemy_collide_pc_body();
}




