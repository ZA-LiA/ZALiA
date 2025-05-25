/// bit1st(int)

// returns the 1st set bit


    argument0&=$FFFFFFFF;
if (argument0==0) return 0;


var _bit = $1;
while ( argument0>0)
{
    if (argument0&_bit) return _bit;
    _bit = _bit<<1;
}

return 0;




