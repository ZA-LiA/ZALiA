/// PaletteEditor_Step_1()


if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{   // if in an edit mode
    PalView_enabled = false;
}
else if (PP0) // PP0: Only 'P' pressed
{   // Toggle show all palettes
    PalView_enabled = !PalView_enabled;
}
else if (state==state_IDLE)
//&&  g.gui_state!=g.gui_state_EDIT_PAL )
{
    /*
    // Turn off palette randomizing & restore default palette
    if (PP && ALT && CTL)
    {
        change_pal(p.pal_rm_def);
        var _COLOR = val(g.dm_rm[?g.rm_name+dk_BackgroundColor], p.C_ERR0);
        set_background_color(_COLOR);
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    */
    
    // Randomize palette right now
    if ((PP && CTL && SHF) 
    || (Input.GP_Other6_held && Input.GP_Other1_held && Input.GP_Other2_pressed) ) // Hold trigR + B, press Y
    {
        var _i, _pi, _palette;
        _palette = p.pal_rm_curr;
        
        for(_i=0; _i<PalEdit_PAL_COUNT; _i++)
        {
            _pi = val(PalEdit_dm[?STR_Palette+hex_str(_i+1)+STR_Palette+STR_Index]);
            _palette = strReplaceAt(_palette, get_pal_pos(_pi), global.PAL_CHAR_PER_PAL, get_random_palette1(1,true));
        }
        
        change_pal(_palette);
    }
}




