/// FileSelect_build_surfaces()


switch(state)
{   // ---------------------------------------------------
    case State_MAIN:{
    if(!surface_exists(    surf_MAIN) 
    ||  surface_get_width( surf_MAIN)==1 ) // first frame
    {
        if(!surface_exists(surf_MAIN)) surf_MAIN = surface_create(1,1);
        surface_resize(    surf_MAIN,  surf_MAIN_CLMS<<3, surf_MAIN_ROWS<<3);
        surface_set_target(surf_MAIN);
        
        var _i,_j, _idx, _val;
        var _x,_y;
        var _X1  = surf_MAIN_CLMS; // Frame XR
            _X1 -= $02; // Frame + Padding
            _X1 -=($04*3); // Levels + Level pad
            _X1  = _X1<<3; // Levels XL
        var _Y1  = $01<<3; // Frame YT
        var _Y2  = _Y1 + ($02<<3); // -NAME-  -LEVEL- YT
        var _Y3  = _Y2 + ($02<<3); // Save Files YT
        var _text;
        var _tsrc, _ts_x,_ts_y;
        
        pal_swap_set(p.palette_image, PI_MENU);
        
        // HEADER =======================
        _text = "S E L E C T";
        _x  = (surf_MAIN_CLMS<<3)>>1;
        _x -= (string_length(_text)<<3)>>1;
        _y  = 0;
        draw_text_(_x,_y, _text);
        
        // "-NAME-     -LEVEL-" =======================
        _text = "-NAME-     -LEVEL-";
        _x  = $05<<3;
        _y  = _Y2;
        draw_text_(_x,_y, _text);
        
        // LEVELS =======================
        for(_i=0; _i<SAVE_FILE_MAX; _i++)
        {
            _y  = _Y3; // Save Files YT
            _y += _i * ($03<<3); // spr YT
            for(_j=0; _j<3; _j++)
            {
                _x  = _X1; // Levels XL
                _x += _j * ($04<<3); // spr XL
                _spr = ar_spr_statIcon[_j];
                draw_sprite_(_spr,0, _x+4,_y+4);
                
                _x += 8; // "-" XL
                draw_text_(_x,_y, "-");
            }
        }
        
        // REGISTER =======================
        _x  = $04<<3;
        _y  = _Y3; // Save Files YT
        _y +=($03*SAVE_FILE_MAX)<<3; // Save Files YB
        _y += $01<<3; // Padding
        draw_text_(_x,_y, "REGISTER YOUR NAME");
        
        // ELIMINATE =======================
        _y += $03<<3; // Dist to Eliminate
        draw_text_(_x,_y, "ELIMINATION MODE");
        
        // FRAME =======================
        var _ROWS = Frame_ROWS;
        //var _ROWS = surf_MAIN_ROWS;
        for(_i=0; _i<_ROWS; _i++)
        {
            for(_j=0; _j<surf_MAIN_CLMS; _j++)
            {
                if (_i==0 
                ||  _i==_ROWS-1 )
                {
                    if (_j>0 
                    &&  _j<surf_MAIN_CLMS-1 )
                    {    _idx=0;  } // 0: Horizontal bar
                    else _idx=2;    // 2: Corner
                }
                else
                {
                    if (_j==0 
                    ||  _j==surf_MAIN_CLMS-1 )
                    {
                        _idx=1; // 1: Vertical bar
                    }
                    else
                    {
                        continue;// _j
                    }
                }
                
                _tsrc = g.dl_MenuFrame_TSRC[|_idx];
                _tsrc = clamp(_tsrc, 0,$FF);
                
                _ts_x = ((_tsrc>>0)&$F) <<3;
                _ts_y = ((_tsrc>>4)&$F) <<3;
                
                _x  = _j<<3;
                _y  = _Y1;   // Frame YT
                _y += _i<<3;
                draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }
        
        pal_swap_reset();
        surface_reset_target();
    }
    else
    {
        pal_swap_set(p.palette_image, PI_GUI_1);
        if (surface_exists(surf_MAIN))
        {   draw_surface(  surf_MAIN, surf_MAIN_XL,surf_MAIN_YT);  }
        pal_swap_reset();
    }
    break;}//case State_MAIN
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_REGISTER:{
    /*
    else
    {
        pal_swap_set(p.palette_image, PI_GUI_1);
        if (surface_exists(surf_REGISTER))
        {   draw_surface(  surf_REGISTER, surf_MAIN_XL,surf_MAIN_YT);  }
        pal_swap_reset();
    }
    */
    break;}//case State_REGISTER
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_RANDO:{
    
    break;}//case State_RANDO
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_ELIMINATE:{
    
    break;}//case State_ELIMINATE
}//switch(state)











//if ((state==State_REGISTER  && (!surface_exists(surf_REGISTER)  || surface_get_width(surf_REGISTER) ==1)) 
//||  (state==State_ELIMINATE && (!surface_exists(surf_ELIMINATE) || surface_get_width(surf_ELIMINATE)==1)) )
if (state==State_REGISTER 
||  state==State_ELIMINATE )
{
    var _INIT_IS_NEEDED = false;
    if (state==State_REGISTER)
    {
        if(!surface_exists(    surf_REGISTER) 
        ||  surface_get_width( surf_REGISTER)==1 ) // first frame
        {   _INIT_IS_NEEDED = true;  }
    }
    else
    {
        if(!surface_exists(    surf_ELIMINATE) 
        ||  surface_get_width( surf_ELIMINATE)==1 ) // first frame
        {   _INIT_IS_NEEDED = true;  }
    }
    
    
    if (_INIT_IS_NEEDED)
    {
        var _i,_j;
        var _idx = 0;
        var _x,_y, _x1,_y1, _dist1,_dist2;
        var _clms, _rows;
        var _tsrc, _ts_x,_ts_y;
        var _text, _len, _char_w;
        
        var         _dl_CHAR_TABLE=ds_list_create();
        ds_list_add(_dl_CHAR_TABLE,"A B C D E F G H I J K");
        ds_list_add(_dl_CHAR_TABLE,"L M N O P Q R S T U V");
        ds_list_add(_dl_CHAR_TABLE,"W X Y Z - .");
        ds_list_add(_dl_CHAR_TABLE,"0 1 2 3 4 5 6 7 8 9");
        
        _len = string_length(_dl_CHAR_TABLE[|0]);
        var _Table_CLMS  = _len; // text
            _Table_CLMS += $02;  // + left & right text padding
            _Table_CLMS += $02;  // + left & right window borders
        //
        
        _clms  = _Table_CLMS;    // number of char table clms
        _clms += _Table_CLMS&$1; // round up to even
        var _DrawArea_W  = max(Area1_W, _clms<<3);
        var _surf_W = _DrawArea_W;
        //var _surf_W = viewW();
        var _DrawArea_XL = (_surf_W>>1) - (_DrawArea_W>>1);
        var _surf_XC = _surf_W>>1;
        
        var _Y1  = $03<<3; // YT of save files
            _Y1 +=($03<<3)*SAVE_FILE_MAX; // + total height of save files for YT of "RANDO"/"END"
            _Y1 += $01<<3; // + extra "RANDO"/"END" pad
        var                        _Y2  = _Y1;    // YT of "END"
        if (state==State_REGISTER) _Y2 += $02<<3; // YT of "END"
        var _Y3  = _Y2;    // YT of "END"
            _Y3 += $02<<3; // YT of window border
        //
        //var _surf_H  = viewH();
        _rows  = _Y3>>3;                           // YT of window border
        _rows += $02;                              // + top & bottom window borders
        _rows += ds_list_size(_dl_CHAR_TABLE);     // + rows of text
        _rows += ds_list_size(_dl_CHAR_TABLE)+$01; // + empty rows between each char table line
        var _surf_H = _rows<<3;
        
        if (state==State_REGISTER)
        {
            if(!surface_exists(surf_REGISTER)) surf_REGISTER = surface_create(1,1);
            surface_resize(    surf_REGISTER, _surf_W,_surf_H);
            surface_set_target(surf_REGISTER);
        }
        else
        {
            if(!surface_exists(surf_ELIMINATE)) surf_ELIMINATE = surface_create(1,1);
            surface_resize(    surf_ELIMINATE, _surf_W,_surf_H);
            surface_set_target(surf_ELIMINATE);
        }
        
        
        pal_swap_set(p.palette_image, PI_MENU);
        
        
        
        
        
        // HEADER =======================
        if (state==State_REGISTER) _text = " REGISTER YOUR NAME ";
        else                       _text = " ELIMINATION MODE ";
        _char_w = 8;
        _len = string_length(_text);
        _dist1 = _len*_char_w;
        
        // Horizontal bar
        _tsrc = g.dl_MenuFrame_TSRC[|0]; // 0: Horizontal bar
        _ts_x = ((_tsrc>>0)&$F) <<3;
        _ts_y = ((_tsrc>>4)&$F) <<3;
        
        _dist2  = _DrawArea_W>>1; // half w of header
        _dist2 -= _dist1>>1; // w available for an end bar
        _clms  = _dist2>>3;  // Number of horizontal bar tiles on each side of header text
        _clms -= _clms&$1;   // round down to even
        
        _dist2 = _DrawArea_W>>1; // half w of header
        _x1 = _surf_XC - _dist2; // XL of header
        _x = _x1; // XL of left end bar (XL of header)
        _y = 0;   // YT of header
        repeat(2)
        {
            for(_i=0; _i<_clms; _i++) draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x+(_i<<3),_y);
            _x  = _surf_XC + _dist2; // XR of right end bar
            _x -= _clms<<3;          // XL of right end bar
        }
        
        // Header text
        _x = _surf_XC - (_dist1>>1);
        draw_text_(_x,_y, _text);
        
        
        
        
        
        // "RANDO" & "END" =======================
        _x  = SAVE_NAME_X2;
        _x -= viewXC() - (_DrawArea_W>>1); // Because we're drawing on a surface, adjust for possible offset
        if (state==State_REGISTER) draw_text_(_x,_Y1, "RANDO");
        draw_text_(_x,_Y2, "DONE");
        //draw_text_(_x,_Y2, "END");
        
        
        
        
        
        
        // CHAR TABLE =======================
        _clms = _Table_CLMS; // number of window clms
        _dist2 = (_clms<<3)>>1; // half w of the table window
        
        _x1 = _surf_XC - _dist2; // XL of window border
        _x1 = (_x1>>3)<<3;       // make sure window is aligned w/ the grid
        _x  = _x1;    // XL of window border
        _x += $01<<3; // + left window border
        _x += $01<<3; // + left text pad to get XL of text area
        
        _y1  = _Y3;    // YT of window border
        _y1 += $01<<3; // + top window border
        _y1 += $01<<3; // + top text pad to get YT of text area
        for(_i=ds_list_size(_dl_CHAR_TABLE)-1; _i>=0; _i--)
        {
            _y  = _y1; // 1st line text YT
            _y += ($02<<3)*_i; // + dist between text rows
            draw_text_(_x,_y, _dl_CHAR_TABLE[|_i]);
        }
        
        // CHAR TABLE WINDOW BORDER =======================
        _idx = 2; // 2: Corner tile
        _y1 = _Y3; // YT of window border
        _rows  = ds_list_size(_dl_CHAR_TABLE); // text rows
        _rows += _rows+1; // + space inbetween text rows
        _rows += $02;     // + top & bottom window borders
        for(_i=0; _i<_rows; _i++)
        {
            for(_j=0; _j<_clms; _j++)
            {
                if (_i==0 
                ||  _i==_rows-1 )
                {   // Top & Bottom rows
                    if (_j==0 
                    ||  _j==_clms-1 )
                    {    _idx=2;  } // 2: Corner
                    else _idx=0;    // 0: Horizontal bar
                }
                else
                {   // Sides
                    if (_j==0 
                    ||  _j==_clms-1 )
                    {    _idx=1;  } // 1: Vertical bar
                    else continue;// _j
                }
                
                _tsrc = g.dl_MenuFrame_TSRC[|_idx];
                _ts_x = ((_tsrc>>0)&$F) <<3;
                _ts_y = ((_tsrc>>4)&$F) <<3;
                
                _x = _x1 + (_j<<3);
                _y = _y1 + (_i<<3);
                draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }
        
        pal_swap_reset();
        surface_reset_target();
        ds_list_destroy(_dl_CHAR_TABLE); _dl_CHAR_TABLE=undefined;
    }
}




