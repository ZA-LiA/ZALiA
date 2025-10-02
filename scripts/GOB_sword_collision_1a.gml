/// GOB_sword_collision_1a()


// E579: JSR E5F3
GOB_update_sword_offsets();
GOB_update_sword_hb_1a();
SwordHB_can_draw = SwordHB_collidable;

// ---------------------------------------------------------------------
if (SwordHB_collidable 
&&  collide_pc_body(SwordHB_x,SwordHB_y,SwordHB_w,SwordHB_h) )
{   // ---------------------------------------------------------------------
    // E582: JSR E2EF
    var _invulnerable_timer = g.pc.iframes_timer;
    
    enemy_collide_pc_body(); // damage pc
    
    
    // ---------------------------------------------------------------------
    // E587 ------- BOSS SWORD HIT ------------------------------
    if (is_ancestor(object_index,Boss) 
    && !_invulnerable_timer )
    {
        if(!g.DevTools_state 
        ||  g.dev_invState&$3!=$2 )
        {   // Boss sword make PC-dmg-hop higher & further
            g.pc.vspd = (g.pc.vspd<<1) &$FF;
            facing_dir = dir_to_pc(id);
            g.pc.hspd = ($18*facing_dir) &$FF;
        }
    }
}




