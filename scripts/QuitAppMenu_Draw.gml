/// QuitAppMenu_Draw()


if(!cnt_draw_rows) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
var _i,_j, _x,_y;



// ----------------------------------------------------------------------------------
// Draw bg color of menu
draw_sprite_(spr_1x1_WHT,0, drawX,drawY, -1, CLMS<<3, cnt_draw_rows<<3, background_colour);


//draw_gui_frame(ar_tdata, canDrawRows, drawX, drawY);
var _data;
var _tsrc, _ts_x,_ts_y;

for(_i=0; _i<cnt_draw_rows; _i++) // each row
{
    _data = ar_TSRC_DATA[_i];
    
    for(_j=string_length(_data)-1; _j>=0; _j--) // 8x8. each column of the row
    {
            _tsrc = string_char_at(_data,_j+1);
        if (_tsrc=="0" 
        ||  _tsrc=="1" 
        ||  _tsrc=="2" )
        {
            _tsrc = g.dl_MenuFrame_TSRC[|real(_tsrc)];
            _ts_x = ((_tsrc>>0)&$F)<<3;
            _ts_y = ((_tsrc>>4)&$F)<<3;
            _x    =  drawX +    (_j<<3);
            _y    =  drawY +    (_i<<3);
            draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
}




// ----------------------------------------------------------------------------------
if (sub_state!=sub_state_OPEN1) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



var _text;
var _XC = drawX + ((CLMS<<3)>>1);
var _CURS_X = _XC - ($3<<3);

pal_swap_set(p.palette_image, PI_MENU);
_text = TEXT_CONFIRM;
_x  = _XC - ((string_length(_text)<<3)>>1);
_y  = drawY + ($1<<3);
draw_text_(_x,_y, _text);

_text = TEXT_WARNING;
_x  = _XC - ((string_length(_text)<<3)>>1);
_y += ($1<<3);
draw_text_(_x,_y, _text);

_x  = _CURS_X + $0C;
_y += ($1<<3)+4;
draw_text_(_x,_y,   "YES");
draw_text_(_x,_y+8, "NO");

_y += ((!cursor_option)<<3) + 4;
draw_sprite_(spr_arrow_6_rgt,0, _CURS_X+4,_y);
pal_swap_reset();




