/// Ganon2_update()


if (timer1) timer1--;
if (timer2) timer2--;


switch(sub_state)
{   // -----------------------------------------------------------
    case sub_state_RM_ENTER:{ // CONFIRM PC ON GROUND
    Crystal_can_draw = true;
    //if (timer) break;
    g.pc_lock = PC_LOCK;
    global.pc.xScale = 1;
    if (timer) break;
    
    
    if(!global.pc.ogr)
    //if (global.pc.cs&$4 
    //&& !global.pc.ogr )
    {
        g.pc_lock = PC_LOCK_ALL;
        PC_set_behavior(global.pc.behavior_IDLE);
        
        timer = $C0;
        sub_state = sub_state_INTRO1;
    }
    break;}//case sub_state_RM_ENTER
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_INTRO1:{ // DELAY SCREEN SHAKE START
    Crystal_can_draw = true;
    if (timer) break;
    
    
    timer = DURATION9; // DURATION9=$80
    sub_state = sub_state_INTRO2;
    break;}//case sub_state_INTRO1
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_INTRO2:{ // START SCREEN-SHAKE, THEN MOVE INST
    Crystal_can_draw = true;
    
    g.ScreenShake_timer=$10;
    g.ScreenShake_strength_x=1;
    g.ScreenShake_strength_y=1;
    var              _TIMING=$1<<2;
    if(!(g.counter1&(_TIMING-1)) 
    &&   g.counter1& _TIMING )
    {   aud_play_sound(get_audio_theme_track(dk_BridgeCrumble), 0,false, .5);  } // ground shake sound
    if (timer) break;
    
    
    if!(g.counter1&(_TIMING-1))
    {
        set_xy(id, x-1,y);
        if (x<=StartBattle_X)
        //if (xl <= g.rm_w-($A<<3))
        {
            g.pc_lock=0;
            
            g.ScreenShake_timer=0;
            g.ScreenShake_strength_x=0;
            g.ScreenShake_strength_y=0;
            
            Boss_play_battle_music();
            
            timer = 0;
            sub_state = sub_state_BATTLE;
        }
    }
    break;}//case sub_state_INTRO2
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_INTRO3:{
    if (timer) break;
    break;}//case sub_state_INTRO3
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // -----------------------------------------------------------
    case sub_state_BATTLE:{
    //if (timer) break;
    Ganon2_update_battle();
    break;}//case sub_state_BATTLE
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_POST_BATTLE1:{
    Crystal_can_draw = true;
    Ganon2_update_1(); // clamp pc x
    Ganon2_update_2(); // pc lock control
    if (timer) break;
    
    
    Crystal_can_draw = g.counter1&Crystal_TIMING1;
    
    var         _DUR1 = EXPLOSION_DUR3; // EXPLOSION_DUR3=$70
    if (timer2==_DUR1+$30){aud_play_combo1($B); despawn_all_goc();}
    if (timer2==_DUR1+$04) aud_play_sound(get_audio_theme_track(STR_Boss+STR_Explode));
    if (timer2==_DUR1) Crystal_sprite_state = 2; // 0: can't draw, 1: empty spr, 2: full, 3: full & flashing spr
    
    
    //Ganon2_update_3a(); // Crystal explosion update
    if (timer2&$1 
    &&  timer2<=_DUR1  // EXPLOSION_DUR3=$70
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        var _x  =  x + dg_Positions[#Crystal_position,$00];
            _x += irandom($0F)-8;
            _x +=  6; // dont remember why i did this
            _x -=  8; // xl
        //
        var _y  =  y + dg_Positions[#Crystal_position,$01];
            _y += irandom($1F)-7;
            _y += -2; // dont remember why i did this
            _y += -6; // trying to better center explosions around crystal
            _y -=  8; // yt
        GOC1_create(_x,_y, facing_dir, BossExplosion,1, id);
    }
    
    
    if(!timer2)
    {   // start death stun flash
        stun_timer = 0;
        timer  = 0;
        timer += $10; // timing tweek
        sub_state = sub_state_POST_BATTLE2;
    }
    break;}//case sub_state_POST_BATTLE1
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_POST_BATTLE2:{
    Crystal_can_draw = g.counter1 & Crystal_TIMING1;
    Ganon2_update_1(); // clamp pc x
    Ganon2_update_2(); // pc lock control
    if (timer) break;
    
    
    // Set pal colors for Ganon Skull
    var _PAL = build_pal(p.C_WHT1,p.C_RED3,p.C_BLK1,p.C_BLK1,-2,-2,-2,-2);
    var _LEN = string_length(_PAL);
    var _POS = get_pal_pos(Form3_Skull_PI+1) - _LEN;
    change_pal(strReplaceAt(p.pal_rm_new, _POS,_LEN,_PAL));
    
    aud_play_combo1($C); // death sound
    stun_timer  = $28; // stun flash
    stun_timer += $10; // timing tweek
    
    timer2 = EXPLOSION_DUR2; // EXPLOSION_DUR2: EXPLOSION_DUR1($90)+$10
    timer1 = (timer2-EXPLOSION_CUE2)+1; // $29. explode sound delay. EXPLOSION_CUE2=EXPLOSION_DUR1-$18
    timer  = 0;
    sub_state = sub_state_EXPLODE_BODY;
    break;}//case sub_state_POST_BATTLE2
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_EXPLODE_BODY:{
    Crystal_can_draw = g.counter1 & Crystal_TIMING1;
    Form3_can_draw   = true;
    Form3_sprite_idx = 0;
    Ganon2_update_2(); // pc lock control
    if (timer) break;
    
    
    if (timer2&$1 
    &&  timer2<EXPLOSION_DUR1 ) // EXPLOSION_DUR1=$90
    {
        var _i, _x,_y;
        var _TIME=$0C;
        var               _off  = -$6;
        if (timer2<_TIME) _off += -$C;
        var    _COUNT = 1 + inRange(timer2,_TIME,$40); // extra drama
        for(_i=_COUNT-1; _i>=0; _i--)
        {
            if (avail_uidx_goc(MAX_GOC1)==UIDX_NULL) break;
            
            if(!_i && _COUNT>1)    _off = -((ww_+_off) div 3);
            _x  = x + (irandom(ww_+_off)*sign_(irandom(1)));
            _y  = y + (irandom(hh_+_off)*sign_(irandom(1)));
            _x  = clamp(_x, xl+abs(_off),xr-abs(_off));
            _y  = clamp(_y, yt+abs(_off),yb-abs(_off));
            _x -= 8; // xl
            _y -= 7; // yt
            GOC1_create(_x,_y, facing_dir, BossExplosion,1, id);
        }
    }
    
    
    if (timer1==1)
    {
        timer1=0;
        
        var                     _DURATION = g.BOSS_DEATH_FLASH_CUE;
        p.Flash_Pal_timer     = _DURATION;
        p.Flash_Bgr_timer     = _DURATION;
        p.SpellFlash_PC_timer = _DURATION;
        aud_play_sound(get_audio_theme_track(STR_Boss+STR_Explode));
        
        g.ScreenShake_timer = max($10, timer2-$10);
    }
    
    if (g.ScreenShake_timer)
    {   var                          _IN_RANGE = inRange(g.ScreenShake_timer, $08,$40);
        g.ScreenShake_strength_x = 2+_IN_RANGE;
        g.ScreenShake_strength_y = 1+_IN_RANGE;
    }
    
    
    can_draw_self = false;
    if (timer2>=EXPLOSION_CUE6) // EXPLOSION_CUE6 = $30
    {
        if (timer2>=EXPLOSION_CUE7  // EXPLOSION_CUE7 = $48
        ||  timer2&$2 ) // fade effect
        {
            update_EF11();
        }
        Ganon2_update_1(); // clamp pc x
    }
    else
    {
        if (timer2<EXPLOSION_CUE6-$10)
        {
            //vspd_grav=2;
            //updateY();
        }
        
        if(!Crystal_detatched)
        {
            Crystal_detatched = true;
            // make sure crystal is set to home spot on stone Ganon
            Crystal_x = x + dg_Positions[#Crystal_position,$00];
            Crystal_y = y + dg_Positions[#Crystal_position,$01];
        }
    }
    
    
    if(!timer2)
    {
        can_draw_self = false;
        
        timer1 = $30; // Delay crystal drop
        timer  = 0;
        //timer  = $20;
        sub_state = sub_state_NextForm_FALL;
    }
    break;}//case sub_state_EXPLODE_BODY
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_NextForm_FALL:{ // slime fall to ground
    can_draw_self    = false;
    Crystal_can_draw = g.counter1 & Crystal_TIMING1;
    Form3_can_draw   = true;
    Form3_sprite_idx = 0;
    if (timer) break;
    
    
    if(!timer1) // delay crystal drop. ** i think the slime actually makes it to the ground before the crystal starts falling
    {
        Ganon2_update_5(y+Crystal_YOFF1); // update Crystal_vspd & Crystal_y
    }
    
    // update slime falling to ground
    vspd_grav = VSPD_GRAV;
    updateY();
    if (Ganon2_update_4()) // return y+Slime_H_ >= GROUND_Y;
    {
        vspd_grav = 0;
        set_xy(id, x,GROUND_Y-Slime_H_);
        
        g.ScreenShake_timer      = $8;
        g.ScreenShake_strength_x = 0;
        g.ScreenShake_strength_y = 1;
        
        timer2 = Form3_DURATION1; // jiggle after landing. Form3_DURATION1=$40
        timer  = 0;
        sub_state = sub_state_NextForm_LEAVE1;
    }
    break;}//case sub_state_NextForm_FALL
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_NextForm_LEAVE1:{ // crystal fall to slime
    Crystal_can_draw = true;
    Form3_can_draw   = true;
    Form3_sprite_idx = 0;
    Ganon2_update_5(y+Crystal_YOFF1); // update Crystal_vspd & Crystal_y
    if (timer)  break;
    if (timer2) break; // jiggle timer
    
    
    if (Crystal_y>=y+Crystal_YOFF1) // if crystal has reached skull forehead
    //if (Crystal_y>=Crystal_Y1)
    {
        Crystal_x = x;
        Crystal_y = y+Crystal_YOFF1;
        
        timer2 = $8+Form3_DURATION2+$8; // Tease Ganon skull. Form3_DURATION2=$10
        timer  = 0;
        sub_state = sub_state_NextForm_LEAVE2;
    }
    break;}//case sub_state_NextForm_LEAVE1
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_NextForm_LEAVE2:{ // Flash solid and transparent slime sprite to tease Ganon skull
    Crystal_can_draw = true;
    Form3_can_draw   = true;
    Form3_sprite_idx = 0;
    if (timer) break;
    
    
    Crystal_x = x;
    Crystal_y = y+Crystal_YOFF1;
    
    if (timer2)
    {
        if (timer2==$8+Form3_DURATION2)
        {
            aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
            aud_play_sound(get_audio_theme_track(dk_StrikeEnemy), 0,false, .5);
            timer1     = Form3_DURATION2;
            stun_timer = timer1;
        }
        
        if ( timer1 
        && !(timer1&$2) )
        {   // Tease Ganon skull
            Form3_sprite_idx = 1; // transparent spr
        }
    }
    else
    {
        timer = 0;
        sub_state = sub_state_NextForm_LEAVE;
    }
    break;}//case sub_state_NextForm_LEAVE2
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_NextForm_LEAVE:{ // slime hops right until off screen
    Crystal_can_draw = true; // this technically doesnt need to be here because solid slime sprite draws over crystal
    Form3_can_draw   = true;
    Form3_sprite_idx = 0;
    if (timer) break;
    
    
    Crystal_x = x;
    Crystal_y = y+Crystal_YOFF1;
    
    vspd_grav = VSPD_GRAV;
    if (Ganon2_update_4()) // returns: y+Slime_H_ >= GROUND_Y
    {
        off_ground_reason = 0;
        set_xy(id, x,GROUND_Y-Slime_H_);
        vspd = 0;
        
        if (Ganon2_update_6a($20,1)) // if(!irandom($7)) JUMP/HOP !!!!!!!!!!!
        {
            updateX();
            updateY();
            aud_play_sound(Jump_SOUND1);
        }
    }
    else
    {
        updateX();
        updateY();
    }
    //Ganon2_update_8a($20,1); // update x, y, jump
    
    if (Ganon2_update_4()  // return y+Slime_H_ >= GROUND_Y;
    && !rectInView(x-Slime_W_,y-Slime_H_, Slime_W_<<1,Slime_H_<<1) )
    {
        g.pc_lock = 0;
        
        timer = 0;
        //timer = $20;
        sub_state = sub_state_DONE;
    }
    break;}//case sub_state_NextForm_LEAVE
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_DIALOGUE2:{
    if (timer) break;
    break;}//case sub_state_DIALOGUE2
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    case sub_state_DONE:{
    if (timer) break;
    
    
    g.pc_lock = 0;
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}//case sub_state_DONE
}//switch(sub_state)








if (sub_state<sub_state_EXPLODE_BODY)
{
    Ganon2_update_3(); // update; udp, cs, body hb, cam vars
}




