/// GraphicsEffectsEditor_Draw_GUI()


if (state==state_CLOSED)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _i,_j, _val, _count1, _c1;
var _x,_y;
var _text, _font_sprite, _char_w,_char_h;
var _pi, _sprite, _cursor;

// _cursor_XOFF: The cursor's xoff from its lines text XL
var _cursor_XOFF  = -$8;
    //_cursor_XOFF += -$1; // micro adjustment
var _dg = ds_grid_create(1,1);

var _SURF = surface_create(BASE_GAME_RESOLUTION_W,BASE_GAME_RESOLUTION_H);
surface_set_target(_SURF);
draw_clear_alpha(c_black,0);





_x = 0;
_y = YT0;

var           _Main_COUNT = ds_grid_width(dg_Main);
for (_i=0; _i<_Main_COUNT; _i++)
{
    _x           = dg_Main[#_i,$0]; // 0: XL
    //_y           = dg_Main[#_i,$1]; // 1: YT
    _text        = dg_Main[#_i,$2]; // 2: text
    _font_sprite = dg_Main[#_i,$3]; // 3: font sprite
    _char_w = sprite_get_width( _font_sprite);
    _char_h = sprite_get_height(_font_sprite);
    
    _pi = PI_DARK1;
    if (dg_Main[#_i,$4])
    {
        if (dg_Main[#Main_ENABLE,$5]   // dg_Main[#$0,$5]: if filters are enabled
        ||  _i==Main_ENABLE 
        ||  _i==Main_DEFAULT )
        {
            _pi = PI_MENU1; // 4: option available
        }
    }
    draw_text_(_x,_y, _text, _font_sprite, _pi);
    
    if (_i==Main_cursor)
    {
        if (menu_state 
        &&  menu_state==dg_Main[#_i,$9] )
        {
            _sprite = spr_arrow_6_dwn;
            _pi = PI_DARK1;
        }
        else
        {
            _sprite = spr_arrow_6_rgt;
            _pi = PI_MENU1;
        }
        
        _x += _cursor_XOFF;
        draw_sprite_(_sprite,0, _x,_y+(_char_h>>1), _pi);
    }
    
    
    _text = dg_Main[#_i,$A];
    if (is_string(_text) 
    &&  (menu_state==menu_focus_Main || !menu_state || menu_state!=dg_Main[#_i,$9]) )
    {
        _x = Values_XR - (string_length(_text)*_char_w);
        
        if (dg_Main[#Main_ENABLE,$5]  // dg_Main[#$0,$5]: if filters are enabled
        &&  dg_Main[#_i,$4]   // 4: option available
        &&  dg_Main[#_i,$5] ) // if this option is enabled
        {    _pi = PI_MENU1;  }
        else _pi = PI_DARK1;
        draw_text_(_x,_y, _text, _font_sprite, _pi);
    }
    
    _y += _char_h+LEADING1;
    
    
    
    
    if (menu_state 
    &&  menu_state==dg_Main[#_i,$9] )
    {
        //_dg[#$0,$0] = -1;
        _cursor = -1;
        switch(dg_Main[#_i,$9]){
        case menu_focus_Brightness:{ds_grid_copy(_dg,dg_Brightness); _cursor=Brightness_cursor; break;};
        case menu_focus_Saturation:{ds_grid_copy(_dg,dg_Saturation); _cursor=Saturation_cursor; break;};
        case menu_focus_Scanlines:{ ds_grid_copy(_dg,dg_Scanlines);  _cursor=Scanlines_cursor;  break;};
        case menu_focus_Bloom:{     ds_grid_copy(_dg,dg_Bloom);      _cursor=Bloom_cursor;      break;};
        case menu_focus_Blur:{      ds_grid_copy(_dg,dg_Blur);       _cursor=Blur_cursor;       break;};
        }
        
        if (_cursor!=-1)
        //if (_dg[#$0,$0]!=-1)
        {
            _count1 = ds_grid_width(_dg);
            for (_j=0; _j<_count1; _j++)
            {
                _x           = _dg[#_j,$0];
                //_y           = _dg[#_j,$1];
                _text        = _dg[#_j,$2];
                _font_sprite = _dg[#_j,$3]; // 3: font sprite
                _char_w = sprite_get_width( _font_sprite);
                _char_h = sprite_get_height(_font_sprite);
                
                _c1 = dg_Main[#Main_ENABLE,$5]  // dg_Main[#$0,$5]: if filters are enabled
                &&   _dg[#$0,$5]      // _dg[#$0,$5]: if this filter is enabled
                &&   _dg[#_j,$4];     // _dg[#_j,$4]: option available
                
                if (_c1) _pi = PI_MENU1;
                else     _pi = PI_DARK1;
                draw_text_(_x,_y, _text, _font_sprite, _pi);
                
                if (_j==_cursor)
                {
                    _x += _cursor_XOFF;
                    draw_sprite_(spr_arrow_6_rgt,0, _x,_y+(_char_h>>1), PI_MENU1);
                }
                
                
                _text = _dg[#_j,$A];
                if (is_string(_text))
                {
                    _x = Values_XR - (string_length(_text)*_char_w);
                    if (_c1) _pi = PI_MENU1;
                    else     _pi = PI_DARK1;
                    draw_text_(_x,_y, _text, _font_sprite, _pi);
                }
                
                _y += _char_h+LEADING1;
            }
        }
    }
}



surface_reset_target();


if (global.RetroShaders_enabled) _val = global.RetroShaders_surface_scale;
else                             _val = 1;
//_val = 1; // testing
draw_surface_stretched(_SURF, 0,0, surface_get_width(_SURF)*_val,surface_get_height(_SURF)*_val);
surface_free(_SURF);


ds_grid_destroy(_dg); _dg=undefined;




