/// Cutscene_ShadowBoss_1_update()


if (g.ChangeRoom_timer > 0 
||  g.EnterRoom_SpawnGO_timer )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






if(!g.cutscene 
&& !Cutscene_ShadowBoss_update_1a() )  // if Boss NOT defeated yet
{   // 97DE, 97E0: JSR EF11
    with(TK_OBJ)
    {
        if (f.quest_num>=2) set_xlyt(id, spawn_x-$10, spawn_y);
        
        counter = (counter+1)&$FF;
        if (f.quest_num==1) tri_can_draw = 1;
        
        // canDrawSelf gets set to false before draw so 
        // changing sub_state will give the indication.
        sub_state = 1;
    }
    
    // 97E3
    var             _ARENA_X = g.rm_w_;
    with(BOSS_OBJ)  _ARENA_X = arena_x;
    if (viewXC() >= _ARENA_X)
    {
        set_camera_xy(_ARENA_X-viewW_(), viewYT()); // Snap to section
        g.view_lock_boss = $3;
        g.view_lock |= (g.view_lock_boss | g.view_lock_rm);
        
        
            g.pc.hspd = 0;
        if(!g.pc.ogr)
        {
            with(g.pc)
            {
                solid_clip_correction(false);
                PC_set_behavior(behavior_IDLE);
                xScale = 1;
            }
            
            
            g.pc_lock       = PC_LOCK_ALL; // Lock all
            g.cutscene      = 1;
            g.cutscene_part = 1;
            g.cutscene_timer  = $FF;
            
            
            with(TK_OBJ) sub_state++;
        }
    }
}




// 97C6: JSR A4C4.  Triforce flash
triforce_pal_update(); // pi here is PI_MOB_BLU



if(!g.cutscene) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!







//var _TK = instance_find(NPC_A,0); // TK: Triforce Keeper




// 97C6: JSR A4C4.  Triforce flash
//triforce_pal_update();









// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
switch(g.cutscene_part)
{
    // =====================================================================================
    // ----------------------------------------------------------------------------------
    case 1:{ // ShadowBoss-982C -------------------------------------------------
    with(TK_OBJ) sub_state = 0; // TK: Triforce Keeper
    
    // 982C
    if (g.cutscene_timer >= $50)
    {   // 9830
        if (g.cutscene_timer >= $C0 
        ||  g.cutscene_timer & 1 )  // translucent/fade effect
        {
            with(TK_OBJ)
            {
                counter = (counter + (g.cutscene_timer>=$C0)) &$FF;
                if (f.quest_num==1) tri_can_draw    = 1;
                sub_state = 1;
                // update_EF11();
            }
        }
    }
    
    
    // 980D
    if(!g.cutscene_timer)
    {   // 9812
        with(BOSS_OBJ) set_xy(id, g.pc.x, GROUND_Y-hh_);
        
        var                     _DURATION = $40;
        p.Flash_Pal_timer     = _DURATION;
        p.Flash_Bgr_timer     = _DURATION;
        p.SpellFlash_PC_timer = _DURATION;
        
        g.cutscene_timer = $FF;
        global.BackgroundColor_scene = p.C_MGN3; // 0751 = $14; // room bg color
        aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
        
        with(TK_OBJ) sub_state = 0; // Make sure TK doesn't update.
        g.cutscene_part++;
    }
    break;}
    
    
    
    
    
    
    
    // =====================================================================================
    // ----------------------------------------------------------------------------------
    case 2:{ // ShadowBoss-983E -------------------------------------------------
    if (p.Flash_Bgr_timer>=$01)
    {
        break;
    }
    
    var _i, _pos, _pal;
    var            _PI_DEF = global.PI_MOB_PUR;
    //var            _PI_DEF = global.PI_MOB_RED;
    with(BOSS_OBJ) _PI_DEF = palidx_def;
    
    
    
    // Change ShadowBoss and background palettes to black
    _pal = build_pal(p.C_BLK1,p.C_BLK1,p.C_BLK1,p.C_BLK1,p.C_BLK1,p.C_BLK1,p.C_BLK1,p.C_BLK1);
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(_PI_DEF), string_length(_pal), _pal));
    
    for(_i=val(global.dm_pi[?"BGR"+STR_Count],1)-1; _i>=0; _i--)
    {
        _pos = get_pal_pos(val(global.dm_pi[?"BGR"+string(_i+1)+STR_Palette+STR_Index], global.PI_BGR1+_i));
        change_pal(strReplaceAt(p.pal_rm_new, _pos, string_length(_pal), _pal));
    }
    /*
    // 0725 = $0D; // Change BG palettes to black. bg col "14" + "0D" + "0D0D"
    var _pal  = color_str(p.dl_COLOR[|p.background_color_index]);
        _pal += string_repeat(color_str(p.C_BLK1), global.COLORS_PER_PALETTE-(string_length(_pal) div global.PAL_CHAR_PER_COLOR)); // "14" + "0D0D0D"
    //var _pal  = hex_str(p.background_color_index); // bg col idx $14
    //    _pal += string_repeat(p.CI_BLK1_, global.COLORS_PER_PALETTE-(string_length(_pal) div global.PAL_CHAR_PER_COLOR)); // "14" + "0D0D0D"
    
    var _pos  = val(p.dm_pal_data[?hex_str(_PI_DEF)+STR_Palette+STR_Position]);
    change_pal(strReplaceAt(p.pal_rm_new, _pos, string_length(_pal), _pal));
    
    _pal = string_repeat(_pal, val(global.dm_pi[?"BGR"+STR_Count])); // "140D0D0D" + "140D0D0D" + "140D0D0D" + "140D0D0D"
    _pos = val(p.dm_pal_data[?hex_str(global.PI_BGR1)+STR_Palette+STR_Position]);
    change_pal(strReplaceAt(p.pal_rm_new, _pos, string_length(_pal), _pal));
    */
    
    //audio_group_stop_all(audiogroup_snd);
    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
    audio_stop_sound(Audio.mus_rm_inst);
                     Audio.mus_rm_intr = 0;
                     Audio.mus_rm_body = 0;
    //
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    // =====================================================================================
    // ----------------------------------------------------------------------------------
    case 3:{ // ShadowBoss-9852 -------------------------------------------------
    with(BOSS_OBJ)
    {
        var                       _CUE = $80;
        if (    g.cutscene_timer <= _CUE)
        {
            if (g.cutscene_timer == _CUE)
            {
                set_xy(id, g.pc.x, GROUND_Y-hh_);
                facing_dir = -1;
                vspd      = $FC;
                hspd      = $13;
                ogr       = OGR_OTHR;
                
                // So update_ShadowBoss() can run udp_ShadowBoss()
                sub_state++;
            }
            
            // 9864: JSR 9A0F
            updateX();
            updateY2(GRAV_ADD, TERMINAL_VELOCITY);
            //Boss_update_6a();
            
            
            if (yb >= GROUND_Y)
            {
                g.cutscene_timer = $70 + 1;
                
                //GO_sprite_init(g.pc.sprite_index);
                GO_set_sprite(id, g.pc.sprite);
                set_xy(id, x, GROUND_Y-hh_); // mod
                
                g.cutscene_part++;
            }
            
            behavior = g.pc.behavior_DAMAGE; // $0A: BVR_DAMG
            
            // 9878: JMP 9A77
            // udp must be called in update_ShadowBoss() bc 
            // canDrawSelf gets re-set to false after this scr.
            // update_EF11();
            // udp_ShadowBoss();
            // xScale = facingDir;
        }
    }
    break;}
    
    
    
    
    
    
    
    // =====================================================================================
    // ----------------------------------------------------------------------------------
    case 4:{ // ShadowBoss-987B -------------------------------------------------
    if (g.cutscene_timer) // Fight not started yet
    {   // 9887
        with(BOSS_OBJ)
        {
            behavior = g.pc.behavior_CROUCH;
            ShadowBoss_udp();
        }
    }
    
    if (g.cutscene_timer==1)
    {
        with(BOSS_OBJ)
        {
            Boss_play_battle_music();
            //sdm("Cutscene_ShadowBoss_1_update(): "+"MusicBattle_THEME: "+MusicBattle_THEME+", MusicBattle_BODY: "+audio_get_name(MusicBattle_BODY)+", MusicBattle_INTRO: "+audio_get_name(MusicBattle_INTRO)+", Audio.mus_rm_inst: "+string(Audio.mus_rm_inst)+" val(Audio.dm_music_inst[?string(Audio.mus_rm_inst)+STR_Audio+STR_Asset+STR_Name]) "+string(val(Audio.dm_music_inst[?string(Audio.mus_rm_inst)+STR_Audio+STR_Asset+STR_Name]))+" "+audio_get_name(Audio.mus_rm_inst)); sdm("");
            //MusicBattleIntro_started = true;
            //aud_play_sound(MusicBattle_INTRO, Audio.PRIORITY_TOP, false);
        }
    }
    
    if(!g.cutscene_timer)
    {
        //audio_stop_sound(Audio.mus_rm_inst);
        //with(BOSS_OBJ) MusicBattleIntro_started = true;
        //aud_play_sound(Audio.MUS_BOSS_2A, Audio.PRI_TOP, true);
        
        g.pc_lock = 0;
        
        
        with(BOSS_OBJ) sub_state++; // START FIGHT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        g.cutscene      = 0;
        g.cutscene_part = 0;
        //g.cutscene_part++;
        
        
        var _LEN       = string_length(dk_spawn);
        var _SPAWN_IDX = string_copy(  dk_spawn, _LEN-1,2);  // Last 2 chars
        var _DATAKEY   = string_copy(  dk_spawn, 1, _LEN-2); // All but last 2 chars
            _DATAKEY  += hex_str(str_hex(_SPAWN_IDX)+1);
        with(GameObject_create(0,0, Cutscene_ShadowBoss_2,1, _DATAKEY))
        {
            if (is_undefined(         BOSS_SPAWN_DK) 
            && !is_undefined(   other.BOSS_SPAWN_DK) )
            {   BOSS_SPAWN_DK = other.BOSS_SPAWN_DK;  }
        }
        
        instance_destroy();
    }
    break;}
}




