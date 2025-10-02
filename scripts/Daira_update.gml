/// Daira_update()


// Daira ver1(Orange)
// Daira ver2(Red)


// ------------------------------------------------------------------------
if (ver==2) attack_dist = $37; // Daira red
else        attack_dist = $1E; // Daira orange

// 9A15
if (behavior 
&& !timer )
{
    behavior++;
    
    // 9AE5
    if (behavior==2)
    {
        update_EF11();
        
        // 9AEC: JSR E558,   E563: JSR E5F3
        var _C1 = !(g.spells_active&SPL_RFLC) && !(f.items&ITM_SHLD);
        if (_C1 
        || !GOB_sword_collision_2a() ) // handles PC SHIELD collision check & reaction
        {   // E579: JSR E5F3
            GOB_sword_collision_1a(); // handles PC BODY collision check & reaction
        }
        
        
        // 9AEF, DBCE
        if (ver==2    // Daira red
        &&  ocsH3(id) // All width must be in ocs area
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            if (inRange(x, g.view_xl_og,g.view_xr_og) 
            ||  abs(x-g.pc.x) < attack_dist )
            {
                GOC1_create(xl,yt, facing_dir, projectile,projectile_ver);
            }
        }
    }
    
    
    
    if (behavior >= 3+(ver==1)) // 3: Daira red, 4: Daira orange
    {
        behavior  = 0;
    }
    else
    {   // 9AFF
        timer = 5;
    }
}



// ------------------------------------------------------------------------
// 9A18
GO_update_cs();
GOB_update_2();

// 9A2C
Enemy_update_1();




