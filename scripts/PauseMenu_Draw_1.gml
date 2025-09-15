/// PauseMenu_Draw_1()


var _type  = 0;
    _type |= (!surface_exists(MenuFrame_srf_SPELL)) <<0; // $1
    _type |= (!surface_exists(MenuFrame_srf_ITEM))  <<1; // $2
    _type |= (!surface_exists(MenuFrame_srf_MAP))   <<2; // $4
//
if (_type)
{
    var _i,_j,_k, _count0;
    var _xl,_yt, _xl0,_yt0;
    var _tsrc, _ts_xl,_ts_yt;
    var _data1;
}
else
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// SPELL ------------------------------------------------------------------------------------
if (_type&$1)
{
    MenuFrame_srf_SPELL = surface_create(MenuFrame_srf_SPELL_W,MenuFrame_srf_SPELL_H);
    surface_set_target(MenuFrame_srf_SPELL);
    draw_clear_alpha(c_black,0);
    
    _xl0 = 0;
    _count0 = ds_grid_width(dg_win_tdata_spl);
    for(_i=0; _i<_count0; _i++) // Each vertical section
    {
        _yt0 = _i<<4;
        for(_j=0; _j<dg_tdata_H; _j++) // (Window_w x 8). Each row of this section
        {
            _data1 = dg_win_tdata_spl[#_i,_j];
            if (_data1!=0)
            {
                for(_k=string_length(_data1)-1; _k>=0; _k--) // 8x8. each column of the row
                {
                        _tsrc = string_char_at(_data1,_k+1);
                    if (_tsrc=="0" 
                    ||  _tsrc=="1" 
                    ||  _tsrc=="2" )
                    {
                        _tsrc  = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                        _ts_xl = ((_tsrc>>0)&$F)<<3;
                        _ts_yt = ((_tsrc>>4)&$F)<<3;
                        _xl    = _xl0 + (_k<<3);
                        _yt    = _yt0 + (_j<<3);
                        draw_background_part(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt);
                    }
                }//for(_k
            }
        }//for(_j
    }//for(_i
    
    _xl0 = 0;
    _yt  = $2<<3;
    _tsrc  = TSRC_HORZ;
    _ts_xl = ((_tsrc>>0)&$F) <<3;
    _ts_yt = ((_tsrc>>4)&$F) <<3;
    for(_i=1; _i<SpellWindow_CLMS-1; _i++)
    {
        _xl = _xl0 + (_i<<3);
        draw_background_part(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt);
    }
    
    surface_reset_target();
}








// ITEM ------------------------------------------------------------------------------------
if (_type&$2)
{
    MenuFrame_srf_ITEM = surface_create(MenuFrame_srf_ITEM_W,MenuFrame_srf_ITEM_H);
    surface_set_target(MenuFrame_srf_ITEM);
    draw_clear_alpha(c_black,0);
    
    _xl0 = 0;
    _count0 = ds_grid_width(dg_win_tdata_itm);
    for(_i=0; _i<_count0; _i++) // Each vertical section
    {
        _yt0 = _i<<4;
        for(_j=0; _j<dg_tdata_H; _j++) // (Window_w x 8). Each row of this section
        {
            _data1 = dg_win_tdata_itm[#_i,_j];
            if (_data1!=0)
            {
                for(_k=string_length(_data1)-1; _k>=0; _k--) // 8x8. each column of the row
                {
                        _tsrc = string_char_at(_data1,_k+1);
                    if (_tsrc=="0" 
                    ||  _tsrc=="1" 
                    ||  _tsrc=="2" )
                    {
                        _tsrc  = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                        _ts_xl = ((_tsrc>>0)&$F)<<3;
                        _ts_yt = ((_tsrc>>4)&$F)<<3;
                        _xl    = _xl0 + (_k<<3);
                        _yt    = _yt0 + (_j<<3);
                        draw_background_part(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt);
                    }
                }//for(_k
            }
        }//for(_j
    }//for(_i
    
    
    
    // Draw sectional bar for inventory -------------------
    // Main & Quest items separator
    _xl = Items_Bar1_XOFF;
    _yt = Items_Bar1_YOFF;
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+0, -1, Items_Bar_W,4, Items_Bar_COLOR1);
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    
    // Crystals top bar
    _xl = Items_Bar2_XOFF;
    _yt = Items_Bar2_YOFF;
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+0, -1, Items_Bar_W,1, Items_Bar_COLOR1);
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    
    // Crystals bottom bar
    _xl = Items_Bar3_XOFF;
    _yt = Items_Bar3_YOFF;
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+0, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt+2, -1, Items_Bar_W,1, Items_Bar_COLOR1);
    
    surface_reset_target();
}








// MAP ------------------------------------------------------------------------------------
if (_type&$4)
{
    MenuFrame_srf_MAP = surface_create(MenuFrame_srf_MAP_W,MenuFrame_srf_MAP_H);
    surface_set_target(MenuFrame_srf_MAP);
    draw_clear_alpha(c_black,0);
    
    _xl0 = 0;
    _count0 = ds_grid_width(dg_win_tdata_map);
    for(_i=0; _i<_count0; _i++) // Each vertical section
    {
        _yt0 = _i<<4;
        for(_j=0; _j<dg_tdata_H; _j++) // (Window_w x 8). Each row of this section
        {
            _data1 = dg_win_tdata_map[#_i,_j];
            if (_data1!=0)
            {
                for(_k=string_length(_data1)-1; _k>=0; _k--) // 8x8. each column of the row
                {
                        _tsrc = string_char_at(_data1,_k+1);
                    if (_tsrc=="0" 
                    ||  _tsrc=="1" 
                    ||  _tsrc=="2" )
                    {
                        _tsrc  = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                        _ts_xl = ((_tsrc>>0)&$F)<<3;
                        _ts_yt = ((_tsrc>>4)&$F)<<3;
                        _xl    = _xl0 + (_k<<3);
                        _yt    = _yt0 + (_j<<3);
                        draw_background_part(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt);
                    }
                }//for(_k
            }
        }//for(_j
    }//for(_i
    
    surface_reset_target();
}




