/// OptionsMenu_Draw_InputConfig(YT)


var _YT0 = argument[0];

var _i, _val;
var _x,_y, _xl,_yt, _xl1,_yt1;
var _pi;
var _text, _font, _font_w,_font_h;


_pi = PI_MENU1;
_yt1 = drawY+$20;

for(_i=0; _i<InputConfigOption_COUNT; _i++)
{
    _text = dg_InputConfigOptions[#_i,0];
    _font = dg_InputConfigOptions[#_i,1];
    _font_w = sprite_get_width( _font);
    _font_h = sprite_get_height(_font);
    
    _xl = TextArea1_xl;
    switch(_i){
    case InputConfigOption_DEFAULT: {_yt1+=$8; break;} // extra pad
    //case InputConfigOption_BACK:    {_yt1+=$6; break;} // extra pad
    }
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    _text = dg_InputConfigOptions[#_i,0];
    
    if (InputConfigState==InputConfigState_EDITING 
    &&  _i!=InputConfigOption )
    {
        _pi = PI_DARK2;
    }
    else if (_i==InputConfigOption)
    {
        _pi = PI_MENU1;
    }
    else
    {
        _pi = PI_MENU2;
    }
    draw_text_(_xl,_yt1, _text, _font, _pi);
    
    
    if (_i<InputConfigOption_DEFAULT)
    {
        if (_font_w<8) _xl = TextArea1_xl + ($10*_font_w);
        else           _xl = TextArea1_xl + ($0C*_font_w);
        
        switch(_i){
        case InputConfigOption_RIGHT: {_val=Input.GP_right;  break;}
        case InputConfigOption_LEFT:  {_val=Input.GP_left;   break;}
        case InputConfigOption_DOWN:  {_val=Input.GP_down;   break;}
        case InputConfigOption_UP:    {_val=Input.GP_up;     break;}
        case InputConfigOption_MAGIC: {_val=Input.GP_magic;  break;}
        case InputConfigOption_PAUSE: {_val=Input.GP_pause;  break;}
        case InputConfigOption_ATTACK:{_val=Input.GP_attack; break;}
        case InputConfigOption_JUMP:  {_val=Input.GP_jump;   break;}
        }
        
        _text = val(Input.Buttons_dm[?string(_val)+STR_Name], "BUTTON");
        draw_text_(_xl,_yt1, _text, _font, _pi);
    }
    
    
    
    if (_i==InputConfigOption)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU1);
    }
    
    
    _yt1 += _font_h;
    _yt1 += _font_h; // extra pad
}




