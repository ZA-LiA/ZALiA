/// TogglingPathDirectionB_init2()


path_dir = g.dm_spawn[? dk_spawn+STR_Direction];


set_xlyt(id, spawn_xl-(ww>>1), spawn_yt-(hh>>1));



// TOP. path_num 1
dg_a[# 0, 1] = x;
dg_a[# 0, 2] = y - RADIUS;
// RGT. path_num 2
dg_a[# 1, 1] = x + RADIUS;
dg_a[# 1, 2] = y;
// BTM. path_num 3
dg_a[# 2, 1] = x;
dg_a[# 2, 2] = y + RADIUS;
// LFT. path_num 4
dg_a[# 3, 1] = x - RADIUS;
dg_a[# 3, 2] = y;


switch (g.exit_enter.side & $F) {
case 1: { location_a = LOC_RGT; break; } // RGT 2
case 2: { location_a = LOC_LFT; break; } // LFT 4
case 4: { location_a = LOC_BTM; break; } // BTM 3
case 8: { location_a = LOC_TOP; break; } // TOP 1
}

location_b = ((location_a-1 + path_dir) & 3) + 1;




var _XX, _YY;
var _OFFSET = $10;
var _WW     = $18; // Elevator ww
switch (location_a)
{
    case LOC_TOP: {
    _XX = x - (_WW>>1);
    _YY = cam_yt_min() - _OFFSET;
    break;        }
    
    case LOC_RGT: {
    _XX = cam_xr_max() + _OFFSET - _WW;
    _YY = y - (ELEV_H>>1);
    break;        }
    
    case LOC_BTM: {
    _XX = x - (_WW>>1);
    _YY = cam_yb_max() + _OFFSET - ELEV_H;
    break;        }
    
    case LOC_LFT: {
    _XX = cam_xl_min() - _OFFSET;
    _YY = y - (ELEV_H>>1);
    break;        }
}



      elev = GameObject_create(_XX,_YY, ElevatorB,1);
with (elev)
{
    spawn_xl = _XX;
    spawn_yt = _YY;
    set_xlyt(id, spawn_xl, spawn_yt);
    
    ds_list_add(dl_exit, g.exit_enter);
    
    scr_step = undefined;
}





var _x, _y, _idx;
var _QUAR_CNT = ARROW_CNT>>2;
for (var i = 0; i < _QUAR_CNT; i++)
{
    // UP  - RGT
    _y = -(((i + 1)         <<3) + 4);
    _x =  (((_QUAR_CNT - i) <<3) + 4);
    
    
    _idx = (0*_QUAR_CNT)+i;
    dg_arrows[# _idx, 1] = x +  _x;
    dg_arrows[# _idx, 2] = y +  _y;
    
    // UP  - LFT
    _idx = (1*_QUAR_CNT)+i;
    dg_arrows[# _idx, 1] = x +  _y;
    dg_arrows[# _idx, 2] = y + -_x;
    
    // DWN - LFT
    _idx = (2*_QUAR_CNT)+i;
    dg_arrows[# _idx, 1] = x + -_x;
    dg_arrows[# _idx, 2] = y + -_y;
    
    // DWN - RGT
    _idx = (3*_QUAR_CNT)+i;
    dg_arrows[# _idx, 1] = x + -_y;
    dg_arrows[# _idx, 2] = y +  _x;
}





