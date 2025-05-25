/// bitNum(uint)

// returns the bit number of the 1st set bit


    argument0&=$FFFFFFFF;
if (argument0==0) return 0;


var _bit_num = $1;
while  (argument0>0)
{
    if (argument0&$1) return _bit_num;
        argument0 = argument0>>1;
    _bit_num++;
}


return 0;




