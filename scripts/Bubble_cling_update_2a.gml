/// Bubble_cling_update_2a()

// UPDATE COLLISION POINTS ---------------------------------------------


var _i, _x, _y, _a1, _ib;
var _COUNT1 = ds_grid_width(dg_cling);

dg_cling[#0,4] = 0;

for(_i=1; _i<_COUNT1; _i++)
{
    _a1 = _i<_COUNT1-4; // true: corners
    _ib =(_i-1)&$3;     // 0-3
    
    
    // Record previous
    dg_cling[#_i,3] = dg_cling[#_i,0]; // colliding state
    dg_cling[#_i,4] = dg_cling[#_i,1]; // x
    dg_cling[#_i,5] = dg_cling[#_i,2]; // y
    
    // Set new
                   _x = x;
                   _y = y;
    if (_a1)
    {   // corners.  _ib=0 top lft, _ib=1 top rgt, _ib=2 btm lft, _ib=3 btm rgt
                   _x = x + ((POINT_OFF + !(_ib&$1)) * sign_(  _ib&$1));
                   _y = y + ((POINT_OFF + !(_ib>$1)) * sign_(  _ib>$1));
    }
    else
    {   // centers.  _ib=0 rgt, _ib=1 lft, _ib=2 btm, _ib=3 top
        if (_ib>1) _y = y + ((POINT_OFF +  (_ib&$1)) * sign_(!(_ib&$1))); // 2 btm, 3 top
        else       _x = x + ((POINT_OFF +  (_ib&$1)) * sign_(!(_ib&$1))); // 0 rgt, 1 lft
    }
    
    dg_cling[#_i,1] = _x;
    dg_cling[#_i,2] = _y;
    
    
        dg_cling[#_i,0] = collide_solid_grid(_x,_y)&TID_SOLID1; // colliding state
    if(!dg_cling[#_i,0])
    {
        if (_x>=0 
        &&  _y>=0 
        &&  _x<g.rm_w 
        &&  _y<g.rm_h 
        &&  global.dg_chain[#_x>>3,_y>>3] )
        {
            dg_cling[#_i,0] = TID_SOLID1;
        }
    }
    // Check if out of rm bounds
    if(!dg_cling[#_i,0] 
    && !pointInRect(_x,_y, cam_xl_min(),cam_yt_min(),cam_x_range(),cam_y_range()) )
    {
        dg_cling[#_i,0] = TID_SOLID1;
    }
    
    
    dg_cling[#0,4] |= dg_cling[#_i,0];
}




