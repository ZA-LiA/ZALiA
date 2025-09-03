/// Rando_can_reach_Z1Area()


var _can_reach_Midoro_area = false;
switch(global.Rando_RauruPass_VER)
{
    case 1:{
    if (Rando_can_traverse_RauruPass()          // The boulder/RiverDevil next to Rauru
    ||  Rando_can_traverse_RauruToMidoroCave()  // The cave next to Rauru to Midoro Field that's only in rando
    ||  Rando_can_traverse_JUMPCave() )
    {
        _can_reach_Midoro_area = true;
    }
    break;}
    
    case 2:{
    if (Rando_can_traverse_RauruPass()          // The boulder/RiverDevil next to Rauru
    ||  Rando_can_traverse_RauruToMidoroCave()  // The cave next to Rauru to Midoro Field that's only in rando
    ||  Rando_can_traverse_JUMPCave() )
    {
        _can_reach_Midoro_area = true;
    }
    break;}
    
    case 3:{
    if (Rando_can_traverse_RauruPass()          // The boulder/RiverDevil next to Rauru
    ||  Rando_can_traverse_JUMPCave() )
    {
        _can_reach_Midoro_area = true;
    }
    break;}
}


// From Midoro/Morogue area
if (_can_reach_Midoro_area)
{
    // Midoro Field to RoyalCemetery
    if (Rando_is_attainable(STR_HAMMER))
    {
        // RoyalCemetery to Z1Area
        if (Rando_can_get_from_RoyalCemeteryToZ1Area())
        {
            return true;
        }
    }
    
    // Midoro Field to Saria to Death Mtn to Z1Area
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl to Mido
{
    if (Rando_can_get_from_RoyalCemeteryToZ1Area())
    {
        return true;
    }
}


return false;


/*
// Frontway through Death Mtn
if (Rando_can_traverse_JUMPCave() 
&&  Rando_can_cross_SariaBridge() 
&&  Rando_can_traverse_DeathMtn() )
{
    return true;
}



if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl to Mido
{
    if (Rando_can_get_from_RoyalCemeteryToZ1Area())
    {
        return true;
    }
}


// Rauru to Midoro Field
if (Rando_can_traverse_RauruPass() 
||  Rando_can_traverse_RauruToMidoroCave() 
||  Rando_can_traverse_JUMPCave() )
{
    // Midoro Field to RoyalCemetery
    if (Rando_is_attainable(STR_HAMMER))
    {
        // RoyalCemetery to Z1Area
        if (Rando_can_get_from_RoyalCemeteryToZ1Area())
        {
            return true;
        }
    }
    
    // Midoro Field to Saria to Death Mtn to Z1Area
    if (Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


return false;
*/


/*
// Backway through Death Mtn
if (Rando_is_attainable(STR_BOOTS) 
||  ItemLocations_DARKROOM_DIFFICULTY>=1 
||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
{
    if (Rando_is_attainable(STR_HAMMER))
    {
        return true;
    }
    
    if (Rando_is_attainable(STR_RAFT)  // Through Whale Isl
    &&  Rando_can_traverse_NIslMtnPass() )
    {
        return true;
    }
    
    // Through Death Mtn
    if (Rando_can_traverse_JUMPCave() 
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}

return false;
*/

/*
if (Rando_is_attainable(STR_HAMMER) 
||  Rando_is_qual_location(STR_Mido) ) // Whale Isl to Mido
{
    return true;
}

// Through JUMP cave && Death Mtn
if (Rando_can_traverse_JUMPCave() 
&&  Rando_can_cross_SariaBridge() 
&&  Rando_can_traverse_DeathMtn() )
{
    return true;
}


return false;
*/




