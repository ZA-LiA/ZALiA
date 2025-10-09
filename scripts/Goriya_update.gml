/// Goriya_update()


attack_dist = ATK_DIST; // $60

// 9972
if (behavior  // 1,3. if attacking
&& !timer )   // Attack delay finished
{   // 998B
    if (avail_uidx_goc(MAX_GOC1)!=UIDX_NULL)
    {
        if (inRange(x, g.view_xl_og,g.view_xr_og) 
        ||  abs(x-global.pc.x) < attack_dist )
        {
            var _YT = yt + ($11*(behavior==BVR_ATK1)); // 1 attack low
            
            var _P = GOC1_create(xl,_YT, facing_dir, projectile,projectile_ver, id);
            
            if (behavior==BVR_ATK2) _P.vspd = $F0; // attack high
            else                    _P.vspd = rand()&$10;
            
            _P.facing_dir_spawn = facing_dir;
            _P.isHighAttack     = behavior==BVR_ATK2;
        }
    }
    
    
    behavior = BVR_IDLE; // 0 attack NONE
}

// 99F2
//attack_dist = ATK_DIST; // $60

GO_update_cs();
GOB_update_2();

Enemy_update_1();




