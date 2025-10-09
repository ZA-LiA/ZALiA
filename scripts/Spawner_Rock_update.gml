/// Spawner_Rock_update()


GO_update_cam_vars();

if (g.counter1&$1F) // !(g.counter1&$1F): every 32 frames = 0.533s
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

var _UIDX = avail_uidx_goc(4);
if (_UIDX==UIDX_NULL)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var _IDX = rand()&$7;
var          _DIR = -1;
if (_IDX&$1) _DIR =  1;

if (ver==2)  _DIR = -PlatformRaft.hspd_dir; // So it's not chasing PC

// WIDE VIEW
var _XL  = viewXC() + (viewW_()*-_DIR);
    _XL += 4*_DIR;
    _XL -= 8;
var _YT  = global.pc.yt + dl_YOFF[|_IDX] + 1;
//_YT -= $3; // 2022/11/07: Rocks seems too low. 2022/11/12: Y position was fine, verified by testing OG
/*  OG. // ar_yoff = $03,13,-0D,-1D, -$2D,-3D,03,13;
var _XL  = g.camXL + ($C*_DIR)&$FF;
var _YT  = global.pc.yt + ar_yoff[_IDX] + 1;
*/

g.go_mgr.uIdxSwap_goc = _UIDX;
with(GOC1_create(_XL,_YT, _DIR, projectile,projectile_ver)) // Rock1
{
    is_from_spawner = true;
    GO_depth_init(g.dl_TILE_DEPTHS[|(ds_list_size(g.dl_TILE_DEPTHS))-1] - 1); // Set in front of water & fg terrain
    hspd = ($10*facing_dir) &$FF;
}




