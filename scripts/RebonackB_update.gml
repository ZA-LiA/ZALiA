/// RebonackB_update()


// B23F
if (pending_death)
{   // B22C
    Boss_update_end();
    
    if (state==state_EXPLODE)
    {
        with(Rebonack01A)
        {
            if (state) state = state_NORMAL;
        }
    }
    
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// -------------------------------------------------------------------
if (g.view_lock_boss) Boss_HPBar_udp();

// B250: JSR EF11
update_EF11();


BodyHB_idx  = BodyHB_IDX;
//shld_hb_idx = SHLD_HB_IDX;
react_sword = REACT_SWORD;
react_proj  = REACT_PROJ;
IronKnuckle_update_ShieldHB_idx();

// B253: JSR E617
if (GOB_shield_collision_1a())
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// In case spawn happens outside of boss arena
var _PAD = 2;
if(!wINwAll(xl+_PAD,ww-(_PAD<<1), arena_xl,arena_w))
{
    var _X  =(arena_w>>1) - (ww_-_PAD);
        _X *= sign_(x>arena_x);
        _X  = arena_x + _X;
    set_xy(id, _X,y);
}





// B256 --------------------------------------------------------------
attack_tokens = g.counter1&$40;
//if!(g.timer0&$7F) sdm("BODY_HB_IDX $"+hex_str(BODY_HB_IDX)+", body_hb_idx $"+hex_str(body_hb_idx));
// B25D: JSR 9C8C
IronKnuckle_update();

// B263: JMP B1E9
if(!ocs) GOB_update_2();




can_draw_self = true;


// B1F6
Boss_update_5(); // check for and set pending death









/*
// var _pc_sword_collide_shield = false;

// B23F
if (ed3 < $80)
{
    if (g.camLocked) Boss_HPBar_udp(6);
    
    // B250: JSR EF11
    update_EF11();
    
    // B253: JSR E617
    GOB_update_shield_offsets();
    update_shield_hb();
    
    // _pc_sword_collide_shield = GOB_shield_collision_1a(shldX1, shldY1, shldW, shldH);
    // if (!_pc_sword_collide_shield)
    GOB_shield_collision_1a(shldX1, shldY1, shldW, shldH);
    if (!pc_sword_collided_solid_body)
    {
        // B256
        atk_frenzy = g.timer0 & $40;
        
        // B25D: JSR 9C8C
        update_IronKnuckle();
    }
}
else
{
    // hspd = 0;
}


if (!pc_sword_collided_solid_body)
// if (!_pc_sword_collide_shield)
{
    // B260: JSR B20D
    if (!g.camLocked || ed3 & $80)
    {
        Boss_update_4a(); // start or end battle
    }
    else
    {
        // B263: JMP B1E9
        Boss_update_5a(); // DE40, check for and set pending death
    }
}

*/




