/// Carock_update()


// AE7B: JSR B20D
if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    can_draw_self = pending_death;
    
    if (ver==2 
    &&  pending_death )
    {
        Carock_update_2();
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// Update healthbar ------------------------------------------------------
Boss_HPBar_udp();



if(!Boss_update_4()) // Arena gate
{
    //update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// MOD. Delay 1st attack -----------------------------------------------
if (start_timer)
{
    start_timer--;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// AE7E: JSR B1E9 --------------------------------------------------------
Boss_update_5(); // check for and set pending death
behavior  = 0; // for SoundWave
facing_dir = dir_to_pc(id);


//if(!pending_death) Boss_Roar_update();



if (ver==2 
&&  g.mod_CAROCK_ATK_3 )
{
    if (sub_state != sub_state_ATTACK_3A 
    ||  sub_state_timer <= Attack3_CUE4 )
    {
        for(var _i=ds_grid_width(dg_Attack3)-1; _i>=0; _i--)
        {
            if(!dg_Attack3[#_i,1]) continue;
            
                dg_Attack3[#_i,1]--;
            if (dg_Attack3[#_i,1]) continue;
            
            
            with(GOC1_create(dg_Attack3[#_i,0]-4,Attack3_Y-8, facing_dir, Attack3_PROJECTILE, -1, id))
            {
                hspd = 0;
                vspd = 0;
            }
        }
    }
}






if (attack_timer)
{   attack_timer--;  }



// AE8D ------------------------------------------------------------------
if (sub_state_timer)
{   sub_state_timer--;  }


switch(sub_state)
{
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_1A:{ // FADE IN
    if (sub_state_timer)
    {
        if (sub_state_timer&$1) update_EF11();
        break;
    }
    
    
    // This will be Carock's vulnerability duration
    sub_state_timer  = DURATION1; // DURATION1=$10
    if (g.mod_Carock_VulnDur) sub_state_timer += DURATION6; // Extra vulnerability time to compensate wider arena
    sub_state = sub_state_ATTACK_1B;
    break;}
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_1B:{ // ATK 1
    if (sub_state_timer)
    {   // AE98
        if (sub_state_timer==$08 
        && !ocs 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            // AED9: JSR DBCE.  Carock spr is 32x48. SoundWave spr is 8x16
            if (0)
            {
                if (ver==2 
                &&  hp<(g.dl_HP[|HP_IDX] div 3) 
                && !irandom($17) )
                {
                    projectile     = Fireball1;
                    projectile_ver = 1;
                }
                else
                {
                    projectile     = projectile_OBJ;
                    projectile_ver = projectile_VER;
                }
            }
            else
            {
                projectile     = projectile_OBJ;
                projectile_ver = projectile_VER;
            }
            
            
            var _DIST = $0D + (!!facing_dir);
            var _XL   = x + (_DIST*facing_dir); // SoundWave x
                _XL  -= $04; // SoundWave xl
            //
            
            if(!irandom(1) 
            &&  abs(x-global.pc.x)>($A<<3) )
            {    var _YT = yb-$20;  }
            else var _YT = yb-$10;
            
            with(GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver, id))
            {
                if (object_index==SoundWave) counter = 3 + !facing_dir;
            }
        }
        
        // AEB2
        behavior = 1; // for SoundWave
        
        GOB_body_collide_pc_body_1a();
        BodyHB_can_draw = true;
        if (cs&CS_BD1) enemy_collide_pc_body();
        
        update_EF11();
        break;
    }
    
    sub_state_timer = DURATION1; // DURATION1=$10
    sub_state       = sub_state_ATTACK_1C;
    break;}
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_1C:{ // FADE OUT
    if (sub_state_timer)
    {
        if (sub_state_timer&$1) update_EF11();
        break;
    }
    
    sub_state_timer = 0;
    sub_state       = sub_state_ATTACK_1D;
    break;}
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_1D:{ // FIND/SET NEW X
    if (sub_state_timer) break;
    
    
    if (ver==2 
    && (g.mod_CAROCK_ATK_2 || g.mod_CAROCK_ATK_3) 
    && !attack_timer 
    &&  hp<(g.dl_HP[|HP_IDX]>>1) )
    {
        if (g.mod_CAROCK_ATK_3 
        &&  irandom(1) )
        {
            var _i, _dur;
            var _count = ds_grid_width(dg_Attack3);
            var _IDX = irandom((_count>>1)-1)<<1;
            
            var _dl_RAND = ds_list_create();
            for(_i=0; _i<_count; _i++)
            {
                dg_Attack3[#_i,1] = 0; // timer
                dg_Attack3[#_i,2] = 0; // timer
                
                if (_i<_IDX 
                ||  _i>_IDX+1 )
                {   // clms that will NOT spawn flames
                    ds_list_add(_dl_RAND,_i);
                }
            }
            
            ds_list_shuffle(_dl_RAND);
            
            _count = ds_list_size(_dl_RAND);
            _dur = 0;
            for(_i=0; _i<_count; _i++)
            {
                dg_Attack3[#_dl_RAND[|_i],1] = Attack3_DURATION1+_dur; // Delay draw duration
                _dur += irandom(8)+4;
            }
            
            ds_list_destroy(_dl_RAND); _dl_RAND=undefined;
            
            
            
            sub_state_timer = Attack3_DURATION0; //  Attack3_DURATION0: $100
            sub_state       = sub_state_ATTACK_3A;
            break;
        }
        else
        {   // ATK 2
            sub_state_timer = DURATION3; //  DURATION3: $D0
            sub_state       = sub_state_ATTACK_2A;
            break;
        }
    }
    
    
    // AEBD
    Carock_update_1(); // Find and set new x
    
    stun_timer      = 0;
    sub_state_timer = DURATION1; // DURATION1=$10
    sub_state       = sub_state_ATTACK_1A;
    break;}
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_2A:{ // ATK 2
    if (sub_state_timer)
    {
        set_xy(id, arena_x, Attack2_YT+hh_);
        stun_timer = 0;
        
        
        if (    inRange(sub_state_timer, Attack2_CUE3, Attack2_CUE5))  // Attack2_CUE3 $10, Attack2_CUE5 $B0
        {
            if (inRange(sub_state_timer, Attack2_CUE2, Attack2_CUE1)   // Attack2_CUE2 $28, Attack2_CUE1 $98
            ||  sub_state_timer&$1 ) // Fade in/out effect
            {
                update_EF11();
            }
        }
        
        
        
        if ( sub_state_timer <= Attack2_CUE1         // Attack2_CUE1 $98
        && !(sub_state_timer & (Attack2_TIMING-1)) )
        {
            if (wINwAll(Attack2_xl,8, arena_xl,arena_w) 
            &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
            {
                with(GOC1_create(Attack2_xl,Attack2_YT, facing_dir, Attack2_PROJECTILE, -1, id))
                {
                    hspd = 0;
                    vspd = 0;
                    
                    float_tmr = $20;
                    timer    -= float_tmr;
                }
            }
            
            Attack2_xl += Attack2_SPACING * -Attack2_dir;
        }
        
        break;
    }
    
    
    Attack2_dir = sign_(irandom(1)); // 1,-1
    Carock_set_Attack2x();
    
    
    set_xy(id, x, spawn_yt+sprite_index_yoff); // set to atk1 yt
    
    sub_state_timer = DURATION2;
    sub_state       = sub_state_ATTACK_2B;
    break;}
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_2B:{ // POST ATK2 DELAY ATK1
    if (sub_state_timer) break;
    
    
    Carock_update_1(); // Find and set new x
    
    attack_timer = DURATION7 + irandom(DURATION8); // For Attack2, Attack3
    sub_state_timer = DURATION1; // DURATION1=$10
    sub_state       = sub_state_ATTACK_1A;
    break;}
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_3A:{ // ATK 3
    if (sub_state_timer)
    {
        set_xy(id, arena_x, Attack2_YT+hh_);
        stun_timer = 0;
        
        
        if (    inRange(sub_state_timer, Attack3_CUE0, Attack3_CUE1))  // Attack3_CUE0 $10, Attack3_CUE1 $E0
        {
            if (inRange(sub_state_timer, Attack3_CUE2, Attack3_CUE3)   // Attack3_CUE2 $28, Attack3_CUE3 $C8
            ||  sub_state_timer&$1 ) // Fade in/out effect
            {
                update_EF11();
            }
        }
        
        break;
    }
    
    
    set_xlyt(id, xl, spawn_yt); // set to atk1 yt
    
    sub_state_timer = Attack3_DURATION1;
    sub_state       = sub_state_ATTACK_3B;
    break;}
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------
    // -----------------------------------------------------------------------
    case sub_state_ATTACK_3B:{ // POST ATK3 DELAY NEXT ATK
    if (sub_state_timer) break;
    
    
    Carock_update_1(); // Find and set new x
    
    attack_timer = DURATION7 + irandom(DURATION8); // For Attack2, Attack3
    sub_state_timer = DURATION1; // DURATION1=$10
    sub_state       = sub_state_ATTACK_1A;
    break;}
}




