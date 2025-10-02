/// Moblin_update()


//  Moblin v1 orange $14
//  Moblin v2 red    $15
//  Moblin v3 blue   $16

if (ver==1) attack_dist = ATCK_DIST1; // $60
else        attack_dist = ATCK_DIST2; // $16


if (behavior==BVR_ATKL 
||  behavior==BVR_ATKH )
{   // 997A
    update_EF11(); // updates swrd spr offs
    
    // 997D: JSR E558, E563: JSR E5F3
    if(!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
    {   // E579: JSR E5F3
        GOB_sword_collision_1a(); // handles BODY collision check & reaction
    }
}


// 9972
if (behavior  // if attacking
&& !timer )
{   // 99C9
         if (behavior==BVR_DRWH) behavior = BVR_ATKH;
    else if (behavior==BVR_DRWL) behavior = BVR_ATKL;
    else                         behavior = 0;
    
    
    if (behavior==BVR_ATKH  // 4
    &&  (ver==1 || ver==3)  // v1 orange, v3 blue
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        if (inRange(x, g.view_xl_og,g.view_xr_og) 
        ||  abs(x-g.pc.x) < attack_dist )
        {
            var _XL = xl + (ver==3);
            var _YT = yt + 5;
            
            with(GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver, id, palidx_def))
            {
                hspd =($28*facing_dir) &$FF;
                vspd = $E8;
            }
        }
    }
    
    // 99E6
    if (behavior) timer = DUR_ATK_STAB; // $10: 0.267s
}




// 99F2
//if (ver==1) attack_dist = ATCK_DIST1; // $60
//else        attack_dist = ATCK_DIST2; // $16




// 9A29
GO_update_cs();

GOB_update_2();

Enemy_update_1();











/*
//  Moblin v1 orange $14
//  Moblin v2 red    $15
//  Moblin v3 blue   $16


if (behavior)
{
    if !(behavior & 1) // behavior is even
    {
        // 997A
        update_EF11();
        
        // 997D: JSR E558, E563: JSR E5F3
        if (!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
        {
            // E579: JSR E5F3
            GOB_sword_collision_1a(); // handles BODY collision check & reaction
        }
    }
}



// 9972
// update_9972();
// 9980
if (behavior && !timer)
{
    // 99C9
    behavior++;
    if (behavior == 3 || behavior >= 5)
    {
        // 99EE
        behavior = 0;
    }
    else
    {
        if (behavior == BVR_ATK2    // 4
        &&  ver != 2 )              // v1 orange, v3 blue
        {
            // 97F2
            if (avail_uidx_goc(MAX_GOC) != UIDX_NULL)
            {
                var _X = xx + (ver == 3);
                var _Y = yy + 5;
                
                with Projectile_create(_X, _Y, facing_dir, Spear,1, id, palIndex)
                {
                    hspd = byte($28 * facing_dir);
                    vspd = $E8;
                }
            }
            
            // 99E2
            behavior = 5;
        }
        
        // 99E6
        timer = DUR_ATK_STAB; // $10: 0.267s
    }
}

// 99F2
if (ver == 1) attackDist = $60;
else          attackDist = $16;


// 9A29
GOB_update_cs();

GOB_update_2();

update_9A2C();
*/




