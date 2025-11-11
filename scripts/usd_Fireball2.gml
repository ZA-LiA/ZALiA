

// pID 4: AE20, pID 8: 9D18
Fireball_udp(); // Takes care of yscale


if (ver==2        // Thunderbird
&&  g.counter1&$2 )
{    xScale =  1;  }
else xScale = -1;


HostileFire_udp_1();

/*
if (ver==3) // Gooma
{
    // frequency.  1: every 2,  2: every 4,  3: every 8
    var _FREQ = 2;
    if(!(g.counter1 & (($1<<_FREQ)-1)))
    {
        palidx = p.dg_PI_SEQ[#0, (g.counter1>>_FREQ)&$3];
    }
}
*/




