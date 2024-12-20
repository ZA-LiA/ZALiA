/// FileSelect_Draw_Rando()


var _i, _idx, _val, _count;
var _text, _word, _char, _spr, _pi;
var _pos, _len;
var _x,_y, _X,_Y, _xr;
var _datakey1;
var _char_w = 8;
var _char_h = 8;

var _PI_DARK1=get_pi(PI_DARKLONK,3);
var _PI_DARK2=PI_DARKLONK;

var _FONT_SPRITE1 = spr_Font1;
var _FONT_SPRITE2 = spr_Font2;
var _FONT_SPRITE3 = spr_Font3_1;

var _RANDO_ACTIVE = FileSelect_Rando_is_on(-1);
/*
var _RANDO_ACTIVE=false;
for(_i=0; _i<RandoMAIN_COUNT; _i++)
{
    _RANDO_ACTIVE=FileSelect_Rando_is_on(_i);
    if (_RANDO_ACTIVE) break;//_i
}
*/

/*
var _ITEM_MAX_STR_LEN=$10;
for(_i=0; _i<RandoITEM_COUNT; _i++)
{
    _text = dg_RandoITEM_Options[#_i,3];
    if (string_length(_text)>_ITEM_MAX_STR_LEN)
}
*/






// Title Text
_text = "RANDO SETTINGS";
_len = string_length(_text);
_X  = viewXC();
_X -= (_len<<3)>>1;
_Y  = y;
_Y += $01<<3;
//_Y += $02<<3;
draw_text_(_X,_Y, _text, -1,PI_MENU);
// Title Bar
_count = Area1_W-(_len<<3);
_count = (_count>>1)>>3;
_count--; // Text pad
_x = Area1_XL;
_y = Area1_YT;
pal_swap_set(p.palette_image, PI_MENU);
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _x+(_i<<3),_y);
_x = Area1_XR-8;
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _x-(_i<<3),_y);
pal_swap_reset();






switch(RandoState)
{
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_MAIN:{
    var _FONT_SPRITE=RandoMAIN_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    //var _CHAR_SIZE=sprite_get_width(_FONT_SPRITE);
    //_x = RandoOptions_X;
    //_y = RandoOptions_Y;
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoMAIN_COUNT; _i++)
    {
        _x = dg_RandoMAIN_Options[#_i,0];
        _y = dg_RandoMAIN_Options[#_i,1];
        
        _text  = dg_RandoMAIN_Options[#_i,3];
        //_text += string_repeat(" ", $10-string_length(_text));
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoMAIN_ITEMS, RandoMAIN_SPELLS, RandoMAIN_ENEMIES, RandoMAIN_LVLCOST, RandoMAIN_PALETTE
            if (dg_RandoMAIN_Options[#_i,2]>=0) _pi= PI_MENU; // -1 means option unavailable
            else                                _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            //_x += _char_w*string_length(_text);
            if (FileSelect_Rando_is_on(_i))
            {
                _text=Text_ON;
                _pi=PI_MENU;
            }
            else
            {
                _text=Text_OFF;
                _pi=_PI_DARK1;
            }
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_SEED:{
            var _QUEST_NUM = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,2];
            Rando_draw_seed(_x+$28,_y+RandoSeedY_ADJ1, FileSelect_get_file_seed(Register_file_num,1));
            _pi=PI_MENU
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_OTHER:{
            _pi=PI_MENU
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_BACK:{
            _pi=PI_MENU
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_ITEM:{
    var _FONT_SPRITE=RandoITEM_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoITEM_COUNT; _i++)
    {
        _x = dg_RandoITEM_Options[#_i,0];
        _y = dg_RandoITEM_Options[#_i,1];
        
        _text  = dg_RandoITEM_Options[#_i,3];
        //_text += string_repeat(" ", $16-string_length(_text));
        //_text += string_repeat(" ", $10-string_length(_text));
        
        _pi=PI_MENU;
        
        switch(_i)
        {
            /*
            // -------------------------------------------------
            case RandoITEM_METHOD:{
            //_text  = dg_RandoITEM_Options[#_i,3]+" ";
            _text += string(dg_RandoITEM_Options[#_i,2]);
            
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi=PI_MENU;
            else                                         _pi=_PI_DARK2;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            */
            
            // -------------------------------------------------
            case RandoITEM_OBSCURE_LOCS:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoITEM_Options[#_i,2]) _text="YES";
            else                             _text="NO";
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2] 
            &&  dg_RandoITEM_Options[#_i,2] )
            {    _pi= PI_MENU;  }
            else _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_DARKROOM:{
            //_text += string(dg_RandoITEM_Options[#_i,2]);
            
            if (_RANDO_ACTIVE) _pi= PI_MENU;
            else               _pi=_PI_DARK2;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            _text = string(dg_RandoITEM_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_HINTS:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2] 
            &&  dg_RandoITEM_Options[#_i,2] )
            {    _pi= PI_MENU;  }
            else _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_ZELDA_HINT:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            switch(dg_RandoITEM_Options[#_i,2]){
            case 0:{_text="OFF"; break;}
            case 1:{_text="ALLKEY"; break;}
            case 2:{_text="JUMP TOWN"; break;}
            }
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2] 
            &&  dg_RandoITEM_Options[#_i,2] )
            {    _pi= PI_MENU;  }
            else _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_LOCS:{
            _pi=PI_MENU
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            if (dg_RandoITEM_Options[#_i,2]) _pi= PI_MENU;
            else                             _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_PBAG:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2] 
            &&  dg_RandoITEM_Options[#_i,2] )
            {    _pi= PI_MENU;  }
            else _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_KEYS:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2] 
            &&  dg_RandoITEM_Options[#_i,2] )
            {    _pi= PI_MENU;  }
            else _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_BACK:{
            _pi=PI_MENU;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_SPELL:{
    var _FONT_SPRITE=RandoSPELL_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoSPELL_COUNT; _i++)
    {
        _x = dg_RandoSPELL_Options[#_i,0];
        _y = dg_RandoSPELL_Options[#_i,1];
        
        _text  = dg_RandoSPELL_Options[#_i,3];
        //_text += string_repeat(" ", $10-string_length(_text));
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoSPELL_LOCS, RandoSPELL_COST
            if (dg_RandoSPELL_Options[#_i,2]>=0) _pi= PI_MENU; // -1 means option unavailable
            else                                 _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoSPELL_Options[#_i,2]) _text=Text_ON;
            else                              _text=Text_OFF;
            if (dg_RandoSPELL_Options[#_i,2]) _pi= PI_MENU;
            else                              _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoSPELL_BACK:{
            _pi=PI_MENU;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_DUNGEON:{
    var _FONT_SPRITE=RandoDUNGEON_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoDUNGEON_COUNT; _i++)
    {
        _x = dg_RandoDUNGEON_Options[#_i,0];
        _y = dg_RandoDUNGEON_Options[#_i,1];
        
        _text  = dg_RandoDUNGEON_Options[#_i,3];
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoDUNGEON_TILESET, RandoDUNGEON_ROOM, RandoDUNGEON_BOSS
            if (dg_RandoDUNGEON_Options[#_i,2]>=0) _pi= PI_MENU; // -1 means option unavailable
            else                                   _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            if (dg_RandoDUNGEON_Options[#_i,2]) _text=Text_ON;
            else                                _text=Text_OFF;
            if (dg_RandoDUNGEON_Options[#_i,2]) _pi= PI_MENU;
            else                                _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoDUNGEON_LOCATION:{
            if (dg_RandoITEM_Options[#RandoITEM_LOCS,2]) _pi= PI_MENU;
            else                                         _pi=_PI_DARK2;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            if (dg_RandoDUNGEON_Options[#_i,2]) _text=Text_ON;
            else                                _text=Text_OFF;
            if (dg_RandoDUNGEON_Options[#_i,2]) _pi= PI_MENU;
            else                                _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoDUNGEON_BACK:{
            _pi=PI_MENU;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_ENEMY:{
    var _FONT_SPRITE=RandoENEMY_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoENEMY_COUNT; _i++)
    {
        _x = dg_RandoENEMY_Options[#_i,0];
        _y = dg_RandoENEMY_Options[#_i,1];
        
        _text  = dg_RandoENEMY_Options[#_i,3];
        //_text += string_repeat(" ", $10-string_length(_text));
        switch(_i)
        {   // -------------------------------------------------
            default:{ // enemy hp, enemy dmg, ..
            if (dg_RandoENEMY_Options[#_i,2]>=0) _pi= PI_MENU; // -1 means option unavailable
            else                                 _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            
            //_x += _char_w*string_length(_text);
            if (dg_RandoENEMY_Options[#_i,2]) _text=Text_ON;
            else                              _text=Text_OFF;
            if (dg_RandoENEMY_Options[#_i,2]) _pi= PI_MENU;
            else                              _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_DIFF:{ // difficulty
            //_text += string(dg_RandoENEMY_Options[#_i,2]);
            
            if (dg_RandoENEMY_Options[#_i,2]>=0)
            {
                if ((dg_RandoENEMY_Options[#RandoENEMY_CHAR,    2]>=0 && dg_RandoENEMY_Options[#RandoENEMY_CHAR,    2]) 
                ||  (dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2]>=0 && dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2]) 
                ||  (dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,  2]>=0 && dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,  2]) )
                {    _pi= PI_MENU;  }
                else _pi=_PI_DARK2;
            }
            else
            {
                _pi=_PI_DARK1;
            }
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            _text = string(dg_RandoENEMY_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_CHAR:{
            if (dg_RandoENEMY_Options[#_i,2]>=0) _pi= PI_MENU; // -1 means option unavailable
            else                                 _pi=_PI_DARK1;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            
            //_x += _char_w*string_length(_text);
            switch(dg_RandoENEMY_Options[#_i,2]){
            default:{_text=Text_OFF;break;}
            case 1: {_text="SPAWNS";break;}
            case 2: {_text="TYPES";break;}
            }
            
            if (dg_RandoENEMY_Options[#_i,2]) _pi= PI_MENU;
            else                              _pi=_PI_DARK1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_BACK:{
            _pi=PI_MENU;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_OTHER:{
    FileSelect_Draw_RandoState_OTHER();
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_SEED:{
    var _FONT_SPRITE=RandoSEED_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoSEED_COUNT; _i++)
    {
        _x    = dg_RandoSEED_Options[#_i,0];
        _y    = dg_RandoSEED_Options[#_i,1];
        _text = dg_RandoSEED_Options[#_i,3];
        
        if (RandoSEED_EDIT_state==1 
        &&  _i!=RandoSEED_EDIT )
        {    _pi=_PI_DARK1;  }
        else _pi= PI_MENU;
        
        draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
    }
    
    
    _text    = dg_RandoSEED_Options[#RandoSEED_EDIT,3];
    var _X1  = dg_RandoSEED_Options[#RandoSEED_EDIT,0];
        _X1 += (string_length(_text)+1)<<3;
        _X1 += $4;
    var _Y1  = dg_RandoSEED_Options[#RandoSEED_EDIT,1];
        _Y1 += $2; // micro adj
    var _QUEST_NUM = 1;
    //var _QUEST_NUM = dg_RandoOTHER_Options[#RandoOTHER_QUEST,2];
    Rando_draw_seed(_X1,_Y1+RandoSeedY_ADJ1, FileSelect_get_file_seed(Register_file_num,1));
    //Rando_draw_seed(_X1,_Y1+RandoSeedY_ADJ1, FileSelect_get_file_seed(Register_file_num,_QUEST_NUM));
    
    
    if (RandoSEED_EDIT_state==1) // user is editing seed
    {   // Draw seed cursor arrow
        _x  = _X1;
        _x += $0C*RandoSeedChar_cursor;
        //_x += $01; // micro adj
        
        _y  = _Y1;
        _y += $10; // seed spr h
        _y += $02+$04; // pad + (half arrow h)
        _y -= $04; // micro adj
        
        draw_sprite_(spr_arrow_6_up,0, _x,_y, PI_MENU);
    }
    break;}
}//switch(RandoState)





// Option Description --------------------------------
var _j;
var _FONT_SPRITE = spr_Font2;
_char_w = sprite_get_width( _FONT_SPRITE);
_char_h = sprite_get_height(_FONT_SPRITE);
var _PAD1 = $2;
var _PAD2 = $2;
var _dist1;
var _DIST1 = _char_h+_PAD2; // leading (vertical dist between yt of each line)
var _XL1  = Area0_XL+_PAD1;
var _XR1  =(Area0_XL+Area0_W)-_PAD1;
//var _XR1  = Area1_XL-_PAD1;
var _YT1  = viewYT();
    _YT1 += _DIST1;
    _YT1 += _PAD1;
var _COUNT1 = (_XR1-_XL1) div _char_w;
var _pos_end_line = 0;
var _pos_space = 0;

_text = dg_RandoMAIN_Options[#RandoMAIN_cursor,3];
_x = _XL1;
_y = _YT1;
_y = draw_text_plus(_x,_XR1,_y, _text,spr_Font2_1, PI_MENU);
draw_text_(_x,_y, string_repeat("-",_COUNT1), _FONT_SPRITE,PI_MENU);
_y+=_DIST1;

_text="";
switch(RandoState){
case RandoState_ITEM:   {_text=dg_RandoITEM_Options[#RandoITEM_cursor,3]; break;}
case RandoState_SPELL:  {_text=dg_RandoSPELL_Options[#RandoSPELL_cursor,3]; break;}
case RandoState_DUNGEON:{_text=dg_RandoDUNGEON_Options[#RandoDUNGEON_cursor,3]; break;}
case RandoState_ENEMY:  {_text=dg_RandoENEMY_Options[#RandoENEMY_cursor,3]; break;}
case RandoState_OTHER:  {_text=dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,3]; break;}
case RandoState_SEED:   {_text=dg_RandoSEED_Options[#RandoSEED_cursor,3]; break;}
}
if (string_length(_text))
{
    _x = _XL1;
    _y = draw_text_plus(_x,_XR1,_y, _text,spr_Font2_1, PI_MENU);
    _y+=_DIST1; // Add blank line
}


var _IDX0 = 4;
for(_i=_IDX0; _i<RandoGrid_H; _i++)
{
    switch(RandoState){
    default:                {_text=dg_RandoMAIN_Options[#RandoMAIN_cursor,_i]; break;}
    case RandoState_MAIN:   {_text=dg_RandoMAIN_Options[#RandoMAIN_cursor,_i]; break;}
    case RandoState_ITEM:   {_text=dg_RandoITEM_Options[#RandoITEM_cursor,_i]; break;}
    case RandoState_SPELL:  {_text=dg_RandoSPELL_Options[#RandoSPELL_cursor,_i]; break;}
    case RandoState_DUNGEON:{_text=dg_RandoDUNGEON_Options[#RandoDUNGEON_cursor,_i]; break;}
    case RandoState_ENEMY:  {_text=dg_RandoENEMY_Options[#RandoENEMY_cursor,_i]; break;}
    case RandoState_OTHER:  {_text=dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,_i]; break;}
    case RandoState_SEED:   {_text=dg_RandoSEED_Options[#RandoSEED_cursor,_i]; break;}
    }
    
    
    if (is_string(_text))
    {
        _y  = draw_text_plus(_XL1,_XR1,_y, _text,_FONT_SPRITE, PI_MENU);
        _y += _DIST1; // Add blank line
    }
    else
    {
        break;//_i
    }
}






/*
// Lower Bar
_count = Main_CLMS;
_x  = viewXC();
_x -= (_count<<3)>>1;
_y  = RandoDescription_YT;
_y -= $0A;
pal_swap_set(p.palette_image, PI_MENU);
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _x+(_i<<3),_y);
pal_swap_reset();
*/




