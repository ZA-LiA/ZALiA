/// PaletteEditor_Step()


var _i, _idx;
var _pi, _palette, _color_char, _color;
var _pos;


/*
GP_Attack // Xbox X button, PS SQUARE button
GP_Jump   // Xbox A button, PS CROSS button

GP_Other1 // Xbox B button, PS CIRCLE button
GP_Other2 // Xbox Y button, PS TRIANGLE button

GP_Other3 // LEFT  bumper
GP_Other4 // RIGHT bumper
GP_Other5 // LEFT  trigger
GP_Other6 // RIGHT trigger
*/
CTL  = keyboard_check(vk_control);
SHF  = keyboard_check(vk_shift);
ALT  = keyboard_check(vk_alt);
CTL0 =  CTL && !SHF && !ALT; // ONLY CTL held
SHF0 = !CTL &&  SHF && !ALT; // ONLY SHF held
ALT0 = !CTL && !SHF &&  ALT; // ONLY ALT held
//                                                  //
PP   = keyboard_check_pressed(ord("P"));
PH   = keyboard_check(        ord("P"));
PP0  = !CTL && !SHF && !ALT && PP;
PH0  = !CTL && !SHF && !ALT && PH;

var _EDIT_REQUESTED_PAL = (CTL0 && PP) 
                       || (Input.GP_Other6_held && Input.GP_Other4_held && Input.GP_Other2_pressed); // Hold trigR + bumpR, press Y
//
var _EDIT_REQUESTED_BGR = (Input.GP_Other5_held && Input.GP_Other3_held && Input.GP_Other2_pressed); // Hold trigL + bumpL, press Y

//var _Input_COLOR_SELECTED = Input.Jump_pressed;
var _Input_COLOR_SELECTED = Input.Jump_pressed || Input.Pause_pressed;
var _Input_ViewOld_HELD   = Input.GP_Other2_held;     // Input.GP_Other2, xbox 'Y'.  Toggle old/new
var _Input_ViewOld_RELS   = Input.GP_Other2_released; // Input.GP_Other2, xbox 'Y'.  Toggle old/new
var _Input_Randomize_PRES = Input.Attack_pressed;     // Input.Attack, xbox 'X'.  Randomizing

var _Input_CANCEL = keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape) || Input.GP_Other1_pressed; // Other1: Xbox B




// --------------------------------------------------------------------
if (timer) timer--;


if(!timer) PaletteEditor_Step_1();




// --------------------------------------------------------------------
if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    PalView_enabled = false;
    
    switch(state){
    case state_EDIT1A:   {color_old=PaletteEditor_get_cursor_color(true); break;}
    //case state_EDIT1B:   {color_old=PaletteEditor_get_cursor_color(true); break;}
    case state_BGR_COLOR:{color_old=BgrColor_before_edit; break;}
    }
    
    color_new = PaletteEditor_get_cursor_color(false);
}








// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
switch(state)
{
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    case state_IDLE:{
    if (timer) break;
    
    if (g.gui_state==g.gui_state_NONE)
    {
        if (_EDIT_REQUESTED_PAL)
        {
            PaletteEditor_initiate_pal_edit_mode();
            break;//case state_IDLE
        }
        
        if (_EDIT_REQUESTED_BGR)
        {
            PaletteEditor_initiate_bgr_edit_mode();
            break;//case state_IDLE
        }
    }
    break;}//case state_IDLE
    
    
    
    
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    case state_EDIT1A:{ // Choose a palette's color to change
    if (timer) break;//case state_EDIT1A
    
    // Complete changes -------------------------------------------------------------
    if (Input.Pause_pressed)
    {
        ds_list_clear(dl_hist_sess);
        g.gui_state = g.gui_state_NONE;
        /*
        if (gui_state_at_sess_start!=g.gui_state_OPTIONS) g.gui_state = gui_state_at_sess_start;
        else                                              g.gui_state = g.gui_state_NONE;
        //g.gui_state = gui_state_at_sess_start;
        */
        
        timer = DELAY1_DUR; // Delay any input reaction in next state.
        state = state_IDLE;
        break;//case state_EDIT1A
    }
    
    
    // CLOSE PaletteEditor ----------------------------------------------------------
    if (_Input_CANCEL 
    ||  _EDIT_REQUESTED_PAL )
    {
        change_pal(pal_before_edit_sess);
        ds_list_clear(dl_hist_sess);
        g.gui_state = g.gui_state_NONE;
        /*
        if (gui_state_at_sess_start!=g.gui_state_OPTIONS) g.gui_state = gui_state_at_sess_start;
        else                                              g.gui_state = g.gui_state_NONE;
        //g.gui_state = gui_state_at_sess_start;
        */
        
        timer = DELAY1_DUR; // Delay any input reaction in next state.
        state = state_IDLE;
        break;//case state_EDIT1A
    }
    
    
    // SELECT COLOR ------------------------------------------------------------------
    if (_Input_COLOR_SELECTED)
    {
        if (pal_before_edit_sess!=p.pal_rm_curr) ds_list_add(dl_hist_room,p.pal_rm_curr);
        
        pal_before_edit_color = p.pal_rm_curr;
        pal_during_edit       = p.pal_rm_curr;
        
        _idx = ds_list_find_index(ColorGrid_dl_colors, color_old);
        if (_idx!=-1)
        {
            ColorGrid_Cursor_clm = _idx mod ColorGrid_CLMS;
            ColorGrid_Cursor_row = _idx div ColorGrid_CLMS;
        }
        
        timer = DELAY2_DUR; // DELAY2_DUR: $20.  Delay any input reaction in next state.
        state = state_EDIT1B;
        break;//case state_EDIT1A
    }
    
    
    
    
    
    
    
    
    // TOGGLE COLORS  ----------------------------------------------------
    // --------------------------------------------------------------------------
    var _Input1_HELD = Input.GP_Other5_held; // Input.trig_LH. All colors of the cursor's PI
    var _Input2_HELD = Input.GP_Other6_held; // Input.trig_RH. The whole palette
    
    
    // 4: TOGGLE OLD/NEW ------------------------------------------------------------
    // --------------------------------------------------------------------------
    if (_Input_ViewOld_HELD) // xbox 'Y'.  Toggle old/new
    {
        if (_Input1_HELD   // Input.trig_LH. 1: cursor's palette
        &&  _Input2_HELD ) // Input.trig_RH. 2: whole palette
        {
            break;//case state_EDIT1A
        }
        
        
        // SINGLE COLOR. TOGGLE OLD/NEW COLOR of the cursor --------------------------------------------------------
        if(!_Input1_HELD   // !Input.trig_LH. 1: cursor's palette
        && !_Input2_HELD ) // !Input.trig_RH. 2: whole palette
        {
            var _PI  = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Palette+STR_Index]);
            var _POS = get_pal_col_pos(_PI,string_char_at(global.PAL_BASE_COLOR_ORDER, PalEdit_Cursor_row+1));
            var _COL1 = string_copy(pal_before_edit_sess, _POS, global.PAL_CHAR_PER_COLOR);
            var _COL2 = string_copy(pal_during_edit,      _POS, global.PAL_CHAR_PER_COLOR);
            if (_COL1!=_COL2)
            {
                change_pal(strReplaceAt(p.pal_rm_new,  _POS, string_length(_COL1), _COL1));
                break;//case state_EDIT1A
            }
        }
        
        
        // ALL PI COLORS. TOGGLE OLD/NEW COLORS of the cursor's PI --------------------------------------------------------
        if (_Input1_HELD   //  Input.trig_LH. 1: cursor's palette
        && !_Input2_HELD ) // !Input.trig_RH. 2: whole palette
        {
            var _PI  = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Palette+STR_Index]);
            var _POS = get_pal_pos(_PI);
            var _PAL1 = string_copy(pal_before_edit_sess, _POS, global.PAL_CHAR_PER_PAL);
            var _PAL2 = string_copy(pal_during_edit,      _POS, global.PAL_CHAR_PER_PAL);
            if (_PAL1!=_PAL2)
            {
                change_pal(strReplaceAt(p.pal_rm_new, _POS, string_length(_PAL1), _PAL1));
                break;//case state_EDIT1A
            }
        }
        
        
        // WHOLE PALETTE. TOGGLE OLD/NEW COLORS of the WHOLE palette --------------------------------------------------------
        if (_Input2_HELD   //  Input.trig_RH. 2: whole palette
        && !_Input1_HELD ) // !Input.trig_LH. 1: cursor's palette
        {
            if (pal_during_edit!=pal_before_edit_sess)
            {
                change_pal(pal_before_edit_sess);
                break;//case state_EDIT1A
            }
        }
        
        break;//case state_EDIT1A
    }
    else if (_Input_ViewOld_RELS) // xbox 'Y' released
    {
        if (pal_during_edit!=pal_before_edit_sess)
        {
            change_pal(pal_during_edit);
            break;//case state_EDIT1A
        }
    }
    
    
    
    
    
    
    
    
    // 3: RANDOMIZE COLORS  ---------------------------------------------------------
    // --------------------------------------------------------------------------
    if (_Input_Randomize_PRES) // Input3: xbox 'X'.  Randomize a color
    {
        if (_Input1_HELD   // Input.trig_LH. 1: cursor's palette
        &&  _Input2_HELD ) // Input.trig_RH. 2: whole palette
        {
            break;//case state_EDIT1A
        }
        
        
        // Randomize color the cursor is on
        if(!_Input1_HELD   // Input.trig_LH. 1: cursor's palette
        && !_Input2_HELD ) // Input.trig_RH. 2: whole palette
        {
            _pi = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Palette+STR_Index]);
            _color_char = string_char_at(global.PAL_BASE_COLOR_ORDER, PalEdit_Cursor_row+1);
            _pos = get_pal_col_pos(_pi,_color_char);
            _color = get_random_color(true,_color_char);
            pal_during_edit = change_pal(strReplaceAt(pal_during_edit, _pos, global.PAL_CHAR_PER_COLOR, color_str(_color)));
            break;//case state_EDIT1A
        }
        
        
        // Randomize palette the cursor is on
        if (_Input1_HELD   // Input.trig_LH. 1: cursor's palette
        && !_Input2_HELD ) // Input.trig_RH. 2: whole palette
        {
            _pi = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Palette+STR_Index]);
            _pos = get_pal_pos(_pi);
            _palette = get_random_palette1(-1);
            //_palette = randomize_palette(1,true);
            pal_during_edit = change_pal(strReplaceAt(pal_during_edit, _pos, global.PAL_CHAR_PER_PAL, _palette));
            break;//case state_EDIT1A
        }
        
        
        // Randomize all editable colors
        if(!_Input1_HELD   // Input.trig_LH. 1: cursor's palette
        &&  _Input2_HELD ) // Input.trig_RH. 2: whole palette
        {
            for(_i=0; _i<PalEdit_PAL_COUNT; _i++)
            {
                _pi = val(PalEdit_dm[?STR_Palette+hex_str(_i+1)+STR_Palette+STR_Index]);
                _pos = get_pal_pos(_pi);
                _palette = randomize_palette(1,true);
                pal_during_edit = strReplaceAt(pal_during_edit, _pos, global.PAL_CHAR_PER_PAL, _palette);
            }
            
            pal_during_edit = change_pal(pal_during_edit);
            break;//case state_EDIT1A
        }
        
        
        break;//case state_EDIT1A
    }
    
    
    
    
    // update move PalEdit_Cursor
    PaletteEditor_update_cursor();
    break;}//case state_EDIT1A
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    case state_EDIT1B:{ // Choose a new color for the palette color
    if (timer) break;//case state_EDIT1B
    
    
    if(!timer)
    {
        // TOGGLE OLD/NEW COLOR --------------------------------------------------------
        if (_Input_ViewOld_HELD) // gp4: xbox 'Y' button
        {
            if (p.pal_rm_curr!=pal_before_edit_color) change_pal(pal_before_edit_color);
            break;//case state_EDIT1B
        }
        else
        {
            if (p.pal_rm_curr!=pal_during_edit) change_pal(pal_during_edit);
        }
        
        
        
        // CANCEL/DONE ------------------------------------------------------------------
        if (_Input_CANCEL) // Backspace || ESC || gp2: xbox B button
        {
            pal_during_edit = change_pal(pal_before_edit_color);
            
            timer = DELAY1_DUR; // Delay any input reaction in next state.
            state = state_EDIT1A;
            break;//case state_EDIT1B
        }
        
        
        
        // SELECT COLOR ------------------------------------------------------------------
        if (_Input_COLOR_SELECTED)
        {
            if (pal_before_edit_color!=p.pal_rm_new) ds_list_add(dl_hist_sess,p.pal_rm_new);
            
            timer = DELAY2_DUR; // Delay any input reaction in next state.
            state = state_EDIT1A;
            break;//case state_EDIT1B. **Selecting a palette color to edit gets priority.
        }
    }
    
    
    // -------------------------------------------------
    // update move ColorGrid_Cursor
    PaletteEditor_update_cursor();
    
    // update palette
        _color =PaletteEditor_get_cursor_color(false); //    color grid cursor color
    if (_color!=PaletteEditor_get_cursor_color(true))  // if color grid cursor color != palette color
    {
        var _PI = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Palette+STR_Index]);
        var _COLOR_CHAR = string_char_at(global.PAL_BASE_COLOR_ORDER, PalEdit_Cursor_row+1);
        var _POS = get_pal_col_pos(_PI,_COLOR_CHAR);
        pal_during_edit = change_pal(strReplaceAt(pal_during_edit, _POS, global.PAL_CHAR_PER_COLOR, color_str(_color)));
    }
    break;}//case state_EDIT1B
    
    
    
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    // ----------------------------------------------------------------------------------------
    case state_BGR_COLOR:{ // Choose a new color for the background
    if (timer) break;//case state_BGR_COLOR
    
    
    // CONFIRM/DONE -----------------------------------------------------------------
    if (Input.Pause_pressed)
    {
        global.BackgroundColor_scene = PaletteEditor_get_cursor_color(false); // color grid cursor color
        set_background_color(global.BackgroundColor_scene);
        g.gui_state = g.gui_state_NONE;
        /*
        if (gui_state_at_sess_start!=g.gui_state_OPTIONS) g.gui_state = gui_state_at_sess_start;
        else                                              g.gui_state = g.gui_state_NONE;
        //g.gui_state = gui_state_at_sess_start;
        */
        
        timer = DELAY1_DUR; // Delay any input reaction in next state.
        state = state_IDLE;
    }
    
    
    // CANCEL/DONE ------------------------------------------------------------------
    if (_Input_CANCEL 
    ||  _EDIT_REQUESTED_BGR )
    {
        global.BackgroundColor_scene = BgrColor_before_edit;
        set_background_color(global.BackgroundColor_scene);
        g.gui_state = g.gui_state_NONE;
        /*
        if (gui_state_at_sess_start!=g.gui_state_OPTIONS) g.gui_state = gui_state_at_sess_start;
        else                                              g.gui_state = g.gui_state_NONE;
        //g.gui_state = gui_state_at_sess_start;
        */
        
        timer = DELAY1_DUR; // Delay any input reaction in next state.
        state = state_IDLE;
        break;//case state_BGR_COLOR
    }
    
    
    
    
    
    
    
    
    // TOGGLE OLD/NEW COLORS --------------------------------------------------------
    if (_Input_ViewOld_HELD)
    {
        global.BackgroundColor_scene = BgrColor_before_edit;
        set_background_color(global.BackgroundColor_scene);
        break;//case state_BGR_COLOR
    }
    else if (_Input_Randomize_PRES)
    {
        var      _RAND = irandom(99);
             if (_RAND<10) global.BackgroundColor_scene = get_random_color(true,0);
        else if (_RAND<40) global.BackgroundColor_scene = get_random_color(true,1);
        else               global.BackgroundColor_scene = get_random_color(true,2);
        set_background_color(global.BackgroundColor_scene);
    }
    else if (_Input_COLOR_SELECTED)
    {
        global.BackgroundColor_scene = PaletteEditor_get_cursor_color(false); // color grid cursor color
        set_background_color(global.BackgroundColor_scene);
        break;//case state_EDIT1B. **Selecting a palette color to edit gets priority.
    }
    else
    {
        PaletteEditor_update_cursor();
        global.BackgroundColor_scene = PaletteEditor_get_cursor_color(false); // color grid cursor color
        set_background_color(global.BackgroundColor_scene);
    }
    break;}//case state_BGR_COLOR
}//switch(state)




PaletteEditor_udp();




