/// HostileFire_init_1(non-mod palidx)


var _PALIDX = argument[0];


switch(global.FIRE_PI_SYSTEM_VER)
{
    default:{
    GO_init_palidx(_PALIDX);
    break;}
    
    
    case 2:{
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    PI1 = add_pi_permut(palidx, "RBWGMKYC", "Flame1 permut 1");
    PI2 = add_pi_permut(palidx, "BRWGMKYC", "Flame1 permut 2");
    break;}
    
    
    case 3:{
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    PI1 = add_pi_permut(palidx, "WRBGMKYC", "Flame1 permut 1");
    PI2 = add_pi_permut(palidx, "WBRGMKYC", "Flame1 permut 2");
    break;}
    
    
    case 4:{
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    PI1 = add_pi_permut(palidx, "WRBGMKYC", "Flame1 permut 1");
    PI2 = add_pi_permut(palidx, "BWRGMKYC", "Flame1 permut 2");
    PI3 = add_pi_permut(palidx, "RBWGMKYC", "Flame1 permut 3");
    break;}
    
    
    case 5:{
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    PI1 = add_pi_permut(palidx, "WRBGMKYC", "Flame1 permut 1");
    PI2 = add_pi_permut(palidx, "WBRGMKYC", "Flame1 permut 2");
    break;}
    
    
    case 6:{
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    PI1 = add_pi_permut(palidx, "WRBGMKYC", "Flame1 permut 1");
    PI2 = add_pi_permut(palidx, "RWBGMKYC", "Flame1 permut 2");
    break;}
    
    
    case 7:{ // No blinking
    GO_init_palidx(global.PI_FIRE_HOSTILE1);
    break;}
}//switch(global.FIRE_PI_SYSTEM_VER)




