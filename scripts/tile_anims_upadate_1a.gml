/// tile_anims_upadate_1a(anim frame 1, anim frame 2)

// compare 2 frames,
// return 0: tiles stay the same solid state
// return 1: tiles change from clear to solid
// return 2: tiles change from solid to clear


var _return = 0;

var _DATA1 = g.dm_tile[?STR_frame+hex_str(argument[0])];
if (is_undefined(_DATA1)) return _return;

var _DATA2 = g.dm_tile[?STR_frame+hex_str(argument[1])];
if (is_undefined(_DATA2)) return _return;


var _dm_frame1 = json_decode(_DATA1);
var _dm_frame2 = json_decode(_DATA2);
if (_dm_frame1==-1 
||  _dm_frame2==-1 )
{
    return _return;
}


var _SOLID1 = val(_dm_frame1[?"0"+STR_Solid]);
var _SOLID2 = val(_dm_frame2[?"0"+STR_Solid]);
if (_SOLID1!=_SOLID2)
{
    if (_SOLID1==TID_SOLID1 
    ||  _SOLID2==TID_SOLID1 )
    {
        _return = 1 + (_SOLID1==TID_SOLID1);
    }
}


ds_map_destroy(_dm_frame1); _dm_frame1=undefined;
ds_map_destroy(_dm_frame2); _dm_frame2=undefined;


return _return;




