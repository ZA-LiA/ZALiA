/// OptionsMenu_Draw_RandoOptions(YT)


var _YT0 = argument[0];

var _i, _count;
var _x,_y, _xl,_yt, _xl1,_yt1;
var _DIST1 = $6; // line spacing
var _text, _font, _font_w,_font_h;
var _dk, _pi;
var _option_is_avail = false;
var _option_state = 0;
var _DK0 = "Rando";


_yt1  = _YT0;
_yt1 += _DIST1; // line spacing




var          _COUNT0 = val(dm_options[?_DK0+STR_Count]);
for(_i=0; _i<_COUNT0; _i++)
{
    _font = val(dm_options[?_DK0+hex_str(_i)+STR_Font], FONT2);
    _font_w = sprite_get_width( _font);
    _font_h = sprite_get_height(_font);
    
    
    switch(_i){
    case Rando_BACK:{_yt1+=$6; break;} // extra pad
    }
    
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    
    _option_is_avail = OptionsMenu_option_is_avail(menu_state_RANDO,_i);
    
    
    _text = val(dm_options[?_DK0+hex_str(_i)+STR_Option+STR_Text], STR_undefined);
         if(!_option_is_avail) _pi = PI_DARK2;
    else if (_i==Rando_cursor) _pi = PI_MENU1;
    else                       _pi = PI_MENU2;
    draw_text_(TextArea1_xl,_yt1, _text, _font, _pi);
    
    
    _dk = _DK0+hex_str(_i)+STR_State;
    _option_state = -1;
    _text = 0;
    switch(_i)
    {
        case Rando_MARK_ACQUIRED:{
        _option_state = global.MarkItemLocations_state;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_HINTS:{
        _option_state = global.RandoHints_enabled;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_MAPS_SHOW_KEYS:{
        _option_state = g.RandoKeys_MAP_items_show_keys;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_ENEMY_RANDO:{
        _option_state = g.Rando_enemy;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_DUNGEON_TILESETS:{
        _option_state = global.RandoDungeonTilesets_enabled;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_OW_BIOMES:{
        _option_state = global.can_rando_ow_tsrc;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_SCENES:{
        _option_state = global.SceneRando_enabled;
        _text = val(dm_options[?_dk+hex_str(_option_state)+STR_Text], STR_undefined);
        break;}
        
        case Rando_PALETTE:{
        _text = string(g.RandoPalette_state);
             if(!_option_is_avail) _pi = PI_DARK2;
        else if (_i==Rando_cursor) _pi = PI_MENU1;
        else                       _pi = PI_MENU2;
        break;}
    }//switch(_i)
    
    if (_option_state!=-1)
    {
             if(!_option_is_avail) _pi = PI_DARK2;
        else if (_i==Rando_cursor) _pi = PI_MENU1;
        else if(!_option_state)    _pi = PI_DARK1;
        else                       _pi = PI_MENU2;
    }
    
    if (_text!=0)
    {
        _xl  = TextArea2_xr;
        _xl -= string_length(_text) * _font_w;
        draw_text_(_xl,_yt1, _text, _font, _pi);
    }
    
    
    
    
    if (_i==Rando_cursor)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU1);
    }
    
    
    _yt1 += _font_h; // text yb
    _yt1 += _DIST1;  // line spacing
}








// OPTION INFO -----------------------------------------------------------
_yt1 = Info_yt;
if (_yt1+Info_FONT_H < MenuWindow_yb)
{
    _dk = _DK0+hex_str(Rando_cursor)+STR_Description;
    _count = val(dm_options[?_dk+STR_Count]);
    if (_count)
    {
        _xl = TextArea1_xl;
        _yt = _yt1;
        if (Rando_cursor==Rando_MAPS_SHOW_KEYS)
        {
            _x  = drawX;
            _x += $8; // window border
            _x += $1; // pad
            _x += $4; // map xc
            _y  = _yt;
            _y += $8; // map yc
            draw_sprite_(spr_Item_Map_2a,0, _x,_y, global.PI_MOB_ORG);
            _x += $8; // add map w
            _x += $2; // space between maps
            draw_sprite_(spr_Item_Map_2b,0, _x,_y, global.PI_MOB_ORG);
            _xl  = _x; // map xc
            _xl += $4; // map xr
            _xl += $3; // text pad
            _xl  = max(_xl,TextArea1_xl);
        }
        
        pal_swap_set(global.palette_image, PI_MENU1);
        for(_i=0; _i<_count; _i++)
        {
            if (_yt1+Info_FONT_H >= MenuWindow_yb)
            {
                break;//_i
            }
            
            _text = val(dm_options[?_dk+hex_str(_i)]);
            if(!is_string(_text))
            {
                break;//_i
            }
            
            //_xl = TextArea1_xl;
            _yt = _yt1;
            _yt1  = draw_text_plus(_xl,Info_xr, _yt, _text, Info_FONT);
            _yt1 += Info_PAD1; // line spacing
        }
        pal_swap_reset();
    }
}




