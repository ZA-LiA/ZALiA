/// Backwall_init2()


var _i, _val;
var _datakey;


                     _i=0;
sub_state_IDLE     = _i++;
sub_state_MOVING   = _i++;
sub_state_DROWNING = _i++;
sub_state          = sub_state_IDLE;

GO_init_palidx(global.PI_BGR3);


/*
Sequence_DATA = undefined;
if(!is_undefined(dk_spawn))
{
    _datakey = STR_Sequence;
    for(_i=1; _i<$10; _i++)
    {
        _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if(!is_undefined(       _val) 
        &&  is_string(          _val) 
        &&  string_pos(_datakey,_val) )
        {
            var _POS = string_pos(_datakey,_val)+string_length(_datakey);
            Sequence_DATA = string_copy(_val, _POS, string_length(_val)-(_POS-1));
            break;//_i
        }
    }
}
*/

// Delay Start Moving
timer = $40;
if(!is_undefined(dk_spawn))
{
    _datakey = STR_Delay;
    for(_i=1; _i<$10; _i++)
    {
        _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if(!is_undefined(       _val) 
        &&  is_string(          _val) 
        &&  string_pos(_datakey,_val) )
        {
            var _POS = string_pos(_datakey,_val)+string_length(_datakey);
            _val = string_copy(_val, _POS, string_length(_val)-(_POS-1));
            timer = str_hex(_val);
            break;//_i
        }
    }
}




// Movement Direction. $1-RIGHT, $2-LEFT, $4-DOWN, $8-UP
DIRECTION = $8;
if(!is_undefined(dk_spawn)) DIRECTION = val(g.dm_spawn[?dk_spawn+STR_Direction],DIRECTION);
DIRECTION = bit1st(DIRECTION);




// Movement Speed
SPEED1 = $20;
if(!is_undefined(dk_spawn)) SPEED1 = val(g.dm_spawn[?dk_spawn+STR_Speed],SPEED1);
SPEED1 = clamp(SPEED1,$01,$7F);
speed1 = (SPEED1*sign_(DIRECTION&$5)) &$FF;

acceleration = sign_(DIRECTION&$5);

HSPD1 = SPEED1;
VSPD1 = SPEED1;
hspd  = 0;
vspd  = 0;




X_MIN = 0;
X_MAX = g.rm_w;
Y_MIN = 0;
Y_MAX = g.rm_h;
if (DIRECTION&$1) X_MIN=spawn_xl;
if (DIRECTION&$2) X_MAX=spawn_xl;
if (DIRECTION&$4) Y_MIN=spawn_yt;
if (DIRECTION&$8) Y_MAX=spawn_yt;
if(!is_undefined(dk_spawn))
{
    var _len, _pos;
    var _LEN2 = string_length(STR_Min+"_X");
    for(_i=1; _i<$10; _i++)
    {
        _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if(!is_undefined(_val) 
        &&  is_string(   _val) )
        {
            if (string_pos(STR_Min,_val) 
            ||  string_pos(STR_Max,_val) )
            {
                _len = string_length(_val);
                
                    _pos  = string_pos(STR_Min+"_X",_val);
                if (_pos)
                {
                    _pos += _LEN2;
                    _val  = string_copy(_val, _pos, _len-(_pos-1));
                    X_MIN = str_hex(_val);
                    continue;
                }
                
                    _pos  = string_pos(STR_Max+"_X",_val);
                if (_pos)
                {
                    _pos += _LEN2;
                    _val  = string_copy(_val, _pos, _len-(_pos-1));
                    X_MAX = str_hex(_val);
                    continue;
                }
                
                    _pos  = string_pos(STR_Min+"_Y",_val);
                if (_pos)
                {
                    _pos += _LEN2;
                    _val  = string_copy(_val, _pos, _len-(_pos-1));
                    Y_MIN = str_hex(_val);
                    continue;
                }
                
                    _pos  = string_pos(STR_Max+"_Y",_val);
                if (_pos)
                {
                    _pos += _LEN2;
                    _val  = string_copy(_val, _pos, _len-(_pos-1));
                    Y_MAX = str_hex(_val);
                    continue;
                }
            }
        }
    }
}


/*
if(!is_undefined(dk_spawn))
{
    X_MIN = val(g.dm_spawn[?dk_spawn+STR_Min+"_X"],X_MIN);
    X_MAX = val(g.dm_spawn[?dk_spawn+STR_Max+"_X"],X_MAX);
    Y_MIN = val(g.dm_spawn[?dk_spawn+STR_Min+"_Y"],Y_MIN);
    Y_MAX = val(g.dm_spawn[?dk_spawn+STR_Max+"_Y"],Y_MAX);
}
*/
/*
if (DIRECTION&$1) X_MAX=X_MIN+_DISTANCE;
if (DIRECTION&$2) X_MIN=X_MAX-_DISTANCE;
if (DIRECTION&$4) Y_MAX=Y_MIN+_DISTANCE;
if (DIRECTION&$8) Y_MIN=Y_MAX-_DISTANCE;
*/


pc_is_drowning = false;
//pc_x_on_collision = 0;
//pc_y_on_collision = 0;




