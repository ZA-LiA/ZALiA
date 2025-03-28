/// ContinueSaveScreen_draw()


set_background_color(p.C_BLK1);


if (state == ST_NUL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _text, _x,_y;
var _pi = PI_GUI_1;


if(!surface_exists(Caution_srf))
{
    var _i,_j, _tsrc, _ts_x,_ts_y;
    var _CLMS1 = Caution_W>>3;
    var _ROWS1 = Caution_H>>3;
    Caution_srf = surface_create(Caution_W,Caution_H);
    surface_set_target(Caution_srf);
    draw_clear_alpha(c_black,0);
    for(_i=0; _i<_ROWS1; _i++)
    {
        for(_j=0; _j<_CLMS1; _j++)
        {
            if (_j==0 
            ||  _j==_CLMS1-1 
            ||  _i==0 
            ||  _i==_ROWS1-1 )
            {
                _x = _j<<3;
                _y = _i<<3;
                
                if ((_j==0 || _j==_CLMS1-1) 
                &&  (_i==0 || _i==_ROWS1-1) )
                {    _tsrc = $22;  } // Corner
                else if (_j==0 || _j==_CLMS1-1)
                {    _tsrc = $21;  } // Vertical
                else _tsrc = $20;    // Horizontal
                
                _ts_x = ((_tsrc>>0)&$F)<<3;
                _ts_y = ((_tsrc>>4)&$F)<<3;
                draw_background_part(ts_Menu01, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }
    }
    
    var _XL1 = PAD1;
    var _YT1 = PAD1;
    for(_i=ds_list_size(Caution_dl_text)-1; _i>=0; _i--)
    {
        _y = _YT1 + (PAD1*_i);
        draw_text_(_XL1,_y, Caution_dl_text[|_i], -1, 0);
    }
    surface_reset_target();
}

if (surface_exists(Caution_srf))
{
    pal_swap_set(p.palette_image, PI_BGR_1);
    draw_surface(Caution_srf, Caution_XL,Caution_YT);
    pal_swap_reset();
}
//draw_sprite(Caution_SPR,0, Caution_XC,Caution_YC);


draw_sprite_(BOTTLE_SPR,0, Cursor_XC, Cursor_YC+(Options_idx*PAD1), _pi);


if (state == ST_SEL 
&&  Options_idx == Option_SAVE 
&&  saveFlashCount <= SAVE_FLASH_LIMIT 
&&  counter & 4 )
{    _pi = PI_BGR_1;  }
else _pi = PI_GUI_1;
dg_Options[#Option_SAVE,3] = _pi;



for(var _i=0; _i<Options_COUNT; _i++)
{
    _text = dg_Options[#_i,0];
    _x    = dg_Options[#_i,1];
    _y    = dg_Options[#_i,2];
    _pi   = dg_Options[#_i,3];
    draw_text_(_x,_y, _text,-1, _pi);
}



/*
// draw_spr_aligned(MAIN_SPR, x,y, 0,0);
draw_sprite(MAIN_SPR,0, x,y);

if (optionIndex == OP_SAVE) bottleY = BOTTLE_SAVEY;
else                        bottleY = BOTTLE_BASEY;
draw_spr_aligned(BOTTLE_SPR, bottleX,bottleY, -1,-1, get_pi(PI_GUI_1));


if (state == ST_SEL 
&&  optionIndex == OP_SAVE 
&&  saveFlashCount <= SAVE_FLASH_LIMIT 
&&  counter & 4 )
{
    draw_sprite(SAVE_SPR, 0, SAVEX, SAVEY);
}
*/




