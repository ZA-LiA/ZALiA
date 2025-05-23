/// Overworld_tile_change_3(tile data, x, y, depth, 1:add -1:delete 0:both)


var                       _a=0;
var _TILE_DATA = argument[_a++];
var _X         = argument[_a++];
var _Y         = argument[_a++];
var _DEPTH     = argument[_a++];
var _CHANGE    = argument[_a++];

var                       _SCALE_X =  1;
if (_TILE_DATA&$80000000) _SCALE_X = -1;
if(!_SCALE_X) _X += global.OVERWORLD.T_SIZE;

var                       _SCALE_Y =  1;
if (_TILE_DATA&$40000000) _SCALE_Y = -1;
if(!_SCALE_Y) _Y += global.OVERWORLD.T_SIZE;


var _tsrc  = _TILE_DATA-1; // Tiled app adds 1 so it can't be 0
    _tsrc &= $3FFFFFFF;    // truncate the scale xy data
    _tsrc  = abs(_tsrc);
//
switch((_tsrc>>8)&$FF)
{
    default:{var _TS=ts_Overworld_anark01; break;}
    case  0:{var _TS=ts_Overworld_anark02; break;}
    case  1:{var _TS=ts_Overworld_anark01; break;}
    case  2:{var _TS=ts_OverworldAnim01;   break;}
}
//if!((_tsrc>>8)&$FF) var _TS = ts_Overworld_anark02;
//else                var _TS = ts_Overworld_anark01;
//var _IDX = ((_tsrc>>8)&$FF) == 0; // 0: ts_Overworld_anark02, 1: ts_Overworld_anark01
//var _TS  = global.OVERWORLD.dl_anarkhya_ts[|_IDX];
_tsrc &= $FF;


var _TILE_ID = tile_change_3a(global.OVERWORLD.T_SIZE, _TS,_tsrc, _X,_Y, _DEPTH, _CHANGE);
if (tile_exists(_TILE_ID)) tile_set_scale(_TILE_ID, _SCALE_X,_SCALE_Y);




