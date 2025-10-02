/// Ache_update()


if (stun_timer)
{   // DBC8, DE40
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ----------------------------------------------------------------------------------
// DB53. ver 2: Acheman (OG eID $0A)
if (ver==2 
&&  acheManTimer )
{
        acheManTimer--;
    if (acheManTimer == ACHEMAN_DUR>>1  // if (acheManTimer == $18)
    &&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
    {
        GOC1_create(xl, yt + 2, facing_dir, projectile,projectile_ver);
    }
    
    // DB73
    facing_dir = dir_to_pc(id);
}
else
{   // --------------------------------------------------------------------
    // if idle.    DB8B
    if(!behavior) 
    {
        facing_dir = dir_to_pc(id);
        
        // Map Page (rm section)
        var _page_COUNT = cam_x_range()>>8;
        var _page_IDX   = (xl>>8) - (cam_xl_min()>>8);
        
        var _IN_DIST = byte(goDist1()+attack_dist) < byte(attack_dist<<1);
        
        // if more than 2 sections, use OG rules
        var _C1 = _page_COUNT > 2;
        
        // Must be in atk dist
        var _C2 = !_C1 || !isVal(_page_IDX, 0, _page_COUNT-1);
        
        // For less than 3 rm sections and less than $80 from rm edge
        var                            _C3 = 0;
        if (abs(x-cam_xl_min()) < $80) _C3 = 1; // move right
        if (abs(x-cam_xr_max()) < $80) _C3 = 2; // move left
        
        // Dir torwards pc, 1(right) or 2(left)
        var _C4 = dir8b(g.pc.x-x);
        
        
        
        // Each scenario. Only one can be positive.
        // --------------------------------------------------------------------
        // Atk regardless of dist && rm has more than 2 sections
        var _A1 = !_C2 &&  _C1;
        // Atk if in dist && (rm has more than 2 sections || is more than $80 away from rm edge)
        var _A2 =  _C2 && _IN_DIST && (_C1 || !_C3);
        // Atk if in dist && rm has less than 3 sections && less than $80 from rm edge && pc is on side of GOB w/ more rm space
        var _A3 =  _C2 && _IN_DIST && !_C1 && _C3==_C4;
        
        // Set atk dir. Only one will NOT be 0
        _A1 *= 1 +  (_page_IDX!=0);
        _A2 *= 1 + !(rand()&$1);
        _A3 *= _C3;
        
        // 1 or 2. atk dir
        var _ATK_DIR = _A1 | _A2 | _A3; // *** this needs to use |, not ||
        if (_ATK_DIR) // if idle && qualify to atk
        {
            if (is_hostile 
            || !(g.counter0&$7F) )
            {
                hspd = (8*bit_dir(_ATK_DIR)) &$FF;
                if (is_hostile) vspd = $40;
                else            vspd = $20;
                behavior = 1; // ATTACK!!!
            }
        }
    }
    
    
    
    if (behavior) // if attacking
    {   // DBA8
        updateX();
        
            vspd = (vspd-1)&$FF;
        if(!vspd) acheManTimer = ACHEMAN_DUR;
        
        updateY();
        
        if (yt < IDLE_Y)
        {
            set_xlyt(id, xl, IDLE_Y);
            vspd     = 0;
            behavior = 0; // set to idle
        }
    }
}



// DBC8
GOB_update_2();
if (cs&CS_BD1 
&&  is_hostile )
{
    enemy_collide_pc_body();
}




