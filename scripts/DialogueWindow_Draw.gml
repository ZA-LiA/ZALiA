/// DialogueWindow_Draw()


// Dialogue window draws one 16 tall row at a time
var _SECTIONS = cnt_draw_rows>>1;
if(!_SECTIONS) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
var _i, _x,_y, _w,_h;
var _val;
var _D3 = g.gui_state==g.gui_state_DIALOGUE3; // gui_state_DIALOGUE3: shop offer


if (g.gui_window_can_draw)
{
    var _j,_k;
    var _data;
    var _tsrc, _ts_x,_ts_y;
    var _rows;
    
    for(_i=1; _i<=2; _i++)
    {
        if (_i==1) // Regular dialogue window
        {
            if(!surface_exists(    WINDOW_FRAME1_SRF) 
            ||  surface_get_width( WINDOW_FRAME1_SRF)==1 ) // first frame
            {
                if(!surface_exists(WINDOW_FRAME1_SRF)) WINDOW_FRAME1_SRF = surface_create(1,1);
                surface_resize(    WINDOW_FRAME1_SRF, CLMS<<3, ROWS_DEF<<3);
                surface_set_target(WINDOW_FRAME1_SRF);
            }
            else
            {
                continue;//_i
            }
            
            _rows = ROWS_DEF;
        }
        else if (_i==2) // Shop dialogue window
        {
            if(!surface_exists(    WINDOW_FRAME2_SRF) 
            ||  surface_get_width( WINDOW_FRAME2_SRF)==1 ) // first frame
            {
                if(!surface_exists(WINDOW_FRAME2_SRF)) WINDOW_FRAME2_SRF = surface_create(1,1);
                surface_resize(    WINDOW_FRAME2_SRF, CLMS<<3, ROWS_SHOP<<3);
                surface_set_target(WINDOW_FRAME2_SRF);
            }
            else
            {
                continue;//_i
            }
            
            _rows = ROWS_SHOP;
        }
        
        
        for(_j=0; _j<_rows; _j++) // Each row
        {
            if (_j==0                       // top    border
            ||  _j==_rows-1                 // bottom border
            ||  (_i==2 && _j==ROWS_DEF-1) ) // GUI_D3 shop offer divider row
            {
                _data = TSRC_DATA1;
            }
            else
            {
                _data = TSRC_DATA2;
            }
            
            
            for(_k=string_length(_data)-1; _k>=0; _k--) // Each $8 x $50 column of the row
            {
                    _val = string_char_at(_data,_k+1);
                if (_val=="0"   // 0: horizontal bar
                ||  _val=="1"   // 1: vertical bar
                ||  _val=="2" ) // 2: corner
                {
                    _tsrc = g.dl_MenuFrame_TSRC[|real(_val)];
                    _tsrc = clamp(_tsrc, 0,$FF);
                    
                    _ts_x = ((_tsrc>>0)&$F) <<3;
                    _ts_y = ((_tsrc>>4)&$F) <<3;
                    
                    _x = _k<<3;
                    _y = _j<<3;
                    draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
                }
            }//for(_k
        }//for(_j
        
        surface_reset_target();
    }//for(_i
    
    
    
    
    // -------------------------------------------------------------------------
    // DRAW SOLID BG --------------------------------------------
    _w = clms         <<3;
    _h = cnt_draw_rows<<3;
    draw_sprite_(spr_1x1_WHT,0, drawX,drawY, -1, _w,_h, background_colour);
    
    
    // -------------------------------------------------------------------------
    // DRAW FRAME --------------------------------------------
    // draw_gui_frame(ar_TSRC_DATA, cnt_draw_rows, drawX, drawY);
    pal_swap_set(p.palette_image, PI_GUI_1);
    if(!_D3){
        if (surface_exists(   WINDOW_FRAME1_SRF))
        {   draw_surface_part(WINDOW_FRAME1_SRF, 0,0, _w,_h, drawX,drawY);  }
    }else{
        if (surface_exists(   WINDOW_FRAME2_SRF))
        {   draw_surface_part(WINDOW_FRAME2_SRF, 0,0, _w,_h, drawX,drawY);  }
    }
    pal_swap_reset();
}




// -------------------------------------------------------------------------
// DRAW TEXT --------------------------------------------
// g.dw.dialogue Example: 'FIND MAGIC<IN A CAVE<SOUTH OF<THE CASTLE.'
if (writ_char_pos  // if any characters written yet
&&  _SECTIONS>1 )  // if at least 2 window sections drawn
{
    var _Z2 = g.dialogue_source && g.dialogue_source.object_index==Zelda && g.dialogue_source.ver==2;
    var _FONT  = val(dm_dialogue[?g.dialogue_source.dialogue_datakey+dialogue_ver+STR_Font], spr_Font1);
    var _LINES = min(writ_line_idx+1, _SECTIONS-1); // _SECTIONS-1: Top & Btm border
    
    var _x1 = drawX + text_x_off;
    var _y1 = drawY + text_y_off;
    if (_Z2)
    {
        _x1  = (g.rm_w_ >>3)<<3;
        _y1  = (viewYC()>>3)<<3;
        _y1 -= 3<<3;
        _y1 += 4;
    }
    
    
    for(_i=0; _i<_LINES; _i++) // Each line that can be written
    {
        if (_Z2) _x = g.rm_w_ - ((dg_dlg[#_i,1]<<3)>>1); // dg_dlg[#_i,1]: the string_length of the line
        else     _x = _x1;
        _y = _y1 + (_i<<4);
        draw_text_(_x,_y, ar_lines_written[_i], _FONT);
    }
}




if (cnt_draw_rows==rows 
&&  writ_char_pos>=string_length(dialogue) 
&& !is_undefined(g.dialogue_source.dk_spawn) )
{   // SIGN ARROW
    _val = val(g.dm_spawn[?g.dialogue_source.dk_spawn+STR_Arrow],-1);
    if (_val+1)
    {
        _x = drawX + (_w>>1);
        _y = drawY + _h - $E;
        _val &= $3;
        var _x_scale = 1;
        var _y_scale = 1;
        switch(_val){
        case 0:{_x_scale= 1; _y_scale= 1; break;} // right
        case 1:{_x_scale= 1; _y_scale= 1; break;} // up
        case 2:{_x_scale= 1; _y_scale=-1; break;} // left
        case 3:{_x_scale=-1; _y_scale= 1; break;} // down
        }
        _val *= 90;
        draw_sprite_(spr_arrow_1b,0, _x,_y, PI_GUI_1, _x_scale,_y_scale, c_white,1, _val);
    }
}




if (_D3 
&&  cnt_draw_rows==rows 
&&  writ_char_pos>=string_length(dialogue) )
{
    _y = drawY + (rows<<3) - $10;
    //_y += -2; // border pad
    
    _x = drawX + ($3<<3);
    draw_text_(_x,_y, TEXT_ACCEPT);
    
    _x = drawX + ($9<<3);
    draw_text_(_x,_y, TEXT_DECLIN);
    
    if (cursor_option==Input.R) _x  = drawX + ($8<<3);
    else                        _x  = drawX + ($2<<3);
                                _x += -1; // pad
    draw_sprite(SPR_CURSOR,0, _x,_y);
}








// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
canDrawSections = 0;
cnt_draw_rows   = 0;




