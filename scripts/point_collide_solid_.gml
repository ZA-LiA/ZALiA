/// point_collide_solid_(px, py)

// This logic makes a rule that: a point being against 
// a tile (above or to the left) is not good enough.
// The point must be inside of a solid area.


if(!argument0 
||  argument0 >= room_width 
|| !argument1 
||  argument1 >= room_height )
{
    return 0;
}




var _CLM = argument0>>3;
var _ROW = argument1>>3;

if(!global.dg_solid[#_CLM,_ROW]) // btm right
{
    return global.dg_solid[#_CLM,_ROW];
}



if(!(argument0&$7) 
|| !(argument1&$7) )
{
    if(!(argument0&$7) 
    && !(argument1&$7) )
    {
        if(!global.dg_solid[#_CLM-1,_ROW-1]   // top left
        || !global.dg_solid[#_CLM  ,_ROW-1]   // top right
        || !global.dg_solid[#_CLM-1,_ROW+1] ) // btm left
        {
            return 0;
        }
    }
    else if(!(argument0&$7) 
         && !global.dg_solid[#_CLM-1,_ROW+1] ) // btm left
    {
        return 0;
    }
    else if(!(argument1&$7) 
         && !global.dg_solid[#_CLM  ,_ROW-1] ) // top right
    {
        return 0;
    }
}




return global.dg_solid[#_CLM,_ROW];




