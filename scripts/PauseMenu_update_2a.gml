/// PauseMenu_update_2a()

// PauseMenu Interactivity.  g.menu_state == 5


if (timer)
{
    timer--;
    if(!timer)
    {
        state     = mapDelay1_state_Backup;
        state_dir = mapDelay1_state_dir_Backup;
        mapDelay1_state_Backup     = 0;
        mapDelay1_state_dir_Backup = 0;
        g.menu_state--; // Go back to build menu (4)
    }
    
    PauseMenu_udp();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
PauseMenu_udp();



// A256
if (Input.Pause_pressed)
//if ( Input.Pause_held            // Start button held
//&& !(Input.heldPrev & Input.S) ) // Start button was NOT held prev frame
{
    g.menu_state++; // Start close menu
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

















// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// A1DD

// TODO: Add ability to reset game w/ button combo. 
// OG does this with controller 2 holding up + a.



var _can_update_state_change = false;




switch(state&$3) // 1: ST_SPL, 2: ST_ITM, 3: ST_MAP
{
    // ------------------------------------------------------------------------------------
    // ------------------------------------------------------------------------------------
    case state_SPELL: { // 1: state_SPELL
    if (f.spells 
    &&  gui_tmr_cursor_v() ) // 9DF6
    {
        // A1F6
        for(var _i=0; _i<g.SPELL_COUNT; _i++)
        {
            g.spell_selected = bitNum(g.spell_selected)-1;
            g.spell_selected =   (g.spell_selected  +  g.SPELL_COUNT) + sign_(Input.Down_held);
            g.spell_selected =    g.spell_selected mod g.SPELL_COUNT;
            g.spell_selected = 1<<g.spell_selected;
            
            if (f.spells&g.spell_selected) break;//_i
        }
        
        
        aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
    }
    else
    {
        _can_update_state_change = true;
    }
    
    
    if (f.spells&g.spell_selected)
    {
        g.spell_ready = g.spell_selected;
    }
    p.SpellReady_flash_timer = 0;
    break;}
    
    
    
    
    
    
    
    // ------------------------------------------------------------------------------------
    // ------------------------------------------------------------------------------------
    case state_ITEM:{ // 2: state_ITEM
    _can_update_state_change = true;
    if (g.mod_SPELL_CANCEL) g.spell_ready = 0;
    break;}
    
    
    
    
    
    
    
    // ------------------------------------------------------------------------------------
    // ------------------------------------------------------------------------------------
    case state_MAP:{ // 3: state_MAP
    if (g.mod_SPELL_CANCEL) g.spell_ready = 0;
    
    if (g.dungeon_num)
    {
        var _CAN_MOVE_X = dungeon_clms_visited >= MapDungeon_CLMS;
        var _CAN_MOVE_Y = dungeon_rows_visited >= MapDungeon_ROWS;
        if (_CAN_MOVE_X 
        ||  _CAN_MOVE_Y )
        //if (dungeon_clms_visited > CLMS_MAP_DNGN 
        //||  dungeon_rows_visited > ROWS_MAP_DNGN )
        //if (dungeon_clms > CLMS_MAP_DNGN 
        //||  dungeon_rows > ROWS_MAP_DNGN )
        {
            //var _DIFF_X  = (dungeon_clms_visited+MapDungeon_PAD1) - CLMS_MAP_DNGN;
            //var _DIFF_Y  = (dungeon_rows_visited+MapDungeon_PAD1) - ROWS_MAP_DNGN;
            //var _DIFF_X  = (_CLMS+MapDungeon_PAD1) - CLMS_MAP_DNGN;
            //var _DIFF_Y  = (_ROWS+MapDungeon_PAD1) - ROWS_MAP_DNGN;
            
            //var _DIFF_X  = (dungeon_clms+MapDungeon_PAD1) - CLMS_MAP_DNGN;
            //var _DIFF_Y  = (dungeon_rows+MapDungeon_PAD1) - ROWS_MAP_DNGN;
            
            
            var     _MOVE_X  = -bit_dir(gui_tmr_cursor_h()); // 0,1,-1
                    //_MOVE_X *=  abs(_MOVE_X) && inRange(map_clm_off+_MOVE_X, -_DIFF_X, MapDungeon_PAD1);
            //
            var     _MOVE_Y  = -bit_dir(gui_tmr_cursor_v()); // 0,1,-1
                    //_MOVE_Y *=  abs(_MOVE_Y) && inRange(map_row_off+_MOVE_Y, -_DIFF_Y, MapDungeon_PAD1);
            //
            if (abs(_MOVE_X)    // 0,1,-1
            ||  abs(_MOVE_Y) )  // 0,1,-1
            {
                var _low, _high;
                
                if (_CAN_MOVE_X)
                {
                    map_clm_off += _MOVE_X;
                    _low  = MapDungeon_CLMS - (dungeon_clms+MapDungeon_PAD1);
                    _high = MapDungeon_PAD1;
                    map_clm_off  = clamp(map_clm_off, _low, _high);
                }
                
                
                if (_CAN_MOVE_Y)
                {
                    map_row_off += _MOVE_Y;
                    _low  = MapDungeon_ROWS - (dungeon_rows+MapDungeon_PAD1);
                    _high = MapDungeon_PAD1;
                    map_row_off  = clamp(map_row_off, _low, _high);
                }
                
                aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
                /*if(0){//sdm('dungeon_clms $'+hex_str(dungeon_clms)+', dungeon_rows $'+hex_str(dungeon_rows));
                        //sdm('dungeon_vis_top $'+hex_str(dungeon_vis_top)+', dungeon_vis_btm $'+hex_str(dungeon_vis_btm));
                        //sdm('CLMS_MAP_DNGN $'+hex_str(CLMS_MAP_DNGN)+', ROWS_MAP_DNGN $'+hex_str(ROWS_MAP_DNGN));
                    var _str  = '_MOVE_X '+string(_MOVE_X)+', _MOVE_Y '+string(_MOVE_Y);
                        _str += ", map_clm_off: " + string(map_clm_off)+", map_row_off: " + string(map_row_off);
                        _str += ', _CLM_OFF '+string(_CLM_OFF)+', _ROW_OFF '+string(_ROW_OFF);
                        //_str += ', _CLMS $'+hex_str(_CLMS)+', _ROWS $'+hex_str(_ROWS);
                        //_str += ', dungeon_vis_lft $'+hex_str(dungeon_vis_lft)+', dungeon_vis_rgt $'+hex_str(dungeon_vis_rgt);
                        sdm(_str);
                }*/
                break;//case ST_MAP
            }
        }
    }
    
    
    _can_update_state_change = true;
    break;}//case ST_MAP
}//switch(state&3)













// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
if (_can_update_state_change)
{
    // SCB: State Change Button
    if (Input.pressed&SCB_R 
    ||  Input.pressed&SCB_L )
    {
        if (Input.pressed&SCB_R) state_dir =  DUR_ARROW_BLINK; //  6
        else                     state_dir = -DUR_ARROW_BLINK; // -6
        
        
        var _STATE = state;
        
        // 1: ST_SPL, 2: ST_ITM, 3: ST_MAP
        state &= $3;
        state += sign(state_dir);
        state &= $3;
        state += sign(state_dir) * !state;
        state &= $3;
        
        // Store a copy of the current state in the 2nd nybble.
        state |= (_STATE&$3)<<4;
        
        
        
        aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
        
        
        if ((state>>0)&$3==state_MAP 
        ||  (state>>4)&$3==state_MAP )
        {
            mapDelay1_state_Backup     = state;
            mapDelay1_state_dir_Backup = state_dir;
            timer = 2; // DELAY AMOUNT
            state_dir = 0;
            state = _STATE;
        }
        else
        {
            // OG --------------------
            g.menu_state--; // Go back to build menu (4)
            // OG --------------------
        }
    }
}





