/// ease_in_out(start, change, time, duration)

// code copied from `Code Workshop` on YouTube


var _start    = argument[0];
var _distance = argument[1];
var _time     = argument[2];
var _duration = argument[3];


_time /= _duration/2;
if (_time<1) return _distance/2*_time*_time + _start;

_time--;
return -_distance/2 * (_time*(_time-2)-1) + _start;




