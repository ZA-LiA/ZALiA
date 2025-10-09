/// ease_in(start, change, time, duration)

// code copied from `Code Workshop` on YouTube


var _start    = argument[0];
var _change   = argument[1];
var _time     = argument[2];
var _duration = argument[3];


_time /= _duration;


return _change*_time*_time*_time + _start;




