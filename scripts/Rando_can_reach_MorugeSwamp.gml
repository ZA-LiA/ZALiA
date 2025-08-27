/// Rando_can_reach_MorugeSwamp()


if (Rando_can_traverse_RauruPass() 
||  Rando_can_traverse_RauruToMidoroCave() 
||  Rando_can_traverse_JUMPCave() )
{
    return true;
}


if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
{
    // Mido boulder
    if (Rando_is_attainable(STR_HAMMER))
    {
        return true;
    }
    
    // Mido fast travel to Saria
    if (Rando_can_traverse_Mido_town()   // in case Mido is Old Kasuto and don't have CROSS
    &&  Rando_can_fast_travel_MidoToSaria() 
    &&  Rando_can_traverse_Saria_town() ) // in case Saria is Old Kasuto and don't have CROSS
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() 
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_Saria_town() ) // in case Saria is Old Kasuto and don't have CROSS
    {
        return true;
    }
}


return false;




