/// update_Dialogue()


if(!g.dialogue_source)
{   // Just in case Dialogue is opened w/out a g.dialogue_source
    g.pc_lock = 0;
    global.pc.in_restore_house = false;
    
    g.gui_state        = g.gui_state_NONE;
    g.menu_built_count = 0;
    g.menu_state       = 0;
    
    g.dialogue_source  = noone;
    dialogue           = dialogue_DEF;
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// B0AB
if (timer) timer--;




// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
var _TYPE  = object_get_name(g.dialogue_source.object_index);
    _TYPE +=         hex_str(g.dialogue_source.ver);
    _TYPE  = val(dm_dialogue[?_TYPE+STR_Type]);
//
var _SAVING_GAME = _TYPE==TYPE_SAVER && g.gui_state==g.gui_state_DIALOGUE2; // gui_state_DIALOGUE2: PC inside save house

var _TYPE_ZELDA = _TYPE==TYPE_ZLDA1 || _TYPE==TYPE_ZLDA2;
if (_TYPE_ZELDA)
{
    g.gui_window_can_draw = 0;
    writ_snd = 0;
}
else
{
    writ_snd = get_audio_theme_track(dk_TypeChar);
}








// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
if(!g.menu_state) g.menu_state = SUB_STATE_OPEN0;


switch(g.menu_state)
{
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_OPEN0:{ // ---------------------------------------------------------------------
    g._UxU_=irandom((ds_grid_width(g.dg_YxY_)>>1)-1);
    
    if (_SAVING_GAME)
    {
        if (DEV)
        {
            var _START_TIME = current_time;
            repeat(1) show_debug_message("");
            show_debug_message("update_Dialogue(). Save START");
        }
        
        if (g.mod_ContinueFrom &(g.mod_ContinueFrom_TWN1|g.mod_ContinueFrom_TWN2)) f.cont_run_town_num = g.town_num;
        
        file_save(      f.file_num, false);
        set_saved_value(f.file_num, STR_Save+STR_Town+STR_Num, f.cont_run_town_num);
        if (g.mod_RetainXPWithSaveNPC) set_saved_value(f.file_num, STR_XP, clamp(f.xp+f.xpPending-f.xpDrain, 0,XP_MAX));
        
        if (DEV)
        {
            show_debug_message("update_Dialogue(). Save END. "+string(current_time-_START_TIME));
            repeat(1) show_debug_message("");
        }
    }
    
    
    g.dialogue_source.HylianText_read = false;
    
    
    // B107
    timer = 0;
    g.menu_state = SUB_STATE_OPEN1;
    break;}//case SUB_STATE_OPEN0
    
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_OPEN1:{ // B0CB. ---------------------------------------------------------------
    if (timer) break;
    
    if (g.gui_window_can_draw) aud_play_sound(get_audio_theme_track(dk_OpenGUI));
    
    timer = 2; // Delay constructing
    g.menu_state = SUB_STATE_CSTR1;
    break;}//case SUB_STATE_OPEN1
    
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_CSTR1:{ // B0D2.  Contructing window. -----------------------------------------
    if (timer) break;
    
    var _i;
    cursor_option      = 0;
    dialogue           = dialogue_DEF;
    
    add_char_tmr       = 0; // 0566
    writ_char_pos      = 0;
    writ_line_idx      = 0; // 048A
    writ_line_char_pos = 0; // 0489
    writ_dlg           = ""; // what's been written so far
    
    for(_i=ds_list_size(dl_lines_written)-1; _i>=0; _i--)
    {
        dl_lines_written[|_i] = "";
    }
    
    
    drawX = get_menu_x();
    drawY = viewYT() + Y_BASE; // $20
    
    // B0FD
    if (g.gui_state==g.gui_state_DIALOGUE3) rows = ROWS_SHOP;
    else                                    rows = ROWS_DEF;
    
    
        g.menu_built_count = min(g.menu_built_count+1, (rows>>1));
    if (g.menu_built_count>=(rows>>1)) g.menu_state = SUB_STATE_DLG_0;
    break;}//case SUB_STATE_CSTR1
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_DLG_0:{ // B480. ---------------------------------------------------------------
    var _i, _num, _dk, _pos, _len;
    var _val, _val1,_val2;
    var _dialogue_is_special = false;
    
    
    _val = f.dl_save_names[|f.file_num-1];
    // Trim whitespaces at end.
    for(_i=string_length(_val); _i>=1; _i--)
    {
        if (string_char_at(_val,_i)!=" ")
        {
            _val = string_copy(_val,1,_i);
            break;//_i
        }
    }
    
    var _SAVE_FILE_NAME = _val;
    dialogue_ver = "A";
    
    update_Dialogue_1a();
    
    
    // B5C7
    var _DIALOGUE_DK = g.dialogue_source.dialogue_datakey+dialogue_ver;
    dialogue = val(dm_dialogue[?_DIALOGUE_DK], dialogue_DEF);
    
    
    //var _TYPE  = object_get_name(g.dialogue_source.object_index);
    //    _TYPE +=         hex_str(g.dialogue_source.ver);
    //    _TYPE  = val(dm_dialogue[?_TYPE+STR_Type]);
    
    var _RandoHint_dialogue_dk = undefined;
    
    if (global.RandoHints_enabled)
    {
        if (val(global.dm_save_file_settings[?STR_Zelda+STR_Hint]) 
        &&  ((_TYPE==TYPE_ZLDA2 && dialogue_ver=="01") || g.dialogue_source.dialogue_datakey==STR_Zelda+STR_Hint) )
        {
            _dialogue_is_special = true;
            _RandoHint_dialogue_dk = STR_Zelda+STR_Hint;
            dialogue = val(f.dm_rando[?_RandoHint_dialogue_dk+STR_Dialogue]);
        }
        else
        {
            if (val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) 
            &&  val(global.dm_save_file_settings[?STR_Item+STR_Location+STR_Hint]) )
            {
                _val = f.dm_rando[?STR_Rando+STR_Hint+g.dialogue_source.dialogue_datakey];
                if(!is_undefined(_val))
                {
                    _dialogue_is_special = true;
                    _RandoHint_dialogue_dk = g.dialogue_source.dialogue_datakey;
                    dialogue = _val;
                }
                else if (val(dm_dialogue[?_DIALOGUE_DK+STR_Hint]))
                {
                    if (g.town_name==STR_Rauru 
                    ||  g.town_name==STR_Saria 
                    ||  g.town_name==STR_Darunia )
                    {    dialogue = "SORRY,<NOTHING.";  }
                    else dialogue = "SORRY.<I KNOW<NOTHING.";
                }
            }
        }
    }
    
    if(!is_undefined(_RandoHint_dialogue_dk))
    {
        _num = val(f.dm_rando[?STR_Rando+STR_Hint+_RandoHint_dialogue_dk+STR_Hint+STR_Num]);
        if (_num)
        {
            var _dialogue = g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Dialogue];
            if (is_undefined(_dialogue)) // if hint not found yet
            {
                g.dm_RandoHintsRecorder[?STR_Found+STR_Hint+STR_Num] = val(g.dm_RandoHintsRecorder[?STR_Found+STR_Hint+STR_Num], "") + hex_str(_num);
                
                _dialogue = dialogue;
                _dialogue = string_replace_all(_dialogue,"<"," ");
                _dialogue = string_replace_all(_dialogue,">"," ");
                g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Dialogue] = _dialogue;
                
                var _item = val(f.dm_rando[?STR_Rando+STR_Hint+hex_str(_num)+STR_Item], "UNDEFINED"); // item id
                //_item=string_letters(_item);
                g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Item] = _item;
                _item = string_letters(_item);
                
                _pos = string_pos(_item,_dialogue);
                if (_pos>1) g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Text+"01"] = string_copy(_dialogue,1,_pos-1);
                else        g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Text+"01"] = "";
                
                _pos += string_length(_item);
                if (string_length(_dialogue)>=_pos) g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Text+"02"] = strR(_dialogue,_pos);
                else                                g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_num)+STR_Text+"02"] = "";
            }
        }
    }
    
    
    
    switch(g.dialogue_source.object_index)
    {
        // ---------------------------------------------------------
        case NPC_4:{ // NPC_4 Heal Magic/Life, Save
        if (g.dialogue_source.ver==1  // v1: Heal Life
        &&  dialogue_ver=="A" 
        && !irandom($800) ) // $800: 1 in 2048 chance
        {
            _dialogue_is_special = true;
            dialogue = "WOULD YOU<"+"LIKE ORC<"+"MASSAGE?";
        }
        break;}//case NPC_4
        
        
        // ---------------------------------------------------------
        case NPC_B:{
        if (dialogue_ver=="A")
        {
            _dialogue_is_special = true;
            dialogue = string(g.dialogue_source.COST) + dialogue;
        }
        break;}//case NPC_B
        
        
        // ---------------------------------------------------------
        case NPC_7:{
        if (dialogue_ver=="D") // D: Boulder circle clue
        {
            _dialogue_is_special = true;
            var _DATAKEY  = STR_Boulder+STR_Circle+STR_Order;
                _DATAKEY += hex_str(g.town_num)+STR_Dialogue;
            var _CARDINAL_DIR = val(f.dm_quests[?_DATAKEY], "...");
            
            /* Example:
            BOULDER
            CIRCLE...
            8TH IS
            SOUTH WEST
            */
            var     _str1="TH"; // towns 4-9
            switch(g.town_num){
            case 1:{_str1="ST"; break;}
            case 2:{_str1="ND"; break;}
            case 3:{_str1="RD"; break;}
            }
            dialogue  = "BOULDER"  +"<"; // Line 1
            dialogue += "CIRCLE..."+">"; // Line 2
            dialogue += string(g.town_num)+_str1+" IS"+"<"; // Line 3
            dialogue += _CARDINAL_DIR;   // Line 4
        }
        break;}//case NPC_7
    }//switch(g.dialogue_source.object_index)
    
    
    if (global.Halloween1_enabled 
    && !_dialogue_is_special )
    {
        _dk = dm_dialogue[?STR_Halloween+g.dialogue_source.dialogue_datakey];
        if(!is_undefined(_dk)) dialogue = val(dm_dialogue[?_dk+dialogue_ver], dialogue);
    }
    
    
    //if (global.SWAP_LINK_NAME_WITH_SAVE_NAME)
    _pos = string_pos(global.USE_PLAYER_NAME_INDICATOR,dialogue);
    if (_pos) dialogue = strReplaceAt(dialogue, _pos, string_length(global.USE_PLAYER_NAME_INDICATOR), _SAVE_FILE_NAME);
    
    switch(val(dm_dialogue[?_DIALOGUE_DK+dk_DynamicDialogue+STR_Type]))
    {
        case 'A':{ // Dialogue uses the save file's name when "LINK" is referred to. There are 2 separate dialogue depending on the length of the save file name.
        _dk1 = dm_dialogue[?_DIALOGUE_DK+dk_DynamicDialogue+STR_Datakey];
        if(!is_undefined(_dk1))
        {
            if (string_length(_SAVE_FILE_NAME)<=val(dm_dialogue[?_dk1+'A'+STR_Character+"_Limit"],SAVE_NAME_CHAR_LIMIT))
            {    _dk2 = _dk1+'A';  } // save file name can fit with other characters in 1 line of dialogue
            else _dk2 = _dk1+'B';    // save file name needs its own line
            
            _val = dm_dialogue[?_dk2];
            if(!is_undefined(_val))
            {
                dialogue = _val;
                _pos = string_pos(global.USE_PLAYER_NAME_INDICATOR,dialogue);
                if (_pos) dialogue = strReplaceAt(dialogue, _pos, string_length(global.USE_PLAYER_NAME_INDICATOR), _SAVE_FILE_NAME);
            }
        }
        break;}//case 'A'
    }//switch(val(dm_dialogue[?_DIALOGUE_DK+dk_DynamicDialogue+STR_Type]))
    
    
    
    
    dlg_line_cnt  = 1; // At least 1
    dlg_line_cnt += string_count(g.CHAR_END_LINE1, dialogue);
    dlg_line_cnt += string_count(g.CHAR_END_LINE2, dialogue);
    
    
    ds_grid_resize(dg_dlg, 1,3);
    ds_grid_clear( dg_dlg, 0);
    var _LEN  = string_length(dialogue);
    var _char = "";
    var _idx  = 0;
    for(_i=0; _i<_LEN; _i++)
    {
            _char = string_char_at(dialogue,_i+1);
        if (_char==g.CHAR_END_LINE1 
        ||  _char==g.CHAR_END_LINE2 )
        {
            dg_dlg[#_idx,2] = _char;
            ds_grid_resize(dg_dlg, (++_idx)+1,ds_grid_height(dg_dlg));
        }
        else
        {
            if (dg_dlg[#_idx,0]==0) dg_dlg[#_idx,0]  = _char;
            else                    dg_dlg[#_idx,0] += _char;
        }
    }
    
    for(_i=ds_grid_width(dg_dlg)-1; _i>=0; _i--) dg_dlg[#_i,1] = string_length(dg_dlg[#_i,0]);
    
    
    
    
    text_x_off = TEXT_X_OFF;
    text_y_off = TEXT_Y_OFF;
    
    // Offset so vertical alignment of text area is more centered
         if (dlg_line_cnt==MAX_LINES)   text_y_off += -4;
    else if (dlg_line_cnt==MAX_LINES-1) text_y_off +=  2;
    else                                text_y_off +=  4;
    
    
    add_char_tmr = dg_DIALOGUE_DELAYS[#g.mod_DLG_SPEED,0];
    
    
    // B621
    timer = 0;
    g.menu_state = SUB_STATE_DLG_1;
    break;}//case SUB_STATE_DLG_0
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_DLG_1:{ // B621. ---------------------------------------------------------------
    if (timer) break;
    
    timer = 0;
    g.menu_state = SUB_STATE_TALK1;
    break;}//case SUB_STATE_DLG_1
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_TALK1:{ // B6A2. ----------------------------------------------------------------
    if (timer) break;
    
    g._0766 = 0;
    
    var _datakey = g.dialogue_source.dialogue_datakey+dialogue_ver+STR_Skip+STR_Type;
    var _SKIP_TYPE = val(dm_dialogue[?_datakey], SkipType_CLOSE);
    
    
    // --------------------------------------------------------
    if (Input.Attack_pressed 
    &&  _SKIP_TYPE==SkipType_CLOSE )
    {   // B672, B621.  Starts close window process
        if (g.gui_state==g.gui_state_DIALOGUE2) g.menu_state = SUB_STATE_ACTN1; // ACTN1: get spell/get skill/restore stat
        else                                    g.menu_state = SUB_STATE_ACTN2;
        break;
    }
    
    
    
    
    
    // --------------------------------------------------------
    if (add_char_tmr)
    {
        if(!Input.Attack_pressed 
        ||  _SKIP_TYPE==SkipType_NONE )
        {   // B69E
            add_char_tmr--;
            break;
        }
    }
    
    
    
    
    // --------------------------------------------------------
    // B6BF
    g._0766 = 1;
    
    /*  Example:
    dialogue = ' HIDDEN<'     // 
             + '_ TOWN<'      // 
             + '__ OF<'       // 
             + ' KASUTO';     // 
    */
    var _LEN = string_length(dialogue);
    
    
    if (writ_char_pos<_LEN)
    {
        //  _C3: can SKIP TO END of dlg
        var _C3  =  _SKIP_TYPE==SkipType_TOEND 
                &&  Input.Attack_pressed 
                &&  writ_char_pos;   // At least 1 char written.
        //
        var                    _WRIT_SND = writ_snd;
        if (_TYPE==TYPE_ZLDA1) _WRIT_SND = 0; // Cutscene_GameEnd_1B_update() plays the sound
        
        var _char  = 0;
        var _char2 = 0;
        var      _last = writ_char_pos+1; // next char
        if (_C3) _last = _LEN;            // last char of dialogue
        
        while (writ_char_pos<_last) // write 1 or all char
        {
            writ_char_pos++;
            writ_line_char_pos++;
            
            _char  = string_char_at(dialogue, writ_char_pos);
            _char2 = string_char_at(dialogue, writ_char_pos+1);
            
            if(!_C3 
            &&  _char ==g.CHAR_BLANK 
            &&  _char2==g.CHAR_BLANK 
            &&  _last<_LEN )
            {
                _last++; // go until next char != g.CHAR_BLANK
            }
            
            
            if (_char==g.CHAR_END_LINE1 
            ||  _char==g.CHAR_END_LINE2 )
            {
                writ_line_idx++;
                writ_line_char_pos = 0;
            }
            else
            {
                if (_char==g.CHAR_BLANK) _char2 = " ";
                else                     _char2 = _char;
                
                dl_lines_written[|writ_line_idx] += _char2;
                writ_dlg                         += _char2;
            }
        }
        
        
        
        if(!_C3) // Writing 1 char, NOT skipping to end of dlg
        {
            if (_TYPE==TYPE_ZLDA1)
            {   // Credits scene.
                if (_char==" ") add_char_tmr = 0;
                else            add_char_tmr = dg_DIALOGUE_DELAYS[#g.mod_DLG_SPEED,4]; // dur $10
                
                break;//case SUB_STATE_TALK1
            }
            
                 if (_char==g.CHAR_END_LINE1) add_char_tmr = dg_DIALOGUE_DELAYS[#g.mod_DLG_SPEED,2]; // next line delay
            else if (_char==g.CHAR_END_LINE2) add_char_tmr = dg_DIALOGUE_DELAYS[#g.mod_DLG_SPEED,3]; // long next line delay
            else if (_TYPE==TYPE_ZLDA2)       add_char_tmr = $0C; // next char delay
            else                              add_char_tmr = dg_DIALOGUE_DELAYS[#g.mod_DLG_SPEED,1]; // next char delay
            
            if (_WRIT_SND 
            &&  _char!=g.CHAR_BLANK 
            &&  _char!=0 )
            {
                aud_play_sound(_WRIT_SND);
            }
        }
        
        
        break;//case SUB_STATE_TALK1
    }
    
    if (_TYPE==TYPE_ZLDA1)
    {   // Cutscene_GameEnd_1B_update() will change menu_state at right time
        break;//case SUB_STATE_TALK1
    }
    
    
    if (_SAVING_GAME) aud_play_sound(get_audio_theme_track(dk_SaveGame), -1,false,-1, dk_SaveGame);
    
    
    g.menu_state = SUB_STATE_ACTN0;
    break;}//case SUB_STATE_TALK1
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_ACTN0:{ // Healer, Saver, Spell Giver, Knight ----------------------------------
    if (timer) break;
    
    
    if (_TYPE==TYPE_SPELL   // if Spell Giver
    ||  _TYPE==TYPE_SKILL ) // if Skill Knight
    {
        // B672. --------------  END OF DIALOGUE  ------------------------
        var _GET_SPELL = _TYPE==TYPE_SPELL && dialogue_ver=="A"; // 'A' acquiring spell
        var _GET_SKILL = _TYPE==TYPE_SKILL && dialogue_ver=="A"; // 'A' acquiring skill
        
        var _YB = global.pc.yb;
        var _DURATION1 = $40; // spell flash duration
        var _DURATION2 = _DURATION1 + $80; // $C0. spell flash duration + fanfare delay
        
        // Delay get spell/skill music. 
             if (_GET_SPELL) g.temp_timer1 = _DURATION2 + 1; // Wise Man.     flash duration + fanfare delay
        else if (_GET_SKILL) g.temp_timer1 = _DURATION2 + 1; // Skill Knight. flash duration + fanfare delay
        else                 g.temp_timer1 = 0;
        
        
        if (_GET_SPELL) // first time acquiring spell
        {
            if (g.mod_WISEMEN_CAST_SPELL)
            {
                if (           g.dialogue_source.give_spell)
                {   cast_spell(g.dialogue_source.give_spell);  }
                
                
                if (g.mod_PC_CUCCO_1 
                &&  g.dialogue_source.give_spell==SPL_FARY 
                &&  pc_is_cucco() )
                {
                    if (g.dialogue_source.ver==2)
                    {
                        f.Cucco_skills |= f.CuccoSkill_THRUST_D;
                        f.Cucco_skills |= f.CuccoSkill_THRUST_U;
                        f.Cucco_skills |= f.CuccoSkill_BREAK1;
                        f.Cucco_skills |= f.CuccoSkill_PROJ1;
                        f.Cucco_skills |= f.CuccoSkill_PROJ2;
                        
                        g.CuccoSpell2_Acquired = 1;
                        g.CuccoSpell2_Active   = 1;
                        
                        g.spells_active |= SPL_FARY;
                    }
                    
                    
                    with(global.pc)
                    {
                        var _Y = _YB - (Cucco_H>>1);
                        set_xy(id, x,_Y);
                        hspd = 0;
                        vspd = 0;
                    }
                }
            }
            else
            {   // SND_CAST_SPEL plays in cast_spell()
                aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
            }
        }
        
        
        
        
        if (_GET_SPELL) // first time acquiring spell
        {
            //p.pal_flash_tmr       = $C0; // $C0 == 192
            p.Flash_Pal_timer     = _DURATION1;
            p.Flash_Bgr_timer     = _DURATION1;
            p.SpellFlash_PC_timer = _DURATION1;
            g.dialogue_source.CastSpellSprite_timer = g.dialogue_source.CastSpellSprite_DURATION; // 049E
        }
        
        if (_GET_SKILL)
        {   // Added 2024/09/30 because I saw bgr flash in OG.
            p.Flash_Bgr_timer = _DURATION1;
            aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
        }
        
        
        
        
        if (g.mod_WISEMEN_RESTORE_MP 
        &&  _TYPE==TYPE_SPELL 
        &&  f.mp<get_stat_max(STR_Magic) )
        {   // MOD. Spell Giver restores MP
            g.StatRestore_timer_mp = max($FF, get_stat_max(STR_Magic)); // MP
        }
        
        
        if (_GET_SPELL 
        ||  _GET_SKILL )
        {    g.menu_state = SUB_STATE_ACTN1;  } // ACTN1: get spell/get skill/restore stat
        else g.menu_state = SUB_STATE_ACTN2;
    }
    else if (g.gui_state==g.gui_state_DIALOGUE3 
         &&  isVal(_TYPE, TYPE_GAME1,TYPE_GAME2,TYPE_GAME3,TYPE_SHOP1) )
    {
        if (bitCount(cursor_option&$3)!=$1) cursor_option = Input.L; // Option YES to start minigame
        
        
        if (Input.Pause_pressed)
        //if ( Input.Pause_held          // Start held
        //&& !(Input.heldPrev&Input.S) ) // Start NOT held prev frame
        {
            //g._0766 = 0;
            aud_play_sound(get_audio_theme_track(dk_CursorFileSelect));
            timer = 2; // because skipping ACTN1&2
            g.menu_state = SUB_STATE_CLOS0; // skip ACTN1&2
        }
        else
        {
            if (tmr_cursor_1) tmr_cursor_1--;
            
            if (Input.heldH 
            &&  Input.heldH!=cursor_option 
            && !tmr_cursor_1 )
            {
                cursor_option ^= $3;
                tmr_cursor_1   = $7;
                aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
            }
        }
    }
    else if (val(dm_dialogue[?g.dialogue_source.dialogue_datakey+'A'+STR_Font],global.dl_game_font[|global.game_font_idx])==spr_Font_Hyrulian 
         && !g.dialogue_source.HylianText_read 
         &&  f.items&ITM_BOOK )
    {
             g.dialogue_source.HylianText_read = true;
             aud_play_AdvanceDialogue();
             timer = $20;
             g.menu_state = SUB_STATE_CSTR1;
    }
    else
    {
        // B672. --------------  END OF DIALOGUE  ------------------------
        if (g.gui_state==g.gui_state_DIALOGUE2) g.menu_state = SUB_STATE_ACTN1; // ACTN1: get spell/get skill/restore stat
        else                                    g.menu_state = SUB_STATE_ACTN2;
    }
    break;}//case SUB_STATE_ACTN0
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_ACTN1:{ // Healer, Saver, Spell Giver, Knight ----------------------------------
    if (timer) break;
    
    
    // B75B
    // --------------------------------------------------------
    if (_TYPE==TYPE_HEART   // LIFE   Restore
    ||  _TYPE==TYPE_MAGIC ) // MAGIC  Restore
    {   // B76A
        if (_TYPE==TYPE_HEART 
        &&  f.hp<get_stat_max(STR_Heart) )
        {
            g.StatRestore_timer_hp = max(get_stat_max(STR_Heart),$FF);
        }
        
        if (_TYPE==TYPE_MAGIC 
        &&  f.mp<get_stat_max(STR_Magic) )
        {
            g.StatRestore_timer_mp = max(get_stat_max(STR_Magic),$FF);
        }
        
        g.menu_state = SUB_STATE_ACTN2;
        break;//case SUB_STATE_ACTN1
    }
    
    
    // --------------------------------------------------------
    if (_TYPE==TYPE_SPELL   // SPELL-GIVER
    ||  _TYPE==TYPE_SKILL ) // SKILL-KNIGHT
    {
        if (g.temp_timer1) // SpellGiver or Knight
        {
            g.temp_timer1--;
        }
        else
        {   // B776
            aud_play_sound(get_audio_theme_track(dk_GetSpell), -1,false,-1, dk_GetSpell);
            
            if (_TYPE==TYPE_SPELL)
            {   // SPELL-GIVER. B78A.  Acquiring spell --------------------------------
                g.pc_lock             = 0;
                global.pc.in_restore_house = false;
                
                g.PAUSE_MENU.state    = g.PAUSE_MENU.state_SPELL; // set PauseMenu to open spell list
                g.menu_built_count    = 0;
                g.menu_state          = 1;
                g.gui_state           = g.gui_state_PAUSE; // OPEN PAUSE MENU
            }
            else
            {   // SKILL-KNIGHT
                g.menu_state          = SUB_STATE_ACTN2;
            }
        }
    }
    else
    {   // Should be only Restore Life/Magic, Wise Man, Skill Knight 
        // that make it to menu_state 8 so this is just in case.
        g.menu_state = SUB_STATE_ACTN2;
    }
    break;}//case SUB_STATE_ACTN1
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_ACTN2:{ // ---------------------------------------------------------------------
    if (timer) break;
    
    
    if (_TYPE==TYPE_ZLDA1)
    {   // End game Zelda dlg
        g.menu_state = SUB_STATE_CLOS0;
        break;//case SUB_STATE_ACTN2
    }
    
    
    if (is_ver(g.dialogue_source,NPC_9,8)) // NPC_9 v8: SCROBLIN
    {
        if (Input.Attack_pressed 
        &&  val(f.dm_quests[?Scroblin_DATAKEY1]) )
        {
            with(Exit)
            {
                if (exitName==g.rm_name+"00")
                {
                    if(!open)
                    {
                        if (val(f.dm_quests[?Scroblin_DATAKEY1])==1)
                        {
                            aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
                        }
                        
                        f.dm_quests[?Scroblin_DATAKEY1] = 2;
                        
                        aud_play_combo1(7);
                    }
                    
                    open = true;
                    doorway_spr = g.Doorway1_SPR;
                    break;//with(Exit)
                }
            }
        }
    }
    
    
    // B7A6, B7A2.   !g._0766: dlg closed w/out finishing
    if (g._0766     // DID NOT close dlg early w/ 'b' press
    && !Input.Attack_pressed ) // Dlg finished, waiting for 'b' press
    {
        break;//case SUB_STATE_ACTN2
    }
    
    
    g.menu_state = SUB_STATE_CLOS0;
    break;}//case SUB_STATE_ACTN2
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_CLOS0:{ // B350, B107. ----------------------------------------------------------
    if (timer) break;
    
    //if (_SAVING_GAME) aud_play_sound(Audio.MUS_SAVE_GAME);
    g.menu_state = SUB_STATE_DSTR1;
    break;}//case SUB_STATE_CLOS0
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_DSTR1:{ // B183, B107.  DeconSTRuct window. -------------------------------------
    if (timer) break;
    
        g.menu_built_count--;
    if (g.menu_built_count<0) g.menu_state = SUB_STATE_CLOS1;
    break;}//case SUB_STATE_DSTR1
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------
    case SUB_STATE_CLOS1:{ // B7B2. -----------------------------------------------------------------
    if (timer) break;
    
    
    if (g.dialogue_source.object_index==NPC_2) // traffic NPC
    {
        if ((global.Halloween1_enabled && isVal(g.town_name,STR_Rauru,STR_Ruto,STR_Saria,STR_Mido,STR_Nabooru,STR_Darunia,STR_New_Kasuto,STR_Old_Kasuto)) 
        || (!global.Halloween1_enabled && isVal(g.town_name,STR_Saria,STR_Darunia) && g.dl_RandomOG[|2]<$67) ) 
        {
            // B7E0.  Change NPC to Ache or Bot or ... --------------------------------------------
            var _obj = Ache01;
            var _ver = $1;
            if (global.Halloween1_enabled)
            {
                if (irandom(99)>=65)
                {
                    _obj = Bot_A;
                    _ver = $1;
                }
            }
            else
            {
                if!(g.dl_RandomOG[|3]&$1) // 50%
                //if!(g.dl_RandomOG[|3]&$3) // 25%
                {
                    _obj = Bot_A;
                    _ver = $1;
                }
            }
            
            
            if (instance_number(_obj)<6)
            {
                g.dialogue_source.state = 0;
                
                //g.go_mgr.uIdxSwap_gob = g.dialogue_source.uIdx;
                with(GameObject_create(g.dialogue_source.xl,g.dialogue_source.yt, _obj,_ver, -1, global.PI_MOB_BLU))
                {
                    switch(object_index)
                    {   // ------------------------------
                        case Ache01:{
                        facing_dir = g.dialogue_source.facing_dir;
                        behavior  = 3;
                        vspd      = 0;
                        hspd      = 0;
                        hp        = 0;
                        IDLE_Y    = ((yt>>8)<<8) + $40;
                        break;}//case Ache01
                        
                        // ------------------------------
                        case Bot_A:{
                        facing_dir = -sign_(rand()&$1);
                        vspd      = INIT_VEL_DEF;
                        hspd      = (hspd_jump*facing_dir) &$FF;
                        hp        = 0;
                        break;}//case Bot_A
                    }//switch(object_index)
                    
                    if (is_hostile) is_hostile = !global.Halloween1_enabled;
                }//with(GameObject_create(g.dialogue_source.xl,g.dialogue_source.yt, _obj,_ver, -1, PI_MOB_BLU))
            }
        }
    }
    
    
    
    
    // Plays when closing dlg window
    if (g.gui_window_can_draw)
    // && !audio_is_playing(Audio.SND_CAST_SPEL) )
    {
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        /*
        if (g.dialogue_source.object_index!=NPC_7 
        ||  g.dialogue_source.use_cucco_dlg<2 )
        {
            aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        }
        */
    }
    
    
    g.pc_lock = 0;
    global.pc.in_restore_house = false;
    
    
    // B7F0
    if (g.mod_destroy_go_on_death 
    && !is_undefined(   g.dialogue_source) 
    &&  instance_exists(g.dialogue_source) 
    &&                 !g.dialogue_source.state )
    {
        with(g.dialogue_source)
        {
            var _IDX =    ds_list_find_index(g.go_mgr.dl_gob2, id);
            if (_IDX!=-1) ds_list_delete(    g.go_mgr.dl_gob2,_IDX);
        }
    }
    
    
    g.dialogue_source  = noone;
    dialogue           = dialogue_DEF;
    
    
    g.menu_built_count = 0;
    g.menu_state       = 0;
    g.gui_state        = g.gui_state_NONE;
    break;}//case SUB_STATE_CLOS1
}//switch(g.menu_state)




// ---------------------------------------------------------------------
if (g.menu_built_count>-1) canDrawSections = g.menu_built_count;
if (g.menu_built_count>-1) cnt_draw_rows   = g.menu_built_count<<1;




