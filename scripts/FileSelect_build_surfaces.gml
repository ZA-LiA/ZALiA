/// FileSelect_build_surfaces()


if(!surface_exists(MAIN_surf))
{
    MAIN_surf = surface_create(MAIN_surf_W,MAIN_surf_H);
    surface_set_target(MAIN_surf);
    draw_clear_alpha(c_black,0);
    
    var _i,_j, _idx;
    var _x,_y;
    var _X1  = MAIN_surf_CLMS; // Frame XR
        _X1 -= $02; // Frame + Padding
        _X1 -=($04*3); // Levels + Level pad
        _X1  = MAIN_surf_DrawArea_XL + (_X1<<3); // Levels XL
    var _Y1  = MAIN_surf_DrawArea_YT + ($01<<3); // Frame YT
    var _Y2  = _Y1 + ($02<<3); // -NAME-  -LEVEL- YT
    var _Y3  = _Y2 + ($02<<3); // Save Files YT
    var _text;
    var _tsrc, _ts_x,_ts_y;
    
    
    pal_swap_set(global.palette_image, PI_MENU1);
    
    // HEADER =======================
    _text = "S E L E C T";
    _x  = MAIN_surf_W>>1;
    _x -= (string_length(_text)<<3)>>1;
    _y  = MAIN_surf_DrawArea_YT;
    draw_text_(_x,_y, _text);
    
    // "-NAME-     -LEVEL-" =======================
    _text = "-NAME-     -LEVEL-";
    _x  = MAIN_surf_DrawArea_XL + ($05<<3);
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
            _spr = dl_spr_statIcon[|_j];
            draw_sprite_(_spr,0, _x+4,_y+4);
            
            _x += 8; // "-" XL
            draw_text_(_x,_y, "-");
        }
    }
    
    // REGISTER =======================
    _x  = MAIN_surf_DrawArea_XL + ($04<<3);
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
        for(_j=0; _j<MAIN_surf_CLMS; _j++)
        {
            if (_i==0 
            ||  _i==_ROWS-1 )
            {
                if (_j>0 
                &&  _j<MAIN_surf_CLMS-1 )
                {    _idx=0;  } // 0: Horizontal bar
                else _idx=2;    // 2: Corner
            }
            else
            {
                if (_j==0 
                ||  _j==MAIN_surf_CLMS-1 )
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
            
            _x  = MAIN_surf_DrawArea_XL + (_j<<3);
            _y  = _Y1;   // Frame YT
            _y += _i<<3;
            draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
    
    pal_swap_reset();
    surface_reset_target();
    if (surface_exists(MAIN_surf)) show_debug_message("FileSelect_build_surfaces(). "+"`MAIN_surf` created!");
}




FileSelect_build_surfaces_1(STR_Register);
FileSelect_build_surfaces_1(STR_Eliminate);




// -------------------------------------------------------
// Save File Rando Info
FileSelect_build_surfaces_2();




/*
// -----------------------------------------------------------------------------------
switch(state)
{   // ---------------------------------------------------
    case State_MAIN:{
    if(!surface_exists(MAIN_surf))
    {
        MAIN_surf = surface_create(MAIN_surf_W,MAIN_surf_H);
        surface_set_target(MAIN_surf);
        draw_clear_alpha(c_black,0);
        
        var _i,_j, _idx;
        var _x,_y;
        var _X1  = MAIN_surf_CLMS; // Frame XR
            _X1 -= $02; // Frame + Padding
            _X1 -=($04*3); // Levels + Level pad
            _X1  = MAIN_surf_DrawArea_XL + (_X1<<3); // Levels XL
        var _Y1  = MAIN_surf_DrawArea_YT + ($01<<3); // Frame YT
        var _Y2  = _Y1 + ($02<<3); // -NAME-  -LEVEL- YT
        var _Y3  = _Y2 + ($02<<3); // Save Files YT
        var _text;
        var _tsrc, _ts_x,_ts_y;
        
        
        pal_swap_set(global.palette_image, PI_MENU1);
        
        // HEADER =======================
        _text = "S E L E C T";
        _x  = viewXC();
        _x -= (string_length(_text)<<3)>>1;
        _y  = MAIN_surf_DrawArea_YT;
        draw_text_(_x,_y, _text);
        
        // "-NAME-     -LEVEL-" =======================
        _text = "-NAME-     -LEVEL-";
        _x  = MAIN_surf_DrawArea_XL + ($05<<3);
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
                _spr = dl_spr_statIcon[|_j];
                draw_sprite_(_spr,0, _x+4,_y+4);
                
                _x += 8; // "-" XL
                draw_text_(_x,_y, "-");
            }
        }
        
        // REGISTER =======================
        _x  = MAIN_surf_DrawArea_XL + ($04<<3);
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
            for(_j=0; _j<MAIN_surf_CLMS; _j++)
            {
                if (_i==0 
                ||  _i==_ROWS-1 )
                {
                    if (_j>0 
                    &&  _j<MAIN_surf_CLMS-1 )
                    {    _idx=0;  } // 0: Horizontal bar
                    else _idx=2;    // 2: Corner
                }
                else
                {
                    if (_j==0 
                    ||  _j==MAIN_surf_CLMS-1 )
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
                
                _x  = MAIN_surf_DrawArea_XL + (_j<<3);
                _y  = _Y1;   // Frame YT
                _y += _i<<3;
                draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }
        
        pal_swap_reset();
        surface_reset_target();
        if (surface_exists(MAIN_surf)) show_debug_message("FileSelect_build_surfaces(). "+"`MAIN_surf` created!");
    }
    break;}//case State_MAIN
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_REGISTER:{
    FileSelect_build_surfaces_1(STR_Register);
    break;}//case State_REGISTER
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_RANDO:{
    
    break;}//case State_RANDO
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_ELIMINATE:{
    FileSelect_build_surfaces_1(STR_Eliminate);
    break;}//case State_ELIMINATE
}//switch(state)




// -------------------------------------------------------
// Save File Rando Info
FileSelect_build_surfaces_2();
*/




