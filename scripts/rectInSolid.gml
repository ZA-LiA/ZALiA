/// rectInSolid(solid bits, rx, ry, rw, rh)


if(!argument[0]) return -1;


var _i, _clm,_row;

var _MINX  =  cam_xl_min()>>3;
var _MINY  =  cam_yt_min()>>3;
var _GRIDW = (cam_xr_max()>>3) - _MINX;
var _GRIDH = (cam_yb_max()>>3) - _MINY;


var         _COUNT = max(1, (argument[3]>>3) * (argument[4]>>3));
for(_i=0; i<_COUNT; i++)
{
    _clm = (argument[1]>>3) + (_i mod (argument[3]>>3));
    _row = (argument[2]>>3) + (_i div (argument[3]>>3));
    
    if(!is_in_grid(_clm-_MINX, _row-_MINY, _GRIDW, _GRIDH))
    {
        continue;
    }
    
    
    if (global.dg_solid[#_clm,_row] & argument[0])  // if SOLID or ONEWAY
    {
        return (_row<<8) | _clm; // return found solid row & clm
    }
    //          row $FF00 | clm $00FF
}


return -1;




