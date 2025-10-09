/// Geru_update()

// ver 1. Geru orange,  weapon: Lance
// ver 2. Geru red,     weapon: Club
// ver 3. Geru blue     weapon: Mace1 (Projectile)


if (ver==3) attack_dist = $40; // $1C Geru blue
else        attack_dist = $18; // Geru red & orange


var _RAND = rand();



// 9B56, 9B90
update_EF11();



if (behavior) // if attacking
{   // 9B59. ---------------------   ATTACKING   -----------------------------------
    if (ver==1) 
    {   // ------------------------ Geru (orange) ---------------------------
        if (behavior==2 
        ||  behavior==5 )
        {   // 9B65: JSR E563, E563: JSR E5F3
            if(!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
            {   // E579: JSR E5F3
                GOB_sword_collision_1a(); // handles BODY collision check & reaction
            }
        }
        
        // 9B68
        if(!timer)
        {
            behavior++;
            
            if (behavior==4 
            ||  behavior>=7 )
            {
                behavior = 0;
            }
            else
            {
                timer = $C;
            }
        }
    }
    // 9B93
    else if(!timer)
    {   // ------------------------- Geru (red & blue) -----------------------------
        behavior++;
        
        if (behavior==4)
        {   // 9D08
            behavior = 0;
        }
        else if (behavior==2)
        {   // 9CD3
            update_EF11();
            
            // 9CD6: JSR E558
            if((!(g.spells_active&SPL_RFLC) && !(f.items&ITM_SHLD)) 
            || !GOB_sword_collision_2a() ) // handles shield collision check & reaction
            {   // E579: JSR E5F3
                GOB_sword_collision_1a();  // handles body   collision check & reaction
            }
            
            
            // 9CD9
            if (ver==3 // Geru blue
            &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
            {
                if (inRange(x, g.view_xl_og,g.view_xr_og) 
                ||  abs(x-global.pc.x) < attack_dist )
                {
                    var            _XL  = xl;
                    if (facing_dir) _XL += $10;
                    else           _XL +=  -8;
                    GOC1_create(   _XL,yt, facing_dir, projectile,projectile_ver, id, palidx_def);
                }
                
                behavior = 0;
            }
        }
        
        // 9D02
        if (behavior) timer = 5;
    }
}







// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9BA2.  shld_hb_idx: 1 LOW, 2 HIGH
if (Input.Attack_pressed 
&&  _RAND&$3 )
{
    ShieldHB_idx = ShieldHB_IDX_LOW + !Input.dHeld; // Input.dHeld = 1 if down held, 0 if not
}

if (GOB_shield_collision_1a()) // if PC sword collided enemy shield
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9BB7.   PC sword did NOT collide GOB shield -----------------
GO_update_cs();
GO_update_cam_vars();

// 9D83
if (yt >= cam_yb_max()+$18) // Same as OG
{
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
GOB_update_2a(); // DE54 & DE63 collision

if (pc_sword_collided_solid_body)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

if (cs&CS_BD1) enemy_collide_pc_body();



// 9BE9.  update vertical -----------
updateY();


if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}


// 9BF5.  update horizontal --------
var _hspdPB_COPY = hspd_pushback;
GOB_update_1(true); // update hspd_pushback

if!(cs&$3) updateX();

if (_hspdPB_COPY)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9BF8
facing_dir = dir_to_pc(id);


// 9B96
var _IN_DIST_ATCK = abs(x-global.pc.x) < attack_dist;
var _IN_DIST_AGRO = abs(x-global.pc.x) < $50;
//var _IN_DIST_ATCK = byte(goDist1() + attack_dist) < byte(attack_dist<<1);
//var _IN_DIST_AGRO = byte(goDist1() + $50)        < $A0;



if (_IN_DIST_ATCK 
||  _IN_DIST_AGRO )
{   // 9C1C
    if(!behavior   // if NOT attacking
    &&  global.pc.ogr ) // PC off ground
    {
        ShieldHB_idx = ShieldHB_IDX_LOW + (global.pc.yt+$A < yt);
    }
    
    
    // ------------- Check to start attack -------------------
    if(!behavior) // if NOT attacking
    {   // 9C34
        counter=(counter+1)&$FF;
        
        
        if (ver==1) _val = $1F; // Geru orange
        else        _val = $3F; // Geru red & blue
        
        if!(counter&_val)
        {   // ------------------- START ATTACK ----------------------
            // 9C4A
            behavior = 1;
            
            if (ver==1) // Geru orange
            {
                if (_RAND&$1 
                ||  Input.dHeld )
                {
                    behavior = 4;
                }
            }
            
            timer = $18;
        }
        
        
        if(!(counter&_val) 
        && !(_RAND&$3) )
        {
            counter = $C0;
        }
    }
    
    
    
    // ------------------ SET hspd -----------------------
    // 9C66
         if (global.pc.cs&(CS_RGT|CS_LFT))  hspd = 0;
    else if (global.pc.hspd && Input.hHeld) hspd = global.pc.hspd;
    else                               hspd = (4*sign_(g.counter1&$40)) &$FF;
    
    hspd = (hspd>>1) | (hspd&$80);
}



if(!_IN_DIST_ATCK)
{   // 9C0F
    if (_IN_DIST_AGRO) facing_dir = dir_to_pc(id);
    hspd = ($10*facing_dir)&$FF;
}




