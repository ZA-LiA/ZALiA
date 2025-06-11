/// NPC_D_update()


hspd = 0;
NPC_update_1();

if(!is_talking)
{
    Merchant_update_1(); // update_EF11(), set facingDir, counter = 0;
    if (sub_state==SUB_STATE_IDLE1 
    ||  sub_state==SUB_STATE_IDLE2 )
    {
        NPC_update_2(); // collision, enter restore house, start dlg
    }
}


switch(sub_state)
{
    // ------------------------------------------------------------
    // ----------------------------------------------------
    case SUB_STATE_IDLE1:{
    if (timer) break;
    
    
    if (is_talking 
    &&  g.dialogue_source==id )
    {
        var _DECLINED_COUNT = val(f.dm_quests[?OfferDeclined_DATAKEY+STR_Count]);
        
        if (Bargaining_ENABLED && _DECLINED_COUNT>=$08)
        {
            dialogue_ver = "E";
            Product1_cost = Product1_COST2;
        }
        else if (Bargaining_ENABLED && _DECLINED_COUNT>=$10)
        {
            dialogue_ver = "F";
            Product1_cost = Product1_COST3;
        }
        else if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]))
        {
            dialogue_ver = "D";
            Product1_cost = Product1_COST;
        }
        else
        {
            dialogue_ver = "A";
            Product1_cost = Product1_COST;
        }
        
        
        
        if(!val(f.dm_quests[?Paid_DATAKEY])) // if have NOT paid
        {
            var _dk = dialogue_datakey+dialogue_ver;
            
            // This removes the product cost in front of "-P" (resets to default text)
            var _dialogue = g.DIALOGUE_WINDOW.dm_dialogue[?_dk+dialogue_ver]; // default
            if(!is_undefined(_dialogue)) g.DIALOGUE_WINDOW.dm_dialogue[?_dk] = _dialogue;
            
            // Add the product cost in front of "-P"
            _dialogue = g.DIALOGUE_WINDOW.dm_dialogue[?_dk];
            if(!is_undefined(_dialogue))
            {   // Add in the cost to the dialogue
                var _POS = string_pos("-P",_dialogue);
                if (_POS)
                {
                    //_dialogue = string_delete(_dialogue,_POS,1); // remove "-" char
                    _dialogue = string_insert(string(Product1_cost), _dialogue, _POS);
                    g.DIALOGUE_WINDOW.dm_dialogue[?_dk] = _dialogue;
                }
            }
            
            
            g.gui_state = g.gui_state_DIALOGUE3;
            timer     = 0;
            sub_state = SUB_STATE_OFFER;
        }
        else
        {
            timer     = 0;
            sub_state = SUB_STATE_IDLE2;
        }
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    // ----------------------------------------------------
    case SUB_STATE_OFFER:{ // Player is offered product with "YES" or "NO" options.
    if (timer) break;
    if (g.gui_state!=g.gui_state_NONE) break;
    // A choice has been made.
    
    
    // Removes cost from dialogue
    //if(!is_undefined(DIALOGUE_BASE)) g.DIALOGUE_WINDOW.dm_dialogue[?DLG_KEY_A] = DIALOGUE_BASE;
    
    
    if (g.DIALOGUE_WINDOW.cursor_option == Input.L)
    {   // "YES". Player accepted offer
        if (f.xp >= Product1_cost)
        {
            f.xpDrain += Product1_cost;
            g.pc_lock  = PC_LOCK_ALL;
            f.dm_quests[?Paid_DATAKEY] = 1;
            with(LoDoA) counter = -1; // -1: Starts opening process
            
            timer     = 0;
            sub_state = SUB_STATE_UNLOCK;
        }
        else
        {   // Not enough money.
            NPC_activate_dialogue();
            dialogue_ver = "B";
            
            timer     = 0;
            sub_state = SUB_STATE_LOWP;
        }
    }
    else
    {   // "NO". Player declined offer.
        f.dm_quests[?OfferDeclined_DATAKEY+STR_Count] = val(f.dm_quests[?OfferDeclined_DATAKEY+STR_Count])+1;
        
        g.pc_lock = 0;
        timer     = 0;
        sub_state = SUB_STATE_IDLE1;
    }
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    // ----------------------------------------------------
    case SUB_STATE_LOWP:{
    if (timer) break;
    
    dialogue_ver = "B";
    if (g.gui_state!=g.gui_state_NONE) break;
    
    g.pc_lock = 0;
    
    timer     = 0;
    sub_state = SUB_STATE_IDLE1;
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    // ----------------------------------------------------
    case SUB_STATE_UNLOCK:{
    if (timer) break;
    if (instance_exists(LoDoA)) break;
    
    
    g.pc_lock = 0;
    
    timer     = 0;
    sub_state = SUB_STATE_IDLE2;
    break;}
    
    
    
    
    
    // ------------------------------------------------------------
    // ----------------------------------------------------
    case SUB_STATE_IDLE2:{
    if (timer) break;
    
    dialogue_ver = "C"; // C: "I HAVE NOTHING ELSE TO OFFER YOU."
    //g.pc_lock = 0;
    break;}
}




