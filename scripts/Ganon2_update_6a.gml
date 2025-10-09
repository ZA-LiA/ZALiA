/// Ganon2_update_6a(hspd, hspd dir)


if(!irandom($7))
{   // JUMP/HOP !!!!!!!!!!!
    off_ground_reason=OGR_JUMP;
    
    hspd = argument0 + (irandom(4)*sign_(irandom(1)));
    hspd = max( hspd, global.pc.HSPD_MAX1+8);
    //hspd = max( hspd, global.pc.hspd_max+8);
    hspd = byte(hspd*sign_(argument1));
    hspd_dir = sign_(hspd<$80);
    
    vspd = $E8 + (irandom(4)*sign_(irandom(1)));
    vspd_dir = sign_(vspd<$80);
    return true;
}
return false;




