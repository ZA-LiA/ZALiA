/// init_save_data1()


var _i, _count;
var _datakey;

with(f)
{
    dm_quests[?STR_Quest+STR_Started]           = 0; // Set at 1st rm's g_Room_Start()
    dm_quests[?STR_Quest+STR_Puzzles+STR_Set]   = 0;
    dm_quests[?STR_Boulder+STR_Circle+STR_Complete] = 0;
    
    
    dm_quests[?STR_ErrorFriend]                 = 0; // boolean: If spoken to Error's friend (Mido)
    dm_quests[?dk_MidoChurch+STR_Open]          = 0;
    dm_quests[?STR_Scroblin+STR_Open+STR_Path]  = 0; // 
    dm_quests[?Zelda_DATAKEY1]                  = 0;
    
    dm_quests[?STR_Talo+STR_State]  = 0;
    dm_quests[?STR_Malo+STR_State]  = 0;
    
    
    // 'obj_name(Challenge_Obj)+"01"' is Challenge_Obj.challenge_id
    dm_challenges[?object_get_name(Challenge_BlockConfiguration)+"01"+STR_Complete] = 0;
    dm_challenges[?object_get_name(Challenge_SwitchA)           +"01"+STR_Complete] = 0;
    dm_challenges[?object_get_name(Challenge_SwitchB)           +"01"+STR_Complete] = 0;
    
    
    if(!is_undefined(g.TriforceBarrier1_RM_NAME))
    {   dm_quests[?  g.TriforceBarrier1_RM_NAME+STR_Barrier+STR_State] = 0;  } // Barrier reset
    
    if(!is_undefined(g.CrystalBarrier1_RM_NAME))
    {   dm_quests[?  g.CrystalBarrier1_RM_NAME +STR_Barrier+STR_State] = 0;  } // Barrier reset
    
    
    
    
    for(_i=val(g.dm_spawn[?STR_Merchant+STR_Count]); _i>=1; _i--)
    {
                   _datakey=STR_Merchant+hex_str(_i);
        dm_quests[?_datakey+"01"+STR_Paid] = 0;
        dm_quests[?_datakey+"02"+STR_Paid] = 0;
        dm_quests[?_datakey+"03"+STR_Paid] = 0;
    }
}




