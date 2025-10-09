/// Ganon3_update_battle()


var _i,_j, _idx, _val;


/*
// update Crystal_xy here to give follow effect
Crystal_x=Skull_x;
Crystal_y=Skull_y;
*/


Boss_HPBar_udp();


// -------------------------------------------------------------------
if (StunMovement_timer)
{   StunMovement_timer--;  }

if (Attack1Timeout_timer)
{   Attack1Timeout_timer--;  }

if (Tell1_timer)
{   Tell1_timer--;  }
//if (Tell2_timer)
//{   Tell2_timer--;  }

if (SlimeChange_timer)
{
    SlimeChange_timer--;
    if(!SlimeChange_timer) SPRITES_idx = !SPRITES_idx;
}

// -------------------------------------------------------------------
//BODY_HB_IDX = BODY_HB_IDX1; // slime hb
if (BattleState==BattleState_Attack4_JUMP_DELAY)
{
    if (x<arena_x) BodyHB_idx=BODY_HB_IDX2;
    else           BodyHB_idx=BODY_HB_IDX3;
}
else               BodyHB_idx=BODY_HB_IDX1;

// -------------------------------------------------------------------
if (g.spell_cast_this_frame==SPL_THUN)
{   // stun movement to easier hit
    StunMovement_timer=StunMovement_DURATION1;
}

// -------------------------------------------------------------------
//Ganon3_Fire_update();
if(!StunMovement_timer) Ganon3_SlimeSpawn_update();

// -------------------------------------------------------------------
/*
Ganon3_update_battle_1a(); // pc projectile & pc sword  collision updates
GOB_body_collide_pc_body_1a();
if (cs&CS_BD1) enemy_collide_pc_body();
*/
Ganon3_update_battle_1a(); // pc projectile & pc sword  collision updates

var _bodies_colliding=false;
if (GO_can_collide_this_frame(update_idx))
{
    update_body_hb_1a();
    if (Attack_id==Attack1_ID) Ganon3_update_skull_hb();
    
    if(!stun_timer)
    {
        if (Attack_id==Attack1_ID)
        {    _bodies_colliding=collide_pc_body(SkullHB_x,SkullHB_y, SkullHB_W,SkullHB_H, SkullHB_R);  }
        else _bodies_colliding=collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r);
    }
}
if (_bodies_colliding) cs |=  CS_BD1;
else                   cs &= ~CS_BD1;
if (cs&CS_BD1) enemy_collide_pc_body();


/*
if (cs&CS_SW1 
&&  global.pc.attack_bits&(BIT_ATK1|BIT_ATK2|BIT_ATK4) 
//&&  global.pc.behavior!=global.pc.BVR_DWTH 
&&  Attack_id    != Attack1_ID 
&&  Attack_round <= Attack_ROUNDS )
{
    stun_timer = STUN_DURATION1; // STUN_DURATION1=$30
    
        dg_AttackRounds[#Attack_round-1,3]--;
    if(!dg_AttackRounds[#Attack_round-1,3]) // 3: attack-round slime hp remaining
    {
        Attack_id   = Attack1_ID;
        
        timer       = 0;
        BattleState = BattleState_Attack1_INIT;
    }
}
*/







// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// -------------------------------------------------------------------
switch(BattleState)
{
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_INIT:{
    Attack_id = Attack1_ID;
    if (timer) break;
    
    Skull_hspd = 0;
    Skull_vspd = 0;
    
    SkullHB_colliding   = 0;
    Skull_hit_counter   = 0;
    SkullOrbit_passes_x = 0;
    SkullOrbit_passes_y = 0;
    
    RoarDelay_timer = RoarDelay_DURATION1; // Tell player ganon is vulnerable
    
    timer       = 0;
    BattleState = BattleState_Attack1_INIT2;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_INIT2:{ // confirm Ganon on ground
    Attack_id = Attack1_ID;
    if (timer) break;
    
    if(!Ganon2_update_4()) // if NOT on ground
    {
        if(!StunMovement_timer) Ganon_update_xy(); // updateY(), updateX() if !cs3
    }
    else if(!SlimeChange_timer)
    {
        Attack1Timeout_timer = Attack1Timeout_DURATION1;
        
        timer       = 0;
        BattleState = BattleState_Attack1_IDLE;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_IDLE:{ // Waiting for PC stab
    Attack_id = Attack1_ID;
    if (timer) break;
    
    if (cs&CS_SW1)
    {   // knock skull out of slime
        var _hspd=Skull_SPEED2;
        var _vspd=Skull_SPEED2;
        switch(Attack_round)
        {
            case 1:{ // --------------------------------------------------
            _hspd=Skull_SPEED4; _vspd=Skull_SPEED4;
            break;}
            
            case 2:{ // --------------------------------------------------
            _hspd=Skull_SPEED2; _vspd=Skull_SPEED2;
            break;}
            
            case 3:{ // --------------------------------------------------
            _hspd=Skull_SPEED2; _vspd=Skull_SPEED2;
            if(!irandom(3)){
                if (irandom(1)){_hspd=Skull_SPEED2; _vspd=choose(Skull_SPEED4,Skull_SPEED2);}
                else           {_vspd=Skull_SPEED2; _hspd=choose(Skull_SPEED4,Skull_SPEED2);}
            }
            break;}
        }
        Skull_hspd = byte(_hspd * sign_(Skull_x<=arena_x));
        Skull_vspd = byte(_vspd * sign_(Skull_y<=viewYC()));
        //Skull_hspd = byte(_hspd * sign_(Skull_x>global.pc.x));
        //Skull_vspd = byte(_vspd * sign_(global.pc.attack_bits&BIT_ATK3));
        
        
        //RoarDelay_timer      = RoarDelay_DURATION1;
        Attack1Timeout_timer = 0;
        
        timer       = 0;
        //timer       = 2;
        BattleState = BattleState_Attack1_EMERGE;
    }
    else if(!Attack1Timeout_timer)
    {   // Player took too long to strike
        timer       = 0;
        BattleState = BattleState_Attack1_DONE;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_EMERGE:{ // move skull far enough out of slime
    Attack_id = Attack1_ID;
    /*if (timer==1)
    {
        timer=0;
        Skull_hspd = byte( Skull_SPEED2 * sign_(Skull_x>global.pc.x));
        Skull_vspd = byte(-Skull_SPEED2);
    }*/
    if (timer) break;
    
    SkullClingState = SkullClingState_FREE;
    Ganon3_skull_update_3a(); // skull cs and bounce update
    Ganon3_skull_update_1a(); // skull(FREE) xy update
    Ganon3_skull_update_2a(); // clamp skull within arena
    
    if (point_distance(x,yb,Skull_x,Skull_y) > Slime_W_)
    {
        Attack1Timeout_timer = Attack1Timeout_DURATION2; // Attack1Timeout_DURATION2=$40*$A
        
        timer       = 0;
        BattleState = BattleState_Attack1;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1:{ // Bounce around rm like a Bubble
    Attack_id = Attack1_ID;
    SkullClingState = SkullClingState_FREE;
    if (timer) break;
    
    
    
    //Ganon3_skull_update_1a(); // skull(FREE) xy update
    
    if(!StunMovement_timer)
    {
        var _COLLIDING_SIDES = Ganon3_skull_update_3a(); // skull cs and bounce update
        Ganon3_skull_update_1a(); // skull(FREE) xy update
        Ganon3_skull_update_2a(); // clamp skull within arena
        
        
        
        if(!_COLLIDING_SIDES 
        &&  Attack_round==3 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            _val =          dg_AttackRounds[#Attack_round-1,1];     // current hp skull
            _val = _val <= (dg_AttackRounds[#Attack_round-1,0]>>1); // default hp skull
            _val = $80>>_val;
            _val--;
            if!(g.counter1&_val)
            {
                var _XL = (Skull_x-4) + (6*byte_dir(Skull_hspd));
                
                if (abs(arena_x-Skull_x) < arena_w>>2)
                {    _val = sign_(irandom(1));  }
                else _val = sign_(Skull_x<arena_x);
                
                with(GOC1_create(_XL,Skull_y-$4, _val, projectile,projectile_ver))
                {
                    GO_depth_init(other.depth+1);
                    hspd = $10 + (irandom(1)<<3);
                    hspd =(hspd*facing_dir) &$FF;
                    vspd = $E0 + (irandom(1)<<3);
                }
            }
        }
    }
    
    
    
    
    // pc-sword to skull-body collision
    Ganon3_update_skull_hb();
    PC_update_sword_hb();
    if (dg_AttackRounds[#Attack_round-1,1]  // current hp skull
    &&  global.pc.SwordHB_collidable 
    &&  global.pc.attack_bits&(BIT_ATK1|BIT_ATK2|BIT_ATK3|BIT_ATK4) 
    &&  collide_pc_sword(SkullHB_x,SkullHB_y, SkullHB_W,SkullHB_H, SkullHB_R) )
    {
        if!(SkullHB_colliding &  CS_SW1)
        {
            SkullHB_colliding |= CS_SW1;
            
            with(global.pc)
            {
                g.control1_timer = Pushback_DURATION; // PC atk will NOT affect PC.hspd
                if (( xScale && !(cs&$2)) 
                ||  (!xScale && !(cs&$1)) )
                {   hspd = byte($4 * -xScale);  }
                
                if (attack_bits&BIT_ATK4) // upthrust
                {   vspd = 0;  }
            }
            
            aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
            
            Attack1Timeout_timer = Attack1Timeout_DURATION2;
            Skull_hit_counter++;
            
            stun_timer  = STUN_DURATION1; // $30
            HPBar_timer = stun_timer;
            
            
            if (dg_AttackRounds[#Attack_round-1,1]) // current hp skull
            {
                dg_AttackRounds[#Attack_round-1,1]--;
                hp--;
                //dg_AttackRounds[#Attack_round-1,1]-=3; hp-=3; // testing. kill ganon faster
            }
            
            if (dg_AttackRounds[#Attack_round-1,1]) // current hp skull
            {
                Skull_hspd = byte(abs8b(Skull_hspd) * global.pc.xScale);
                Skull_vspd = byte(abs8b(Skull_vspd) * sign_(irandom(1)));
                if (global.pc.attack_bits&(BIT_ATK3|BIT_ATK4))
                {
                    Skull_hspd = byte(abs8b(Skull_hspd) * sign_(irandom(1)));
                    if (global.pc.attack_bits&BIT_ATK3) Skull_vspd = byte( abs8b(Skull_vspd));
                    if (global.pc.attack_bits&BIT_ATK4) Skull_vspd = byte(-abs8b(Skull_vspd));
                }
                
                if (Attack_round==3 
                && !(irandom(3)) 
                &&  abs8b(Skull_hspd)<Skull_SPEED2 
                &&  abs8b(Skull_vspd)<Skull_SPEED2 )
                {
                    var _hspd=Skull_SPEED2;
                    var _vspd=Skull_SPEED2;
                    if (irandom(1)){_hspd=Skull_SPEED2; _vspd=choose(Skull_SPEED4,Skull_SPEED2);}
                    else           {_vspd=Skull_SPEED2; _hspd=choose(Skull_SPEED4,Skull_SPEED2);}
                    Skull_hspd = byte(_hspd*byte_dir(Skull_hspd));
                    Skull_vspd = byte(_vspd*byte_dir(Skull_vspd));
                }
            }
            else
            {
                Attack1Timeout_timer=0;
            }
            //sdm("hp $"+hex_str(hp));
        }
    }
    else
    {
        SkullHB_colliding &= ~CS_SW1;
    }
    
    
    
    
    
    
    switch(DEV_BattleEnding_current)
    {
        case 1:{ // ---------------------------------------
        var _qual=false;
        if(!dg_AttackRounds[#Attack_round-1,1])  // current hp skull
        {
            if (abs(Skull_x-x)>=$60 
            &&  Skull_y>=viewYT()+$60 )
            {   _qual=true;  }
        }
        else if(!Attack1Timeout_timer)
        {
            _qual=true;
        }
        
        if (_qual)
        {
            SkullHB_colliding &= ~CS_SW1;
            timer       = 0;
            BattleState = BattleState_Attack1_MERGE1;
        }
        break;}
        
        case 2:{ // ---------------------------------------
        if(!dg_AttackRounds[#Attack_round-1,1]  // current hp skull
        || !Attack1Timeout_timer )
        {
            SkullHB_colliding &= ~CS_SW1;
            
            if(!dg_AttackRounds[#Attack_round-1,1]  // current hp skull
            &&  Attack_round>=Attack_ROUNDS ) // this is last round
            {   // DEFEATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                return true;
            }
            else
            {
                timer       = 0;
                BattleState = BattleState_Attack1_MERGE1;
            }
        }
        else if(!RoarCooldown_timer)
        {
            RoarDelay_timer     = 1;
            RoarCooldown_timer  = RoarCooldown_DURATION1 + (irandom(4)<<6);
            RoarCooldown_timer += RoarDelay_timer;
        }
        break;}
    } // switch(DEV_BattleEnding_current)
    
    break;} // case BattleState_Attack1
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_MERGE1:{ // move skull to a y-position above slime body
    Attack_id = Attack1_ID;
    SkullClingState = SkullClingState_FREE;
    RoarDelay_timer = 0;
    if (timer) break;
    
    var _dir;
    var _x_TARGET = x;
    var _y_TARGET = viewYT()-SkullAura_H_-($C<<3);
    Ganon3_update_battle_3a(_x_TARGET,_y_TARGET, Skull_SPEED2,Skull_SPEED2); // update Skull_hspd & Skull_vspd for merge
    
    
    var _x_PREV = Skull_x;
    var _y_PREV = Skull_y;
    Ganon3_skull_update_1a(); // skull(FREE) xy update
    var _x_PASSED = sign(_x_TARGET-_x_PREV) != sign(_x_TARGET-Skull_x);
    var _y_PASSED = sign(_y_TARGET-_y_PREV) != sign(_y_TARGET-Skull_y);
    SkullOrbit_passes_x += _x_PASSED;
    SkullOrbit_passes_y += _y_PASSED;
    
    if (SkullOrbit_passes_x>=2)
    {
        Skull_x    = _x_TARGET;
        Skull_hspd = 0;
    }
    
    if (_y_PASSED) // _y_TARGET reached or crossed
    {
        SkullOrbit_passes_y = 0;
        Skull_hspd = 0;
        Skull_x = _x_TARGET;
        
        timer       = 0;
        BattleState = BattleState_Attack1_MERGE2;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_MERGE2:{ // move skull to slime body
    Attack_id = Attack1_ID;
    SkullClingState = SkullClingState_FREE;
    if (timer) break;
    
    var _dir;
    var _x_TARGET=x;
    var _y_TARGET=y;
    Ganon3_update_battle_3a(_x_TARGET,_y_TARGET, Skull_SPEED2,Skull_SPEED3);
    /*
    if (abs(Skull_x-_x_TARGET)<=1 
    &&  abs8b(Skull_hspd)<=$10 )
    {
        Skull_x = _x_TARGET;
        Skull_hspd = 0;
    }
    else if (Skull_x!=_x_TARGET)
    {
        _dir=sign_(Skull_x<_x_TARGET);
        if (abs8b(byte(Skull_hspd+_dir))<Skull_SPEED2) // Skull_SPEED2=$50
        {
            Skull_hspd = byte(Skull_hspd+_dir);
        }
    }
    
    if (abs(Skull_y-_y_TARGET)<=1 
    &&  abs8b(Skull_vspd)<=$10 )
    {
        Skull_y = _y_TARGET;
        Skull_vspd = 0;
    }
    else if (Skull_y!=_y_TARGET)
    {
        _dir=sign_(Skull_y<_y_TARGET);
        if (abs8b(byte(Skull_vspd+_dir))<Skull_SPEED2) // Skull_SPEED2=$50
        {
            Skull_vspd = byte(Skull_vspd+_dir);
        }
    }
    //_val = min(abs8b(Skull_vspd), Skull_SPEED2-abs(vspd_grav)); // Skull_SPEED2=$50
    //Skull_vspd = byte(_val*byte_dir(Skull_vspd));
    */
    
    
    var _x_PREV = Skull_x;
    var _y_PREV = Skull_y;
    Ganon3_skull_update_1a(); // skull(FREE) xy update
    var _x_PASSED = sign(_x_TARGET-_x_PREV) != sign(_x_TARGET-Skull_x);
    var _y_PASSED = sign(_y_TARGET-_y_PREV) != sign(_y_TARGET-Skull_y);
    SkullOrbit_passes_x += _x_PASSED;
    SkullOrbit_passes_y += _y_PASSED;
    
    if (SkullOrbit_passes_x>=2)
    {
        Skull_x    = _x_TARGET;
        Skull_hspd = 0;
    }
    
    if (SkullOrbit_passes_y>=1)
    {
        Skull_y    = _y_TARGET;
        Skull_vspd = 0;
    }
    
    
    if ((Skull_x==_x_TARGET || _x_PASSED) 
    &&  (Skull_y==_y_TARGET || _y_PASSED) )
    {
        SkullClingState = SkullClingState_CLING;
        Skull_x    = _x_TARGET;
        Skull_y    = _y_TARGET;
        Skull_hspd = 0;
        Skull_vspd = 0;
        
        
        if(!dg_AttackRounds[#Attack_round-1,1]) // current hp skull
        {
            var _C1 = Attack_round>=Attack_ROUNDS; // current round is final round
            var _C2 = Attack_round>=2;
            g.ScreenShake_timer      = $8 + ((_C2+_C1)<<2);
            g.ScreenShake_strength_x =  0 +   _C1;
            g.ScreenShake_strength_y =  1 +   _C2+_C1;
            
            if (_C1)
            {   // DEFEATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                hp = 0;
                stun_timer = STUN_DURATION1;
                timer    = 0;
                sub_state = sub_state_POST_BATTLE1;
                break;
            }
        }
        
        timer2      = $28; // merge reaction anim timer
        timer       = timer2;
        BattleState = BattleState_Attack1_MERGE3;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_MERGE3:{ // merge reaction anim
    Attack_id = Attack1_ID;
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_Attack1_DONE;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack1_DONE:{
    Attack_id = Attack1_ID;
    RoarDelay_timer = 0;
    if (timer) break;
    
    if (dg_AttackRounds[#Attack_round-1,1]) // current hp skull
    {   // This is when player took too long to damage skull, the round restarts, but with less hp than default
        dg_AttackRounds[#Attack_round-1,1] = max(dg_AttackRounds[#Attack_round-1,1], dg_AttackRounds[#Attack_round-1,0]>>1);
        dg_AttackRounds[#Attack_round-1,3] =     dg_AttackRounds[#Attack_round-1,2]>>1;
            hp  = 0;
        for(_i=Attack_round-1; _i<Attack_ROUNDS; _i++)
        {
            hp += dg_AttackRounds[#_i,1]; // current hp skull
            //sdm("hp $"+hex_str(hp)+", dg_AttackRounds[#"+string(_i)+",1] = $"+hex_str(dg_AttackRounds[#_i,1]));
        }
    }
    else
    {
        Attack_round++;
    }
    //sdm("hp $"+hex_str(hp));
    SlimeChange_timer = SlimeChange_DUR1;
    
    timer       = 0;
    BattleState = BattleState_DECIDE_ATTACK;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_INIT:{ // Ganon jumps at PC. Player must duck under the jump
    Attack_id = Attack2_ID;
    if (timer) break;
    
    if(!Ganon2_update_4()  // returns: y+Slime_H_ >= GROUND_Y
    && !StunMovement_timer )
    {   Ganon_update_xy();  } // updateX(), updateY()
    
    timer       = 0;
    BattleState = BattleState_Attack2_INIT2;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_INIT2:{ // 
    Attack_id = Attack2_ID;
    if (timer) break;
    
    if(!Ganon2_update_4()) // returns: y+Slime_H_ >= GROUND_Y
    {
        if(!StunMovement_timer) Ganon_update_xy(); // updateX(), updateY()
    }
    else
    {
        off_ground_reason=0;
        set_xy(id, x,GROUND_Y-Slime_H_);
        
        Tell1_timer = Tell1_DURATION1+8; // Tell1_DURATION1=$20. Jump-tell timer
        timer       = Tell1_timer-1;
        BattleState = BattleState_Attack2_TELL;
        
        //timer       = 0;
        //BattleState = BattleState_Attack2_IDLE;
    }
    break;}
    
    
    
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_IDLE:{ // 
    Attack_id = Attack2_ID;
    if (timer) break;
    
    //
    
    timer       = 0;
    BattleState = BattleState_Attack2_TELL;
    break;}
    */
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_TELL:{ // 
    Attack_id = Attack2_ID;
    if (timer) break;
    
    timer       = 2;
    BattleState = BattleState_Attack2_JUMP;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_JUMP:{ // 
    Attack_id = Attack2_ID;
    if (timer==1)
    {   // JUMP!!!!!
        var _DIST0 = abs(x-global.pc.x);
        var _DIST1 = ww_+global.pc.ww_;
        var _DIST2 = _DIST1+($05<<3);
        var _DIST3 = _DIST1+($0C<<3);
        var                _HSPD = $60;
        if (_DIST0<_DIST3) _HSPD = $50;
        if (_DIST0<_DIST2) _HSPD = $40;
        if (_DIST0<_DIST1) _HSPD = $30;
        
        hspd_dir = sign_(x<global.pc.x);
        hspd  = byte(_HSPD*hspd_dir);
        
        vspd_dir = -1;
        vspd  = $30 + ($10*irandom(1));
        //vspd += irandom(4)*sign_(irandom(1));
        vspd  = byte(vspd*vspd_dir);
        
        off_ground_reason=OGR_JUMP;
        
        Tell1_timer = 0;
    }
    
    if (StunMovement_timer) break;
    
    var _vspd_PREV = vspd;
    Ganon_update_xy(); // updateX(), updateY()
    
    if (timer) break;
    
    // ------------------------------------------------------------
    // Drop Flame --------------------------------
    if(!Ganon2_update_4()  // returns: y+Slime_H_ >= GROUND_Y
    &&  _vspd_PREV&$80 
    &&   vspd     <$80 
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        var _XL = (x-4) + (6*byte_dir(hspd));
        with(GOC1_create(_XL,yb-$8, 1, projectile,projectile_ver))
        {
            GO_depth_init(other.depth+1);
            hspd =   0;
            vspd = $10;
        }
    }
    
    
    if (Ganon2_update_4()) // returns: y+Slime_H_ >= GROUND_Y
    {   // LANDING
        hspd=0;
        vspd=0;
        off_ground_reason=0;
        set_xy(id, x,GROUND_Y-Slime_H_);
        
        timer2      = $10; // Flash skull
        timer       = $10; // Delay next attack
        BattleState = BattleState_Attack2_DONE;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack2_DONE:{ // 
    Attack_id = Attack2_ID;
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_DECIDE_ATTACK;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_INIT:{ // 
    Attack_id = Attack3_ID;
    if (timer) break;
    
    //
    
    timer       = 0;
    BattleState = BattleState_Attack3_CAST;
    break;}
    
    
    
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_IDLE:{ // Summon hostile rain/meteors
    Attack_id = Attack3_ID;
    if (timer) break;
    
    p.Flash_Pal_timer      =(p.SpellFlash_DURATION1+1) | $80; // SpellFlash_DURATION1=$20. bit $80 mean flash bgr
    p.Flash_Bgr_timer      = p.Flash_Pal_timer&$7F;
    p.SpellFlash_GOB_timer = p.Flash_Pal_timer&$7F;
    aud_play_sound(Audio.SND_CAST_SPEL);
    
    timer       = p.Flash_Bgr_timer-1; // delay projectile rain start
    BattleState = BattleState_Attack3_SPELL1;
    break;}
    */
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_CAST:{ // 
    Attack_id = Attack3_ID;
    if (timer) break;
    
    
    var                      _DURATION1 = p.SpellFlash_DURATION1+1; // SpellFlash_DURATION1=$20
    p.Flash_Pal_timer      = _DURATION1;
    //p.Flash_Bgr_timer      = _DURATION1;
    p.Flash_Bgr_timer2     = _DURATION1; // Flash_Bgr_timer2 is so bgr guaranteed to flash red overriding the user's setting
    p.SpellFlash_GOB_timer = _DURATION1;
    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
    
    var _DURATION2 = _DURATION1-1; // delay projectile rain start
    ProjRain_timer    = ProjRain_DURATION1+_DURATION2;
    ProjRain_cooldown = ProjRain_DURATION2+_DURATION2;
    
    timer       = _DURATION2;
    BattleState = BattleState_Attack3_DONE;
    //BattleState = BattleState_Attack3_SPELL1;
    break;}
    
    
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_SPELL1:{ // 
    Attack_id = Attack3_ID;
    if (timer) break;
    
    //ProjRain_timer     = ProjRain_DURATION1;
    //ProjRain_cooldown  = ProjRain_DURATION2;
    
    timer       = 0;
    BattleState = BattleState_Attack3_DONE;
    break;}
    */
    
    
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_SPELL2:{ // 
    Attack_id = Attack3_ID;
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_Attack3_DONE;
    break;}
    */
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack3_DONE:{ // 
    Attack_id = Attack3_ID;
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_DECIDE_ATTACK;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_INIT:{ // 
    Attack_id = Attack4_ID;
    if (timer) break;
    
    hspd_dir = sign_(x>=global.pc.x);
    
    timer       = 0;
    BattleState = BattleState_Attack4_POSITION1;
    //BattleState = BattleState_Attack4_IDLE;
    break;}
    
    
    
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_IDLE:{ // 
    Attack_id = Attack4_ID;
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_Attack4_POSITION1;
    break;}
    */
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_POSITION1:{ // Hop over to nearest wall
    Attack_id = Attack4_ID;
    if (timer) break;
    if (StunMovement_timer) break;
    
    Ganon2_update_6(max($28,global.pc.HSPD_MAX1+$10), hspd_dir); // update x, y, jump
    //Ganon2_update_6(max($28,global.pc.hspd_max+$10), hspd_dir); // update x, y, jump
    
    if (Ganon3_update_battle_2a()  // if hit wall (cs3)
    && !Ganon2_update_4()  // returns: y+Slime_H_ >= GROUND_Y
    &&  inRange(y, GROUND_Y-ww_-global.pc.hh_ ,GROUND_Y-ww_-1) )
    {
        var _X  = (arena_w>>1)-Slime_H_;
            //_X += 8; //adj
            _X *= sign_(x>arena_x);
            _X += arena_x;
        set_xy(id, _X,y);
        
        hspd = 0;
        vspd = 0;
        //BodyHB_idx = BODY_HB_IDX2+(x<arena_x);
        
        Tell1_timer = Tell1_DURATION1;
        timer2      = Tell1_timer; // squish anim timer
        timer       = timer2; // jump delay
        BattleState = BattleState_Attack4_JUMP_DELAY;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_JUMP_DELAY:{ // Cling to wall building jump power
    Attack_id = Attack4_ID;
    //if (x<arena_x) BodyHB_idx=BODY_HB_IDX2;
    //else           BodyHB_idx=BODY_HB_IDX3;
    //BodyHB_idx = BODY_HB_IDX2+(x<arena_x);
    
    if (timer) break;
    
    timer       = 0;
    BattleState = BattleState_Attack4_JUMP;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_JUMP:{ // Shoot across arena
    Attack_id = Attack4_ID;
    if (timer) break;
    if (StunMovement_timer) break;
    
    if(!hspd)
    {   // JUMP!!!!!!
        Tell1_timer = 0;
        
        hspd_dir = sign_(x<arena_x);
        hspd = byte($60*hspd_dir);
        vspd = 0;
        updateX();
        aud_play_sound(Jump_SOUND1);
    }
    else if(!Ganon3_update_battle_2a()) // if NOT hit wall
    {
        updateX();
    }
    else
    {
        var _PAD = hh_-3;
        set_xy(id, clamp(x, arena_xl+_PAD, arena_xr-_PAD),y);
        
        // bounce off wall
        hspd_dir = -hspd_dir;
        hspd = byte( $18*hspd_dir);
        vspd = byte(-$18);
        Ganon_update_xy(); // updateX(), updateY()
        
        timer       = 0;
        BattleState = BattleState_Attack4_LAND1;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_LAND1:{ // 
    Attack_id = Attack4_ID;
    if (timer) break;
    
    if(!Ganon2_update_4()) // returns: y+Slime_H_ >= GROUND_Y
    {
        if(!StunMovement_timer) Ganon_update_xy(); // updateX(), updateY()
    }
    else
    {
        set_xy(id, x,GROUND_Y-Slime_H_);
        hspd = 0;
        vspd = 0;
        
        timer       = 0;
        BattleState = BattleState_Attack4_LAND2;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_Attack4_LAND2:{ // 
    Attack_id = Attack4_ID;
    if (timer) break;
    
    timer       = 0;
    //timer       = $10;
    BattleState = BattleState_DECIDE_ATTACK;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_DECIDE_ATTACK:{ // 
    if (timer) break;
    
    if (Attack_id==Attack1_ID) ProjRainCast_count=0;
    
    var _X = !!ProjRain_cooldown;
    var _Y = irandom(dg_AttackChoices[#_X,0]-1) + 1; // _Y index 0 is the number of choices in _X index
    Attack_id =      dg_AttackChoices[#_X,_Y];
    /*
    if (ProjRain_cooldown)
    {        Attack_id = choose(Attack2_ID,Attack4_ID);  }
    else     Attack_id = choose(Attack2_ID,Attack3_ID,Attack4_ID);
    */
    
    if (Attack_id!=Attack3_ID 
    && !ProjRain_cooldown 
    &&  ProjRainCast_count<2 
    && !irandom(1+ProjRainCast_count) )
    {      Attack_id=Attack3_ID;  }
    
    switch(Attack_id){
    case   Attack2_ID:{BattleState=BattleState_Attack2_INIT; break;} // jump over pc
    case   Attack3_ID:{BattleState=BattleState_Attack3_INIT; break;} // proj-rain spell
    case   Attack4_ID:{BattleState=BattleState_Attack4_INIT; break;} // shoot across arena
    }
    break;}
    
    ProjRainCast_count += Attack_id==Attack3_ID;
}



/*
if (SkullClingState==SkullClingState_CLING)
//if (Attack_id != Attack1_ID)
{
    Skull_x=x;
    Skull_y=y;
}
*/
//update_EF11();
//GO_update_cs();




return false;




