/// Rando_can_reach_Saria2()

// Saria2: Saria South Exit


// From Midoro/Morogue area
if (Rando_can_traverse_RauruPass()  // Rauru boulder/RiverDevil
||  Rando_can_traverse_RauruToMidoroCave() 
||  Rando_can_traverse_JUMPCave() )
{
    // Through Saria
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_is_attainable(STR_HAMMER) 
    &&  Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


// From Mido area
if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
{
    // Mido boulder
    if (Rando_is_attainable(STR_HAMMER) 
    &&  Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Mido fast travel to Saria
    if (Rando_can_traverse_Mido_town()   // in case Mido is Old Kasuto and don't have CROSS
    &&  Rando_can_fast_travel_MidoToSaria() 
    &&  Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


return false;




