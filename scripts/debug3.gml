sdm("");
                    
                    
var _num;
_num = $100;
_num = (_num & $100) >> 8;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("");
_num = 0;
_num = (_num & $100) >> 8;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");
_num = $100;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");
_num = $FF;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");
_num = $100 & $FF;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");
_num = 256 & 256;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");
_num = 256 & 256;
_num = _num >> 8;
sdm("_num: " + string_format(_num, 16, 16));
sdm("is_int32(_num): " + string(is_int32(_num)));
sdm("is_int64(_num): " + string(is_int64(_num)));
sdm("is_real(_num): " + string(is_real(_num)));
sdm("--------------------");
sdm("");

sdm("$FF: " + string_format($FF, 16, 16));
sdm("is_int32($FF): " + string(is_int32($FF)));
sdm("is_int64($FF): " + string(is_int64($FF)));
sdm("is_real($FF): " + string(is_real($FF)));
sdm("--------------------");
sdm("");

sdm("255: " + string_format(255, 16, 16));
sdm("is_int32(255): " + string(is_int32(255)));
sdm("is_int64(255): " + string(is_int64(255)));
sdm("is_real(255): " + string(is_real(255)));
sdm("--------------------");
sdm("");


var _RAND = rand();

// _val = rand() div 2;
_val   = _RAND >>1;
_carry = _RAND & 1;
sdm("A1");
sdm("_carry: " + string_format(_carry, 16, 16));
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = _val + $40 + _carry;
_carry = (_val & $100) >> 8;
_val &= $FF;
sdm("A2");
sdm("_carry: " + string_format(_carry, 16, 16));
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = _val + global.pc.hspd + _carry;
_carry = (_val & $100) >> 8;
_val &= $FF;
sdm("A3");
sdm("global.pc.hspd: " + string_format(global.pc.hspd, 16, 16));
sdm("_carry: " + string_format(_carry, 16, 16));
sdm("");

sdm("is_int32(global.pc.hspd): " + string(is_int32(global.pc.hspd)));
sdm("is_int64(global.pc.hspd): " + string(is_int64(global.pc.hspd)));
sdm("is_real(global.pc.hspd):  " + string(is_real(global.pc.hspd)));
sdm("");
                    
sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = _val + global.pc.hspd + _carry;
_carry = (_val & $100) >> 8;
_val &= $FF;
sdm("A4");
sdm("global.pc.hspd: " + string_format(global.pc.hspd, 16, 16));
sdm("_carry: " + string_format(_carry, 16, 16));
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = _val + global.pc.hspd + _carry;
_carry = (_val & $100) >> 8;
_val &= $FF;
sdm("A5");
sdm("global.pc.hspd: " + string_format(global.pc.hspd, 16, 16));
sdm("_carry: " + string_format(_carry, 16, 16));
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = _val + viewXL() + _carry;
set_xlyt(id, _val, yt);
sdm("A6");
sdm("viewXL(): " + string_format(viewXL(), 16, 16));
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");

_val = (_val & $1F) + $24;
timer = _val;
// timer = (_val & $1F) + $24;
sdm("A7");
sdm("");

sdm("is_int32(_carry): " + string(is_int32(_carry)));
sdm("is_int64(_carry): " + string(is_int64(_carry)));
sdm("is_real(_carry):  " + string(is_real(_carry)));
sdm("");

sdm("is_int32(_val): " + string(is_int32(_val)));
sdm("is_int64(_val): " + string(is_int64(_val)));
sdm("is_real(_val):  " + string(is_real(_val)));
sdm("");

sdm("_val: " + string(_val));
sdm(string_format(_val, 16, 16));
sdm("--------------------");
sdm("");
sdm("--------------------");

counter = byte(counter + 1);

// _val = rand();
sdm("");

sdm(is_real(_val));
sdm("_val: " + string(_val));

sdm(is_real(timer));
sdm("timer: $" + hex_str(timer) + ", " + string(timer));
sdm("counter: " + string(counter));
sdm("--------------------");
sdm("---------------------------------------------");
