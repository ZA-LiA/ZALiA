/// ShadowBoss_update()


x_scale_prev = xScale;
x_prev       = x;
y_prev       = y;


if (timer1) timer1--;
if (timer2) timer2--;
if (timer3) timer3--;


// cutscene_Shadow_Boss_1() will set subState
if(!sub_state)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if (sub_state==1)
{
    ShadowBoss_udp();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
var _ON_GROUND_Y = GROUND_Y - hh_;





// ------------------------------------------------------------------------------------------
// ---------------------------  FIGHTING  ---------------------------------------------
// 988E, 989B: JSR A4E9
Boss_HPBar_udp();



// ------------------------------------------------------------
if (g.pc.attack_phase==0 
||  g.pc.attack_phase==4 
|| (g.pc.attack_phase==3 && !g.pc.SwordHB_collidable) )
{
    is_blocking_attack = false;
}




// 989E
if (g.boss_stun_timer)
{   // ---------------------------------------------------------
    // $80 means pending death
    if (g.boss_stun_timer&$8F==$80) aud_play_sound(get_audio_theme_track(STR_PC+STR_Damage));
    
    behavior = g.pc.behavior_DAMAGE;
    
    // 98B1: JSR 9A0F
    ShadowBoss_update_1(); // setFacingDir, xScale, updateXY, jump
    
    
    // 98B4
    if (yt>=max(PAGE_H,g.rm_h))
    {   // DEFEATED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        GOB_update_data_defeated(id);
        state = 0;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    // 98D0: JMP 9A77
    ShadowBoss_udp();
}
else
{   // ---------------------------------------------------------
    // 98D3: JSR 98EB
    if (1)
    {
        var _DIST  =  abs(g.pc.x -  x);
            _DIST += 3 + (g.pc.x <= x);
            _DIST  = _DIST>>4;
    }
    else
    {   // OG
        var _X    =       xl    &$FF;
        var _PC_X = (g.pc.xl-8) &$FF;
        
        var            _DIST  = (_X-_PC_X) &$FF;
        if (_DIST&$80) _DIST ^= $FF;
                       _DIST  = (_DIST + 3 + (_PC_X<=_X)) &$FF;
                       _DIST  =  _DIST>>4;
    }
    
    
    
    if (_DIST>=6)
    {   // 990C
        down_held = 0;
    }
    else if(!ogr)
    {
        if (_DIST<2)
        {   // 9911. _DIST == 0,1
            if (Input.pressedC) down_held = Input.dHeld; // down_held true means crouching behaviors
            
            if (Input.pressedC  // B or A button pressed
            && !(g.dl_RandomOG[|1]&$7) ) // 1 in 8, 12.5% chance
            {   // 9926
                vspd_grav    = 0;
                attack_phase = 0;
                ShadowBoss_update_1a(); // JUMP!!
            }
            // 994F
            else if!(g.dl_RandomOG[|3]&$3) // 1 in 4, 25% chance
            {   // 9956: JSR DC91
                hspd_dir_next = -dir_to_pc_(id); // Move AWAY from PC
                timer2 = $10;
            }
            else
            {
                var _C1 = g.mod_ShadowBoss_ADJ1 && f.items&ITM_SWRD && !is_blocking_attack;
                var _C2 = 0;
                if (_C1)
                {
                    var _CHANCE = 50;
                    if (attack_phase==1 
                    ||  attack_phase==2 )
                    {
                        _CHANCE = round(_CHANCE*.6); // Less chance of blocking if currently attacking.
                    }
                    
                    _C2 =  g.pc.attack_phase==1 
                       ||  g.pc.attack_phase==2 
                       || (g.pc.attack_phase==3 && g.pc.SwordHB_collidable);
                }
                
                if (_C1 
                &&  _C2 
                &&  irandom(99)<_CHANCE )
                {   // MOD  ------------------------------
                    // When boss attacks, it always does opposite high/low of 
                    // pc's current stand/crouch state.
                    // This leaves it open to take a hit and doesn't even 
                    // consider if pc is currently attacking.
                    // However, it doesn't matter because boss's body hb is so 
                    // thin, pc's sword hb can't reach.
                    // ITM_SWRD gives pc's sword hb +2 pixels extra length 
                    // and this seems to be enough to reach the boss's hb 
                    // making the fight feel way too easy in my opinion.
                    // This mod here gives the boss a chance to consider 
                    // not attacking while pc is attacking.
                    is_blocking_attack = true;
                    down_held = Input.dHeld; // down_held true means crouching behaviors
                }
                // 9964
                else if (yt>=g.pc.yt)
                {
                    if (attack_phase==0 
                    ||  attack_phase==3 )
                    {   // 9972 - ATTACK START!!!
                        attack_phase = 1;
                        hspd         = 0;
                        timer1       = $10;
                        if (is_blocking_attack)
                        {    down_held = Input.dHeld;  }
                        else down_held = Input.dHeld^$1; // OG. Attack opposite of pc crouching state
                        
                        aud_play_sound(get_audio_theme_track(STR_Stab));
                    }
                }
            }
        }
        // 9989. _DIST == 2,3,4,5
        else if (g.counter1&$C0)
        {   // 9993: JSR DC91
            hspd_dir_next = dir_to_pc_(id); // Move TOWARDS PC
            timer2 = $02;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    // 98D6: JSR 99A4  -----------------------------------------
         if (timer2) hspd = ($14*hspd_dir_next) &$FF;
    else if(!ogr)    hspd = 0;
    
    
    
    // 98D9: JSR 99B8, 99B8: JSR 9A0F  -------------------------
    ShadowBoss_update_1(); // set facing_dir, xScale, updateXY, jump
    
    
    
    // 99BB  ---------------------------------------------------
    if (y>=_ON_GROUND_Y)
    {   // 99C1: JSR DAC1
        vspd = 0;
        ogr  = 0;
        set_xy(id, x, _ON_GROUND_Y);
        
        // 99E2
        if (hspd)
        {   // 99E6
            if (byte_dir(hspd)!=xScale   // moving opposite of (the dir towards pc)
            && !(walk_frame&$1) )        // walk_frame==0,2
            {    behavior = g.pc.behavior_WALK1 + (walk_frame^$2);  } // behavior = g.pc.BVR_WLK1 + 2,1,0
            else behavior = g.pc.behavior_WALK1 +  walk_frame;        // behavior = g.pc.BVR_WLK1 + 0,1,2
            
            //if (to_pc_dir_x==xScale) behavior = g.pc.BVR_WLK1 + str_hex('00'+'01'+'02', walk_frame);
            //else                     behavior = g.pc.BVR_WLK1 + str_hex('02'+'01'+'00', walk_frame);
            
            if!(g.counter1&$3)
            {   //                walk_frame: 0,1,2
                //walk_frame = (walk_frame+1) mod 3;
                if (walk_frame<2) walk_frame++;
                else              walk_frame=0;
            }
        }
        else
        {   // 9A05.  While on ground
            if (down_held) behavior = g.pc.behavior_CROUCH; // 6: BVR_CRCH
            else           behavior = g.pc.behavior_IDLE;   // 3: BVR_IDLE
        }
    }
    else
    {   // 99CC.  While NOT on ground
        down_held = Input.dHeld;
        if (vspd<$80) behavior = g.pc.behavior_WALK3;  // 2: BVR_WLK3
        else          behavior = g.pc.behavior_CROUCH; // 6: BVR_CRCH
    }
    
    
    
    // ---------------------------------------------------------
    // 98DC: JSR 9A50
    if (attack_phase)
    {
        if (timer1 
        ||  attack_phase!=3 )
        {
                           behavior  = g.pc.behavior_DRAWBACK; // 4: BVR_DRAW
                           behavior += attack_phase==2;        // 5: BVR_ATK1 (high)
            if (down_held) behavior += 2;                      // 6,7: BVR_CRCH, BVR_ATK2 (low)
        }
        
        if(!timer1)
        {
                attack_phase++;
                attack_phase &= $3;
            if (attack_phase) timer1=8;
        }
    }
    
    
    
    // ---------------------------------------------------------
    // 98DF: JSR 9A77
    ShadowBoss_udp();
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------
    // Collision -----------------------------------------------
    // 9ABB: JSR E942
    update_body_hb_1a();
    // 9ABE
    update_body_hb();
    
    
    
    // 98E2: JSR 9A8D
    if(!ogr 
    && !g.pc.ogr 
    && !timer3 ) // invulnerable timer
    {   // 9A9A
        if (down_held) ShieldHB_idx = ShieldHB_IDX_LOW;
        else           ShieldHB_idx = ShieldHB_IDX_HGH;
        
        var _DIR = facing_dir;
        facing_dir = xScale;
        GOB_update_shield_offsets();
        facing_dir = _DIR;
        
        if (xScale) ShieldHB_yoff += x+$08  >=  viewXR();                // very unlikely
        else        ShieldHB_yoff += x      !=  viewXL();                // very   likely
                    ShieldHB_xoff += inRange(x, viewXL()-8, viewXL()-1); // very unlikely
        /*  OG
        var         _val = $FF;
        if (xScale) _val = $10;
                    _val = byte(camXX+8) + _val;
        //
        if(!down_held)
        {           shldYOff  = 4;  }
        else        shldYOff  = 17;
                    shldYOff += (_val>$FF); // carry
        //
        if (xScale) shldXOff  = 16;
        else        shldXOff  = -1;
                    shldXOff +=  8;
                    shldXOff += ((camXX+8)>$FF); // carry
        */
        update_shield_hb();
        
        
        // 9A97: JSR E9A2
        if (collide_pc_sword(ShieldHB_x,ShieldHB_y, ShieldHB_w,ShieldHB_h))
        {   // 9A5F
            ShadowBoss_update_2(); // pushback
        }
        // 9ABB: JSR E942
        else if (collide_pc_sword(BodyHB_x,BodyHB_y, BodyHB_w,BodyHB_h))
        {   // 9ACD
            //sdm("down_held: "+string(down_held)+", attack_phase: "+string(attack_phase)+", shld_hb_idx==ShieldHB_IDX_LOW: "+string(shld_hb_idx==ShieldHB_IDX_LOW)+", g.pc.attack_phase: "+string(g.pc.attack_phase));
                hp--;
            if (hp) g.boss_stun_timer = $18;
            else    g.boss_stun_timer = $FF;
            
            if (hp) timer3 = $38; // invulnerability timer
            
            // 9AE1: JSR DC91
            hspd         = ($A * -dir_to_pc_(id)) &$FF;
            vspd         = $FD;
            ogr          = OGR_OTHR;
            attack_phase = 0;
            aud_play_sound(get_audio_theme_track(STR_PC+STR_Damage));
        }
        else if (SwordHB_collidable)
        {   // 9B0A
            // WIDE VIEW
            SwordHB_xoff  =  8             * x_scale_prev;
            SwordHB_xoff += (SwordHB_w>>1) * x_scale_prev;
            SwordHB_xoff -=  SwordHB_w>>1;
            if(!g.mod_fix_og_swordhb_exploit 
            &&  qual_SwordHB_xoff_bug() )
            {
                SwordHB_xoff += 2;
            }
            
            SwordHB_yoff  = 3;
            
            SwordHB_xoff += g.HB_ADJ_X;
            SwordHB_yoff += g.HB_ADJ_Y;
            
            SwordHB_x = viewXL() + view_xl_dist + SwordHB_xoff;
            SwordHB_y = SwordHB_y_base          + SwordHB_yoff;
            /*  OG
            if (g.mod_allow_bug_swrdXOff) // OG
            {
                if (swrdX_base < xl&$FF)            SwordHB_xoff =  2;
                else                                SwordHB_xoff = -8;
            }
            else
            {
                if ((swrdX_base+g.view_xl_og) < xl) SwordHB_xoff =  2; // No extended swrd hb?
                else                                SwordHB_xoff = -8;
            }
            
            SwordHB_yoff =  3;
            
            SwordHB_xoff += g.HB_ADJ_X;
            SwordHB_yoff += g.HB_ADJ_Y;
            
            swrdX = swrdX_base + SwordHB_xoff + g.view_xl_og;
            swrdY = swrdY_base + SwordHB_yoff;
            */
            
            
            
            SwordHB_can_draw = SwordHB_collidable;
            
            // 9B07: JSR E9D8
            if (collide_pc_shield(SwordHB_x,SwordHB_y, SwordHB_w,SwordHB_h))
            {   // 9A5F
                ShadowBoss_update_2(); // pushback
            }
            // 9B2F: JSR E975
            else if (collide_pc_body(SwordHB_x,SwordHB_y, SwordHB_w,SwordHB_h))
            {   // 9B37: JSR E2EF
                enemy_collide_pc_body();
            }
        }
    }
    
    // 98E5: JSR E4D9
    GOB_body_collide_pc_body_1a();
    // 98E8: JMP D6C1
    if (cs&CS_BD1) enemy_collide_pc_body();
}
// ------------------------------------------------------------




