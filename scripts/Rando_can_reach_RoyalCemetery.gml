/// Rando_can_reach_RoyalCemetery()


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
    if (Rando_is_attainable(STR_HAMMER))
    {
        return true;
    }
    
    // Through Death Mtn
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


// Raftway to Whale Isl to Mido
if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) )
{
    return true;
}


return false;


/*
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


return false;
*/




