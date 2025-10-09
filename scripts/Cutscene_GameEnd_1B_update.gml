/// Cutscene_GameEnd_1B_update()


g.cutscene = 1;
//if (g.can_use_dev_tools1 && 1) g.cutscene = 1;
//if (DEV && 1) g.cutscene = 1;
//if (DEV && 1) g.cutscene = g.CUTSCENE_GAME_END_1B; // testing

if (g.ChangeRoom_timer>0)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _i,_j, _idx, _val;


//with(Zelda)       DRAW_YOFF=0;
//with(GameObjectA) DRAW_YOFF=0;

g.pc_lock = PC_LOCK_ALL;

THE_END_can_draw  = 0;
triforce_can_draw = 0;


if (g.gui_state!=g.gui_state_NONE)
{
    with(g.DIALOGUE_WINDOW) // DialogueWindow
    {
        drawX  = viewXC() - ((CLMS>>1)<<3);
        drawX  = (drawX>>3)<<3;
        
        drawY  = global.pc.yt - (rows<<3);
        drawY -= $01<<3; // padding
        drawY  = (drawY>>3)<<3;
    }
}




if(!g.cutscene_part)
{   g.cutscene_part = SUB_STATE_INIT_1A;  }








// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
switch(g.cutscene_part)
{
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_INIT_1A:{
    if (g.cutscene_timer) break;
    
    
    var _a, _x,_y, _count;
    var _c1;
    var _clm,_row;
    var _depth, _tid, _tsrc;
    var _dk;
    
    
    // ---------------------------------------------------
    g.pc_lock      = PC_LOCK_ALL;
    g.view_lock_rm = $F;
    g.view_lock   |= g.view_lock_rm;
    
    set_camera_xy(g.rm_w_-viewW_(), viewYT());
    
    
    GROUND_Y = (global.pc.spawn_yt>>3)<<3;
    GROUND_Y = get_ground_y(viewXC(),GROUND_Y,  1, GROUND_Y+PC_H);
    CEILNG_Y = find_row_solid(TID_SOLID1, viewXC()>>3,(GROUND_Y>>3)-4, -1, 0, $08);
    CEILNG_Y = (CEILNG_Y+1)<<3;
    
    
    // ---------------------------------------------------
    var _CURTAIN_DEPTH = DEPTH_FG2;
    
    for(_i=ds_list_size(g.dl_pal_swap_depths)-1; _i>=0; _i--)
    {
            _depth = g.dl_pal_swap_depths[|_i];
            _idx   = ds_list_find_index(g.dl_TILE_DEPTHS, _depth);
        if!(_idx+1) continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        _dk  = g.dl_TILE_DEPTH_NAMES[|_idx]; // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
        _dk += STR_Depth + STR_Layer + STR_Name;
                         _layer_name = val(g.dm_tile_file[?_dk], 'UNDEFINED');
        if (is_undefined(_layer_name) 
        || !string_pos(  _layer_name, 'CURTAIN') )
        {
            continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
        
        
        _CURTAIN_DEPTH = _depth;
        break;//_i
    }
    
    
    // ---------------------------------------------------
    var _X = CURTAIN_CLM<<3;
    var _Y_START = (viewYC()>>3)<<3;
    var _GRID_ROWS = ds_grid_height(dg_curtain);
    
    for(_i=CURTAIN_CLMS-1; _i>=0; _i--)
    {
        _x = _X + (_i<<3);
        
        //  DEPTH   -------------------------------------------------------
        dg_curtain[#_i,5] = _CURTAIN_DEPTH;
        
        //  GROUND ROW  -------------------------------------------------------
        _y = get_ground_y(_x,_Y_START, 1, global.pc.spawn_yt+PC_H);
        _y = _y>>3;
        dg_curtain[#_i,4] = _y; // ground row
        
        //  ROW UNDER CEILNG  --------------------------------------------------
        dg_curtain[#_i,3] = find_row_solid(TID_SOLID1, _x>>3,_y-4, -1, 0, $08);
        dg_curtain[#_i,3]++;
        
        //  ROW UNDER CURTAIN  -------------------------------------------------
        dg_curtain[#_i,2] = dg_curtain[#_i,3] + 4;
        
        if (curtain_lowest_row < dg_curtain[#_i,2])
        {   curtain_lowest_row = dg_curtain[#_i,2];  }
        
        //  GOAL REACHED  -----------------------------------------------------
        dg_curtain[#_i,1] = 0;
        
        // STATE/SIDE  -------------------------------------------------------
        //  0: NOT curtain clm,  1: left side of curtain,  2: right side of curtain
        _y  = dg_curtain[#_i,2]; // ROW UNDER CURTAIN
        _y -= 2;                 // move up to a curtain tile
        _y  = _y<<3;
            _tsrc = tile_layer_get_tsrc(_CURTAIN_DEPTH, _x,_y);
        if (_tsrc+1) dg_curtain[#_i,0] = 1 + (_tsrc&$1); // 1: left, 2: right
        else         dg_curtain[#_i,0] = 0; // 0: clm doesn't have curtain
    }
    
    
    // ---------------------------------------------------
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_INIT_2A;
    break;}
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_INIT_2A:{ // 
    if (g.cutscene_timer) break;
    
    
    with(Zelda) // Wait for Zelda inst before going to next sub_state.
    {
        var _X = g.rm_w_;
        //
        set_camera_xy(_X-viewW_(), viewYT());
        
        
        other.can_draw_L_and_Z = true;
        
        xScale = -1;
        set_xy(id, _X + (8 * -xScale), y);
        
        global.pc.xScale = -xScale;
        set_xy(global.pc, x + ($10 * xScale), y);
        if (pc_is_cucco())
        {
            with(global.pc) set_xy(id, other.x-$0B, other.y-$03);
            depth = global.pc.depth-1;
        }
        
        sub_state = SUB_STATE_TALK1; // So correct sprite is drawn
        
        
        g.cutscene_timer = other.DUR1; // DUR1: $5F 1.583s
        g.cutscene_part = other.SUB_STATE_DLOG_1A;
    }
    break;}
    
    
    

    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_DLOG_1A:{ // TRIGGER DIALOGUE
    if (g.cutscene_timer) break;
    
    
    with(Zelda)
    {
        g.gui_state = g.gui_state_DIALOGUE1;
        g.dialogue_source = id;
        
        dialogue_datakey     = "0Z_00_";
        dialogue_ver     = "A";
        
        is_talking  = true;
        talked_to_count++;
        
        sub_state   = SUB_STATE_TALK1;
    }
    
    
    g.DIALOGUE_WINDOW.depth = DLG_DEPTH;
    
    g.cutscene_timer = 4; // wait for dlg window to build
    g.cutscene_part = SUB_STATE_DLOG_1B;
    break;}
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_DLOG_1B:{ // WRITING DIALOGUE
    if (g.cutscene_timer) break;
    if(!g.DIALOGUE_WINDOW.writ_char_pos) break;
    if (Zelda_update_talk_sound()) break; // Updates the talk sound.
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part = SUB_STATE_CURT_1B;
    break;}
    
    
    
    
    
    
    
    
    /*
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_1A:{ // CURTAINS MOVE DOWN - DELAY
    if (g.cutscene_timer) break;
    
    
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_CURT_1B;
    break;}
    */
    
    
    
    
    
    

    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_1B:{ // CURTAINS MOVE DOWN
    if (g.cutscene_timer) break;
    
    // if (!g.timer0) sdm("SUB_STATE_CURT_1B");
    // curtains stop when covering half of Zelda and PC
    if(!Cutscene_GameEnd_1B_update_1a(3,1, 2)) break;
    
    
    g.cutscene_timer = DUR1; // Kiss delay. DUR1: $5F 1.583s
    g.cutscene_part = SUB_STATE_KISS_1A;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_KISS_1A:{ // DELAY KISS
    if (g.cutscene_timer) break; // Kiss delay
    
    
    // Move in for kiss.
    var _DIST = 4;
    
    with(global.pc)
    {
        set_xy(id, x + (_DIST*xScale), y);
    }
    
    with(Zelda)
    {
        set_xy(id, x + (_DIST*xScale), y);
        sub_state = SUB_STATE_KISS;
    }
    
    
    g.cutscene_timer = DUR1; // 'THE END' text delay. DUR1: $5F 1.583s
    g.cutscene_part = SUB_STATE_OTHR_1A;
    break;}
    
    
    

    
    
    
    
    
    
    /*
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    case SUB_STATE_KISS_1B:{ // KISS
    
    if (g.cutscene_timer) break; // 'THE END' text delay
    
    
    //aud_play_sound(g.MUS_END_CREDT, Audio.PRI_TOP, true);
    
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_OTHR_1A;
    break;}
    */    
    
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_OTHR_1A:{ // 'THE END' TEXT - DELAY
    if (g.cutscene_timer) break; // 'THE END' text delay
    
    
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_OTHR_1B;
    break;}
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_OTHR_1B:{ // ADD 'THE END' TEXT
    THE_END_can_draw = 1;
    if (g.cutscene_timer) break;
    
    
    audio_stop_sound(Audio.mus_rm_inst);
    var _BODY  = get_audio_theme_track(dk_Credits);
    var _INTRO = get_audio_theme_track_intro(_BODY);
    if (_INTRO==_BODY) var _MUSIC = _BODY;  // There isn't an intro
    else               var _MUSIC = _INTRO; // There IS    an intro
    if (_INTRO!=_BODY) Audio.mus_rm_intr = _INTRO;
    Audio.mus_rm_body = _BODY;
    
    var _will_loop = val(Audio.dm[?audio_get_name(_MUSIC)+STR_Loop], _INTRO==_BODY);
    if(!_will_loop)
    //if (audio_get_name(_MUSIC)==audio_get_name(mus_Wyng1_Credits))
    {
        Audio.mus_rm_intr = 0;
        Audio.mus_rm_body = 0;
    }
    
    aud_play_sound(_MUSIC, Audio.PRIORITY_TOP, _will_loop, -1, dk_Credits);
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part = SUB_STATE_CURT_2A;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_2A:{ // DELAY CURTAINS MOVE DOWN
    THE_END_can_draw = 1;
    if (g.cutscene_timer) break;
    
    
    g.cutscene_timer = 0; // 
    g.cutscene_part = SUB_STATE_CURT_2B;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_2B:{ // CURTAINS MOVE DOWN TO FLOOR
    THE_END_can_draw = 1;
    if (g.cutscene_timer) break;
    
    
    if(!Cutscene_GameEnd_1B_update_1a(3,1, 0)) break;
    
    
    g.menu_state = g.DIALOGUE_WINDOW.SUB_STATE_CLOS1; // close dlg window
    
    
    // Changing global.pc.state<=0 will cause any other gob(like the Torches) to NOT draw
    can_draw_L_and_Z = false;
           //global.pc.state = -1;
    //with(Zelda) state =  0;
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part = SUB_STATE_CURT_3A;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_3A:{ // DELAY CURTAINS MOVE UP
    if (g.cutscene_timer) break;
    
    // I guess this is here to be dynamic in case I change 
    // the scene at some point.
    
    // Make it so only the curtains between the 2 inner-most stone clms to move up.
    var _pillar_found = false;
    var _dir = 1; // -1 left, 1 right
    
    //  _IDX1 is the middle-right curtain clm.
    var _IDX1 = ds_grid_width(dg_curtain)>>1;
    var _idx2 = _IDX1 - !_dir; // - !_dir: Start at the left middle curtain if !_dir(searching left)
    
    // Start with the middle 2 curtains and search outward 
    // each dir(-1 left, 1 right) until you find a 
    // non-curtain(stone column). Then set the rest 
    // of the curtains beyond that to 0 so they don't move up.
    for(_i=0; _i<2; _i++) // each dir search(right & left)
    {
        for(_j=0; _j<_IDX1; _j++) // each clm from mid curtain to outer-most curtain.
        {
            //     _idx2 is the start index(one of the 2 middle curtains)
            _idx = _idx2 + (_j*_dir);
            
            if (_pillar_found)
            {
                dg_curtain[#_idx,0] = 0;
                continue;//_j
            }
            
            
            if(!dg_curtain[#_idx,0])
            {
                _pillar_found = true;
            }
        }
        
        _pillar_found = false;
        _dir = -_dir; // flip dirs
        _idx2 = _IDX1 - !_dir; // - !_dir: Start at the left middle curtain and search left.
    }
    
    
    g.DIALOGUE_WINDOW.depth = DLG_DEPTH_DEF;
    
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_CURT_3B;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CURT_3B:{ // CURTAINS MOVE UP
    if (g.cutscene_timer) break;
    
    if(!Cutscene_GameEnd_1B_update_1a(3,-1, 4)) break;
    
    
    g.cutscene_timer  = DUR1; // DUR1: $5F 1.583s
    g.cutscene_timer += 2; // delay drawing "STAFF"
    g.cutscene_part = SUB_STATE_CRDT_1A;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CRDT_1A:{ // CREDITS DELAY
    if (g.cutscene_timer) break;
    
    
    change_pal(strReplaceAt(p.pal_rm_new, CREDITS_STAF_PAL_POS, PAL_LEN, CREDITS_STAF_PAL1));
    dg_CREDITS[#0,3] = 1; // allow "STAFF" text to draw
    dg_CREDITS[#0,2] = CREDITS_DUR3; // sequence timer
    dg_CREDITS[#0,0] = 1; // credits idx
    
    
    g.cutscene_timer = 0;
    g.cutscene_part = SUB_STATE_CRDT_1B;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_CRDT_1B:{ // CREDITS SEQUENCE
    if (g.cutscene_timer) break;
    
    if (dg_CREDITS[#0,2])    // timer
    {
            dg_CREDITS[#0,2]--;
        if(!dg_CREDITS[#0,2])
        {
            if (dg_CREDITS[#0,3] 
            &&!(dg_CREDITS[#0,3]&$1)  // STAFF text faded out
            &&  dg_CREDITS[#0,1]==0 )
            {   dg_CREDITS[#0,3]++;  }
            
                   dg_CREDITS[#0,1]++; // state
            switch(dg_CREDITS[#0,1])   // state
            {
                // FADE IN TITLE  --------------------------------
                case 1:{ // ------------
                dg_CREDITS[#0,4] = 1; // title text - can draw
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL1));
                dg_CREDITS[#0,2] = CREDITS_DUR2; // CREDITS_DUR2=$08
                break;}
                
                case 2:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL2));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 3:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL3));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 4:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL4));
                dg_CREDITS[#0,2] = CREDITS_DUR1; // Delay name text
                break;}
                
                
                
                // FADE IN NAME  --------------------------------
                case 5:{ // ------------
                dg_CREDITS[#0,5] = 1; // name  text - can draw
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL1));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 6:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL2));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 7:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL3));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 8:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL4));
                dg_CREDITS[#0,2] = CREDITS_DUR1; // timer
                if (dg_CREDITS[#0,0] == CREDITS_COUNT1-2)  // credits idx
                {   dg_CREDITS[#0,3]  = 0;  } // STAFF text state
                if (dg_CREDITS[#0,0] == CREDITS_COUNT1-1)  // credits idx
                {   dg_CREDITS[#0,0]  = CREDITS_COUNT1;  } // credits idx
                break;}
                
                
                
                // FADE OUT TITLE & NAME  --------------------------------
                case 9:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL3));
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL3));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                case 10:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL2));
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL2));
                dg_CREDITS[#0,2]  = CREDITS_DUR2;
                if (dg_CREDITS[#0,0]+1 < CREDITS_COUNT1 
                &&  dg_CREDITS[#dg_CREDITS[#0,0],5] != dg_CREDITS[#dg_CREDITS[#0,0]+1,5] ) // next credit's staff is diff
                {   dg_CREDITS[#0,3]++  }
                break;}
                
                case 11:{ // ------------
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL1));
                change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL1));
                dg_CREDITS[#0,2] = CREDITS_DUR2;
                break;}
                
                
                
                // ---------------------------------------------------------
                case 12:{ // ------------
                dg_CREDITS[#0,0]++;      // credits idx
                dg_CREDITS[#0,1] = 0;    // state/case
                dg_CREDITS[#0,2] = CREDITS_DUR3; // timer
                
                dg_CREDITS[#0,4] = 0; // 4: job title can draw
                dg_CREDITS[#0,5] = dg_CREDITS[#0,4];
                break;}
            } // switch
        }
    }
    
    
    
    
    var _CAN_SKIP_TO_END = false;
    if (Input.Pause_pressed 
    &&  (dg_CREDITS[#0,0]>1 || dg_CREDITS[#0,1]>=9) )
    {
        _CAN_SKIP_TO_END = true;
        change_pal(strReplaceAt(p.pal_rm_new, CREDITS_TITL_PAL_POS, PAL_LEN, CREDITS_TITL_PAL4));
        change_pal(strReplaceAt(p.pal_rm_new, CREDITS_NAME_PAL_POS, PAL_LEN, CREDITS_NAME_PAL4));
    }
    
    
    if (dg_CREDITS[#0,0]>=CREDITS_COUNT1 
    ||  _CAN_SKIP_TO_END )
    {
        dg_CREDITS[#0,1] = 0; // state/case
        dg_CREDITS[#0,3] = 0; // "STAFF" can draw
        dg_CREDITS[#0,4] = 1; // 4: job title can draw
        dg_CREDITS[#0,5] = dg_CREDITS[#0,4]; // 5: name can draw
        
        dg_CREDITS[#0,0] = CREDITS_COUNT1-1; // keep drawing 'PRESS START TO REPLAY'
        
        
        g.cutscene_timer = $20; // 8
        g.cutscene_part = SUB_STATE_TRIF_1A;
    }
    break;} // case SUB_STATE_CRDT_1B:{ // CREDITS SEQUENCE
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_TRIF_1A:{ // ADD TRIFORCE
    if (g.cutscene_timer) break;
    
    
    triforce_can_draw = 1;
    triforce_pal_update();
    
    
    g.cutscene_timer = 8;
    g.cutscene_part = SUB_STATE_RPLY_1A;
    break;}
    
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_RPLY_1A:{ // WAIT FOR USER INPUT
    triforce_can_draw = 1;
    triforce_pal_update();
    if (g.cutscene_timer) break;
    
    
    if (Input.Pause_pressed   // Start button pressed
    ||  Input.Magic_pressed ) // Select button pressed
    {
        audio_stop_sound(Audio.mus_rm_inst);
        
        // Prevent 'Wake Zelda' music from restarting.
        //audio_stop_sound(Audio.mus_rm_body);
        Audio.mus_rm_body = 0; // This line is enough to prevent 'Wake Zelda' music from restarting, but it only works if done right here for some reason..
        //audio_group_stop_all(audiogroup_mus);
        
        spawn_data_set_default();
        if (Input.Pause_pressed)
        {
            var _FILE_NUM  = f.file_num;
            var _QUEST_NUM = 2;
            
            var _Cucco_SKILLS         = f.Cucco_skills;
            var _CuccoSpell2_ACQUIRED = g.CuccoSpell2_Acquired;
            
            var _SKILLS       = f.skills;
            var _SPELLS       = f.spells;
            var _ATTACK_LEVEL = f.level_atk;
            var _MAGIC_LEVEL  = f.level_mag;
            var _LIFE_LEVEL   = f.level_lif;
            
            
            
            f.game_completed_count++;
            init_new_save_file(_FILE_NUM, _QUEST_NUM);
            
            
            
            f.Cucco_skills         = _Cucco_SKILLS;
            g.CuccoSpell2_Acquired = _CuccoSpell2_ACQUIRED;
            if (_CuccoSpell2_ACQUIRED) set_saved_value(_FILE_NUM, STR_Cucco+STR_Spell+"02"+STR_Acquired, _CuccoSpell2_ACQUIRED);
            if (_Cucco_SKILLS)         set_saved_value(_FILE_NUM, STR_Skill+STR_Cucco,                   _Cucco_SKILLS);
            
            f.skills    = _SKILLS;
            f.spells    = _SPELLS;
            f.level_atk = _ATTACK_LEVEL;
            f.level_mag = _MAGIC_LEVEL;
            f.level_lif = _LIFE_LEVEL;
            set_saved_value(_FILE_NUM, f.SDNAME_skills,    _SKILLS);
            set_saved_value(_FILE_NUM, f.SDNAME_spells,    _SPELLS);
            set_saved_value(_FILE_NUM, f.SDNAME_level_atk, _ATTACK_LEVEL);
            set_saved_value(_FILE_NUM, f.SDNAME_level_mag, _MAGIC_LEVEL);
            set_saved_value(_FILE_NUM, f.SDNAME_level_lif, _LIFE_LEVEL);
            
            f.cont_run_town_num = 0;
            set_saved_value(_FILE_NUM, STR_Save+STR_Town+STR_Num, f.cont_run_town_num);
            
            
            
            
            
            
            
            
            var _settings = "";
            
            var _SEED = get_saved_value(_FILE_NUM, get_file_seed_dk(_FILE_NUM,_QUEST_NUM), "undefined");
            if (is_string(_SEED))
            {   // Just in case a value wasn't found.
                _SEED = val(f.dm_rando[?STR_Rando+STR_Seed], RUN_RANDOMIZATION_SEED);
                if (f.quest_num==1) _SEED ^= $FFFFFFFF;
            }
            
            //sdm("val(f.dm_rando[?STR_Rando+STR_Active]) = "+string(val(f.dm_rando[?STR_Rando+STR_Active]))+",  is_undefined(f.dm_rando[?STR_Rando+STR_Settings]) = "+string(is_undefined(f.dm_rando[?STR_Rando+STR_Settings])));
            if (val(f.dm_rando[?STR_Rando+STR_Active]))
            //if (get_saved_value(_FILE_NUM, STR_Rando+STR_Active, false))
            {
                _settings = f.dm_rando[?STR_Rando+STR_Settings]; // json encoded map
                if(!is_undefined(_settings))
                {
                    var _dm_SETTINGS = json_decode(_settings);
                    if (_dm_SETTINGS!=-1)
                    {
                        var _spell_bit, _spell_name, _datakey;
                        
                                      _datakey=STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Level;
                        _dm_SETTINGS[?_datakey+STR_Attack] = f.level_atk;
                        _dm_SETTINGS[?_datakey+STR_Magic]  = f.level_mag;
                        _dm_SETTINGS[?_datakey+STR_Life]   = f.level_lif;
                        
                        _dm_SETTINGS[?STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Skill] = f.skills;
                        
                        for(_i=ds_list_size(g.dl_Spell_STR)-1; _i>=0; _i--)
                        {
                            _spell_name =   g.dl_Spell_STR[|_i];
                            _spell_bit  = val(g.dm_Spell[?STR_Bit+_spell_name]);
                            
                            _datakey = STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Spell+_spell_name;
                            _dm_SETTINGS[?_datakey] = f.spells & _spell_bit;
                        }
                        
                        
                        
                        
                        // --------------------------------------------------------
                        var _items  = get_saved_value(_FILE_NUM, f.SDNAME_items, 0);
                            _items |= get_saved_value(_FILE_NUM, STR_File+STR_Start+STR_Items, 0);
                        if (_items)   set_saved_value(_FILE_NUM, f.SDNAME_items, _items);
                        //sdm("_items $"+hex_str(_items));
                        
                        
                        
                        
                        var _START_CONT_HP = get_saved_value(_FILE_NUM, STR_File+STR_Start+STR_Container+STR_HP, cont_cnt_hp());
                        if (_START_CONT_HP>=cont_cnt_hp())
                        {
                            _val="";
                            for(_i=1; _i<=_START_CONT_HP; _i++)
                            {
                                for(_j=1; _j<=f.CONT_PIECE_PER_HP; _j++)
                                {
                                    _val += hex_str(_i)+hex_str(_j);
                                }
                            }
                            set_saved_value(_FILE_NUM, f.SDNAME_cont_pieces_hp, _val);
                        }
                        //sdm("_START_CONT_HP $"+hex_str(_START_CONT_HP)+", cont pieces hp: "+_val);
                        
                        var _START_CONT_MP = get_saved_value(_FILE_NUM, STR_File+STR_Start+STR_Container+STR_MP, cont_cnt_mp());
                        if (_START_CONT_MP>=cont_cnt_mp())
                        {
                            _val="";
                            for(_i=1; _i<=_START_CONT_MP; _i++)
                            {
                                for(_j=1; _j<=f.CONT_PIECE_PER_MP; _j++)
                                {
                                    _val += hex_str(_i)+hex_str(_j);
                                }
                            }
                            set_saved_value(_FILE_NUM, f.SDNAME_cont_pieces_mp, _val);
                        }
                        //sdm("_START_CONT_MP $"+hex_str(_START_CONT_MP)+", cont pieces mp: "+_val);
                        
                        
                        
                        
                        
                        var _DOLL_COUNT = get_saved_value(_FILE_NUM, STR_File+STR_Start+STR_Dolls, 0);
                        if (_DOLL_COUNT)
                        {
                            var _item_id;
                            for(_i=1; _i<=_DOLL_COUNT; _i++)
                            {
                                _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
                                if(!is_undefined(_item_id)) f.dm_1up_doll[?_item_id+STR_Acquired] = true;
                            }
                            
                            _val = json_encode(f.dm_1up_doll);
                            set_saved_value(_FILE_NUM, f.SDNAME_linkDolls, _val);
                        }
                        //sdm("_DOLL_COUNT $"+hex_str(_DOLL_COUNT));
                        
                        
                        
                        
                        
                        
                        var _KAKUSU_MAX = val(g.dm_spawn[?STR_Kakusu+STR_Count]);
                        _val = get_saved_value(_FILE_NUM, STR_Kakusu+STR_Required+STR_Count, _KAKUSU_MAX);
                        if (_KAKUSU_MAX-_val) set_saved_value(_FILE_NUM, STR_Kakusu+STR_Required+STR_Count, _val);
                        //sdm("kakusu requirement $"+hex_str(_val));
                        
                        _val = get_saved_value(_FILE_NUM, STR_Crystal+STR_Required+STR_Count, f.CRYSTAL_MAX);
                        if (f.CRYSTAL_MAX-_val) set_saved_value(_FILE_NUM, STR_Crystal+STR_Required+STR_Count, _val);
                        //sdm("crystals requirement $"+hex_str(_val));
                        
                        
                        
                        
                        
                        
                        // Delete Rando Hints
                        set_saved_value(_FILE_NUM, STR_Found+STR_Hint, -1, true);
                        
                        
                        
                        
                        
                        // --------------------------------------------------------
                        _settings = json_encode(_dm_SETTINGS);
                        ds_map_destroy(_dm_SETTINGS);_dm_SETTINGS=undefined;
                        //f.dm_rando[?STR_Rando+STR_Settings] = _settings;
                        
                        /*
                        var _SEED = get_saved_value(_FILE_NUM, get_file_seed_dk(_FILE_NUM,_QUEST_NUM), "undefined");
                        if (is_string(_SEED))
                        {   // Just in case a value wasn't found.
                            _SEED = val(f.dm_rando[?STR_Rando+STR_Seed], RUN_RANDOMIZATION_SEED);
                            if (f.quest_num==1) _SEED ^= $FFFFFFFF;
                        }
                        //var _SEED = get_saved_value(_FILE_NUM, get_file_seed_dk(_FILE_NUM,_QUEST_NUM), RUN_RANDOMIZATION_SEED);
                        //sdm("RUN_RANDOMIZATION_SEED $"+hex_str(RUN_RANDOMIZATION_SEED));
                        //sdm("rando quest-"+string(_QUEST_NUM)+", seed $"+hex_str(_SEED));
                        with(instance_create(0,0,Rando))
                        {
                            Rando_randomize_file(_FILE_NUM, _QUEST_NUM, _SEED, _settings);
                            instance_destroy();
                        }
                        */
                    }
                }
            }
            
            
            with(instance_create(0,0,Rando))
            {
                Rando_randomize_file(_FILE_NUM, _QUEST_NUM, _SEED, _settings);
                instance_destroy();
            }
        }
        
        
        g.cutscene_timer = DUR1;
        g.cutscene_part = SUB_STATE_RSET_1A;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    // ========================================================================
    // -------------------------------------------------------------------
    case SUB_STATE_RSET_1A:{ // SIMULATING NES RESET
    g.surf.draw_clear_color = p.C_BLK1;
    if (g.cutscene_timer) break;
    
    
    // Prevent 'Wake Zelda' music from restarting.
    // Audio.mus_rm_body = 0;
    // audio_group_stop_all(audiogroup_mus); // Prevent 'Wake Zelda' music from restarting.
    
    goto_title_rm();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
}
//





// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
with(global.pc)
{
    can_draw_self = false;
    
    if(!other.can_draw_L_and_Z) break;
    //if(!state) break;
    
    
    PC_set_behavior(behavior_POSE1);
    PC_udp();
    xScale =  1;
}

with(Zelda)
{
    can_draw_self = false;
    
    if(!other.can_draw_L_and_Z) break;
    //if(!state) break;
    
    
    update_EF11();
    xScale = -global.pc.xScale;
    
    with(global.pc) other.depth = depth-1;
}




