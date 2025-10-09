/// collide_solid_grid(x, y)


if (argument0    >= 0 
&&  argument1    >= 0 
&&  argument0>>3 <  global.dg_solid_w 
&&  argument1>>3 <  global.dg_solid_h )
{
    return global.dg_solid[#argument0>>3,argument1>>3];
}
    return 0;
//


// val = dg_solids[#argument0>>3, argument1>>3]
//return (((val>>$00)&$FF) & ($1<<(argument0&$7))) 
//    && (((val>>$08)&$FF) & ($1<<(argument1&$7)));




