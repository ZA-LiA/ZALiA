/// data_Elev(str exit nums, x, y, *shaft rows)


var _i, _arg;
                           _arg=0;
var _EXIT_NUMS_ = argument[_arg++];
var _XL         = argument[_arg++];
var _YT         = argument[_arg++];

var _dk_SPAWN = data_spawn(rm+STR_PRIO,ElevA,1,  _XL,_YT);

// exit nums of Exits associated w/ this ElevA
g.dm_spawn[?_dk_SPAWN+STR_ExitData] = _EXIT_NUMS_;



if (_EXIT_NUMS_==0) // if doesn't go to an exit
{
    var _COUNT = 0;
    return _dk_SPAWN;
}
else
{
    var _COUNT = string_length(_EXIT_NUMS_)>>1;
}

var                      _SHAFT_ROWS = string_repeat("01",_COUNT);
if (argument_count>_arg) _SHAFT_ROWS = argument[_arg++];

if (_SHAFT_ROWS!=0)
{   // data for dungeon map
    var _dk, _exit_num, _exit_name, _diff;
    
    if (string_length(_SHAFT_ROWS)&$1)          _SHAFT_ROWS  = "0"+_SHAFT_ROWS;
    if (string_length(_SHAFT_ROWS)>>1 < _COUNT) _SHAFT_ROWS += string_repeat("01", _COUNT-(string_length(_SHAFT_ROWS)>>1));
    
    for(_i=0; _i<_COUNT; _i++) // each Exit associated w/ this ElevA
    {
        _exit_num  = string_copy(_EXIT_NUMS_, (_i<<1)+1, 2);
        _exit_name = rm_name+_exit_num;
        
        _diff  = clamp(str_hex(_SHAFT_ROWS,_i), $1,$10);
        _diff++;
        _diff *= sign_(str_hex(_exit_num)&$40);
        //if (rm_name==Area_PalcE+"0C")sdm("_exit_name "+_exit_name+", _EXIT_NUMS_ "+_EXIT_NUMS_+", _SHAFT_ROWS "+_SHAFT_ROWS+", _COUNT $"+hex_str(_COUNT)+", _diff: "+string(_diff));
        g.dm_rm[?_exit_name+STR_Destination+STR_Row+STR_Count] = _diff;
        g.dm_rm[?_exit_name+STR_Destination+STR_Clm+STR_Count] = 0;
    }
}


return _dk_SPAWN;




