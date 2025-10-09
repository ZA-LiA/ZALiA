/// pushback_pc(push source x, new hspd)


with(global.pc)
{
    if(!argument1)                 exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    if (argument0< x && cs&CS_RGT) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    if (argument0>=x && cs&CS_LFT) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    hspd  = abs8b(argument1) * sign_(x-argument0);
    hspd &= $FF;
}




