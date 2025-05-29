/// quest_is_complete(quest id)


switch(argument0)
{
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Rauru_Spell:
    {
        return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Ruto_Spell:
    {
        if (f.items&ITM_TRPH) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Saria_Spell:
    {
        if (f.items&ITM_MIRR) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Mido_Spell:
    {
        if (f.items&ITM_MEDI) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Nabooru_Spell:
    {
        var _TOWN_NAME = val(g.dm_town[?STR_Town+STR_Name+hex_str(argument0)], STR_Nabooru);
        return val(f.dm_quests[?_TOWN_NAME+STR_Quest+STR_Complete]);
        //if (f.items & ITM_WATR) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Darunia_Spell:
    {
        if (f.items&ITM_CHLD) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_NewKasuto_Spell:
    {
        return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_OldKasuto_Spell:
    {
        return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Bulblin_Spell:
    {
        return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_Saria_Bridge:
    {
        if (f.items&ITM_NOTE) return true;
        break;
    }
    
    
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    case QuestID_NewKasuto_Container:
    {
        switch(g.mod_QuestNewKasuto){
        case 0:{return cont_cnt_mp()>=f.CONT_MAX_MP-1; break;} // OG
        case 1:{return true; break;}
        }
        
        break;
    }
}



return false;




