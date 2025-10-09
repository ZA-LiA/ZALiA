/// Cutscene_ShadowBoss_2_update()


if (g.ChangeRoom_timer>0 
||  g.EnterRoom_SpawnGO_timer )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if(!ARENA_X)
{
    with(BOSS_OBJ) other.ARENA_X = arena_x;
}


if (f.quest_num>=2)
{
    Boss_can_draw   = false;
    Bottle_can_draw = false;
    Blood_can_draw  = false;
}


// 97C6: JSR A4C4.  Triforce flash
triforce_pal_update();







// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
switch(sub_state)
{
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_BATTLE1:{
    if(!Cutscene_ShadowBoss_update_1a()) // if boss IS NOT defeated
    {
        break;//case sub_state_BATTLE1
    }
    
    // ShadowBoss-98BA -------------------------------------------------
    // Audio will be 1 frame late. Normally played in boss update.
    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
    audio_stop_sound(Audio.mus_rm_inst);
    Audio.can_play_boss_music=false;
    
    var                     _DURATION = $30 - 1;
    p.Flash_Pal_timer     = _DURATION;
    p.Flash_Bgr_timer     = _DURATION;
    p.SpellFlash_PC_timer = _DURATION;
    
    g.cutscene_timer = $40 - 1;
    g.cutscene_part  = 1;
    g.cutscene       = 1;
    sub_state = sub_state_POST_BATTLE1;
    break;}//case sub_state_BATTLE1
    
    
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_POST_BATTLE1:{ // ShadowBoss-9B3A -------------------------------------------------
    if (p.Flash_Bgr_timer==$01)
    {
        change_pal(p.pal_rm_def);
        //var            _pi = global.PI_MOB_RED;
        //with(BOSS_OBJ) _pi = palidx_def;
        
        var _PAL = build_pal(p.C_GRY1,p.C_GRY4,p.C_BLK1,p.C_BLK1,-2,-2,-2,-2);
        change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(Boss_PI), string_length(_PAL), _PAL));
        global.BackgroundColor_scene = p.C_BLK1;
    }
    
    if (g.cutscene_timer) break;//case sub_state_POST_BATTLE1
    
    
    
    if(!global.pc.ogr)
    {
        with(global.pc)
        {
            solid_clip_correction(false); // Make sure not in ground
            hspd = 0; // mod
            g.pc_lock = PC_LOCK_ALL; // Lock all
        }
        
        
        g.cutscene_timer = $80;
        g.cutscene_part++;
        sub_state = sub_state_WALK_PC;
    }
    break;}//case sub_state_POST_BATTLE1
    
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_WALK_PC:{ // ShadowBoss-9B53 -------------------------------------------------
    if (g.cutscene_timer)
    {
        if (global.pc.behavior!=global.pc.behavior_CROUCH) PC_set_behavior(global.pc.behavior_IDLE);
        break;//case sub_state_WALK_PC
    }

    
    
    // ------------------------------------------------------
    if (f.quest_num>=2) var _TARGET_X = ARENA_X - ($02<<3);
    else                var _TARGET_X = ARENA_X;
    
    
    g.pc_lock = PC_LOCK_ALL
    global.pc.WalkTo_active   = true;
    global.pc.WalkTo_x        = _TARGET_X;
    global.pc.WalkTo_hspd_max = $10; // $10 max hspd. Should limit speed to 1 pixel per frame
    
    if (global.pc.x==_TARGET_X)
    {
        global.pc.WalkTo_active = false;
        
        set_xy(global.pc, _TARGET_X, global.pc.y);
        global.pc.hspd = 0;
        
        PC_set_behavior(global.pc.behavior_IDLE);
        global.pc.xScale = 1;
        
        if (f.quest_num>=2) var _X = ARENA_X + (ARENA_X-global.pc.x);
        else                var _X = global.pc.x + ($03<<3);
        with(TK_OBJ) // TK: Triforce Keeper
        {
            set_xy(id, _X, GROUND_Y-hh_);
            update_draw_xy();
        }
        
        
        g.cutscene_timer = $D4 + g.timer_b; // 2 + (6 * 21) + (4 * 21) = 212($D4)
        
        g.cutscene_part++;
        sub_state = sub_state_REVEAL_TK;
    }
    break;}//case sub_state_WALK_PC
    
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_REVEAL_TK:{ // ShadowBoss-9B98 -------------------------------------------------
    var _CUE1 = $03;
    
    with(TK_OBJ) // TK: Triforce Keeper
    {   // 9B9C
        tri_can_draw = 0;
        sub_state = 0;
        
        if (inRange(g.cutscene_timer, _CUE1,$81))
        {
            var _CUE2=$43;
            if (g.cutscene_timer<_CUE2 
            ||  g.counter1&$1 )  // Fade-in effect
            {
                // Need to update these here. Cutscenes update after GO
                if (f.quest_num==1 
                &&  g.cutscene_timer<_CUE2 )
                {
                    tri_can_draw = 2; // 2: position over TK head
                    tri_xOff     = 2 * xScale; // centers on keeper body mass looks better
                    tri_yOff     = -hh; // should sit right on top of keeper
                }
                GO_set_sprite(id, SPR_IDLE);
                
                sub_state = 1; // will draw TriforceKeeper. See NPC_step_6a()
            }
        }
    }
    
    
    // 9B91
    if (g.cutscene_timer>=_CUE1)
    {
        break;//case sub_state_REVEAL_TK
    }
    
    
    
    
    
    // 9B74
    var                     _DURATION = $40;
    p.Flash_Pal_timer     = _DURATION;
    p.Flash_Bgr_timer     = _DURATION;
    p.SpellFlash_PC_timer = _DURATION;
    g.timer_b1            = $15; // decrements every $15 frames. $15 * $15 = $1B9(441)
    
    
    audio_stop_sound(Audio.mus_rm_inst);
    if (f.quest_num==1) aud_play_sound(get_audio_theme_track(dk_GameClear), -1,false,-1, dk_GameClear);
    
    
    with(TK_OBJ)
    {
        tri_can_draw = 0;
        sub_state = 0;
    }
    
    g.cutscene_part++;
    if (f.quest_num==1)
    {
        sub_state = sub_state_HOLD_TRIFORCE;
    }
    else
    {
        Boss_x        = ARENA_X;
        Boss_y        = global.pc.y - $10 - $8;
        Boss_Target_y = Boss_y - Boss_Raise_DIST;
        
        Bottle_x      = Boss_x;
        Bottle_y      = global.pc.y - $16;
        
        p.Flash_Pal_timer        = 0;
        p.Flash_Bgr_timer        = 0;
        p.SpellFlash_PC_timer    = 0;
        p.SpellFlash_GOB_timer   = 0;
        p.SpellReady_flash_timer = 0;
        aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
        
        g.cutscene_timer = $40;
        sub_state = sub_state_FILL_BOTTLE1;
    }
    break;}//case sub_state_REVEAL_TK
    
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_HOLD_TRIFORCE:{ // ShadowBoss-9BA8 -------------------------------------------------
    global.pc.xScale = 1;
    
    // 9BB1
    with(TK_OBJ)
    {
        tri_can_draw = 0;
        counter = (counter+1)&$FF; // for sprite frames
        sub_state = 1;
    }
    
    // MOD -------------------------------
    g.pc_lock         = PC_LOCK_ALL;
    triforce_can_draw = 1;
    PC_set_behavior(global.pc.behavior_HOLD_ITEM4);
    if (pc_is_cucco()) global.pc.HoldItem_timer = $FF;
    
    // Triforce fills hp & mp. 
    // w/out this, low hp beep will continue for rest of game.
    var _HP_MAX = get_stat_max(STR_Heart);
    var _MP_MAX = get_stat_max(STR_Magic);
    if (_HP_MAX!=f.hp) g.StatRestore_timer_hp = max($FF,_HP_MAX);
    if (_MP_MAX!=f.mp) g.StatRestore_timer_mp = max($FF,_MP_MAX);
    
    
    
    
    if (g.timer_b1) break;//case sub_state_HOLD_TRIFORCE
    
    
    // -----------------------------------
    // 9BBA
    with(Exit)
    {
        if (exitNum&$F0==g.EXIT_DIR_MID)
        {
            g.exit_leave = id;
            show_debug_message("exit door");
            
            g.cutscene_part  = 0;
            g.game_end_state = 1;
            other.sub_state = other.sub_state_DONE;
            break;//with(Exit)
        }
    }
    break;}//case sub_state_HOLD_TRIFORCE
    
    
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_DONE:{
    if (f.quest_num==1)
    {
        if (g.exit_leave==noone)
        {
            sub_state = sub_state_WALK_PC;
        }
    }
    else
    {
        with(TK_OBJ)
        {
            var _X = other.ARENA_X+($02<<3);
            if (x!=_X)
            {
                var _Y = get_ground_y(_X, viewYC(), 1) - 8;
                set_xy(id, _X,_Y);
            }
        }
    }
    break;}//case sub_state_DONE
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  2ND QUEST  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE1:{
    g.pc_lock = PC_LOCK_ALL;
    
    
    if (Boss_y <= Boss_Target_y+(Boss_Raise_DIST-(Boss_Raise_DIST>>2))) Boss_can_draw = true;
    else                                                                Boss_can_draw = g.counter1&$1; // fade in
    
    if (g.cutscene_timer)
    {   // Reveal ShadowBoss Corpse flash
        var _IDX = (g.cutscene_timer>>1)&$3;
        if(!_IDX) Boss_pi = Boss_PI;
        else      Boss_pi = p.dg_PI_SEQ[#4,_IDX]; // 4: pc spell flash pi's
    }
    else
    {   // Blink slow then increase frequency as corpse slowly raises
        var  _TIMING = $8;
        if (Boss_y < Boss_Target_y+(Boss_Raise_DIST>>2))
        {    _TIMING = _TIMING>>1;  }
        
        if (g.counter1 &  _TIMING 
        &&  g.counter1 & (_TIMING>>1) )
        {    Boss_pi = global.PI_MOB_PUR;  }
        else Boss_pi = Boss_PI;
    }
    
    
    
    if!(g.counter1&$F)
    {   Boss_y--;  }
    
    if (Boss_y <= Boss_Target_y)
    {
        Boss_y  = Boss_Target_y;
        g.cutscene_timer = $20;
        sub_state = sub_state_FILL_BOTTLE2;
    }
    
    break;}//case sub_state_FILL_BOTTLE1
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE2:{
    g.pc_lock = PC_LOCK_ALL;
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    
    // Blink fast during bleeding delay
    var               _TIMING = $4;
    if (g.counter1 &  _TIMING 
    &&  g.counter1 & (_TIMING>>1) )
    {    Boss_pi = global.PI_MOB_PUR;  }
    else Boss_pi = Boss_PI;
    
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE2
    
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    g.cutscene_timer = $30; // stun flash timer
    sub_state = sub_state_FILL_BOTTLE3;
    break;}//case sub_state_FILL_BOTTLE2
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE3:{
    g.pc_lock = PC_LOCK_ALL;
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    
    // Damage flash to indicate skin has been cut
    if (g.cutscene_timer)
    {
        switch((g.cutscene_timer>>1)&$3){
        case 0:{Boss_pi=Boss_PI;break;}
        case 1:{Boss_pi=global.PI_MOB_ORG;break;}
        case 2:{Boss_pi=global.PI_MOB_RED;break;}
        case 3:{Boss_pi=global.PI_MOB_BLU;break;}
        }
    }
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE3
    
    Boss_pi = Boss_PI;
    
    Blood_x      = Boss_x;
    Blood_yt     = Boss_y;
    Blood_h      = $2;
    Blood_yb     = Blood_yt+Blood_h;
    Blood_yb_MAX = Bottle_y+$07;
    
    sub_state = sub_state_FILL_BOTTLE4;
    break;}//case sub_state_FILL_BOTTLE3
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE4:{
    g.pc_lock = PC_LOCK_ALL;
    Blood_can_draw  = true;
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    
    // Flash during bleeding
    var               _TIMING = $2;
    if (g.counter1 &  _TIMING 
    &&  g.counter1 & (_TIMING>>1) )
    {    Boss_pi = global.PI_MOB_PUR;  }
    else Boss_pi = Boss_PI;
    
    
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE4
    
    if!(g.counter1&$7)
    {   Blood_yb = min(Blood_yb+$2, Blood_yb_MAX);  }
    
    if (Blood_yb>=Blood_yb_MAX)
    {
        Blood_yb = Blood_yb_MAX;
        BottleLiquid_level++;
        
        f.dm_quests[?STR_Bottle+"01"+STR_State] = 1; // Indicates bottle has been filled w/ blood.
        sub_state = sub_state_FILL_BOTTLE5;
    }
    
    Blood_h = Blood_yb-Blood_yt;
    break;}//case sub_state_FILL_BOTTLE4
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE5:{
    g.pc_lock = PC_LOCK_ALL;
    Blood_can_draw  = true;
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE5
    
    if!(g.counter1&$F)
    {   BottleLiquid_level++;  }
    
    if (BottleLiquid_level>=6)
    {
        g.cutscene_timer = $20;
        sub_state = sub_state_FILL_BOTTLE6;
    }
    break;}//case sub_state_FILL_BOTTLE5
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE6:{
    g.pc_lock = PC_LOCK_ALL;
    Blood_can_draw  = !(g.counter1&$1);
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE6
    
    Blood_can_draw  = false;
    BottleLiquid_level = 0;
    Bottle_spr  = Bottle_SPR2;
    
    sub_state = sub_state_FILL_BOTTLE7;
    break;}//case sub_state_FILL_BOTTLE6
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_FILL_BOTTLE7:{
    g.pc_lock = PC_LOCK_ALL;
    Boss_can_draw   = true;
    Bottle_can_draw = true;
    if (g.cutscene_timer) break;//case sub_state_FILL_BOTTLE7
    
    if!(g.counter1&$7) Boss_vspd = min(Boss_vspd+1, 7);
    Boss_y += Boss_vspd;
    if (Boss_y>=viewYB()+$30)
    {
        if (pc_is_cucco()) global.pc.HoldItem_timer = $FF;
        
        Bottle_spr = Bottle_SPR2;
        Bottle_x   = global.pc.x;
        Bottle_y   = global.pc.y - $17;
        
        PC_set_behavior(global.pc.behavior_HOLD_ITEM2);
        
        audio_stop_sound(Audio.mus_rm_inst);
        aud_play_sound(get_audio_theme_track(dk_GetItem+"01"), -1,false,-1, dk_GetItem+"01");
        g.cutscene_timer = $C0;
        sub_state = sub_state_HOLD_BOTTLE;
    }
    break;}//case sub_state_FILL_BOTTLE7
    
    
    
    
    
    
    // ======================================================================================
    // ----------------------------------------------------------------------------------
    case sub_state_HOLD_BOTTLE:{
    Bottle_can_draw = true;
    if (g.cutscene_timer) break;//case sub_state_HOLD_BOTTLE
    
    
    var _HP_MAX = get_stat_max(STR_Heart);
    var _MP_MAX = get_stat_max(STR_Magic);
    if (_HP_MAX!=f.hp) g.StatRestore_timer_hp = max($FF,_HP_MAX);
    if (_MP_MAX!=f.mp) g.StatRestore_timer_mp = max($FF,_MP_MAX);
    
    PC_set_behavior(global.pc.behavior_IDLE);
    g.pc_lock = 0;
    global.pc.hspd = 0;
    
    g.cutscene     = 0;
    g.cutscene_ctr = 0;
    
    g.view_lock &= ~g.view_lock_boss;
    g.view_lock_boss = 0; // need this or view edges act as solids (can't leave rm)
    
    sub_state = sub_state_DONE;
    break;}//case sub_state_HOLD_BOTTLE
}//switch(sub_state)






if (f.quest_num>=2 
&&  sub_state>sub_state_REVEAL_TK )
{
    with(TK_OBJ)
    {
        if (other.sub_state<other.sub_state_HOLD_BOTTLE)
        {    counter = (counter+1)&$FF;  } // for sprite frames
        else counter = $18; // idle/mouth closed
        
        if (other.sub_state==other.sub_state_DONE) sub_state = 2; // For dialogue
        else                                       sub_state = 1;
    }
}




