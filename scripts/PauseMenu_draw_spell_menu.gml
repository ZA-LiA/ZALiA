/// PauseMenu_draw_spell_menu()


var _i, _x,_y;
var _text, _spell_bit, _amount, _pi;


if (g.mod_SHOW_MAGIC_REMAINING_NUM 
&&  Window_vertical_draw_section_count )
{
    _spell_bit = -1;
    _text = Head_TEXT;
    _amount = f.mp>>1;
    _x  = Window_spell_menu_window_xl;
    _y  = drawY;
    _y -= 1; // micro adj
    PauseMenu_draw_spell(_spell_bit,_text,_amount, _x,_y, PI_MENU);
    
    if (Window_vertical_draw_section_count>1)
    {
        var _tsrc, _ts_x,_ts_y;
        var _X1 = Window_spell_menu_window_xl;
        var _Y1 = drawY + ($02<<3);
        
        pal_swap_set(p.palette_image, PI_MENU);
        for(_i=1; _i<CLMS_WIN_SPL-1; _i++) // 
        {
            _tsrc = TSRC_HORZ;
            _ts_x = ((_tsrc>>0)&$F) <<3;
            _ts_y = ((_tsrc>>4)&$F) <<3;
            _x    = _X1 + (_i<<3);
            _y    = _Y1;
            draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
        }
        pal_swap_reset();
    }
}



for(_i=0; _i<Window_vertical_draw_section_count-1; _i++) // Each section
{
    if (_i>=g.SPELL_COUNT) break;//_i
    
                 _spell_bit = $1<<_i;
    if!(f.spells&_spell_bit) continue;//_i
    
    
    
    if (_spell_bit==SPL_FARY 
    &&  g.CuccoSpell2_Acquired 
    &&  g.CuccoSpell2_Option )
    {    _text = SPELL_TEXT_CUCCO;  }
    else _text = ar_spell_str[_i];
    
    
    _amount = get_spell_cost(_spell_bit);
    _x  = Window_spell_menu_window_xl;
    _y  = drawY + (_i<<4);
    _y -= 1; // gives 1 extra pixel pad for 9th spell
    
    
    if (g.mod_IndicateSpellUnaffordable 
    &&  f.mp-_amount<0 )
    {
        _pi = p.PI_SPELL_UNAFFORDABLE;
    }
    else if (g.mod_IndicateSpellActive 
         &&  g.spells_active&_spell_bit )
    {
        _pi = p.PI_SPELL_FUTILE;
    }
    else
    {
        _pi = PI_MENU;
    }
    
    _amount = _amount>>1;
    PauseMenu_draw_spell(_spell_bit,_text,_amount, _x,_y, _pi);
}




