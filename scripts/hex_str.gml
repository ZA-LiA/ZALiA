/// hex_str(number, *char count)

// converts a number to a string representation of its hex value


if (is_string(argument[0])) return argument[0];

argument[0] &= $FFFFFFFF; // limit to 32 bits

if (argument_count>1) argument[1] = clamp(argument[1],1,8);

if (argument[0]==0)
{
    if (argument_count>1) return string_repeat("0", argument[1]);
    return "00";
}


// ---------------------------------------------------------
var _return = "";
while (argument[0]!=0) //    HEX_CHARS = "0123456789ABCDEF";
{   //_char =        strChar(HEX_CHARS,(argument[0]&$F)+1); // !!! causing slow performance
    _return = string_char_at(HEX_CHARS,(argument[0]&$F)+1) + _return;
    argument[0] = argument[0]>>4;
}


if (argument_count>1)
{
    //argument[1] = clamp(argument[1],1,8);
    var _LEN = string_length(_return);
    if (_LEN!=argument[1])
    {
        if (_LEN<argument[1]) _return = string_repeat("0",    argument[1]-_LEN) + _return;
        else                  _return = string_copy(_return, (argument[1]-_LEN)+1, argument[1]);
    }
}
else if (string_length(_return)&$1)
{
    _return = "0"+_return;
}


return _return;




/*
/// hex_str(number)

// converts a number to a string representation of its hex value


if (is_string(argument0)) return argument0;

argument0&=$FFFFFFFF; // limit to 32 bits

if (argument0==0) return "00";


// ---------------------------------------------------------
var _return = "";
while (argument0!=0) //      HEX_CHARS = "0123456789ABCDEF";
{   //_char =        strChar(HEX_CHARS,(argument0&$F)+1); // !!! causing slow performance
    _return = string_char_at(HEX_CHARS,(argument0&$F)+1) + _return;
    argument0 = argument0>>4;
}

if (string_length(_return)&$1) _return = "0"+_return;


return _return;
*/
