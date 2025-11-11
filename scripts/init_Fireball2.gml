/// init_Fireball2()


GO_sprite_init(spr_Fireball2);

HostileFire_init_1(global.PI_MOB_RED);

//brightness = 1;


switch(ver)
{
    // -----------------------------------
    case 1:{ // Barba
    break;}
    
    
    // -----------------------------------
    case 2:{ // Thunderbird
    vspd_adj = 1; // gravity
    break;}
    
    
    // -----------------------------------
    case 3:{ // Gooma
    timer = $FF; // Life duration
    break;}
}




