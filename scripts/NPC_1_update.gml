/// NPC_1_update()

// NPC_1: (Idle Simple)
// NPC_9: Riverman, Bagu, Error & friend, Bot, Ache, 
// NPC_A: TriforceKeeper


// ----------------------------------------------------------------------------------
// 9793: JSR 9A9B
if (NPC_update_1())
{   // if talking
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ----------------------------------------------------------------------------------
// 9796: JSR 9A8D: JSR EF11
update_EF11();

// 9799
if!(g.counter1&$3F) facing_dir = dir_to_pc(id);

counter = 0; // Just in case. Necessary for dlg

// 97A6: JMP 99B9
NPC_update_2(); // collision, enter restore house, start dlg




