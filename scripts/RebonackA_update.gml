/// RebonackA_update()


// --------------------------------------------------------
// AFBC - HEALTH BAR ----------------------------------
if (phase==1 
&&  g.view_lock_boss )
{
    Boss_HPBar_udp();
}



// --------------------------------------------------------
hspd_impel = 0;

if (phase==1 
||  phase==2 )
{
    if(!g.view_lock_boss 
    ||  start_timer )
    {
        update_EF11(); // MOD. Draw pre battle
        RebonackA_update_hover(); // HOVER EFFECT -----------------------
        RebonackA_update_sway(); // SWAY BACK AND FORTH --------------------
        updateX();
    }
}




// --------------------------------------------------------
// AFEC: JSR B20D, B212.  START BATTLE -------------
if (phase==1 
&& !g.view_lock_boss )
{
    Boss_update_start();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (phase==1)
{
    if(!Boss_update_4()) // Arena gate
    {
        g.pc_lock = PC_LOCK_ALL;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
        g.pc_lock = 0;
}



// --------------------------------------------------------
// AFC6 - DELAY UPDATE AFTER START BATTLE -----------
if (phase==1 
||  phase==2 )
{
    if (start_timer)
    {
        start_timer--;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}
// --------------------------------------------------------
// --------------------------------------------------------











// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
if (phase==1 
||  phase==2 )
{   // AFCB
    update_EF11();
    
    if (GOB_shield_collision_1a()) // SHIELD COLLISION
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    // AFD6
    RebonackA_update_hover(); // HOVER EFFECT -----------------------
}

if ( phase==1 
||  (phase==2 && reboB && instance_exists(reboB) && reboB.state==state_NORMAL) ) // if not exploding
{
    updateX();
}




// --------------------------------------------------------
// B003: JSR B1E3
if (phase==1)
{
    update_EF11();
    
    // B1E6: JSR D6C1 -----------------------------------------
    if (cs&CS_BD1) enemy_collide_pc_body();
    
    if (g.mod_RebonackA_HBBalance)
    {   // MOD: hb xoff balance.  $D Left, $2 Right ----------
        if (facing_dir) BodyHB_idx = BodyHB_IDX_RGT; // xoff  2, yoff 3, wdth 12, hght 23
        else           BodyHB_idx = BodyHB_IDX_LFT; // xoff 18, yoff 3, wdth 12, hght 23
    }
    else               BodyHB_idx = BodyHB_IDX_RGT; // OG
    
    if(!ocs) GOB_update_2();
    
    
    // B006: JSR E579 -----------------------------------------
    GOB_sword_collision_1a(); // handles PC BODY collision check & reaction
    
    
    
    
    
    // --------------------------------------------------------
    // B04D -------------------------------------------
    if (hp >= HP_CUE) // HP_CUE=$24
    {
        // Change facing_dir once half-way turned around
        if (Turn_timer == Turn_DURATION>>1)
        {
            target_side = -target_side;
            facing_dir   =  target_side;
        }
        
        if (Turn_timer) Turn_timer--;
        
        // B05A
        if(!Turn_timer                     // If NOT in process of turning around
        &&  facing_dir != dir_to_pc(id) 
        &&  (hspd+8)&$FF < $11 )        // If slowed down enough
        {   // Start turning around once slowed down enough after passing PC.
            // Timer for turning around and determining sprite.
            Turn_timer = Turn_DURATION-1; // TURN_AROUND_DUR: $20
        }
        
        
        
        
        
        // B07A
        if (timer)
        {
            RebonackA_update_sway(); // SWAY BACK AND FORTH --------------------
            if (Proj_USE 
            && !Proj_tokens )
            {   Proj_tokens = 1;  }
        }
        else if!(g.counter1&$1)
        {
            var                 _PAD  = $0C<<3;
            if (arena_w>PAGE_W) _PAD += $0A<<3;
            
            if (target_side)
            {    var _TARGET_X = arena_xr-_PAD;  }
            else var _TARGET_X = arena_xl+_PAD;
            
            
            var _DIR = sign_(x<_TARGET_X);
            
            
            if (hspd != (hspd_MAX*_DIR)&$FF ) // if not max hspd toward pc
            {   // B09A
                hspd  = (hspd    +_DIR)&$FF; // inc/dec hspd toward pc
                hspd_impel =      _DIR; 
                
                // idle timer. for swaying back & forth while waiting to charge pc
                // When timer reaches 0, if hspd dir is charge dir, Rebo will charge, 
                // otherwise hspd will increment towards 0 and a new sway period will 
                // begin. A charge wont happen unless hspd dir is charge dir when 
                // sway period ends.
                if(!hspd) timer = $53;
            }
            
            
            if (Proj_USE 
            &&  Proj_tokens 
            &&           hspd 
            &&  byte_dir(hspd) == _DIR 
            &&  abs8b(   hspd) >  hspd_SWAY )
            {
                Proj_tokens = 0;
                var _XC   = arena_x + (Proj_DIST1 * -_DIR);
                var _DIST = abs(global.pc.x-_XC)>>3;
                    _DIST = clamp(_DIST, 3,(arena_w>>3)-5);
                with(GOC1_create(_XC,Proj_YT, _DIR, Proj_OBJ))
                {
                    //GO_depth_init(other.Proj_DEPTH); // 2024/10/15. Removing this because fire is behind pillars. Another solution would be to put the pillars on a different layer.
                    set_xy(id, x-ww_, y);
                    vspd =  $FC;
                    hspd = round(2.6*_DIST); // This aims really well!
                    hspd = (hspd*facing_dir) &$FF;
                }
            }
        }
    }
    else if (hp < HP_CUE) // HP_CUE=$24
    {   // B009 - CHANGE TO KNIGHT BATTLE -------------------------
        var _XL = xl + $18;
        var _YT = yt;
        var _VER = 1 + (ver==2);
        with(GameObject_create(_XL,_YT, ReboB,_VER, dk_spawn, palidx_def))
        {
            state = state_NORMAL;
            
            other.reboB = id;
                  reboA = other;
            //
            vspd  = $EA;
            hspd  = ($10*other.facing_dir) &$FF;
            hspd ^= $FF;
            hspd  = (hspd<<1) &$FF;
            
            arena_xl = other.arena_xl;
            arena_x  = other.arena_x;
            arena_w  = other.arena_w;
            
            HPBar_XOFF = other.HPBar_XOFF;
            HPBar_YOFF = other.HPBar_YOFF;
            
            ShieldHB_idx = ShieldHB_IDX_HGH;
            
            MusicBattle_THEME = other.MusicBattle_THEME;
            MusicBattle_BODY  = other.MusicBattle_BODY;
            MusicBattle_INTRO = other.MusicBattle_INTRO;
        }
        
        
        
        with(global.pc)
        {
            if (behavior==behavior_STAB_DOWN 
            &&  vspd&$80 )
            {   vspd=(vspd<<1)&$FF;  }
        }
        
        
        hspd     = ($10*facing_dir) &$FF;
        behavior = 1;
        phase    = 2; // 2: Horse leaving battle & waiting for battle end
        
        hp       = 1; // 
        state    = state_NORMAL;
    }
}
else
{   // AFF2 - HORSE LEAVING BATTLE ----------------------------
    if(!ocsH1(id)  // true if any width is w/in ocs area width
    &&  phase==2 ) // Rider knocked off horse
    {
        phase =3; // if all ocs outside of ocs area
    }
}






// --------------------------------------------------------
// --------------------------------------------------------
// Waiting for reboB to die --------------------------
if (phase==2 
||  phase==3 )
{
    // In case was in the middle of turning around when knocked off horse, 
    // this will finish the horse turning around.
    if (Turn_timer) Turn_timer--;
    
    
    if (reboB 
    &&  instance_exists(reboB) 
    &&  reboB.state == state_DROP 
    &&  reboB.timer == 1 // Last frame of rising xp
    &&  global.pc.state  == global.pc.state_NORMAL 
    && !global.pc.is_dead )
    {
        phase = 4;
    }
    else if(!instance_exists(ArenaGate))
    {
        phase = 4;
    }
}


if (phase==4)
{
    g.pc_lock = 0;
    
    // This is how game spawner knows not to spawn again
    GOB_update_data_defeated(id);
    state = 0;
}




