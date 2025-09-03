/// Rando_is_qual_location(location id, *item exception)


var                   _LOCATION_ID = argument[0];
var                   _ITEM_ID     = "undefined";
//var                   _ITEM_ID = -1;
if (argument_count>1) _ITEM_ID     = argument[1];

var _RM_NAME = string_copy(_LOCATION_ID,1,RmName_LEN);


switch(_LOCATION_ID) // location id = rm name + rm item num
{
    // ------------------------------------------------------------
    case Area_TownA+'5F'+'01':{ // Bagu Item location (NOTE)
    if (Rando_can_reach_MorugeSwamp())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'63'+'01':{ // Whale Isl Item location (BOOK)
    // Get to Malo (House in Nabooru Bay)
    if (Rando_can_reach_East() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        // get to Anju
        if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Rauru+"A"], STR_Rauru)))
        {
            // Get to Talo (House on Whale Isl)
            if (Rando_is_attainable(STR_RAFT) 
            &&  Rando_can_traverse_NIslMtnPass() )
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'00'+'01':{ // BOTTLE item. North Castle Zelda room
    if (QUEST_NUM==2)
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'2C'+'01':{ // Tantari Desert Container Piece location
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'29'+'01':{ // North Castle Field Container Piece location
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'2D'+'01':{ // North Castle Cave Container Piece location
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'3F'+'01':{ // Parapa Shore Container Piece location
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'26'+'01':{ // South Parapa Container Piece location
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'36'+'01':{ // Tantari Cave, TROPHY location
    if (Rando_is_attainable(STR_CANDLE,STR_FIRE)) // To see platforms
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'20'+'01':{ // North Isl Container Piece location
    if (Rando_is_attainable(STR_RAFT))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'FF'+'01':{ // Ruto Mtn Container Piece location
    if (Rando_is_qual_location(STR_Ruto) 
    &&  Rando_can_traverse_Ruto_town() ) // in case Ruto is Old Kasuto and don't have CROSS
    {
        if (Rando_is_attainable(STR_JUMP))
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'FA'+'01':{ // RFAIRY location
    if (Rando_can_reach_RutoMtnRuins())
    {
        if (Rando_is_attainable(STR_JUMP) 
        &&  Rando_is_attainable(STR_CANDLE,STR_FIRE) ) // To see the crumble-bridge platforms
        {
            return true;
        }
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'5A'+'01':{ // FLOWER location
    if (Rando_can_reach_MorugeSwamp() 
    &&  Rando_is_attainable(STR_HAMMER) )
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY))
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'33'+'01':{ // Moruge Swamp Container Piece location
    if (Rando_can_reach_MorugeSwamp())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'11'+'01':{ // Midoro Field Cave Container Piece location
    if (Rando_can_reach_MidoroField() 
    &&  Rando_is_attainable(STR_HAMMER) )
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=1 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'34'+'01':{ // Midoro Swamp Container Piece location
    if (Rando_can_reach_MidoroField())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'20'+'01':{ // Saria Bay Container Piece location
    if (Rando_is_qual_location(STR_Saria))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'90'+'01':{ // Target Minigame location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Saria+"A"], STR_Saria)))
    {
        if (_ITEM_ID!=STR_RFAIRY) // item must have gravity
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'37'+'01':{ // MIRROR location
    if (Rando_can_reach_Saria2())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'54'+'01':{ // MEAT location
    if (Rando_can_reach_Saria2())
    {
        if (Rando_is_attainable(STR_FIRE) 
        &&  Rando_is_attainable(STR_JUMP) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'24'+'01':{ // Death Mtn Shoals Container Piece location
    if (Rando_can_reach_Z1Area())
    {
        if (Rando_is_attainable(STR_BOOTS))
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'15'+'01':{ // HAMMER location
    if (Rando_can_reach_Z1Area())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'1A'+'01':{ // Death Mtn Hole Container Piece location
    if (Rando_can_reach_Z1Area())
    {
        if (Rando_is_attainable(STR_HAMMER))
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'11'+'01':{ // Death Mtn Maze Container Piece location (HEART)
    //case Area_DthMt+'0D'+'01':{ // Death Mtn Maze Container Piece location (HEART)
    if (Rando_can_reach_Z1Area())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'09'+'01':{ // Death Mtn Maze Container Piece location (MAGIC)
    if (Rando_can_reach_Saria2()   // North end of Death Mtn
    ||  Rando_can_reach_Z1Area() ) // South end of Death Mtn
    {
        //if (Rando_can_traverse_DeathMtn())
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY))
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'22'+'01':{ // Death Mtn 1up location
    if (Rando_can_reach_Saria2()   // North end of Death Mtn
    ||  Rando_can_reach_Z1Area() ) // South end of Death Mtn
    {
        //if (Rando_can_traverse_DeathMtn())
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY))
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'38'+'01':{ // Royal Cemetery Container Piece location
    if (Rando_can_reach_RoyalCemetery())
    {
        return true;
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'07'+'01':{ // Container Piece above P5 location
    if (Rando_can_reach_East() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'6E'+'01':{ // Nabooru Chimney PBag location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Nabooru+"A"], STR_Nabooru)) 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'6F'+'01':{ // Mido Fairy Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Mido+"A"], STR_Mido)) 
    &&  Rando_is_attainable(STR_RFAIRY) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'89'+'01':{ // Nabooru MAP item location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Nabooru+"A"], STR_Nabooru)))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'12'+'01':{ // Nabooru Bay Cave Container Piece location
    if (Rando_is_qual_location(STR_Nabooru) 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'6B'+'01':{ // Pendant Isl Container Piece location
    if (Rando_can_reach_DaruniaField() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'3A'+'01':{ // PBag: North Nabooru Bay
    if (Rando_can_reach_DaruniaField())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'91'+'01':{ // Darunia Minigame
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Darunia+"A"], STR_Darunia)) 
    &&  Rando_is_attainable(STR_STABDOWN) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_MazIs+'03'+'01':{ // Maze Isl Hole Container Piece location
    if (Rando_can_reach_MazeIsl())
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_MazIs+'04'+'01':{ // CHILD location
    if (Rando_can_reach_MazeIsl())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=1 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_MazIs+'0A'+'01':{ // Shoals above P4
    if (Rando_can_reach_MazeIsl() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'16'+'01':{ // River Devil Lake Container Piece location
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'15'+'01':{ // Kasuto-Lake magic piece location
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'34'+'01':{ // Seashore-Desert Container-Piece location
    if (Rando_can_reach_KasutoArea())
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'68'+'01':{ // New Kasuto Quest Reward location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"A"], STR_New_Kasuto)))
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'88'+'01':{ // New Kasuto MAP item location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"A"], STR_New_Kasuto)))
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'6A'+'01':{ // BRACELET location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"A"], STR_New_Kasuto)) 
    &&  Rando_is_attainable(STR_ENIGMA) )
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'6A'+'02':{ // PBag: BRACELET room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"A"], STR_New_Kasuto)) 
    &&  Rando_is_attainable(STR_ENIGMA) 
    &&  Rando_is_attainable(STR_BRACELET) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_TownA+'5C'+'01':{ // Old Kasuto container piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Old_Kasuto+"A"], STR_Old_Kasuto)) 
    &&  Rando_is_attainable(STR_CROSS) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'1F'+'01':{ // VOD Container Piece location
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_CROSS) 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'60'+'01':{ // Under Kings Tomb location (SHIELD)
    if (Rando_can_reach_RoyalCemetery() 
    &&  Rando_is_attainable(STR_BOOK) )
    {
        var _return=false;
        
        var _dk = STR_Spell+STR_Sequence+"01";
        var _spell_seq = f.dm_quests[?_dk];
        if(!is_undefined(_spell_seq))
        {
            var _i, _count, _spell_name;
            
            _return=true;
            _spell_seq = val(dm_save_data[?_dk], _spell_seq);
            
                         _count = string_length(_spell_seq)>>1; // _spell_seq is a string of 4 spell bits
            for(_i=0; _i<_count; _i++)
            {
                _spell_name = string_copy(_spell_seq, (_i<<1)+1, 2);
                _spell_name = g.dm_Spell[?_spell_name+STR_Name];
                if (is_undefined(         _spell_name) 
                || !Rando_is_attainable(  _spell_name) )
                {
                    _return=false;
                    break;//_i
                }
            }
        }
        
        return _return;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'51'+'01':{ // Carock 2 location (PENDANT)
    if (Rando_can_reach_DaruniaField() 
    &&  Rando_is_attainable(STR_BOOTS) 
    &&  Rando_is_attainable(STR_BOOK) 
    &&  Rando_is_attainable(STR_REFLECT) ) // To defeat Carock 2
    {
        var _return=false;
        
        var _dk = STR_Spell+STR_Sequence+"02";
        var _spell_seq = f.dm_quests[?_dk];
        if(!is_undefined(_spell_seq))
        {
            var _i, _count, _spell_name;
            
            _return=true;
            _spell_seq = val(dm_save_data[?_dk], _spell_seq);
            
                         _count = string_length(_spell_seq)>>1; // _spell_seq is a string of 4 spell bits
            for(_i=0; _i<_count; _i++)
            {
                _spell_name = string_copy(_spell_seq, (_i<<1)+1, 2);
                _spell_name = g.dm_Spell[?_spell_name+STR_Name];
                if (is_undefined(         _spell_name) 
                || !Rando_is_attainable(  _spell_name) )
                {
                    _return=false;
                    break;//_i
                }
            }
        }
        
        return _return;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_DthMt+'30'+'01':{ // Boulder Circle Reward location (RING)
    if (Rando_can_reach_Z1Area() 
    &&  Rando_is_attainable(STR_HAMMER) )
    {
        // *** It's possible that only 6 pieces of the code are attainable if both SUMMON and FAIRY are NOT in Bulblin
        var _Bulblin_SPELL = val(dm_save_data[?STR_Bulblin+STR_Spell]);
        var _code_count  = 0;
            _code_count += Rando_is_attainable(STR_PROTECT) && _Bulblin_SPELL!=STR_PROTECT;
            _code_count += Rando_is_attainable(STR_JUMP)    && _Bulblin_SPELL!=STR_JUMP;
            _code_count += Rando_is_attainable(STR_HEAL)    && _Bulblin_SPELL!=STR_HEAL;
            _code_count += Rando_is_attainable(STR_FIRE)    && _Bulblin_SPELL!=STR_FIRE;
            _code_count += Rando_is_attainable(STR_REFLECT) && _Bulblin_SPELL!=STR_REFLECT;
            _code_count += Rando_is_attainable(STR_ENIGMA)  && _Bulblin_SPELL!=STR_ENIGMA;
            _code_count += Rando_is_attainable(STR_THUNDER) && _Bulblin_SPELL!=STR_THUNDER;
        if (_code_count >= 6) // 6 pieces of code: there are 2 possible combos of the missing code
        //if (_code_count >= 5) // 5 pieces of code: there are 6 possible combos of the missing code
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'48'+'01':{ // Kakusu Reward location (SWORD)
    if (Rando_is_qual_location_1a())
    {
        return true;
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_EastA+'4A'+'01':{ // PBag: South Continent cave
    if (Rando_is_qual_location_1a())
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ===================================================
    // =====================  PBAGS  =====================
    // ------------------------------------------------------------
    case Area_WestA+'0D'+'01':{ // PBag: Cave N of Midoro Swamp
    if (Rando_can_reach_MidoroField())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=1 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'1A'+'01':{ // PBag: North Castle Lake west exit
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'1F'+'01':{ // PBag: Secret tile SW of Royal Cemetery
    if (Rando_can_reach_RoyalCemetery())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'29'+'02':{ // PBag: Secret tile North side of North Castle Lake
    if (Rando_is_attainable(STR_JUMP)) // High up on top of ruins
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'42'+'01':{ // PBag: North Castle vertical climb challenge
    if (Rando_is_attainable(STR_JUMP))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'3C'+'01':{ // PBag: Upper North Castle Hallway
    if (Rando_is_attainable(STR_JUMP))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'2B'+'01':{ // PBag: Forest tile S of Tantari Desert
    return true;
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'2E'+'01':{ // PBag: Forest tile E of Saria
    if (Rando_is_qual_location(STR_Saria))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'2F'+'01':{ // PBag: Island N of Tantari Desert
    if (Rando_is_attainable(STR_RAFT))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'44'+'01':{ // PBag: Sea Cave N end of Ruto Mtns
    if (Rando_is_attainable(STR_BOOTS))
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'45'+'01':{ // PBag: Island between Death Mtn and Royal Cemetery
    if (Rando_can_reach_RoyalCemetery() 
    ||  Rando_can_reach_Z1Area() )
    {
        if (Rando_is_attainable(STR_BOOTS))
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'47'+'01':{ // PBag: Secret tile Midoro Swamp near P2
    if (Rando_can_reach_MidoroField())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'48'+'01':{ // PBag: Cave ruins under North Castle Lake
    if (Rando_are_attainable(STR_STABDOWN,STR_GLOVE) 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'4D'+'01':{ // PBag: West Saria River Waterfall
    if (Rando_can_reach_Saria2() 
    &&  Rando_is_attainable(STR_FIRE) 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
        /*
        if (Rando_is_attainable(STR_FAIRY))// This could be a progression item, JUMP is not enough to land on ground to pick up item.
        {   // 2024/08/07. The room has been changed so that JUMP is enough to get to it.
            return true;
        }
        */
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'55'+'01':{ // PBag: Forest above Saria Lake
    if (Rando_can_reach_Saria2() 
    &&  Rando_is_attainable(STR_FIRE) 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'F4'+'01':{ // PBag: N Ruto Mtn ruins 2 (top of ruins)
    if (Rando_can_reach_RutoMtnRuins() 
    &&  Rando_is_attainable(STR_JUMP) 
    &&  Rando_is_attainable(STR_CANDLE,STR_FIRE) ) // To see crumble platforms in RFAIRY room
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_WestA+'FE'+'01':{ // PBag: N Ruto Mtn ruins 1
    if (Rando_can_reach_RutoMtnRuins() 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'0A'+'01':{ // PBag: Cave S of Nabooru
    if (Rando_can_reach_East())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'0C'+'01':{ // PBag: Kasuto Swamp cave
    if (Rando_can_reach_KasutoArea())
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'11'+'01':{ // PBag: Sea cave N of Darunia
    if (Rando_can_reach_DaruniaField() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'1C'+'01':{ // PBag: Secret field tile E Darunia Field
    if (Rando_can_reach_DaruniaField())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'21'+'01':{ // PBag: Secret desert tile S of P5
    if (Rando_can_reach_East())
    {
        if (Rando_is_attainable(STR_HAMMER,STR_BOOTS) 
        &&  Rando_is_attainable(STR_JUMP) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'26'+'01':{ // PBag: Forest tile W of Nabooru
    if (Rando_can_reach_East())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'2C'+'01':{ // PBag: Secret forest tile NE of P6
    if (Rando_can_reach_KasutoArea())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'33'+'01':{ // PBag: Secret tile Kasuto Swamp
    if (Rando_can_reach_KasutoArea())
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'3F'+'01':{ // PBag: Secret tile in VOD
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_CROSS) 
    &&  Rando_is_attainable(STR_JUMP,STR_RFAIRY) )// For VOD trap rooms. But not required if rm skips are used.
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'5C'+'01':{ // PBag: Nabooru quest cave system, item 1 (right of well bottom)
    // Get to well
    if (Rando_is_qual_location(STR_Nabooru) 
    &&  Rando_can_traverse_Nabooru_town() ) // in case Nabooru is Old Kasuto and don't have CROSS
    {
        // Get inside well
        if (Rando_can_get_in_NabooruWell())
        {
            if (_ITEM_ID!=STR_RFAIRY) // Rescue Fairy might bug inside blocks? I think?
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'53'+'01':{ // PBag: Nabooru quest cave system, item 2 (above last big vertical drop)
    // Get to well
    if (Rando_is_qual_location(STR_Nabooru) 
    &&  Rando_can_traverse_Nabooru_town() ) // in case Nabooru is Old Kasuto and don't have CROSS
    {
        // Get inside well
        if (Rando_can_get_in_NabooruWell())
        {
            // Get across well shaft
            if (Rando_is_attainable(STR_GLOVE) 
            &&  Rando_is_attainable(STR_STABDOWN) 
            &&  Rando_is_attainable(STR_JUMP) )
            {
                // Get across pit
                if (Rando_is_attainable(STR_JUMP,STR_FAIRY))
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'76'+'01':{ // PBag: Raft ride to Dragmire
    if (Rando_can_reach_Dragmire() 
    &&  Rando_is_attainable(STR_JUMP) )
    {
        return true;
    }
    break;}
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'90'+'02':{ // PBag: Dragmire shoals location
    if (Rando_can_reach_Dragmire() 
    &&  Rando_is_attainable(STR_JUMP) ) // caves on the way there
    {
        return true;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------
    case Area_EastA+'A8'+'01':{ // MASK location
    if (Rando_is_qual_location(STR_Bulblin) 
    &&  Rando_is_attainable(STR_HAMMER) 
    &&  Rando_are_attainable(STR_BRACELET,STR_JUMP,STR_GLOVE) )
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    case Area_EastA+'A8'+'02':{ // PBag: MASK room, bag 1
    if (Rando_is_qual_location(_RM_NAME+'01'))
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    case Area_EastA+'A8'+'03':{ // PBag: MASK room, bag 2
    if (Rando_is_qual_location(_RM_NAME+'01'))
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Ruto],Area_TownA+'61')+'01':{ // item in JUMP spell room
    case Area_TownA+'61'+'01':{ // item in JUMP spell room
    if (Rando_is_qual_location(_RM_NAME+STR_Spell) 
    &&  Rando_is_attainable(STR_JUMP) ) // To get on ceiling of room
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Mido],Area_TownA+'63')+'01':{ // item in FAIRY spell room
    case Area_TownA+'63'+'01':{ // item in FAIRY spell room
    if (Rando_is_qual_location(_RM_NAME+STR_Spell) 
    &&  Rando_is_attainable(STR_FAIRY) ) // To get across water
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Nabooru],Area_TownA+'65')+'01':{ // item in FIRE spell room
    case Area_TownA+'65'+'01':{ // item in FIRE spell room
    if (Rando_is_qual_location(_RM_NAME+STR_Spell) 
    &&  Rando_is_attainable(STR_FIRE) ) // To get past vines
    {
        return true;
    }
    break;}
    /*
    // ------------------------------------------------------------
    case Area_TownA+'61'+'01':{ // item in JUMP spell room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Ruto+"A"], STR_Ruto)) 
    &&  Rando_is_attainable(val(dm_save_data[?STR_Ruto+STR_Spell])) 
    &&  Rando_is_attainable(STR_JUMP) ) // To get on ceiling of room
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    case Area_TownA+'63'+'01':{ // item in FAIRY spell room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Mido+"A"], STR_Mido)) 
    &&  Rando_is_attainable(val(dm_save_data[?STR_Mido+STR_Spell])) 
    &&  Rando_is_attainable(STR_FAIRY) ) // To get across water
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    case Area_TownA+'65'+'01':{ // item in FIRE spell room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Nabooru+"A"], STR_Nabooru)) 
    &&  Rando_is_attainable(val(dm_save_data[?STR_Nabooru+STR_Spell])) 
    &&  Rando_is_attainable(STR_FIRE) ) // To get past vines
    {
        return true;
    }
    break;}
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 1 ------------------------------
    // ------------------------------------------------------------
    case Area_PalcA+'00'+'01':{ // P1 Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Parapa_Palace+"A"], STR_Parapa_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Parapa_Palace],1))>=1 )
        {
            return true;
        }
    }
    break;}
    
    // ------------------------------------------------------------
    case Area_PalcA+'08'+'01':{ // P1 item location (CANDLE)
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Parapa_Palace+"A"], STR_Parapa_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Parapa_Palace],1))>=3 )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcA+'01'+'01':{ // Key. 2nd key of palace left of room with 3rd key guarded by a Guma
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Parapa_Palace+"A"], STR_Parapa_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            return true;
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Parapa_Palace],1))>=1 )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcA+'02'+'01':{ // Key. 3rd key of palace guarded by a Guma
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Parapa_Palace+"A"], STR_Parapa_Palace)))
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=1 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                return true;
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Parapa_Palace],1))>=1 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcA+'03'+'01':{ // Key. 1st key of palace left of 1st elevator
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Parapa_Palace+"A"], STR_Parapa_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            return true;
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (string_pos(STR_KEY, _ITEM_ID) 
            ||  string_pos(STR_PBAG,_ITEM_ID) )
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_FAIRY))
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_GLOVE))
            //&&  Rando_is_attainable(STR_STABDOWN,STR_STABUP) )
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 2 ------------------------------
    // ------------------------------------------------------------
    case Area_PalcB+'00'+'01':{ // PBag: P2 entrance
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (Rando_is_attainable(STR_JUMP))
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcB+'16'+'01':{ // P2 1up location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE))
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcB+'06'+'01':{ // P2 Item location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Midoro_Palace],2))>=4 )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcB+'15'+'01':{ // P2 Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE))  // There's a room on the way with blocks blocking the way
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Midoro_Palace],2))>=1 )
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcB+'03'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            return true;
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Midoro_Palace],2))>=1 )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcB+'09'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            return true;
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (string_pos(STR_KEY, _ITEM_ID) 
            ||  string_pos(STR_PBAG,_ITEM_ID) )
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_FAIRY))
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_GLOVE))
            //&&  Rando_is_attainable(STR_STABDOWN,STR_STABUP) )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcB+'0E'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // There's a room on the way with blocks blocking the way
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                return true;
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Midoro_Palace],2))>=1 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcB+'10'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Midoro_Palace+"A"], STR_Midoro_Palace)))
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 3 ------------------------------
    // ------------------------------------------------------------
    case Area_PalcC+'04'+'02':{ // P3 PBag: under blocks next to 1st key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_are_attainable(STR_STABDOWN,STR_GLOVE))
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'12'+'01':{ // P3 Item location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // fast falling blocks
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=4 )
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'13'+'01':{ // P3 Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // fast falling blocks
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=4 )
            {
                if (Rando_is_attainable(STR_FAIRY)) // passage to room
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'07'+'02':{ // PBag: Mau Spawner room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // fast falling blocks
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=3 )
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'08'+'01':{ // PBag: GLOVE & JUMP locked cove above hallway
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)  // cove blocks and other block rooms
        &&  Rando_is_attainable(STR_JUMP) ) // To get up to cove
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'0C'+'01':{ // PBag: On blocks on top of pillar
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // fast falling blocks
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=4 )
            {
                if (Rando_is_attainable(STR_JUMP))
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcC+'0D'+'01':{ // PBag: Room left of Rebonack
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // rm 03 fast falling blocks
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=4 )
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcC+'04'+'01':{ // Key: Under blocks
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)  // rm 03 fast falling blocks
        &&  Rando_are_attainable(STR_STABDOWN,STR_GLOVE) ) // under blocks
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcC+'06'+'01':{ // Key: Outside room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // rm 03 fast falling blocks
        //&&  Rando_is_attainable(STR_JUMP) ) // Floor gap in left adjacent room
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcC+'07'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // rm 03 fast falling blocks, key is under blocks
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_are_attainable(STR_STABDOWN,STR_GLOVE) ) // rm 04 key under blocks
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=3 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcC+'0A'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Island_Palace+"A"], STR_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // rm 03 fast falling blocks, rm 0A block wall
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_are_attainable(STR_STABDOWN,STR_GLOVE) ) // rm 04 key under blocks
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Island_Palace],3))>=3 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 4 ------------------------------
    // ------------------------------------------------------------
    case Area_PalcD+'04'+'01':{ // PBag: Room with 3 Stalfos and spiketraps
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_STABDOWN) 
        || (!string_pos(STR_KEY,_ITEM_ID) && !string_pos(STR_PBAG,_ITEM_ID)) )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcD+'09'+'01':{ // P4 Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcD+'0F'+'01':{ // PBag: Left cove in pit room left of BOOTS
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        return true;
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcD+'10'+'01':{ // P4 BOOTS location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=6 )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcD+'01'+'02':{ // PBag: 2 Doomknockers and a key under blocks
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=4 )
        {
            if (Rando_is_attainable(STR_GLOVE)) // PBag is under blocks
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcD+'0B'+'01':{ // PBag: Room with blocks on top of pillars
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=6 )
        {
            if (Rando_is_attainable(STR_JUMP)) // PBag is high up
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcD+'01'+'01':{ // Key: 2 Doomknockers and a key under blocks
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            &&  Rando_is_attainable(STR_GLOVE) ) // Key is under blocks
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY)              // Get across pit in rm 09 to get to key rm 0A
            &&  Rando_are_attainable(STR_GLOVE,STR_JUMP,STR_STABUP)  // Get key in rm 02 alcove
            &&  Rando_is_attainable(STR_GLOVE) )                     // Key is under blocks in this rm and key rm 11
            {
                return true;
            }
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=4 )
            {
                if (Rando_is_attainable(STR_GLOVE)) // Key is under blocks
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcD+'02'+'01':{ // Key: up in block locked high alcove
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            &&  Rando_are_attainable(STR_JUMP,STR_STABUP,STR_GLOVE) )// Get key in rm 02 alcove
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY)              // Get across pit in rm 09 to get to key rm 0A
            &&  Rando_is_attainable(STR_GLOVE)                       // Key is under blocks in rm 11
            &&  Rando_are_attainable(STR_JUMP,STR_STABUP,STR_GLOVE) )// Get key in rm 02 alcove
            {
                return true;
            }
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=3 )
            {
                if (Rando_are_attainable(STR_JUMP,STR_STABUP,STR_GLOVE))// Get up in alcove
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcD+'07'+'01':{ // Key: Last death-abuse room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY))
            {
                return true;
            }
            
            if (Rando_is_attainable(STR_JUMP,STR_FAIRY)              // Get across pit in rm 09 to get to key rm 0A
            &&  Rando_are_attainable(STR_GLOVE,STR_JUMP,STR_STABUP)  // Get key in rm 02 alcove
            &&  Rando_is_attainable(STR_GLOVE) )                     // Key under blocks in rm 11
            {
                return true;
            }
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Maze_Island_Palace],4))>=4 )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcD+'0A'+'01':{ // Key: 1st death-abuse room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_JUMP,STR_FAIRY)) // Get across pit in rm 09 to get to key rm 0A
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcD+'11'+'01':{ // Key: Bottom left of dungeon's right side
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        if (Rando_is_attainable(STR_GLOVE)) // under blocks
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcD+'14'+'01':{ // Key: 2nd death-abuse room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Maze_Island_Palace+"A"], STR_Maze_Island_Palace)))
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 5 ------------------------------
    // ------------------------------------------------------------
    case Area_PalcE+'00'+'01':{ // PBag: P5 Entrance
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_JUMP)) // PBag is high up
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'0A'+'01':{ // P5 Container Piece location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'0C'+'01':{ // PBag: JUMP locked above elevator
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=1 )
            {
                if (Rando_is_attainable(STR_JUMP)) // PBag is high up
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'1A'+'01':{ // P5 Item location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=5 )
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'0B'+'01':{ // PBag: Locked by downthrust, upthrust, and GLOVE 1
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=4 )
            {
                if (Rando_are_attainable(STR_GLOVE,STR_STABDOWN,STR_STABUP))
                {
                    // Break the item's floor with a standing stab at jump peak
                    if (Rando_is_attainable(STR_JUMP) 
                    ||  _ITEM_ID!=STR_RFAIRY ) // item has gravity
                    {
                        return true;
                    }
                }
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'13'+'02':{ // PBag: Locked by downthrust, upthrust, and GLOVE 2
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=1 )
            {
                if (Rando_are_attainable(STR_GLOVE,STR_STABDOWN,STR_STABUP))
                {
                    // Break the item's floor with a standing stab at jump peak
                    if (Rando_is_attainable(STR_JUMP) 
                    ||  _ITEM_ID!=STR_RFAIRY ) // item must have gravity
                    {
                        return true;
                    }
                }
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcE+'12'+'01':{ // PBag: On top of break blocks in rm to the right of pillar/water/skulls room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY))
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=4 )
            {
                if (Rando_is_attainable(STR_JUMP)) // to get on top of blocks
                {
                    return true;
                }
                
                // if dont have JUMP
                if (Rando_is_attainable(STR_GLOVE) 
                &&  _ITEM_ID!=STR_RFAIRY ) // item must have gravity
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcE+'02'+'01':{ // Key: Right after Cucco requirement
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY)) // Get 1st key right after cucco tunnel
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcE+'08'+'01':{ // Key: High up in falling blocks room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY)) // Get 1st key right after cucco tunnel
        {
            if(!KeyLocations_WILL_RANDOMIZE 
            &&  Rando_is_attainable(STR_JUMP,STR_GLOVE) ) // to get to item spot high up
            {
                return true;
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=1 )
                {
                    if (Rando_is_attainable(STR_JUMP,STR_GLOVE)) // to get to item spot high up
                    {
                        return true;
                    }
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcE+'0F'+'01':{ // Key: Right side of wall in dead-end room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY)) // Get 1st key right after cucco tunnel
        {
            if(!KeyLocations_WILL_RANDOMIZE 
            &&  Rando_is_attainable(STR_JUMP) ) // Spikes room
            {
                return true;
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=1 )
                {
                    if (Rando_is_attainable(STR_JUMP)) // Spikes room
                    {
                        return true;
                    }
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcE+'13'+'01':{ // Key: High up in alcove with IronKnuckle
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY)) // Get 1st key right after cucco tunnel
        {
            if(!KeyLocations_WILL_RANDOMIZE 
            &&  Rando_is_attainable(STR_JUMP) ) // To get to alcove
            {
                return true;
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=1 )
                {
                    if (Rando_is_attainable(STR_JUMP)) // To get to alcove
                    {
                        return true;
                    }
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcE+'1D'+'01':{ // Key: Left of skull-pillar room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Palace_On_The_Sea+"A"], STR_Palace_On_The_Sea)))
    {
        if (Rando_is_attainable(STR_FAIRY)) // Get 1st key right after cucco tunnel
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY))
                {
                    return true;
                }
                
                if (Rando_is_attainable(STR_JUMP,STR_GLOVE)  // to get key high up in rm 08
                &&  Rando_is_attainable(STR_JUMP) ) // Get to rm 13 key in alcove, Get past spikes room for key in rm 0F
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Palace_On_The_Sea],5))>=4 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // =======================================================================
    // ------------------------ PALACE 6 ------------------------------
    // *** The falling key in Area_PalcF+'13' IS attainable WITHOUT STABDOWN.
    
    // ------------------------------------------------------------
    case Area_PalcF+'01'+'02':{ // PBag: 1st key room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_BRACELET) 
        &&  Rando_are_attainable(STR_STABUP,STR_GLOVE) )
        {
            if (_ITEM_ID!=STR_RFAIRY) // item must have gravity
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'02'+'01':{ // PBag: GLOVE and STABUP locked 1 (below entrance)
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_are_attainable(STR_STABUP,STR_GLOVE) 
        &&  Rando_is_attainable(STR_JUMP) ) // To get up and into alcove containing pbag
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'08'+'01':{ // P6 CROSS location
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=5 )
        {
            if (Rando_is_attainable(STR_GLOVE)      // block wall in false floor room
            &&  Rando_is_attainable(STR_JUMP)       // floor gap in false floor room
            &&  Rando_is_attainable(STR_STABDOWN) ) // To kill Rebo in CROSS room
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'06'+'01':{ // PBag: Top-Right of Dungeon: rm with down elevator going to Atta room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        // *** The gap in the first endless pit room 
        // can be crossed w/out JUMP by falling 
        // through the pit loop and staying to the right.
        
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=5 )
        {
            if (Rando_is_attainable(STR_GLOVE)) // This pbag is under blocks
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'0A'+'01':{ // PBag: Room with Atta
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=5 )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'0C'+'01':{ // PBag: Endless pit 3
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=1 )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'12'+'01':{ // Room above room left of Barba
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=6 )
        {
            if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
            &&  Rando_is_attainable(STR_GLOVE)      // room with block wall
            &&  Rando_is_attainable(STR_STABDOWN) ) // To kill 2nd Rebo
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'13'+'02':{ // PBag: Bottom-left corner in falling key room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=1 )
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'17'+'02':{ // PBag: Under blocks with Mau Spawner
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=4 )
        {
            if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
            &&  Rando_is_attainable(STR_GLOVE) )        // room with block wall
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'1A'+'01':{ // PBag: P6 Bottom room of pit to boss
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=6 )
        {
            if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
            &&  Rando_is_attainable(STR_GLOVE)     // room with block wall
            &&  Rando_is_attainable(STR_STABDOWN) )// To kill 2nd Rebo
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcF+'1C'+'01':{ // PBag: Room below Kakusu room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=6 )
        {
            if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
            &&  Rando_is_attainable(STR_STABDOWN)  // To kill 2nd Rebo
            &&  Rando_is_attainable(STR_GLOVE) )   // room with block wall
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    // ====================================================
    // --------------------------------------------
    case Area_PalcF+'01'+'01':{ // Key: Room with push-statue
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE))
        {
            if (_ITEM_ID!=STR_RFAIRY) // item must have gravity
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcF+'09'+'01':{ // Key: Endless-pit 1-1
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE) ) // to get key in _PalcF_01
            {
                return true;
            }
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=1 )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcF+'0B'+'01':{ // Key: Room below false floor room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if(!KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY))
            {
                return true;
            }
            
            if (Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE)  // to get key in _PalcF_01
            &&  Rando_are_attainable(STR_FAIRY,STR_JUMP) ) // To get across lava room for other potentially needed keys
            {
                return true;
            }
        }
        
        if (KeyLocations_WILL_RANDOMIZE)
        {
            if (Rando_is_attainable(STR_ALLKEY) 
            ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=5 )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcF+'13'+'01':{ // Key. falling key
    // It's possible to acquire this key WITHOUT downstab
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        // Must be an item that can be obtained by stabbing
        if (string_pos(STR_KEY, _ITEM_ID) 
        ||  string_pos(STR_PBAG,_ITEM_ID) )
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE) ) // to get key in _PalcF_01
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=1 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcF+'17'+'01':{ // Key: Mau spawner room
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
        &&  Rando_is_attainable(STR_GLOVE) )        // room with block wall
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE) ) // to get key in _PalcF_01
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=4 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case Area_PalcF+'1F'+'01':{ // Key
    if (Rando_is_qual_location(val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Three_Eye_Rock_Palace+"A"], STR_Three_Eye_Rock_Palace)))
    {
        if (Rando_are_attainable(STR_FAIRY,STR_JUMP) // To get across P6 lava room
        &&  Rando_is_attainable(STR_GLOVE)           // room with block wall
        &&  Rando_is_attainable(STR_STABDOWN) )      // To kill dark Rebo
        {
            if(!KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_are_attainable(STR_BRACELET,STR_STABUP,STR_GLOVE) ) // to get key in _PalcF_01
                {
                    return true;
                }
            }
            
            if (KeyLocations_WILL_RANDOMIZE)
            {
                if (Rando_is_attainable(STR_ALLKEY) 
                ||  Rando_attainable_key_count(val(g.dm_dungeon[?STR_Dungeon+STR_Num+STR_Three_Eye_Rock_Palace],6))>=4 )
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ PALACE 7 ------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    case Area_PalcG+'04'+'01':{ // PBag: Dead end 1
    if (Rando_can_get_inside_P7())
    {
        return true;
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'0B'+'01':{ // PBag: Room with pit-down under block bridge
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_GLOVE)) // For room on the way
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'29'+'01':{ // Great Palace 1up location
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN) )
        {
            return true;
        }
    }
    break;}
    // ------------------------------------------------------------
    case Area_PalcG+'29'+'03':{ // Great Palace 1up location (2nd Quest PBag)
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN) )
        {
            return true;
        }
    }
    break;}
    // ------------------------------------------------------------
    case Area_PalcG+'29'+'02':{ // PBag: Other side of wall 1up doll is against
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_FAIRY) ) // Ceiling too low to jump across fake floor gap above pit
        {
            // Jump through left fake floor
            if (Rando_is_attainable(STR_JUMP))
            {
                return true;
            }
            // Through blocks next to left fake floor
            if (Rando_is_attainable(STR_GLOVE) 
            &&  Rando_is_attainable(STR_STABUP) )
            {
                return true;
            }
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'2D'+'01':{ // PBag: Pit-down room 1 to Thunderbird (left side)
    if (Rando_can_get_inside_P7())
    {
        // Route through left dungeon side
        if (Rando_is_attainable(STR_GLOVE)  // For a room on the way
        &&  Rando_are_attainable(STR_FAIRY,STR_JUMP) ) // Get across FAIRY lava room
        {
            return true;
        }
        
        // Get to pit in rm '29' that goes to this rm
        if (Rando_is_attainable(STR_ALLKEY))
        {
            // Jump through left fake floor
            if (Rando_is_attainable(STR_JUMP))
            {
                return true;
            }
            // Through blocks next to left fake floor
            if (Rando_is_attainable(STR_GLOVE) 
            &&  Rando_is_attainable(STR_STABUP) )
            {
                return true;
            }
        }
    }
    break;}
    // ------------------------------------------------------------
    case Area_PalcG+'2D'+'02':{ // PBag: Pit-down room 1 to Thunderbird path (right side)
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN) ) // For a room on the way
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'2F'+'01':{ // PBag: Dead end 2 (to the right of 1up rm)
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN) ) // For a room on the way
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'30'+'01':{ // PBag: GLOVE locked on top of 'T' blocks
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN) ) // For a room on the way
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'3A'+'01':{ // Great Palace Item location (SKELETON KEY)
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_GLOVE)) // Waffle-Block room
        {
            return true;
        }
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'3C'+'01':{ // PBag: Outside, back entrance of dungeon
    var _dungeon_name1 = val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Great_Palace+"A"], STR_Great_Palace);
    if (Rando_is_qual_location(_dungeon_name1))
    {
        if (_dungeon_name1==STR_Island_Palace) // At Island Palace in the overworld, you can only approach from the top or left which means you can only enter Great Palace at the left entrance
        //||  _dungeon_name1==STR_Great_Palace ) // At Great Palace in the overworld, you approach from the bottom which puts you at the left entrance. Leaving through the left entrance puts you 1 tile below the palace, so you can't approach it from a diff direction. (2024/10/04 - Changed leaving Great Palace puts player ON the palace so they don't need JUMP to get to the fast travel cave.)
        {
            if (Rando_is_attainable(STR_JUMP))
            {
                return true;
            }
        }
        else
        {
            return true;
        }
        //DungeonLocations_WILL_RANDOMIZE
        //dm_save_data[?STR_Dungeon+STR_Rando+_dungeon_name2+"A"] = _dungeon_name1; // _dungeon_name2+"A": Get overworld dungeon containing _dungeon_name2
        //dm_save_data[?STR_Dungeon+STR_Rando+_dungeon_name1+"B"] = _dungeon_name2; // _dungeon_name1+"B": Get dungeon inhabiting overworld dungeon _dungeon_name1
    }
    break;}
    
    
    // ------------------------------------------------------------
    case Area_PalcG+'42'+'01':{ // PBag: Dead end 3
    if (Rando_can_get_inside_P7())
    {
        if (Rando_is_attainable(STR_ALLKEY) 
        &&  Rando_is_attainable(STR_GLOVE) )
        {
            return true;
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // CAN GET TO A PALACE ---------------------------------------------
    // --------------------------------------------
    case STR_Parapa_Palace:{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_Midoro_Palace:{
    if (Rando_can_reach_MidoroField())
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Island_Palace:{
    if (Rando_can_reach_RoyalCemetery())
    {
        // Get across large body of water in cave
        if (Rando_are_attainable(STR_FAIRY,STR_JUMP))
        {
            // Get through caves to P3
            if (ItemLocations_DARKROOM_DIFFICULTY>=1 
            ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
            {
                return true;
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case STR_Maze_Island_Palace:{
    if (Rando_can_reach_MazeIsl())
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Palace_On_The_Sea:{
    if (Rando_can_reach_East() 
    &&  Rando_is_attainable(STR_BOOTS) )
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Three_Eye_Rock_Palace:{
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_FLUTE) )
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Great_Palace:{
    if (Rando_can_reach_KasutoArea() 
    &&  Rando_is_attainable(STR_CROSS)  // VOD invisible enemies
    &&  Rando_is_attainable(STR_JUMP,STR_FAIRY) ) // VOD trap rooms
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2  // VOD caves
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case STR_Dragmire_Tower:{
    if (Rando_is_qual_location(STR_Bulblin) 
    &&  Rando_is_attainable(STR_MASK) )
    {
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if (Rando_is_attainable(STR_JUMP)       // Caves and Blooby puzzle
            &&  Rando_is_attainable(STR_STABDOWN) ) // Bloobys
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // -------------------  KEYS  -----------------------
    // --------------------------------------------
    case STR_KEY+"0101":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0102":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0103":{
    return true;
    break;}
    
    
    
    // --------------------------------------------
    case STR_KEY+"0201":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0202":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0203":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0204":{
    return true;
    break;}
    
    
    
    // --------------------------------------------
    case STR_KEY+"0301":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0302":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0303":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0304":{
    return true;
    break;}
    
    
    
    // --------------------------------------------
    case STR_KEY+"0401":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0402":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0403":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0404":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0405":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0406":{
    return true;
    break;}
    
    
    
    // --------------------------------------------
    case STR_KEY+"0501":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0502":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0503":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0504":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0505":{
    return true;
    break;}
    
    
    
    // --------------------------------------------
    case STR_KEY+"0601":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0602":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0603":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0604":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0605":{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_KEY+"0606":{
    return true;
    break;}
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------------ SPELL ROOMS ---------------------------
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Rauru],Area_TownA+'60')+STR_Spell:{ // Wiseman Rauru spell
    case Area_TownA+'60'+STR_Spell:{ // Wiseman Rauru spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Rauru+"A"], STR_Rauru)))
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Ruto],Area_TownA+'61')+STR_Spell:{ // Wiseman Ruto spell
    case Area_TownA+'61'+STR_Spell:{ // Wiseman Ruto spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Ruto+"A"], STR_Ruto)) 
    &&  Rando_is_attainable(STR_TROPHY) )
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Saria],Area_TownA+'62')+STR_Spell:{ // Wiseman Saria spell
    case Area_TownA+'62'+STR_Spell:{ // Wiseman Saria spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Saria+"A"], STR_Saria)) 
    &&  Rando_is_attainable(STR_MIRROR) )
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Mido],Area_TownA+'63')+STR_Spell:{ // Wiseman Mido spell
    case Area_TownA+'63'+STR_Spell:{ // Wiseman Mido spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Mido+"A"], STR_Mido)) 
    &&  Rando_is_attainable(STR_FLOWER) )
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Nabooru],Area_TownA+'65')+STR_Spell:{ // Wiseman Nabooru spell
    case Area_TownA+'65'+STR_Spell:{ // Wiseman Nabooru spell
    // Get to quest location.
    if (Rando_is_qual_location(STR_Nabooru) 
    &&  Rando_can_traverse_Nabooru_town() ) // in case Nabooru is Old Kasuto and don't have CROSS
    {   // Get into well and complete quest
        if (Rando_can_get_in_NabooruWell() 
        &&  Rando_is_attainable(STR_GLOVE) 
        &&  Rando_is_attainable(STR_STABDOWN)  // To get across well shaft
        &&  Rando_is_attainable(STR_JUMP) )    // To get across well shaft
        {   // Get to where ever Nabooru is.
            if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Nabooru+"A"], STR_Nabooru)))
            {
                return true;
            }
        }
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Darunia],Area_TownA+'66')+STR_Spell:{ // Wiseman Darunia spell
    case Area_TownA+'66'+STR_Spell:{ // Wiseman Darunia spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Darunia+"A"], STR_Darunia)) 
    &&  Rando_is_attainable(STR_CHILD) )
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_New_Kasuto],Area_TownA+'69')+STR_Spell:{ // Wiseman New Kasuto spell
    case Area_TownA+'69'+STR_Spell:{ // Wiseman New Kasuto spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"A"], STR_New_Kasuto)))
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Old_Kasuto],Area_TownA+'6B')+STR_Spell:{ // Wiseman Old Kasuto spell
    case Area_TownA+'6B'+STR_Spell:{ // Wiseman Old Kasuto spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Old_Kasuto+"A"], STR_Old_Kasuto)) 
    &&  Rando_is_attainable(STR_CROSS) ) // ** ENIGMA might be an alternative here since it works well against the invisible moa's. Also, enemy rando may rando out the moa's.
    {
        return true;
    }
    break;}
    
    // ------------------------------------------------------------
    //case val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Bulblin],Area_TownB+'60')+STR_Spell:{ // Wiseman Bulblin spell
    case Area_TownB+'60'+STR_Spell:{ // Wiseman Bulblin spell
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Bulblin+"A"], STR_Bulblin)) 
    &&  Rando_is_attainable(STR_MASK) )
    {
        return true;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // --------------------- TOWNS -------------------------
    // This checks if you can get to the town's vanilla location.
    // --------------------------------------------
    case STR_Rauru:{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_Ruto:{
    return true;
    break;}
    
    // --------------------------------------------
    case STR_Saria:{ // if can get to main town (north side of river)
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
        return true;
    }
    
    
    if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
    ||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
    {   // Fast travel Mido to Saria
        if (Rando_can_traverse_Mido_town()  // in case Mido is Old Kasuto and don't have CROSS
        &&  Rando_can_fast_travel_MidoToSaria() )
        {
            return true;
        }
        
        // Mido boulder
        if (Rando_is_attainable(STR_HAMMER))
        {
            return true;
        }
        
        // Backway through Death Mtn
        if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
        &&  Rando_can_traverse_DeathMtn() 
        &&  Rando_can_cross_SariaBridge() )
        {
            return true;
        }
    }
    break;}
    
    // --------------------------------------------
    case STR_Mido:{
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
    
    if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
    ||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
    {   // Whale Isl to Mido
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Nabooru:{
    if (Rando_can_reach_East())
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Darunia:{
    if (Rando_can_reach_DaruniaField())
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_New_Kasuto:{
    if (Rando_can_reach_East())
    {
        if (Rando_are_attainable(STR_BOOTS,STR_BRACELET))
        {
            if (Rando_is_attainable(STR_HAMMER))
            {
                return true;
            }
        }
        
        if (Rando_is_attainable(STR_FLUTE))
        {
            if (ItemLocations_DARKROOM_DIFFICULTY>=2 
            ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
            {
                if (Rando_is_attainable(STR_HAMMER))
                {
                    return true;
                }
            }
        }
    }
    break;}
    
    // --------------------------------------------
    case STR_Old_Kasuto:{
    if (Rando_can_reach_KasutoArea())
    {
        return true;
    }
    break;}
    
    // --------------------------------------------
    case STR_Bulblin:{
    if (Rando_can_reach_Dragmire())
    {   // Various caves
        if (ItemLocations_DARKROOM_DIFFICULTY>=2 
        ||  Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        {
            if (Rando_is_attainable(STR_JUMP)      // Caves to Bulblin area
            &&  Rando_is_attainable(STR_BRACELET) )// Statue in caves
            {
                return true;
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // *** cases STR_STABDOWN & STR_STABUP should only be 
    // called by Rando_sweep_skills() to avoid infinite loops.
    // -------------------------------------------------------
    case STR_STABDOWN:{
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Mido+"A"], STR_Mido)) 
    &&  Rando_is_attainable(STR_JUMP,STR_FAIRY) )
    {
        if (QUEST_NUM==1 
        ||  Rando_is_attainable(STR_GLOVE) )
        {
            return true;
        }
    }
    // Through GP fast travel
    if (Rando_is_qual_location(STR_Great_Palace))
    {
        return true; // 2024/10/04 - Changed leaving Great Palace puts player ON the palace so they don't need JUMP to get to the fast travel cave.
        /*
        var _dungeon_name1 = val(dm_save_data[?STR_Dungeon+STR_Rando+STR_Great_Palace+"B"], STR_Great_Palace);
        if (_dungeon_name1!=STR_Great_Palace 
        ||  Rando_is_attainable(STR_JUMP) ) // You need to get on roof of palace to get to its backside
        {
            return true;
        }
        */
    }
    //DungeonLocations_WILL_RANDOMIZE
    //dm_save_data[?STR_Dungeon+STR_Rando+_dungeon_name2+"A"] = _dungeon_name1; // _dungeon_name2+"A": Get overworld dungeon containing _dungeon_name2
    //dm_save_data[?STR_Dungeon+STR_Rando+_dungeon_name1+"B"] = _dungeon_name2; // _dungeon_name1+"B": Get dungeon inhabiting overworld dungeon _dungeon_name1
    break;}
    
    // -------------------------------------------------------
    case STR_STABUP:{
    if (Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+STR_Darunia+"A"], STR_Darunia)))
    {
        if (Rando_is_attainable(STR_JUMP) 
        ||  Rando_is_attainable(STR_STABDOWN) ) // ***2023/11/17: Darunia minigame does NOT need JUMP and offers a route to upthrust by getting to the top of the minigame and exiting onto the roof.
        {
            return true;
        }
    }
    break;}
}





return false;




