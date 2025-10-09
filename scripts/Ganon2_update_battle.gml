/// Ganon2_update_battle()


var _i, _x,_y, _val;


// ============================================================
//if (hp) Boss_HPBar_udp();



// ============================================================
if (Crystal_timer)
{   Crystal_timer--;  }


// ============================================================
if (hp)
{
    var _MIN=$20;
    var _MAX=$48;
    hspd  =  _MIN;
    hspd += (_MAX-_MIN) * ((HP-hp)/HP);
    hspd  = round(hspd);
    hspd  = clamp(hspd,_MIN,_MAX);
    
        hspd_sub+=hspd;
    if (hspd_sub>$FF)
    {
        hspd_sub&=$FF;
        set_xy(id, x-1,y);
        GO_update_cs();
        
        var _tiles_removed=false;
        for(_i=(hh>>3)-1; _i>=0; _i--)
        {
            _x=xl;
            _y=(yt+4) + (_i<<3);
            if (collide_solid_grid(_x+1,_y))
            {
                _tiles_removed=true;
                _x=(_x>>3)<<3;
                _y=(_y>>3)<<3;
                var                                _DEPTH=DEPTH_WALL;  // wall
                if(!tile_layer_find(_DEPTH,_x,_y)) _DEPTH=DEPTH_BREAK; // break block
                tile_change_1a(_DEPTH, _x,_y, 0,0, 0);
                
                with(SpStA)
                {
                    if(!behavior 
                    &&  rectInRect(_x,_y,1,1, (xl>>3)<<3,(yt>>3)<<3,$10,$10) )
                    {
                        behavior=BVR_STBD;
                        break;//with(SpStA)
                    }
                }
            }
        }
        
        if (_tiles_removed)
        {
            g.ScreenShake_timer=$08;
            g.ScreenShake_strength_x=1;
            g.ScreenShake_strength_y=1;
            aud_play_combo1(7);
        }
    }
}



GO_update_cam_vars();
GO_update_cs();
update_body_hb_1a();



Ganon2_update_1(); // update pc x











// ==================================================================
switch(Crystal_fade_state) // fade type
{   // ==================================================================
    // -----------------------------------------------------------
    case 0:{ // opaque/not fading
        Crystal_can_draw = true;
    if (Crystal_timer) break;
    if(!hp) break;
    
    Crystal_can_draw   = false;
    Crystal_timer      = DURATION1;
    Crystal_fade_state = 2;    // 2: Fade-Out
    break;}
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case 1:{ // fade in
        Crystal_can_draw = !!(g.counter1&Fade_TIMING); // $8 can draw
    if (Crystal_timer) break;
    
        Crystal_can_draw   = true;
        Crystal_fade_state  = 0;       // 0: not fading
    if (Crystal_position) Crystal_timer = DURATION5 + (irandom(2)<<4) + 5; // DURATION5: $FF
    else                  Crystal_timer = DURATION4 + (irandom($10)*sign_(irandom(1)));
    if (Crystal_position) timer2        = DURATION7; // Delay vulnerability
    break;}
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case 2:{ // fade out
        Crystal_can_draw = !!(g.counter1&Fade_TIMING); // can draw
    if (Crystal_timer) break;
    
        Crystal_can_draw   = false;
        Crystal_fade_state = 1;     // 1: Fade-in
    if (Crystal_position) // in attack pos
    {
        Crystal_position = 0; // 0: Home pos
        Crystal_timer    = DURATION4 - irandom($10);
    }
    else
    {
        Crystal_position = choose(1,2,3); // 1,2,3: Attack pos
        Crystal_timer    = DURATION4;
    }
    break;}
}


//Crystal_x = x + dg_Positions[#Crystal_position,$00];
//Crystal_y = y + dg_Positions[#Crystal_position,$01];






if (hp)
{   // ------------------------------------------
    var _Crystal_X = x + dg_Positions[#Crystal_position,$00];
    var _Crystal_Y = y + dg_Positions[#Crystal_position,$01];
    
    if (Crystal_position     // in attack pos
    && !Crystal_fade_state ) // not fading
    {
        var       _OBJ = dg_Positions[#Crystal_position,$04];
        if (isVal(_OBJ,Bullet1,Rock1,SwordBeam))
        {              var _TIMING = $1<<6;  }
        else           var _TIMING = $1<<7;
        if!(Crystal_timer&(_TIMING-1))
        {
            projectile     = _OBJ;
            projectile_ver = 1 + (projectile==SpikeBall1);
            var _pi = -1;
            if (projectile==SpikeBall1) _pi = EnergyBall_PI;
            
            _x = _Crystal_X;
            _y = _Crystal_Y;
            with(GOC1_create(_x,_y, -1, projectile,projectile_ver, -1, _pi))
            {
                switch(object_index)
                {
                    case SpikeBall1:{
                    hspd =(-HSPD1) &$FF;
                    vspd =( VSPD1*sign_(irandom(1))) &$FF;
                    break;}
                    
                    case Bullet1:{
                    hspd =(-$20) &$FF;
                    vspd = 0;
                    break;}
                    
                    case Flame2:{
                    hspd =(-$20) &$FF;
                    vspd = $FC;
                    break;}
                    
                    case SwordBeam:{
                    hspd =(-$20) &$FF;
                    vspd = 0;
                    _y   = other.GROUND_Y - $B - (irandom(1)<<4);
                    break;}
                    
                    case Rock1:{
                    hspd =(-$20) &$FF;
                    vspd = 0;
                    break;}
                }
                
                _x = other.xl - (abs8b(hspd)>>4) - max(1,ww_>>2);
                set_xy(id, _x,_y);
                
                set_hspd_dir();
                hspd_dir_spawn  = hspd_dir;
                
                set_vspd_dir();
                vspd_dir_spawn  = vspd_dir;
                
                update_draw_xy();
                update_body_hb_1a();
            }
        }
    }
    
    
    // ------------------------------------------
    if(!timer2) // vulnerability delay
    {
        if (Crystal_position        // is in attack pos
        && !Crystal_fade_state       // is opaque/solid/not fading
        &&  f.hp 
        &&  global.pc.SwordHB_collidable 
        &&  global.pc.attack_bits&(BIT_ATK1|BIT_ATK2) 
        &&  collide_pc_sword(_Crystal_X-2,_Crystal_Y-3, 4,6) )
        {
            if!(cs &  CS_SW1)
            {
                cs |= CS_SW1;
                
                g.control1_timer = global.pc.Pushback_DURATION; // PC atk will NOT affect PC.hspd
                if!(global.pc.cs&CS_LFT) global.pc.hspd = $FC;
                
                
                aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
                //sdm("Ganon2 hp: "+string(hp));
                    hp--;
                if (hp)
                {
                    stun_timer         = STUN_DURATION1; // $30
                    Crystal_fade_state = 2; // 2: Fade-Out
                    Crystal_timer      = DURATION2;
                }
                else
                {
                    f.dm_quests[?Defeated_DATAKEY] = val(f.dm_quests[?Defeated_DATAKEY])+1;
                    
                    aud_play_sound(get_audio_theme_track(dk_EnemyDeath), 0,false, .7);
                    audio_group_stop_all(audiogroup_mus);
                    Audio.can_play_mus_rm_body = false; // Prevent music
                    Audio.can_play_boss_music  = false;
                    
                    Crystal_position   = 0;
                    Crystal_fade_state = 0;
                    Crystal_timer      = DURATION1;
                    
                    timer2  = EXPLOSION_DUR3; // EXPLOSION_DUR3=$50. Crystal explosions dur
                    timer2 += $30; // delay explosions after despawn_all_goc()
                    timer2 += $30; // delay despawn_all_goc()
                    
                    stun_timer  = timer2-(EXPLOSION_DUR3-$10); // body flash dur
                    stun_timer += $08; // timing tweek
                    
                    timer     = 0;
                    sub_state = sub_state_POST_BATTLE1;
                    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
            }
        }
        else
        {
            cs &= ~CS_SW1;
        }
    }
}


// ------------------------------------------
// Squish PC Against Solid --------------
if (hp)
{
    with(global.pc)
    {
        //if (invuln_tmr) break;
        var _AMT=1;
        if (rectInRect(other.xl-_AMT,other.yt,other.ww+(_AMT<<1),other.hh, csLft1X,csLft1Y,csRgt1X-csLft1X,csLft2Y-csLft1Y))
        //if (rectInRect(other.xl,other.yt,other.ww,other.hh, csLft1X-_AMT,csLft1Y,(csRgt1X-csLft1X)+(_AMT<<1),csLft2Y-csLft1Y))
        //if (wINw(other.xl,other.ww, csLft1X,csRgt1X-csLft1X) 
        //if (other.xl>=csLft1X 
        //&&  other.xl< csRgt1X 
        //if (wINw(other.xl,1, csLft1X,csRgt1X-csLft1X) 
        //&&  hINh(csLft1Y,csLft2Y-csLft1Y, other.bodyY,other.bodyH) )
        {
            var _X = csLft1X-_AMT;
            if (collide_solid_grid(_X,csLft1Y) 
            ||  collide_solid_grid(_X,csLft2Y) )
            {   // squished between Boss & wall
                if (_X < other.LEFT_WALL_XR 
                || !iframes_timer )
                {
                    var _DAMAGE=get_stat_max(STR_Heart);
                    if (_X >= other.LEFT_WALL_XR)
                    {   _DAMAGE=_DAMAGE>>1;  }
                    PC_take_damage(other,_DAMAGE);
                }
            }
        }
    }
}




