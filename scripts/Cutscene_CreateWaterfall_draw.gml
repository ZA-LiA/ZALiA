/// Cutscene_CreateWaterfall_draw()


if (sub_state==SUB_STATE_ACTV1)
{
    depth = Block_DEPTH-3;
    pal_swap_set(p.palette_image, PI_BGR_2);
    Cutscene_CreateWaterfall_draw_1a(Blocks1_CLM<<3,Blocks1_ROW<<3, Blocks1_CLMS,Blocks1_ROWS, Blocks1_COUNT);
    //Cutscene_CreateWaterfall_draw_1a(Blocks2_CLM<<3,Blocks2_ROW<<3, Blocks2_CLMS,Blocks2_ROWS, Blocks2_COUNT);
    pal_swap_reset();
}




if (sub_state!=SUB_STATE_ACTV2 
|| !rows_added 
||  rows_added>=ROWS )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _i, _pi,_pi_permut;

depth = Waterfall_DRAW_DEPTH;

var                    _PI_SET = p.PI_DRK1;
if (rm_pal_qual_lit()) _PI_SET = p.PI_LIT1;

    _pi  = Waterfall_PI;
    _pi += _PI_SET;
    _pi_permut  = p.dg_depth_pi[#Waterfall_DEPTH_IDX,3];
if (_pi_permut)
{   _pi  = get_pi(_pi,_pi_permut);  }


pal_swap_set(p.palette_image, _pi);
var _x,_y;
var _X = xl;
var _Y = yt + (g.counter1&$7);
var          _COUNT = CLMS * rows_added;
for(_i=0; _i<_COUNT; _i++)
{
    _x = _X + ((_i mod CLMS)<<3);
    _y = _Y + ((_i div CLMS)<<3);
    draw_background_part(Waterfall_TS, ((Waterfall_TSRC1>>0)&$F)<<3,((Waterfall_TSRC1>>4)&$F)<<3, 8,8, _x,_y);
}



_y  = yt + (rows_added<<3) + (g.counter1&$7);
_y += 8; // for -1 yscale offset
for(_i=0; _i<CLMS; _i++)
{
    _x = _X + (_i<<3);
    draw_background_part_ext(Waterfall_TS, ((Waterfall_TSRC2>>0)&$F)<<3,((Waterfall_TSRC2>>4)&$F)<<3, 8,8, _x,_y, 1,-1, c_white,1);
}
pal_swap_reset();




