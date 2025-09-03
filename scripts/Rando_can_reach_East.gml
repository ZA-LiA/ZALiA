/// Rando_can_reach_East()


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
    // Go through Mido Boulder Pass
    if (Rando_is_attainable(STR_HAMMER))
    {
        if (Rando_is_attainable(STR_RAFT))
        {
            return true;
        }
    }
    
    // Go through Death Mtn from Saria
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        if (Rando_is_attainable(STR_RAFT))
        {
            return true;
        }
    }
}


// Get to Mido through Raftway
if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
{
    if (Rando_is_attainable(STR_RAFT))
    {
        return true;
    }
}


return false;

/*
if (Rando_is_attainable(STR_RAFT))
{
    if (Rando_is_attainable(STR_HAMMER) 
    ||  Rando_can_traverse_NIslMtnPass() ) // Whale Isl warp to Mido
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




