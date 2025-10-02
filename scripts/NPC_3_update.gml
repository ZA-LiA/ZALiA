/// NPC_3_update()

// NPC_2 Traffic
// NPC_3 Special Walker


// 9878: JSR 9A9B
if (NPC_update_1()) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// --------------------------------------------------------------------
facing_dir = hspd_dir_spawn; // MOD. Maintains spawned dir

// 987B: JSR 99B9
NPC_update_2(); // collision, enter restore house, start dlg

// 99B3: JSR 9A8A
if(!is_undefined(       dk_spawn) 
&&  string_pos(STR_PRIO,dk_spawn) )
{
    if (abs(x-g.rm_w_) >= g.rm_w_+$20) state = 0;
}
else
{
    if (in_despawn_dist(id)) state = 0;
}

// 9A8D: JSR EF11
update_EF11();

// 9A68: JSR DEB8
updateX();




