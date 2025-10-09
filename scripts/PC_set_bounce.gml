/// PC_set_bounce()


with(global.pc)
{
    switch(g.mod_HowDownStabAffectsVSPD){
    case 0:{                                    vspd =       vspd_bounce;      break;} // OG. vspd_bounce: $FE
    case 1:{if (abs8b(vspd)<abs8b(vspd_bounce)) vspd =       vspd_bounce;      break;}
    case 2:{                                    vspd = (vspd+vspd_bounce)&$FF; break;}
    }
}




