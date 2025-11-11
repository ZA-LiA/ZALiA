/// HostileFire_udp_1()


switch(global.FIRE_PI_SYSTEM_VER)
{
    case 2:{
    if (g.counter1&$8) palidx_base = PI1;
    else               palidx_base = PI2;
    break;}
    
    
    case 3:{
    if (g.counter1&$8) palidx_base = PI1;
    else               palidx_base = PI2;
    break;}
    
    
    case 4:{
    switch((g.counter1>>2) mod 3){
    case 0:{palidx_base=PI1; break;}
    case 1:{palidx_base=PI2; break;}
    case 2:{palidx_base=PI3; break;}
    }
    break;}
    
    
    case 5:{
    if (g.counter1&$8) palidx_base = PI1;
    else               palidx_base = PI2;
    break;}
    
    
    case 6:{
    if (g.counter1&$8) palidx_base = PI1;
    else               palidx_base = PI2;
    break;}
    
    
    case 7:{
    // No blinking
    break;}
}//switch(global.FIRE_PI_SYSTEM_VER)




