/// update_og_rand()

// RandomOG: Random Original Game.  $051A-0522


// RandomOG stops if going to title screen and doesn't start until
// 1st side-scrolling room is loaded with 0736==$0B which 
// coincides with PC's state going from 0 to 1
// I'm not sure right now how to impliment this so 
// I'm using a bool 'RandomOG_started'.
if(!RandomOG_started)
{
    if (global.pc.state)
    {
        RandomOG_started = true;
        dl_RandomOG[|0]  = RandomOG_START_VAL;
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _num1 = dl_RandomOG[|0]&$2;
var _num2 = dl_RandomOG[|1]&$2;

var _carry = (_num1^_num2)<<6; // ($0 or $2)<<6 = ($0 or $80)


for(var _i=0; _i<dl_RandomOG_SIZE; _i++)
{    
    _num1  = (dl_RandomOG[|_i]>>1) | _carry;
    _carry = (dl_RandomOG[|_i]&$1)<<7; // $0 or $80
    
    dl_RandomOG[|_i] = _num1;
}

/*
RandomOG_testing_count0++;
if (RandomOG_testing_count0>=1500 
&&  RandomOG_testing_count0<=1980 )
{
    if (dl_RandomOG[|3]&$7 == 2) RandomOG_testing_count1++;
    if (dl_RandomOG[|4]&$7 == 2) RandomOG_testing_count2++;
    if (dl_RandomOG[|5]&$7 == 2) RandomOG_testing_count3++;
}
else if (RandomOG_testing_count0==1981)
{
    sdm("RandomOG_testing_count1: $"+hex_str(RandomOG_testing_count1));
    sdm("RandomOG_testing_count2: $"+hex_str(RandomOG_testing_count2));
    sdm("RandomOG_testing_count3: $"+hex_str(RandomOG_testing_count3));
}
*/




