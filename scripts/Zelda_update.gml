/// Zelda_update()


if (ver==2) // 2nd Quest Zelda
{
    if(!val(f.dm_quests[?Zelda_DATAKEY1]) 
    && !is_undefined( Item_ITEM_ID) 
    &&  item_acquired(Item_ITEM_ID) )
    {
        f.dm_quests[?Zelda_DATAKEY1] = 1;
    }
    /*
    if (is_talking 
    && !g.gui_state )
    {   f.dm_quests[?Zelda_DATAKEY1] = 1;  }
    */
    if(!val(f.dm_quests[?Zelda_DATAKEY1]))
    {   // I'm having trouble setting a custom pos for pc so this is an attempt to resolve it.
        set_xy(g.pc, g.rm_w_-abs(x-g.rm_w_),y);
    }
    
    if (val(f.dm_quests[?Zelda_DATAKEY1]))
    {    dialogue_ver = "01";  } // 01: GOOD-LUCK/HINT
    else dialogue_ver = "02";    // 02: BOTTLE INSTRUCTIONS
    
    // update give item
    NPC_update_3(g.pc.x,g.pc.y); // Spawn item
    
    
    // ----------------------------------------------------------------------------------
    // 9793: JSR 9A9B
    if (NPC_update_1())
    {   // if talking
        Zelda_update_talk_sound();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    // ----------------------------------------------------------------------------------
    // 9796: JSR 9A8D: JSR EF11
    update_EF11();
    
    if!(g.counter1&$3F) facing_dir = dir_to_pc_(id);
    counter = 0; // Just in case. Necessary for dlg
    
    NPC_update_2(); // collision, enter restore house, start dlg
}
else
{
    update_EF11();
}





switch(sub_state)
{
    // --------------------------------------------------------------------
    case SUB_STATE_IDLE:{
    
    break;}
    
    
    
    
    // --------------------------------------------------------------------
    case SUB_STATE_SLEP:{
    // Bounce off sleeping Zelda w/ downthrust
    update_body_hb_1a();
    if (state==state_NORMAL 
    &&  g.pc.SwordHB_collidable 
    &&  g.pc.attack_bits&BIT_ATK3  // BIT_ATK3: downthrust
    &&  collide_pc_sword(BodyHB_x,BodyHB_y, BodyHB_w,BodyHB_h) 
    && !(cs &   CS_SW1) )
    {
         cs |=  CS_SW1;
        PC_set_bounce();
    }
    else cs &= ~CS_SW1;
    break;}
    
    
    
    
    // --------------------------------------------------------------------
    case SUB_STATE_WAKE:{
    break;}
    
    
    
    
    // --------------------------------------------------------------------
    case SUB_STATE_TALK1:{
    break;}
    
    
    
    
    // --------------------------------------------------------------------
    case SUB_STATE_TALK2:{
    break;}
    
    
    
    
    // --------------------------------------------------------------------
    case SUB_STATE_KISS:{
    break;}
}




