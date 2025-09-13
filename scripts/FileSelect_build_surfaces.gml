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
        var _x,_y, _x1,_y1;
        var _X1  = surf_MAIN_CLMS; // Frame XR
            _X1 -= $02; // Frame + Padding
            _X1 -=($04*3); // Levels + Level pad
            _X1  = _X1<<3; // Levels XL
        var _Y1  = $01<<3; // Frame YT
        var _Y2  = _Y1 + ($02<<3); // -NAME-  -LEVEL- YT
        var _Y3  = _Y2 + ($02<<3); // Save Files YT
        var _text;
        var _tsrc, _ts_x,_ts_y;
        
        pal_swap_set(global.palette_image, PI_MENU1);
        
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
                _spr = dl_spr_statIcon[|_j];
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
        pal_swap_set(global.palette_image, global.PI_GUI1);
        if (surface_exists(surf_MAIN))
        {   draw_surface(  surf_MAIN, surf_MAIN_XL,surf_MAIN_YT);  }
        pal_swap_reset();
    }
    break;}//case State_MAIN
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_REGISTER:{
    
    break;}//case State_REGISTER
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_RANDO:{
    
    break;}//case State_RANDO
    
    
    
    
    
    
    // ---------------------------------------------------
    case State_ELIMINATE:{
    
    break;}//case State_ELIMINATE
}//switch(state)











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
        
        
        pal_swap_set(global.palette_image, PI_MENU1);
        
        
        
        
        
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
        _y  = _Y1;
        _y += RandoOptions_YOFF1;
        if (state==State_REGISTER) draw_text_(_x,_y, "RANDO");
        _y  = _Y2;
        _y += RandoOptions_YOFF1;
        draw_text_(_x,_y, "DONE");
        
        
        
        
        
        
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








// -------------------------------------------------------
// Save File Rando Info
if (string_length(p.pal_rm_curr)) // otherwise some text will be wrong color until the surface is redrawn
{
    for(var _i=0; _i<SAVE_FILE_MAX; _i++)
    {
        var _FILE_NUM = _i+1;
        var _DATAKEY1 = STR_Save+STR_File+hex_str(_FILE_NUM);
        
        if(!is_undefined(      SaveFileRandoInfo_dm[?_DATAKEY1+STR_Rando+STR_Data])) // if this save file is rando'd
        {
            //if(!surface_exists(SaveFileRandoInfo_dm[?STR_Save+STR_File+hex_str(_FILE_NUM)+STR_Surface]))
            if (is_undefined(  SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]) 
            || !surface_exists(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]) )
            {
                var _DATA =    SaveFileRandoInfo_dm[?_DATAKEY1+STR_Rando+STR_Data];
                var _dm_Rando = json_decode(_DATA);
                if (_dm_Rando!=-1)
                {
                    var _j, _count, _val;
                    var _x,_y, _x1,_y1, _xl0,_xc0, _yoff, _w,_h, _clm,_row;
                    var _datakey1, _dk;
                    var _char_w, _char_limit, _text, _font_sprite, _len;
                    var _sprite, _pi;
                    var _RIGHT_CLM_STARTS_WITH_VARIOUS = true;
                    
                    var _SURF_W = viewW();
                    var _SURF_H = viewH();
                    var _SURF = surface_create(_SURF_W,_SURF_H);
                    surface_set_target(_SURF);
                    
                    var _DIST1 = sprite_get_width(FONT_SPRITE1);
                    var _DIST2 = _DIST1+$1;
                    var _DIST3 = $4; // y padding
                    var _DIST4 = _DIST2+_DIST3;
                    
                    var _Area_PAD = 2;
                    var _Area_W   = $10<<3;
                    var _Area_YT  = viewYT()+8;
                    
                    var _Area1_XL = viewXL();
                    var _Area1_XR = _Area1_XL+_Area_W;
                    var _XL1      = _Area1_XL+_Area_PAD;
                    var _Area1_XC = _Area1_XL+(_Area_W>>1);
                    
                    var _Area2_XR = viewXR();
                    var _Area2_XL = _Area2_XR-_Area_W;
                    var _XL2      = _Area2_XL+_Area_PAD;
                    var _Area2_XC = _Area2_XL+(_Area_W>>1);
                    
                    var _Area_XR = viewW()-8;
                    var _add_row = 0;
                    var _FONT_SPRITE2 = spr_Font3_1;
                    //var _FONT_SPRITE2 = spr_Font2_1;
                    var _FONT_SPRITE3 = spr_Font3_1;
                    //var _FONT_SPRITE3 = spr_Font3;
                    var _ITEM_PAD = 2;
                    var _item_bit = 0;
                    var _spell_name = undefined;
                    var _spell_bit = 0;
                    var _PI1 = global.PI_BGR1;
                    //var _PI1 = PI_PC_1;
                    
                    var _XL  = FileRandoData_CLM<<3;
                        _XL -= $6;
                    var _YT  = $8;
                    
                    
                    
                    
                    pal_swap_set(global.palette_image, PI_MENU1);
                    
                    for(_j=0; _j<2; _j++)
                    {
                        if (_j) _x = _XL2;
                        else    _x = _XL1;
                        _y = _Area_YT;
                        _font_sprite = FONT_SPRITE1;
                        _text  = f.dl_save_names[|_FILE_NUM-1];
                        _text += " - RANDO INFO";
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _y += _DIST2;
                        _val = sprite_get_width(_font_sprite);
                        _count  = (_Area_W-(_Area_PAD<<1)) div _val;
                        _count += 1;
                        _text   = string_repeat("-", _count);
                        draw_text_(_x,_y, _text, _font_sprite);
                    }//_j
                    
                    _y += _DIST3;
                    var _YT1 = _y;
                    
                    
                    
                    
                    _xl0 = _XL1;
                    _xc0 = _Area1_XC;
                    
                    // =================================================================
                    // Seed -------------------------------------------------
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 1;
                    _font_sprite = FONT_SPRITE1;
                    _text = "SEED:";
                    draw_text_(_x,_y, _text, _font_sprite);
                    _y += _DIST3;
                    
                    _x += string_length(_text)*sprite_get_width(_font_sprite);
                    //_x += string_length(_text)<<3;
                    _x += 6;
                    //_x += 4;    // _x is sprite center. +4: half sprite width
                    _y1 = _y-1; // _y is sprite center and _text center.
                    var _SEED = FileSelect_get_file_seed(_FILE_NUM,1);
                    Rando_draw_seed(_x,_y1, _SEED, 2);
                    
                    
                    
                    
                    // =================================================================
                    // Items ----------------------------------------------
                    _y += _DIST3;
                    
                    if (val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]))
                    {
                        _y += _DIST2;
                        _y += 3;
                        _text = "_ITEM RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _char_w = sprite_get_width(_font_sprite);
                        _char_limit = _Area_W div _char_w;
                        
                        _x  = _xc0-((string_length(_text)*_char_w)>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        
                            _val = val(_dm_Rando[?dk_LimitObscure]);
                        if (_val)
                        {
                            _text = "LIMIT OBSCURE LOCATIONS";
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            //if (_len>_char_limit) _text = string_copy(_text, 1,_len-2) + "..";
                            _x  = _xl0;
                            _y += _DIST2;
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        //if (val(_dm_Rando[?dk_LimitObscure])) _text = "LIMIT OBSCURE LOCATIONS"
                        
                        
                        _val = val(_dm_Rando[?dk_DarkRoom+STR_Difficulty]);
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "DARKROOM DIFFICULTY:";
                        _len = string_length(_text);
                        if (_len+1>_char_limit) _text = string_copy(_text, 1,_char_limit-3) + "..";
                        _text += string(_val);
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                        
                            _val = val(_dm_Rando[?STR_Item+STR_Location+STR_Hint]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "ITEM LOCATION HINTS";
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        
                            _val = val(_dm_Rando[?STR_Zelda+STR_Hint]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "ZELDA HINT: ";
                            switch(_val){
                            case ZELDA_HINT_OPTIONS.FLUTE: {_text+="FLUTE"; break;}
                            case ZELDA_HINT_OPTIONS.ALLKEY:{_text+="ALLKEY"; break;}
                            case ZELDA_HINT_OPTIONS.JUMP:  {_text+="JUMP TOWN"; break;}
                            }
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "SHUFFLE POOL:";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = " ITEM LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_PBAG+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = " PBAG LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Key+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = " KEY LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Spells ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]) 
                    //||  val(_dm_Rando[?STR_Randomize+STR_Skill+STR_Locations]) 
                    ||  val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Cost]) )
                    {
                        _y += _DIST2;
                        _y += 2;
                        //_text = "_SPELL & SKILL RANDO_";
                        _text = "_SPELL RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Cost]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "SPELL COSTS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        if (val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]) )
                        //||  val(_dm_Rando[?STR_Randomize+STR_Skill+STR_Locations]) )
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "SPELL LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                            /*
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "SHUFFLE POOL:";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                            
                                _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]);
                            if (_val)
                            {
                                _x  = _xl0;
                                _y += _DIST2;
                                //_text  = "TOWN SPELLS";
                                _text  = " SPELL LOCATIONS";
                                draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                            }
                            */
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Dungeon ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Locations]) 
                    //||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Tileset]) 
                    ||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Boss]) 
                    ||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Room]) )
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_DUNGEON RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "DUNGEON LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Boss]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "DUNGEON BOSSES";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Town ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_Rando[?STR_Randomize+STR_Town+STR_Locations]))
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_TOWN RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Town+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "TOWN LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Enemies ----------------------------------------------
                    _y += _DIST3;
                    
                    if (val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]))
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_ENEMY RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Difficulty]);
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "ENEMY DIFFICULTY: "+string(_val);
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                        _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]);
                        _x  = _xl0;
                        _y += _DIST2;
                        switch(_val){
                        case 1:{_text="SPAWN LOCATIONS"; break;}
                        case 2:{_text="ENEMY TYPES"; break;}
                        //case 1:{_text="SHUFFLE SPAWN LOCAT.."; break;}
                        //case 2:{_text="SHUFFLE ENEMY TYPES"; break;}
                        }
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Spawner]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "SPAWNER LOCATIONS";
                            //_text  = "SHUFFLE SPAWNER LOC..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_ENIGMA]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "ENIGMA REACTION";
                            //_text  = "RANDO ENIGMA REACTION";
                            //_text  = "RANDO ENIGMA TRANSFORM";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_HP]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "HP AMOUNTS";
                            //_text  = "HP TABLE AMOUNTS";
                            //_text  = "ENEMY HP TABLE AMOUNTS";
                            //_text  = "RANDO ENEMY HP";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Damage]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text  = "DAMAGE AMOUNTS";
                            //_text  = "DAMAGE TABLE AMOUNTS";
                            //_text  = "RANDO ENEMY DAMAGE";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Level Costs ----------------------------------------------
                    _xl0 = _XL2;
                    _xc0 = _Area2_XC;
                    _y  = _YT1;
                    
                    _y += _DIST2;
                    _text = "_VARIOUS RANDO_";
                    //_text = "_VARIOUS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                        _val = val(_dm_Rando[?STR_Randomize+STR_Level+STR_Cost]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "LEVEL COSTS";
                        //_text  = "RANDO LEVEL COSTS";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    // =================================================================
                    // XP ----------------------------------------------
                        _val = val(_dm_Rando[?STR_Randomize+STR_XP]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "XP AMOUNTS";
                        //_text  = "RANDO XP AMOUNTS";
                        //_text  = "XP TABLE AMOUNTS";
                        //_text  = "RANDO XP REWARD";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Palette ----------------------------------------------
                        _val = val(_dm_Rando[?STR_Randomize+STR_Palette]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "COLORS";
                        //_text  = "RANDO COLORS";
                        //_text  = "RANDO PALETTES";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    // =================================================================
                    // Dungeon Tilesets ----------------------------------------------
                        _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Tileset]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text  = "DUNGEON TILESETS";
                        //_text  = "RANDO DUNGEON TILESET";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Requirements --------------------------------------
                    _y += _DIST3;
                    _y += 3;
                    
                    _y += _DIST2;
                    _text = "_REQUIREMENTS_";
                    //_text  = "_REQUIREMENTS SETTINGS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 4;
                    
                    _x1 = _x + 4;
                    _y1 = _y + 4;
                    SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_X"] = _x1;
                    SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_Y"] = _y1;
                    _pi = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
                    draw_sprite_(spr_Crystal_1a,0, _x1,_y1, _pi);
                    
                    _x += $8;
                    draw_text_(_x,_y, "*", -1,PI_MENU1);
                    
                    _x += $8;
                    _val = val(_dm_Rando[?STR_Crystal+STR_Required+STR_Count], f.CRYSTAL_MAX);
                    _text = string(_val);
                    draw_text_(_x,_y, _text, spr_Font1,PI_MENU1);
                    
                    
                    
                    _x += $18+$0;
                    _yoff = 1;
                    _pi = global.PI_MOB_ORG;
                    draw_sprite_(spr_Bot2_Norm,    0, _x,_y+_yoff, _pi);
                    draw_sprite_(spr_Bot_Eyes_1a_1,0, _x,_y+_yoff, _pi);
                    draw_sprite_(spr_1x1_WHT,0, _x-1,_y+3+_yoff, -1, 2,1, get_pal_color(p.pal_rm_curr, _pi, "B"));
                    
                    _x += $9;
                    draw_text_(_x,_y, "*", -1,PI_MENU1);
                    
                    _x += $8;
                    _val = val(g.dm_spawn[?STR_Kakusu+STR_Count], 12);
                    _val = val(_dm_Rando[?STR_Kakusu+STR_Required+STR_Count], _val);
                    _text = string(_val);
                    draw_text_(_x,_y, _text, spr_Font1,PI_MENU1);
                    
                    
                    
                    
                    // =================================================================
                    // Start Quest, Start Levels --------------------------------------
                    _y += _DIST3;
                    _y += 2;
                    
                    _y += _DIST2;
                    _y += 2;
                    _text  = "_START SETTINGS_";
                    //_text  = "_START-WITH SETTINGS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0;
                    _x -= (string_length(_text)*sprite_get_width(_font_sprite))>>1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    // QUEST -----------------------------------
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 2;
                    _text = "QUEST:";
                    //_text  = "START QUEST: "+string(val(_dm_Rando[?STR_File+STR_Start+STR_Quest]));
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    _x += 4;
                    _text = string(val(_dm_Rando[?STR_File+STR_Start+STR_Quest]));
                    _font_sprite = spr_Font1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    /*
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 2;
                    _text  = "QUEST: "+string(val(_dm_Rando[?STR_File+STR_Start+STR_Quest]));
                    //_text  = "START QUEST: "+string(val(_dm_Rando[?STR_File+STR_Start+STR_Quest]));
                    _text += " ";
                    draw_text_(_x,_y, _text, FONT_SPRITE1);
                    */
                    
                    
                    _y += _DIST2;
                    
                    
                    // LEVELS -----------------------------------
                    _datakey1 = STR_File+STR_Start+STR_Level;
                    _y += 3;
                    _x  = _xl0;
                    _text = "LEVELS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Attack level ---------------------
                    _x += 4;
                    _sprite = global.SPR_ICON_ATK;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_Rando[?_datakey1+STR_Attack]));
                    _font_sprite = spr_Font1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Magic level ---------------------
                    _x += 4;
                    _sprite = global.SPR_ICON_MAG;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_Rando[?_datakey1+STR_Magic]));
                    _font_sprite = spr_Font1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Life level ---------------------
                    _x += 4;
                    //_x += 1; // micro adj
                    _sprite = global.SPR_ICON_LIF;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_Rando[?_datakey1+STR_Life]));
                    _font_sprite = spr_Font1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    /*
                    _x  = _xl0;
                    _text  = "START LEVELS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    // Attack level
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    _x += -2;
                    draw_spr_aligned(global.SPR_ICON_ATK, _x,_y,  -1,-1, PI_MENU1);
                    draw_text_(_x+8,_y, string(val(_dm_Rando[?_datakey1+STR_Attack])));
                    
                    // Magic level
                    _x += $02<<3;
                    draw_spr_aligned(global.SPR_ICON_MAG, _x,_y,  -1,-1, PI_MENU1);
                    draw_text_(_x+8,_y, string(val(_dm_Rando[?_datakey1+STR_Magic])));
                    
                    // Life level
                    _x += $02<<3;
                    _x += 1;
                    draw_spr_aligned(global.SPR_ICON_LIF, _x,_y,  -1,-1, PI_MENU1);
                    draw_text_(_x+8,_y, string(val(_dm_Rando[?_datakey1+STR_Life])));
                    */
                    
                    
                    
                    
                    // =================================================================
                    // Start Items --------------------------------------
                    _y += _DIST4;
                    
                    _y += 4;
                    //_y -= 1;
                    _x  = _xl0;
                    _text  = "ITEMS:";
                    //_text  = "START ITEMS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 8;
                    _y += 1;
                    var _ITEMS = val(_dm_Rando[?STR_File+STR_Start+STR_Items]);
                    
                    for(_j=0; _j<RandoOTHER_ITEMS_item_cursor_COUNT; _j++)
                    {
                        switch(_j){
                        default:{continue;}
                        case RandoOTHER_ITEMS_item_cursor_CANDLE: {_dk=STR_CANDLE;  _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_FLUTE:  {_dk=STR_FLUTE;   _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_SHIELD: {_dk=STR_SHIELD;  _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_BAIT:   {_dk=STR_MEAT;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_RING:   {_dk=STR_RING;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_PENDANT:{_dk=STR_PENDANT; _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_SWORD:  {_dk=STR_SWORD;   _pi=global.PI_MOB_ORG; _x-=1; break;}
                        case RandoOTHER_ITEMS_item_cursor_FEATHER:{_dk=STR_FEATHER; _pi=global.PI_MOB_ORG; _x-=1; break;}
                        case RandoOTHER_ITEMS_item_cursor_NOTE:   {_dk=STR_NOTE;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_MAP1:   {_dk=STR_MAP1;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_MAP2:   {_dk=STR_MAP2;    _pi=global.PI_MOB_ORG; break;}
                        }
                        
                        if!(_ITEMS&val(g.dm_ITEM[?_dk+STR_Bit])) _pi = global.PI_GUI2;
                        
                        
                        _sprite = val(g.dm_ITEM[?_dk+STR_Sprite], spr_Torch_1a);
                        _w = sprite_get_width(_sprite);
                        draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                        
                        _x += _w+_ITEM_PAD;
                        if (_j!=RandoOTHER_ITEMS_item_cursor_MAP1) _x += 2;
                    }//_j
                    
                    
                    
                    
                    _y += $13;
                    
                    _x  = _xl0;
                        _count = val(_dm_Rando[?STR_File+STR_Start+STR_Container+STR_HP], f.CONT_MIN_HP);
                    if (_count>f.CONT_MIN_HP) _pi = global.PI_MOB_RED;
                    else                      _pi = global.PI_GUI2;
                    
                    _sprite = spr_Item_Heart_container_1d;
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += 1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 4;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    _x += $9;
                        _count = val(_dm_Rando[?STR_File+STR_Start+STR_Container+STR_MP], f.CONT_MIN_MP);
                    if (_count>f.CONT_MIN_MP) _pi = global.PI_MOB_ORG;
                    else                      _pi = global.PI_GUI2;
                    
                    _sprite = spr_Item_Magic_container_1d;
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += -1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 4;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    _x += $B;
                        _count = val(_dm_Rando[?STR_File+STR_Start+STR_Dolls]);
                    if (_count) _pi = global.PI_PC1;
                    else        _pi = global.PI_GUI2;
                    
                    _sprite = val(g.dm_ITEM[?STR_1UP+STR_Sprite], spr_Torch_1a);
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += 1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 8;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    // =================================================================
                    // Start Spells --------------------------------------
                    _y += _DIST2;
                    
                    var _SPELLS = val(_dm_Rando[?STR_File+STR_Start+STR_Spells]);
                    if (_SPELLS)
                    {
                        _y += _DIST4;
                        _y += -1;
                        _x  = _xl0;
                        _text = "START SPELLS:";
                        _font_sprite = FONT_SPRITE1;
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _y += 1;
                        _count = ds_list_size(g.dl_Spell_STR);
                        for(_j=0; _j<_count; _j++)
                        {
                            _spell_name = g.dl_Spell_STR[|_j];
                            _spell_bit  = val(g.dm_Spell[?STR_Bit+_spell_name]);
                            if (_SPELLS&_spell_bit)
                            {
                                _x  = _xl0;
                                _y += _DIST2;
                                draw_text_(_x,_y, " "+string_letters(_spell_name), _FONT_SPRITE3, _PI1);
                            }
                        }
                    }
                    
                    
                    pal_swap_reset();
                    
                    
                    
                    
                    SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface] = surface_create(_SURF_W,_SURF_H);
                    surface_copy(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface], 0,0, _SURF);
                    surface_reset_target();
                    surface_free(_SURF);
                    
                    ds_map_destroy(_dm_Rando); _dm_Rando=undefined;
                }
            }
        }
    }//_i
}




