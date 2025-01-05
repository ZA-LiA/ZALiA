/// PauseMenu_Draw()


if(!canDrawSections)
{
    canDrawSections = 0;
    canDrawItems    = 0;
    canDrawSpells   = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
var _i,_j,_k, _count;
var _x,_y, _base_x,_base_y, _w;
var _data1,_data2;
var _tsrc, _ts_x,_ts_y;
var _section_rows = 0;
var _state_current = state&$3;




// ----------------------------------------------------------------------------------
// Draw bg color of menu
draw_sprite_(spr_1x1_WHT,0, drawX,drawY, -1, Window_w,Window_h, p.dl_COLOR[|p.background_color_index]);


// ----------------------------------------------------------------------------------
// Draw frame
pal_swap_set(p.palette_image, PI_MENU);
for(_i=0; _i<Window_vertical_draw_section_count; _i++) // Each vertical section
{
    _base_x = drawX;
    _base_y = drawY + (_i<<4);
    
    var _ar_win_tdata;
    switch(Window_draw_data_state){
    default:    {for(_j=array_length_2d(ar_win_tdata_spl,_i)-1; _j>=0; _j--) _ar_win_tdata[_j]=ar_win_tdata_spl[_i,_j]; break;}
    case ST_ITM:{for(_j=array_length_2d(ar_win_tdata_itm,_i)-1; _j>=0; _j--) _ar_win_tdata[_j]=ar_win_tdata_itm[_i,_j]; break;}
    case ST_MAP:{for(_j=array_length_2d(ar_win_tdata_map,_i)-1; _j>=0; _j--) _ar_win_tdata[_j]=ar_win_tdata_map[_i,_j]; break;}
    }
    
                 _count = array_length_1d(_ar_win_tdata);
    for(_j=0; _j<_count; _j++) // (Window_w x 8). Each row of this section
    {
        _data2 = "";
        if (Window_extra_draw_clms) // map
        {
            _data2  = string_copy(   ar_win_tdata_map[_i,_j],1,2); // First 2 8x8 clms from left edge
            _data2 += string_repeat(string_char_at(_data2,2), Window_filler_clms);
            _data2 += string_char_at(ar_win_tdata_map[_i,_j],3);
        }
        
        _data1 = _ar_win_tdata[_j];
        if (string_length(_data2))
        {
            _w = string_length(_data1) - (CLMS_WIN_DEF-1);
            _data1 = _data2 + strR(_data1, _w+1);
        }
        
        
        for(_k=string_length(_data1)-1; _k>=0; _k--) // 8x8. each column of the row
        {
                _tsrc = string_char_at(_data1,_k+1);
            if (_tsrc=="0" 
            ||  _tsrc=="1" 
            ||  _tsrc=="2" )
            {
                _tsrc = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                _ts_x = ((_tsrc>>0)&$F)<<3;
                _ts_y = ((_tsrc>>4)&$F)<<3;
                _x    = _base_x + (_k<<3);
                _y    = _base_y + (_j<<3);
                draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }//for(_k
    }//for(_j
    
    _ar_win_tdata = 0;
}//for(_i
pal_swap_reset();


// Draw sectional bar for inventory
if (Window_draw_data_state==ST_ITM)
{
    if (Items_Bar1_can_draw)
    {   // Main & Quest items separator
        draw_sprite_(spr_1x1_WHT,0, Items_Bar1_x,Items_Bar1_y+0, -1, Items_Bar_W,4, Items_Bar_COLOR1);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar1_x,Items_Bar1_y+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    }
    
    if (Items_Bar2_can_draw)
    {   // Crystals top bar
        draw_sprite_(spr_1x1_WHT,0, Items_Bar2_x,Items_Bar2_y+0, -1, Items_Bar_W,1, Items_Bar_COLOR1);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar2_x,Items_Bar2_y+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    }
    
    if (Items_Bar3_can_draw)
    {   // Crystals bottom bar
        draw_sprite_(spr_1x1_WHT,0, Items_Bar3_x,Items_Bar3_y+0, -1, Items_Bar_W,2, Items_Bar_COLOR2);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar3_x,Items_Bar3_y+2, -1, Items_Bar_W,1, Items_Bar_COLOR1);
    }
}








// SPELL MENU  ----------------------------------------------------------------------
if (canDrawSpells)          PauseMenu_draw_spell_menu();
// INVENTORY  -----------------------------------------------------------------------
if (canDrawItems)           PauseMenu_draw_inventory();
// MAP  -----------------------------------------------------------------------------
if (Window_extra_draw_clms) PauseMenu_draw_map();








// ----------------------------------------------------------------------------------
//  MENU NAVIGATION  -------------------------------------------------------------  
if (Window_vertical_draw_section_count-1==ANIM_FRAMES_DEF-1)
{
    var _dist_x;
    var _sprite1,_sprite2;
    
    _base_x  = Window_spell_menu_window_xl; // Window_spell_menu_window_xl == getMenuX(). So this doesnt move when map open
    _base_x += ((CLMS_WIN_DEF<<3)>>1);      // menu center x
    _base_y  = Window_yb - $C; // $A8. dist from menu bottom to center of sprite
    _x = _base_x;
    _y = _base_y;
    
    
    _dist_x = ($3<<3) + 4; // dist from menu centerx to center of text
    // Buttons 'B' & 'A' changes PauseMenu states
    // state_dir is timer that inc/dec to 0
    if (sign(state_dir) != -1) draw_text_((_x-_dist_x)-4, _y-4, "B"); // left   $20
    if (sign(state_dir) !=  1) draw_text_((_x+_dist_x)-4, _y-4, "A"); // right  $50
    
    
    switch(_state_current) {
    default:    {_sprite1=SPR_ICON_MAP; _sprite2=SPR_ICON_ITM; break;}
    case ST_ITM:{_sprite1=SPR_ICON_SPL; _sprite2=SPR_ICON_MAP; break;}
    case ST_MAP:{_sprite1=SPR_ICON_ITM; _sprite2=SPR_ICON_SPL; break;}
    }
    
    pal_swap_set(p.palette_image, PI_MENU);
    _dist_x = $5<<3; // dist from menu centerx to center of sprite
    draw_sprite_(_sprite1,0, _x-_dist_x, _y);
    draw_sprite_(_sprite2,0, _x+_dist_x, _y);
    pal_swap_reset();
}








// ----------------------------------------------------------------------------------
//  AREA NAME  -------------------------------------------------------------------
if (_state_current==ST_MAP 
&&  map_anim_idx==array_length_1d(ar_map_anim_data)-1 ) // map fully open
{
    _x  = drawX+8; // text area xl
    _x += (Window_spell_menu_window_xl-_x)>>1; // text area xc
    _x -= (string_length(MapAreaName)<<3) >>1; // text xl
    _y  = Window_yb-$10; // text yt
    draw_text_(_x,_y, MapAreaName);
}








// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
if (true) // set to false when testing map frame by frame with dev app pause
{
    canDrawSections = 0;
    canDrawItems    = 0;
    canDrawSpells   = 0;
}




