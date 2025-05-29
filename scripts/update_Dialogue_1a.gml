/// update_Dialogue_1a()



switch(g.dialogue_source.object_index)
{
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_0:{
    if (g.dialogue_source.ver==3) // Mirror
    {   // B5AE
        //f.dm_quests[? hex_str(rm_get_town_idx())] |= 1;
        break;//case NPC_0
    }
    
    
    if (g.dialogue_source.ver==4) // Foutain
    {   // B5AE
        //f.items |= ITM_WATR;
        //f.dm_quests[?STR_Quest+STR_Spell+STR_FIRE] = 1;
        //var _TOWN_NAME = val(g.dm_town_data[?STR_Town_name+hex_str(g.town_num-1)], STR_Rauru);
        //f.dm_quests[?STR_Quest+_TOWN_NAME+'01'] |= 1;
        break;//case NPC_0
    }
    
    
    if (f.items&ITM_BOOK 
    &&  g.dialogue_source.HylianText_read )
    {
            _FONT = val(dm_dialogue[?g.dialogue_source.dialogue_datakey+'A'+STR_Font], spr_Font1);
        if (_FONT==spr_Font_Hyrulian) dialogue_ver = 'B'; // Translated text
    }
    break;}//case NPC_0
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_4:{ // B57D. Healer, Saver
    if (g.gui_state==g.gui_state_DIALOGUE2) // in restore house
    {
        dialogue_ver = "B"; // In restore house dialogue.
    }
    else
    {   // B58C: JSR 9A50
        //scr_NPC_6a(g.dialogue_source);
        
        //if (ver==1  // v1: Heal Life
        //&& !irandom($1000) )
    }
    break;}//case NPC_4
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_5:{ // B560. Quest
    if (is_undefined(g.dialogue_source.dk_spawn))
    {
        break;//case NPC_5
    }
    
    if (quest_is_complete(val(g.dm_spawn[?g.dialogue_source.dk_spawn+STR_Quest+STR_ID], STR_undefined)))
    {
        if(!is_undefined(g.town_name))
        {
            f.dm_quests[?g.town_name+STR_Quest+STR_Complete] = true;
        }
        
        dialogue_ver = "B"; // alt dialogue
    }
    break;}//case NPC_5
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_6:{ // B4BF, B4D7. Skill Knight
    switch(g.dialogue_source.ver)
    {
        case 1:{
        if (f.skills&SKILL_THD) dialogue_ver = "B"; // already have skill dialogue
        f.skills |= SKILL_THD;
        break;}//case 1
        
        case 2:{
        if (f.skills&SKILL_THU) dialogue_ver = "B"; // already have skill dialogue
        f.skills |= SKILL_THU;
        break;}//case 2
    }//switch(g.dialogue_source.ver)
    break;}//case NPC_6
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_7:{ // B518. Spell Giver
    var _BIT = g.dialogue_source.give_spell;
    
    if (f.spells&_BIT)
    {
        if (_BIT!=SPL_SUMM) dialogue_ver = "D"; // Which boulder to break
        else                dialogue_ver = "B"; // already have spell dialogue
    }
    else if (g.mod_AcquireSpellRequirement==1   // 1: no requirement for spell
         ||  get_stat_max(STR_Magic)>=get_spell_cost(_BIT) ) // if can afford casting cost
    {
        dialogue_ver = "A"; // acquire spell dialogue
        f.spells |= _BIT; // Include this spell bit in acquired spells property.
        
        // TODO: if you're going to have the HUD show g.spell_selected, 
        // this may cause it to show before the menu opens.
        // if this is the first spell player has acquired
        if!(f.spells & ~_BIT) g.spell_selected = _BIT;
    }
    else
    {
        dialogue_ver = "C"; // come back when ready
    }
    
    if (g.mod_PC_CUCCO_1 
    &&  g.mod_WISEMEN_CAST_SPELL )
    {
        if (g.dialogue_source.use_cucco_dlg==2)
        {   // Special "whoops" dialogue for turning PC into a cucco.
            dialogue_ver = "E";
            break;//case NPC_7
        }
        
        
        if (_BIT==SPL_FARY)
        {
            if (g.dialogue_source.ver==2)
            {   dialogue_ver  = "A";  }
            
            if (dialogue_ver == "A")
            {   // Only when acquiring the spell.
                // Special dialogue will activate after closing pause menu.
                g.dialogue_source.use_cucco_dlg = 1;
            }
        }
    }
    break;}//case NPC_7
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_8:{ // RESCUE FAIRY's friend
    if (f.items&ITM_FRY1) dialogue_ver = "B";
    break;}//case NPC_8
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_9:{
    switch(g.dialogue_source.ver)
    {   // --------------------------------------------
        case $2:{ // B4A3, B4A7. Riverman
        if (f.items&ITM_NOTE)
        {
            var _SCENE = val(g.dm_rm[?STR_Saria+STR_Bridge+STR_Scene], Area_TownA+'06');
            f.dm_quests[?f.BuildBridge_QUAL_DK+_SCENE] = true;
            
            dialogue_ver = "B"; // alt dialogue
        }
        break;}//case $2
        
        
        // --------------------------------------------
        case $4:{ // B5B9. Nabooru Ache
        if (g.dialogue_source.talked_to_count>=4) dialogue_ver = "B"; // alt dialogue
        break;}//case $4
        
        
        // --------------------------------------------
        case $5:{ // B5B9. Saria Bot
        if (g.dialogue_source.talked_to_count>=4) dialogue_ver = "B"; // alt dialogue
        break;}//case $5
        
        
        // --------------------------------------------
        case $6:{ // B4EE. Error
        if (val(f.dm_quests[?STR_ErrorFriend])) dialogue_ver = "B"; // alt dialogue
        break;}//case $6
        
        
        // --------------------------------------------
        case $7:{ // B4EE. Error's friend
        f.dm_quests[?STR_ErrorFriend] = true;
        break;}//case $7
        
        
        // --------------------------------------------
        case $8:{ // Scroblin
        if (val(f.dm_quests[?Scroblin_DATAKEY1])) dialogue_ver = "B"; // alt dialogue
        break;}//case $8
        
        
        // --------------------------------------------
        case $A:{ // Malo. BOOK sequence-1. Nabooru Bay
        f.dm_quests[?STR_Malo+STR_State] = 1;
        break;}//case $A
        
        
        // --------------------------------------------
        case $B:{ // Anju. BOOK sequence-2. Rauru
        if (val(f.dm_quests[?STR_Malo+STR_State])) // If have spoken to Malo
        {
            if(!val(f.dm_quests[?STR_Talo+STR_State]))
            {       f.dm_quests[?STR_Talo+STR_State] = 1;  } // 1: "Take this item", 2: "Nothing left to give"
            
            dialogue_ver = "B"; // alt dialogue
        }
        break;}//case $B
        
        
        // --------------------------------------------
        case $C:{ // Talo. BOOK sequence-3. Whale Isl.
        if(!is_undefined( g.dialogue_source.Item_ITEM_ID) 
        &&  item_acquired(g.dialogue_source.Item_ITEM_ID) )
        {          f.dm_quests[?STR_Talo+STR_State] = 2;  } // 1: Give item, 2: "Nothing left to give"
        
        switch(val(f.dm_quests[?STR_Talo+STR_State])){
        default:{dialogue_ver="A"; break;} // "Weather is nice today"
        case  1:{dialogue_ver="B"; break;} // "Take this item"
        case  2:{dialogue_ver="C"; break;} // "Nothing left to give"
        }
        break;}//case $C
        
        
        // --------------------------------------------
        case $E:{ // Boulder Circle "talk to the wisemen" hint
        //f.dm_quests[?STR_Boulder+STR_Circle+STR_Hint] = 1;
        break;}//case $E
        
        
        // --------------------------------------------
        case $F:{ // B5B9. Bulblin Ache
        if (g.dialogue_source.talked_to_count>=4)
        {
                dialogue_ver = "B"; // "ZZZZZZ..."
            if (g.dialogue_source.talked_to_count>=7)
            {
                dialogue_ver = "C";
                var                  _DATAKEY = STR_Scroblin+STR_Open+STR_Path;
                if(!val(f.dm_quests[?_DATAKEY]))
                {       f.dm_quests[?_DATAKEY] = true;  } // Path to Ganon tower
            }
        }
        break;}//case $F
    }//switch(g.dialogue_source.ver)
    break;}//case NPC_9
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_B:{ // Minigame
    dialogue_ver = g.dialogue_source.dialogue_ver;
    break;}//case NPC_B
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_D:{ // Shop Owner
    dialogue_ver = g.dialogue_source.dialogue_ver;
    
    if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) 
    &&  dialogue_ver=="C" )
    {
        dialogue_ver ="G"; // G: "I HAVE NOTHING LEFT TO OFFER YOU."
    }
    break;}//case NPC_D
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case Zelda:{
    switch(g.dialogue_source.ver)
    {
        case 1:{
        dialogue_ver = 'A';
        break;}
        
        case 2:{ // 2nd Quest, North Castle
        dialogue_ver = g.dialogue_source.dialogue_ver; // "01": GOOD LUCK/HINT, "02": TAKE THIS BOTTLE
        break;}
    }
    // var _DK0Z00 = '0Z_00_'; // 
    break;}//case Zelda
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case NPC_C:{ // Spell Sequence
    var _FONT = val(dm_dialogue[?g.dialogue_source.dialogue_datakey+'A'+STR_Font], spr_Font1);
    if ((f.items&ITM_BOOK && g.dialogue_source.HylianText_read) 
    ||  _FONT==spr_Font1 )
    {    dialogue_ver='B';  } // Translated text
    else dialogue_ver='A';    // Hylian text
    break;}//case NPC_C
}//switch(g.dialogue_source.object_index)




