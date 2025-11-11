/// Moa_udp()


can_draw_self = true;

// EFF2
if (g.counter1&$10) yScale =  1;
else                yScale = -1;

if (hspd<$80)
{
    xScale =  1;
    sprL = spr_Moa2;
    sprR = spr_Moa1;
}
else
{
    xScale = -1;
    sprL = spr_Moa1;
    sprR = spr_Moa2;
}

// F00D
var           _val  = hspd;
if (hspd&$80) _val ^= $FF;
              _val  = _val>>2;
//
if (_val<6)
{
                sprRXOff = -1;
    if (_val<4) sprRXOff = -2;
    if (_val<2) sprRXOff = -3;
}
else            sprRXOff =  0;

// F1D7
//if (ocs&$C==$C) can_draw_self = false;



if (ver==3) can_draw_self = g.counter0&$1;




