/// NPC_B_update()

// MiniGame NPC


hspd = 0;
if(!NPC_update_1()) // when talking update
{   // when NOT talking
    Merchant_update_1(); // update_EF11(), set facingDir, counter = 0;
    if (sub_state==sub_state_IDLE 
    ||  sub_state==sub_state_DONE )
    {
        NPC_update_2(); // collision, enter restore house, start dlg
    }
}



if (ver==3) // Pogo to Top challenge
{
    if (    Minigame_timer)
    {
            Minigame_timer--;
        if(!Minigame_timer)
        {   // Destroy all Blooby so PC cannot continue challenge w/out paying again.
            with(Blooby) damage_gob(id, max(hp,0), false);
        }
    }
}












// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
switch(sub_state)
{
    // ============================================================
    // ----------------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;
    
    prize_num    = 0;
    dialogue_ver = "A";
    
    Minigame_timer = 0;
    Minigame_display_timer_can_draw = false;
    
    if (is_talking 
    &&  g.dialogue_source==id )
    {
        g.gui_state = g.gui_state_DIALOGUE3;
        sub_state   = sub_state_OFFER;
    }
    break;}
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_OFFER:{ // Player is offered to play minigame with "YES" or "NO" options.
    if (timer) break;
    if (g.gui_state!=g.gui_state_NONE) break;
    
    Minigame_display_timer_can_draw = false;
    
    // A choice has been made.
    if (g.DIALOGUE_WINDOW.cursor_option==Input.L)
    {   // "YES". Player accepted offer to play minigame.
        if (f.xp >= COST)
        {
            f.xpDrain += COST;
            
            if (ver==3) // Pogo to Top challenge
            {
                if (pc_is_fairy() 
                || (pc_is_cucco() && !(f.Cucco_skills&f.CuccoSkill_THRUST_D)) )
                {
                    g.spells_active &= ~SPL_FARY;
                    
                    var                     _DURATION = p.SpellFlash_DURATION1; // SpellFlash_DURATION1=$20. bit $80 mean flash bgr
                    p.Flash_Pal_timer     = _DURATION;
                    p.SpellFlash_PC_timer = _DURATION;
                    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
                    
                    with(g.pc)
                    {
                        PC_update_1a(); // set properties specific to PC form(cucco, fairy, Lonk)
                        set_xy(id, x, other.yb-hh_);
                    }
                }
                
                
                //g.pc_lock = PC_LOCK_ALL & ~PC_LOCK_VSPD;
                with(LoDoA) counter = -1; // Starts opening process
                
                timer     = 0;
                sub_state = sub_state_UNLOCK;
                break;
            }
            else
            {
                if (ver==2) g.StatRestore_timer_hp = max($FF, get_stat_max(STR_Heart)); // HP
                minigame_inst = GameObject_create(MINIGAME_X-8,yt, MINIGAME_OBJ,MINIGAME_VER);
            }
            
            // Go to 'during minigame' state.
            sub_state = sub_state_GAME;
        }
        else
        {
            NPC_activate_dialogue(); // Open Dialogue
            
            // Not enough money.
            sub_state = sub_state_LOWP;
        }
    }
    else
    {   // "NO". Player declined minigame offer.
        sub_state = sub_state_IDLE;
    }
    break;}
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_LOWP:{ // Not enough P (money)
    Minigame_display_timer_can_draw = false;
    
    dialogue_ver = "B";
    
    if (timer) break;
    if (g.gui_state!=g.gui_state_NONE) break;
    
    timer     = 0;
    sub_state = sub_state_IDLE;
    break;}
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_UNLOCK:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = false;
    
    if (timer) break;
    if (instance_exists(LoDoA)) break;
    
    timer     = 0;
    sub_state = sub_state_WALK_PC;
    break;}
    
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_WALK_PC:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = false;
    
    if (timer) break;
    if (g.pc.ogr) break;
    
    timer     = 1; // Delay game start sound
    sub_state = sub_state_PRE_GAME1;
    break;}
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_PRE_GAME1:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = false;
    
    if (timer) break;
    
    
    Minigame_timer = max(0, Minigame_DUR1-1);
    Minigame_display_timer_can_draw = true;
    
    aud_play_sound(SND_GAME_START);
    audio_group_stop_all(audiogroup_mus);
    Audio.can_play_mus_rm_body = false;
    Audio.can_play_boss_music  = false;
    
    
    timer  = round(audio_sound_length(SND_GAME_START)*room_speed);
    timer += 2;
    //timer  = audio_sound_length(SND_GAME_START)*room_speed;
    sub_state = sub_state_PRE_GAME2;
    break;}
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_PRE_GAME2:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = true;
    
    if (timer 
    &&  audio_is_playing(SND_GAME_START) )
    {
        break;
    }
    timer = 0;
    
    
    var _i, _x,_y;
    var _POSITIONS = "6F2C"+"5E2C"+"4D25"+"3C28"+"2C24"+"232C"+"1527";
    //var _POSITIONS = "6A2C"+"592C"+"4A25"+"3928"+"2924"+"232C"+"1527";
    for(_i=(string_length(_POSITIONS)>>2)-1; _i>=0; _i--)
    {
        _x=str_hex(string_copy(_POSITIONS,(_i<<2)+3,2))<<3;
        _y=str_hex(string_copy(_POSITIONS,(_i<<2)+1,2))<<3;
        with(GameObject_create(_x,_y, Blooby,1))
        {
            hspd=0;
            with(GOC1_create(xl+4,yt, 1, BossExplosion,1, id))
            {
                GO_depth_init(other.depth-1);
            }
        }
    }
    aud_play_sound(Audio.SND_STEP_1A);
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    
    aud_play_sound(MUS_GAME_ACTIVE, Audio.PRIORITY_TOP, true, -1, MUS_GAME_THEME);
    
    
    timer     = 0;
    sub_state = sub_state_GAME;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    // ============================================================
    // ============================================================
    // ============================================================
    // ============================================================
    // ----------------------------------------------------
    case sub_state_GAME:{
    Minigame_display_timer_can_draw = true;
    
    if (ver==3) // Pogo to Top Minigame Challenge
    {
        g.pc_lock = 0;
        NPC_B_update_1();
        break;
    }
    
    
    
    if (minigame_inst.sub_state == minigame_inst.ST_SUB1_NPC1) // minigame_inst has signaled game is done
    {
        var _POINTS = minigame_inst.points;
        var _MAX    = minigame_inst.POINTS_MAX;
        
             if (_POINTS>=_MAX-POINTS_PRIZE_1) prize_num = 1;
        else if (_POINTS>=_MAX-POINTS_PRIZE_2) prize_num = 2;
        else if (_POINTS>=_MAX-POINTS_PRIZE_3) prize_num = 3;
        else                                   prize_num = 0;
        
        
        if (prize_num) dialogue_ver = "C";
        else           dialogue_ver = "D";
        NPC_activate_dialogue(); // Open Dialogue
        
        timer     = 0;
        sub_state = sub_state_RESULT;
    }
    break;}
    // ----------------------------------------------------
    // ============================================================
    // ============================================================
    // ============================================================
    
    
    
    
    
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_POST_GAME1:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = true;
    
    if (timer) break;
    
    aud_play_sound(      SND_GAME_DONE);
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    audio_group_stop_all(audiogroup_mus);
    
    
    timer  = round(audio_sound_length(SND_GAME_START)*room_speed);
    timer += 2;
    //timer  = audio_sound_length(SND_GAME_START)*room_speed;
    sub_state = sub_state_POST_GAME2;
    break;}
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_POST_GAME2:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = true;
    
    if (timer 
    &&  audio_is_playing(SND_GAME_DONE) )
    {
        break;
    }
    timer = 0;
    
    
    if (Minigame_timer) Minigame_timer = 1;
    
    
    timer     = $10; // $10: 0.267s Let rm music play some before opening dlg
    sub_state = sub_state_POST_GAME3;
    break;}
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_POST_GAME3:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = !!Minigame_timer;
    
    if (timer) break;
    
    Audio.can_play_mus_rm_body = true;
    
    timer     = 0;
    sub_state = sub_state_POST_GAME4;
    break;}
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_POST_GAME4:{ // Pogo to Top challenge
    Minigame_display_timer_can_draw = sign(Minigame_timer);
    
    if (timer) break;
    
    
    timer     = 0;
    sub_state = sub_state_DONE;
    break;}
    
    
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_RESULT:{
    if (timer) break;
    if (g.gui_state!=g.gui_state_NONE) break;
    
    
    if (prize_num)
    {
        if (ver==1 
        ||  ver==2 )
        {
            var _i, _X,_Y;
            _X = PRIZE_1_CLM + ((PRIZE_AREA_CLMS+PRIZE_AREAS_PAD)*(prize_num-1));
            _X = _X<<3;
            _Y = (g.rm_rows-PAGE_ROWS)+$0A;
            _Y = _Y<<3;
            for(_i=0; _i<PRIZE_AREA_CLMS; _i++)
            {   // Remove tiles under prize so it falls to the floor.
                tile_change_1a(DEPTH_BG4, _X+(_i<<3),_Y, 0,0, 0);
            }
            
            aud_play_sound(get_audio_theme_track(dk_BlockBreak));
            aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
        }
        
        timer     = 0;
        sub_state = sub_state_DONE;
    }
    else
    {
        timer     = 0;
        sub_state = sub_state_IDLE;
    }
    break;}
    
    
    
    
    
    /*
    // ============================================================
    // ----------------------------------------------------
    case sub_state_WINNER:{
    if (timer) break;
    // If a prize is won, player will have to refresh rm to play again.
    break;}
    */
    
    
    
    
    
    // ============================================================
    // ----------------------------------------------------
    case sub_state_DONE:{ // Player will have to refresh rm to play again.
    Minigame_display_timer_can_draw = sign(Minigame_timer);
    if (timer) break;
    dialogue_ver = "E"; // "COME BACK ANY TIME"
    break;}
}//switch(sub_state)
// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




