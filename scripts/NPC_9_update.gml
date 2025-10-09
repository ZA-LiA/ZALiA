/// NPC_9_update()

// NPC_9: Riverman, Bagu, Error & friend, Bot, Ache, 


// ----------------------------------------------------------------------------------
if (is_ver(id,NPC_9,$5)) // Bot NPC
{   // 9783
    is_idle = sign(g.counter1&$80);
}
else
{
    if ( is_ver(id,NPC_9,$1)  // Bagu
    ||  (is_ver(id,NPC_9,$C) && val(f.dm_quests[?STR_Talo+STR_State])==1) ) // Talo
    {
        NPC_update_3(global.pc.x,global.pc.y); // Spawn item
    }
}


// ----------------------------------------------------------------------------------
NPC_1_update();




