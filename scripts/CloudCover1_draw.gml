/// CloudCover1_draw()


var _i,_j, _x0,_x,_y;
//var _W1 = 

//pal_swap_set(p.palette_image, palidx);

for(_i=CloudLayers_COUNT-1; _i>=0; _i--)
{
    pal_swap_set(p.palette_image, dg_CloudLayers[#_i,7]);
    _x0 = dg_CloudLayers[#_i,2];
    _y  = dg_CloudLayers[#_i,3]+DRAW_YOFF;
    for(_j=0; _j<CloudSpr1_COUNT_X; _j++)
    {
        _x = _x0 + (CloudSpr1_W*_j);
        if (wINw(_x-CloudSpr1_W_,CloudSpr1_W, viewXL(),viewW()))
        {
            //_y=viewYC(); // for debug
            draw_sprite_(CloudSpr1,0, _x,_y);
            //if(!_i) drawSprOutline(_x,_y, CloudSpr1, c_orange, 1);
        }
    }
}

pal_swap_reset();

//if!(g.counter0&$3) sdm("CLOUD. "+"x $"+hex_str(dg_CloudLayers[#0,2])+", "+"y $"+hex_str(dg_CloudLayers[#0,3]));




