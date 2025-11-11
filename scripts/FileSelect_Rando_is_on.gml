/// FileSelect_Rando_is_on(rando main option, *sub option)


var                         _i=0;
var _MAIN_OPTION = argument[_i++];
var                    _SUB_OPTION = -1;
if (argument_count>_i) _SUB_OPTION = argument[_i++];



if (argument[0]<0 
||  argument[0]==RandoMAIN_ITEMS )
{
    if (dg_RandoITEM_Options[#RandoITEM_LOCS,2])
    {
        return true;
    }
    
    if (argument[0]==RandoMAIN_ITEMS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_SPELLS )
{
    for(_i=0; _i<RandoSPELL_COUNT-1; _i++)
    {
        if (dg_RandoSPELL_Options[#_i,2] 
        &&  _i != RandoSPELL_BACK )
        {
            return true;
        }
    }
    
    if (argument[0]==RandoMAIN_SPELLS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_DUNGEONS )
{
    for(_i=0; _i<RandoDUNGEON_COUNT-1; _i++)
    {
        if (_i!=RandoDUNGEON_LOCATION 
        ||  dg_RandoITEM_Options[#RandoITEM_LOCS,2] )
        {
            if (dg_RandoDUNGEON_Options[#_i,2] 
            &&  _i != RandoDUNGEON_BACK )
            {
                return true;
            }
        }
    }
    
    if (argument[0]==RandoMAIN_DUNGEONS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_ENEMIES )
{
    for(_i=0; _i<RandoENEMY_COUNT-1; _i++)
    {
        if (dg_RandoENEMY_Options[#_i,2] 
        &&  _i != RandoENEMY_DIFF 
        &&  _i != RandoENEMY_BACK )
        {
            return true;
        }
    }

    
    if (argument[0]==RandoMAIN_ENEMIES)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_LVLCOST )
{
    if (dg_RandoMAIN_Options[#RandoMAIN_LVLCOST,2]) return true;
    if (argument[0]==RandoMAIN_LVLCOST) return false;
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_XP )
{
    if (dg_RandoMAIN_Options[#RandoMAIN_XP,2]) return true;
    if (argument[0]==RandoMAIN_XP) return false;
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_OTHER )
{
    if (dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2]) return true;
    if (dg_RandoOTHER_Options[#RandoOTHER_MAIN_DUNGEON_TS,2]) return true;
    if (argument[0]==RandoMAIN_OTHER) return false;
}





/*
    var _is_active  = ItemLocations_WILL_RANDOMIZE!=0;
        _is_active |= SpellLocations_WILL_RANDOMIZE!=0;
        _is_active |= DungeonLocations_WILL_RANDOMIZE!=0;
        _is_active |= EnemyChars_WILL_RANDOMIZE!=0;
        _is_active |= LevelCosts_WILL_RANDOMIZE!=0;
        _is_active |= XP_WILL_RANDOMIZE!=0;
        _is_active |= SpellLocations_WILL_RANDOMIZE!=0;
*/

/*
if (argument[0]<0 
||  argument[0]==RandoMAIN_OTHER )
{
    for(_i=0; _i<RandoOTHER_COUNT-1; _i++)
    {
        switch(_i)
        {
            case RandoOTHER_QUEST:{
            if (dg_RandoOTHER_Options[#_i,2] != 1) return true;
            break;}
            
            case RandoOTHER_ATTACK:{
            if (dg_RandoOTHER_Options[#_i,2] != 1) return true;
            break;}
            
            case RandoOTHER_MAGIC:{
            if (dg_RandoOTHER_Options[#_i,2] != 1) return true;
            break;}
            
            case RandoOTHER_LIFE:{
            if (dg_RandoOTHER_Options[#_i,2] != 1) return true;
            break;}
        }
    }
    
    if (argument[0]==RandoMAIN_OTHER)
    {
        return false;
    }
}
*/






return false;




