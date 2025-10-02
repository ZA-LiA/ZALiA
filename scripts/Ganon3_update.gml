/// Ganon3_update()


if (timer1) timer1--;
if (timer2) timer2--;
if (timerA) timerA--;


if (RoarCooldown_timer)
{   RoarCooldown_timer--;  }

if (RoarDelay_timer)
{
    RoarDelay_timer--;
    if(!RoarDelay_timer)
    //if(!RoarDelay_timer 
    //&&  SkullClingState==SkullClingState_FREE )
    {
        aud_play_sound(Audio.SND_BOSS_ROAR);
    }
}

if (Explosion_timer)
{   Explosion_timer--;  }


//if (fanfare_failsafe_timer)
//{   fanfare_failsafe_timer--;  }


SkullClingState = SkullClingState_CLING;

/*
if (SlimeChange_timer)
{
    SlimeChange_timer--;
    if(!SlimeChange_timer) SPRITES_idx = !SPRITES_idx;
}
*/

/*  Moved this to Audio_update() bc body won't play after intro if pause menu is open
if (MusicBattleIntro_started 
&& !MusicBattleBody_started 
&&  MusicBattle_BODY==Audio.MUS_BOSS_2A_BODY 
&& !audio_is_playing(MusicBattle_BODY) 
&& !audio_is_playing(MusicBattle_INTRO) )
{
    aud_play_sound(  MusicBattle_BODY, Audio.PRI_TOP, true);
    MusicBattleBody_started  = true;
}
*/
// -------------------------------------------------------------------
// TODO: Create new projectile object
//Ganon3_ProjRain_update();



switch(sub_state)
{
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_PHASE1:{ // Spawns from Ganon2
    if (timer) break;
    
    //timer = 0;
    //sub_state = sub_state_INTRO1;
    break;}
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_PHASE2:{ // scene before battle scene
    //if (timer) break;
    if (g.EnterRoom_control_timer) break;
    
    Crystal_x = x;
    Crystal_y = y;
    
    Ganon2_update_6($20,1); // update x, y, jump
    
    if (Ganon2_update_4()  // returns: y+Form3_H_ >= GROUND_Y;
    &&  xl>g.rm_w )
    {
        f.dm_quests[?object_get_name(Ganon3)+STR_Phase+"02"] = 1;
        
        timer = 0;
        sub_state = sub_state_DONE;
    }
    break;}
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_PHASE3:{ // falling1, rm below battle rm
    if (timer) break;
    //timer = 0;
    //sub_state = sub_state_INTRO1;
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_PHASE4:{ // falling2, rm below falling1
    if (timer) break;
    //timer = 0;
    //sub_state = sub_state_INTRO1;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_RM_ENTER:{
    if (timer) break;
    if (g.EnterRoom_control_timer) break;
    
    timer = 0;
    sub_state = sub_state_INTRO1;
    //sub_state = sub_state_DIALOGUE1;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_DIALOGUE1:{
    if (timer) break;
    
    timer = 0;
    sub_state = sub_state_INTRO1;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_INTRO1:{
    if (timer) break;
    
    if (abs(g.pc.x-x) < $13<<3)
    {
        g.pc_lock = PC_LOCK_ALL;
        
        timer = 0;
        sub_state = sub_state_INTRO2;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_INTRO2:{
    if (timer) break;
    
    if (DoorBlocks_count<DoorBlocks_COUNT)
    {
        if!(g.counter1&$F)
        {   // Add solid blocks to block exit
            var _i, _x,_y;
            for(_i=0; _i<4; _i++)
            {
                _x = (Door_xl>>3) + (_i&1);
                _y =((Door_yt>>3) + (DoorBlocks_count<<1)) + (_i>1);
                _x = _x<<3;
                _y = _y<<3;
                tile_change_1a(DEPTH_BG3, _x,_y, ts_DungeonH01, $EE+((_i>$1)<<4)+(_i&$1), TID_SOLID1);
                //tile_change_1a(DEPTH_BG3, _x,_y, ts_Man_made_1a_WRB, $34+_i, TID_SOLID1);
            }
            
            DoorBlocks_count++;
            aud_play_combo1($D);
            //aud_play_sound(Audio.SND_BLOK_BRK1);
        }
    }
    else
    {
        timer = $10;
        sub_state = sub_state_INTRO3;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_INTRO3:{
    if (timer) break;
    
    g.pc_lock=0;
    
    Boss_play_battle_music();
    
    BattleState = BattleState_DECIDE_ATTACK;
    timer = 0;
    //timer = $10;
    sub_state = sub_state_BATTLE;
    break;}
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_BATTLE:{
    //if (timer) break;
    
    if (Ganon3_update_battle())
    {
        aud_play_sound(get_audio_theme_track(dk_EnemyDeath), 0,false, .7);
        audio_group_stop_all(audiogroup_mus);
        Audio.can_play_mus_rm_body = false; // Prevent music until take key
        Audio.can_play_boss_music  = false;
        
        stun_timer = timer2-(EXPLOSION_DUR3-$10); // body flash dur
        
        timer = 0;
        sub_state = sub_state_POST_BATTLE1;
    }
    else
    {
        // *** 2024/01/03. MusicBattle_BODY did not play after intro in 2024/01/02 stream and I'm not sure why so this is a failsafe.
        if (Audio.can_play_boss_music 
        && !audio_is_playing(MusicBattle_BODY) )
        {
            if(!MusicBattle_INTRO 
            || !audio_is_playing(MusicBattle_INTRO) )
            {
                aud_play_sound(MusicBattle_BODY,  Audio.PRIORITY_TOP, true, -1, MusicBattle_THEME);
            }
        }
    }
    break;}
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_POST_BATTLE1:{
    if (timer) break;
    
    
    switch(DEV_BattleEnding_current)
    {
        case 1:{// ---------------------------------
        updateY();
        vspd = clamp(vspd, vspd_grav,$7F-vspd_grav);
        
        var            _Y=g.rm_h+$40;
        if (     yt >= _Y 
        &&  g.pc.yt >= _Y )
        {
            with(Exit)
            {
                if (side&$4)
                {
                    g.exit_leave=id;
                    break;
                }
            }
            
            
            if (g.exit_leave!=noone)
            {
                state = 0;
                
                timer = 0;
                sub_state = sub_state_DONE;
                //sub_state = sub_state_POST_BATTLE2;
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
        break;}
        
        
        case 2:{// ---------------------------------
        despawn_all_goc();
        aud_play_combo1($C); // death sound
        stun_timer  = $28; // stun flash
        stun_timer += $10; // timing tweek
        
        timer = stun_timer>>1; // delay explode
        sub_state = sub_state_POST_BATTLE2;
        break;}
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_POST_BATTLE2:{
    if (timer) break;
    
    Explosion_timer = EXPLOSION_DUR2; // EXPLOSION_DUR2: EXPLOSION_DUR1($90)+$10
    timer1   =(Explosion_timer-EXPLOSION_CUE2)+1; // $29. explode sound delay. EXPLOSION_CUE2=EXPLOSION_DUR1-$18
    timer = 0;
    sub_state = sub_state_EXPLODE_BODY;
    break;}
    
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_POST_BATTLE3:{
    if (timer) break;
    timer = 0;
    sub_state = sub_state_EXPLODE_BODY;
    break;}
    
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_EXPLODE_BODY:{
    if (timer) break;
    
    if (Explosion_timer&$1 
    &&  Explosion_timer<EXPLOSION_DUR1 ) // EXPLOSION_DUR1=$90
    {
        var _i, _x,_y;
        var    _COUNT = 1 + inRange(Explosion_timer,$0C,$40); // extra drama
        for(_i=_COUNT-1; _i>=0; _i--)
        {
            if (avail_uidx_goc(MAX_GOC1)==UIDX_NULL) break;
            
            _x  = Skull_x + (irandom($B)*sign_(irandom(1)));
            _y  = Skull_y + (irandom($B)*sign_(irandom(1)));
            _x -= 8; // xl
            _y -= 7; // yt
            GOC1_create(_x,_y, facing_dir, BossExplosion,1, id);
        }
        
        if (Explosion_timer>EXPLOSION_DUR1-$28)
        {
            if (avail_uidx_goc(MAX_GOC1)==UIDX_NULL) break;
            
            _x  = x + (irandom(ww_-1)*sign_(irandom(1)));
            _y  = y + (irandom(hh_-1)*sign_(irandom(1)));
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
    
    
    /*
    canDrawSelf = false;
    if (Explosion_timer>=EXPLOSION_CUE6) // EXPLOSION_CUE6 = $30
    {
        if (Explosion_timer>=EXPLOSION_CUE7  // EXPLOSION_CUE7 = $48
        ||  Explosion_timer&$2 ) // fade effect
        {
            //update_EF11();
        }
    }
    */
    
    if(!Explosion_timer)
    {
        can_draw_self = false;
        //g.pc_lock = PC_LOCK_ALL;
        
        audio_stop_sound(Audio.mus_rm_inst);
        
        timer = $60; // delay fanfare
        sub_state = sub_state_FANFARE_PRE1;
        //sub_state = sub_state_FANFARE;
        //sub_state = sub_state_DIALOGUE2;
    }
    break;}
    
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_DIALOGUE2:{
    if (timer) break;
    timer = 0;
    sub_state = sub_state_DONE;
    break;}
    
    
    
    
    
    
    
// ==================================================================
    // -----------------------------------------------------------
    case sub_state_FANFARE_PRE1:{
    //if (timer==1) aud_play_sound(Audio.MUS_VICTORY_1);
    if (timer) break;
    if (g.pc.ogr) break;
    
    with(g.pc)
    {
        set_xy(id, x, other.GROUND_Y-hh_);
        hspd=0;
        vspd=0;
        PC_set_behavior(behavior_IDLE);
    }
    g.pc_lock = PC_LOCK_ALL;
    
    aud_play_sound(Fanfare_MUSIC, -1,false,-1, Fanfare_THEME);
    //fanfare_failsafe_timer  = round(audio_sound_length(Fanfare_MUSIC)*ROOM_SPEED_BASE);
    //fanfare_failsafe_timer += 8;
    
    timer = 0;
    sub_state = sub_state_FANFARE;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_FANFARE:{
    if (fanfare_failsafe_timer)
    {   fanfare_failsafe_timer--;  }
    
    if (timer) break;
    
    if(!fanfare_failsafe_timer 
    || !audio_is_playing(Fanfare_MUSIC) )
    {
        timer = $60; // delay exiting rm
        sub_state = sub_state_FANFARE_DONE;
    }
    /*
    if (timer==1) aud_play_sound(Audio.MUS_VICTORY_1);
    if (timer) break;
    
    if (g.pc.ogr) break;
    with(g.pc)
    {
        set_xy(id, x, other.GROUND_Y-hh_);
        hspd=0;
        vspd=0;
        PC_set_behavior(BVR_IDLE);
    }
    g.pc_lock = PC_LOCK_ALL;
    
    if(!audio_is_playing(Audio.MUS_VICTORY_1) 
    || !fanfare_failsafe_timer )
    {
        timer = $60; // delay exiting rm
        sub_state = sub_state_FANFARE_DONE;
    }
    */
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_FANFARE_DONE:{
    if (timer) break;
    
    timer = 0;
    sub_state = sub_state_EXIT_RM;
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_EXIT_RM:{
    if (timer) break;
    
    g.game_end_state=0;
    with(Exit)
    {
        if (exitNum&$F0==g.EXIT_DIR_MID)
        {
            g.exit_leave=id;
            sdm("exit door");
            
            g.cutscene_part=0;
            g.game_end_state=1;
            break; // with(Exit)
        }
    }
    
    if (g.game_end_state)
    {
        timer = 0;
        sub_state = sub_state_DONE;
    }
    break;}
    
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case sub_state_DONE:{
    if (timer) break;
    
    //
    
    //timer = 0;
    //sub_state = sub_state_INTRO1;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
}







if (SkullClingState==SkullClingState_CLING 
&&  sub_state<=sub_state_BATTLE )
{
    Skull_x=x;
    Skull_y=y;
}



update_EF11();
GO_update_cs();

Ganon3_Fire_update();
Ganon3_ProjRain_update();




