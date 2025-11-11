/// FileSelect_Draw_Rando()


var _i, _idx, _val, _count;
var _text, _word, _char, _spr, _pi1,_pi2,_pi3,_pi4,_pi5;
var _pos, _len;
var _x,_y, _X,_Y, _xl,_xr, _yt;
var _datakey1;
var _char_w = 8;
var _char_h = 8;
var _state = false;

var _FONT_SPRITE1 = global.dl_game_font[|global.game_font_idx];
var _FONT_SPRITE2 = spr_Font2;
var _FONT_SPRITE3 = spr_Font3_1;

var _RANDO_ACTIVE = FileSelect_Rando_is_on(-1);
/*
var _ITEM_MAX_STR_LEN=$10;
for(_i=0; _i<RandoITEM_COUNT; _i++)
{
    _text = dg_RandoITEM_Options[#_i,3];
    if (string_length(_text)>_ITEM_MAX_STR_LEN)
}
*/

var _ITEM_LOC_STATE = dg_RandoITEM_Options[#RandoITEM_LOCS,2];






var _YT0  = Area1_YT;
    _YT0 -= $6;
    _YT0 += RANDO_YOFF1;
// Title Text
_text = "RANDO SETTINGS";
_len = string_length(_text);
_xl  = viewXC();
_xl -= (_len<<3)>>1;
_yt  = _YT0;
draw_text_(_xl,_yt, _text, -1,PI_MENU1);

// Title Bar
_count = Area1_W-(_len<<3);
_count = (_count>>1)>>3;
_count--; // Text pad
_xl = Area1_XL;
_yt = _YT0;
pal_swap_set(global.palette_image, PI_MENU1);
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _xl+(_i<<3),_yt);
_xl = Area1_XR-8;
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _xl-(_i<<3),_yt);
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
        
        if (dg_RandoMAIN_Options[#_i,2]<0) _pi1 = PI_DARK3; // -1 means option unavailable
        else if (_i==RandoMAIN_cursor)     _pi1 = PI_MENU1;
        else                               _pi1 = PI_MENU2;
        
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoMAIN_ITEMS, RandoMAIN_SPELLS, RandoMAIN_ENEMIES, RandoMAIN_LVLCOST, RandoMAIN_PALETTE
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
            
            _state = FileSelect_Rando_is_on(_i);
            if (_state) _text = Text_ON;
            else        _text = Text_OFF;
            
            if(!_state)                    _pi2 = PI_DARK3; // -1 means option unavailable
            else if (_i==RandoMAIN_cursor) _pi2 = PI_MENU1;
            else                           _pi2 = PI_MENU2;
            
            _x  = _xr - (string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_SEED:{
            var _QUEST_NUM = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,2];
            Rando_draw_seed(_x+$28,_y+RandoSeedY_ADJ1, FileSelect_get_file_seed(Register_file_num,1));
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_OTHER:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
            break;}
            
            // -------------------------------------------------
            case RandoMAIN_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
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
        
        _text = dg_RandoITEM_Options[#_i,3];
        
        if (_i==RandoITEM_cursor) _pi1 = PI_MENU1;
        else                      _pi1 = PI_MENU2;
        
        if (dg_RandoITEM_Options[#_i,2]<1 || !_ITEM_LOC_STATE) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                                   _pi2 = _pi1;
        
        if (dg_RandoITEM_Options[#_i,2]<0 || !_ITEM_LOC_STATE) _pi3 = PI_DARK3; // -1 means option unavailable
        else                                                   _pi3 = _pi1;
        
        if (dg_RandoITEM_Options[#_i,2]<1) _pi4 = PI_DARK3; // -1 means option unavailable
        else                               _pi4 = _pi1;
        
        switch(_i)
        {   // -------------------------------------------------
            case RandoITEM_LOCS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi1);
            
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi4);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_PBAG:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_KEYS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_OBSCURE_LOCS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            if (dg_RandoITEM_Options[#_i,2]) _text="YES";
            else                             _text="NO";
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_DARKROOM:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            _text = string(dg_RandoITEM_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_HINTS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            if (dg_RandoITEM_Options[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_ZELDA_HINT:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            
            switch(dg_RandoITEM_Options[#_i,2]){
            case ZELDA_HINT_OPTIONS.NONE:  {_text="OFF"; break;}
            case ZELDA_HINT_OPTIONS.FLUTE: {_text="FLUTE"; break;}
            case ZELDA_HINT_OPTIONS.ALLKEY:{_text="ALLKEY"; break;}
            case ZELDA_HINT_OPTIONS.JUMP:  {_text="JUMP TOWN"; break;}
            }
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // -------------------------------------------------
            case RandoITEM_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi1);
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
        
        _text = dg_RandoSPELL_Options[#_i,3];
        
        if (_i==RandoSPELL_cursor) _pi1 = PI_MENU1;
        else                       _pi1 = PI_MENU2;
        
        if (dg_RandoSPELL_Options[#_i,2]<1) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                _pi2 = _pi1;
        
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoSPELL_LOCS, RandoSPELL_COST
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
            
            if (dg_RandoSPELL_Options[#_i,2]) _text=Text_ON;
            else                              _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            break;}
            
            // -------------------------------------------------
            case RandoSPELL_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
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
        
        if (_i==RandoDUNGEON_cursor) _pi1 = PI_MENU1;
        else                         _pi1 = PI_MENU2;
        
        if (dg_RandoDUNGEON_Options[#_i,2]<0) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                  _pi2 = _pi1;
        
        if (dg_RandoDUNGEON_Options[#_i,2]<1) _pi3 = PI_DARK3; // -1 means option unavailable
        else                                  _pi3 = _pi1;
        
        switch(_i)
        {   // -------------------------------------------------
            default:{ // RandoDUNGEON_TILESET, RandoDUNGEON_LOCATION, RandoDUNGEON_BOSS, RandoTOWN_LOCATION
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            
            if (dg_RandoDUNGEON_Options[#_i,2]) _text=Text_ON;
            else                                _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi3);
            break;}
            
            // -------------------------------------------------
            case RandoDUNGEON_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
            break;}
        }
    }
    break;}
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case RandoState_ENEMY:{
    var _ENEMY_RANDO_STATE = dg_RandoENEMY_Options[#RandoENEMY_CHAR,2] || dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2] || dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,2];
    var _FONT_SPRITE=RandoENEMY_FONT_SPRITE;
    _char_w=sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoENEMY_COUNT; _i++)
    {
        _x = dg_RandoENEMY_Options[#_i,0];
        _y = dg_RandoENEMY_Options[#_i,1];
        
        _text = dg_RandoENEMY_Options[#_i,3];
        
        if (_i==RandoENEMY_cursor) _pi1 = PI_MENU1;
        else                       _pi1 = PI_MENU2;
        
        if (dg_RandoENEMY_Options[#_i,2]<0) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                _pi2 = _pi1;
        
        if (dg_RandoENEMY_Options[#_i,2]<1) _pi3 = PI_DARK3; // -1 means option unavailable
        else                                _pi3 = _pi1;
        
        if (dg_RandoENEMY_Options[#_i,2]<0 || !_ENEMY_RANDO_STATE) _pi4 = PI_DARK3; // -1 means option unavailable
        else                                                       _pi4 = _pi1;
        
        if (dg_RandoENEMY_Options[#_i,2]<1 || !_ENEMY_RANDO_STATE) _pi5 = PI_DARK3; // -1 means option unavailable
        else                                                       _pi5 = _pi1;
        
        switch(_i)
        {   // -------------------------------------------------
            default:{ // enemy hp, enemy dmg, ..
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            
            if (dg_RandoENEMY_Options[#_i,2]) _text=Text_ON;
            else                              _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi3);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_DIFF:{ // difficulty
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi4);
            
            _text = string(dg_RandoENEMY_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi4);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_CHAR:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            
            switch(dg_RandoENEMY_Options[#_i,2]){
            default:{_text=Text_OFF;break;}
            case 1: {_text="SPAWNS";break;}
            case 2: {_text="TYPES";break;}
            }
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi5);
            break;}
            
            // -------------------------------------------------
            case RandoENEMY_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
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
        
        if (RandoSEED_EDIT_state==1 && _i!=RandoSEED_EDIT) _pi1 = PI_DARK3;
        else if (_i==RandoSEED_cursor)                     _pi1 = PI_MENU1;
        else                                               _pi1 = PI_MENU2;
        draw_text_(_x,_y, _text, _FONT_SPRITE,_pi1);
    }
    
    
    _text    = dg_RandoSEED_Options[#RandoSEED_EDIT,3];
    var _X1  = dg_RandoSEED_Options[#RandoSEED_EDIT,0];
        _X1 += (string_length(_text)+1)<<3;
        _X1 += $4;
    var _Y1  = dg_RandoSEED_Options[#RandoSEED_EDIT,1];
        _Y1 += $2; // micro adj
    Rando_draw_seed(_X1,_Y1+RandoSeedY_ADJ1, FileSelect_get_file_seed(Register_file_num,1));
    
    
    if (RandoSEED_EDIT_state==1) // user is editing seed
    {   // Draw seed cursor arrow
        _x  = _X1;
        _x += $0C*RandoSeedChar_cursor;
        //_x += $01; // micro adj
        
        _y  = _Y1;
        _y += $10; // seed spr h
        _y += $02+$04; // pad + (half arrow h)
        _y -= $04; // micro adj
        draw_sprite_(spr_arrow_6_up,0, _x,_y, PI_MENU1);
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
var _YT1  = viewYT();
    _YT1 += _DIST1;
    _YT1 += _PAD1;
var _COUNT1 = (_XR1-_XL1) div _char_w;
var _pos_end_line = 0;
var _pos_space = 0;

_text = dg_RandoMAIN_Options[#RandoMAIN_cursor,3];
_xl  = _XL1;
_yt  = _YT1;
_yt  = draw_text_plus(_xl,_XR1,_yt, _text,spr_Font2_1, PI_MENU1);
_yt += _PAD2;
draw_text_(_xl,_yt, string_repeat("-",_COUNT1), _FONT_SPRITE,PI_MENU1);
_yt += _DIST1;

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
    _xl  = _XL1;
    _yt  = draw_text_plus(_xl,_XR1,_yt, _text,spr_Font2_1, PI_MENU1);
    _yt += _PAD2;
    _yt += _DIST1; // Add blank line
}




var _IDX0 = 4;
for(_i=_IDX0; _i<RandoGrid_H; _i++)
{
    if (RandoState==RandoState_OTHER 
    &&  RandoOTHER_state==RandoOTHER_state_ITEMS )
    {
        _text = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor,_i];
    }
    else
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
    }
    
    
    if (is_string(_text))
    {
        _yt  = draw_text_plus(_XL1,_XR1,_yt, _text,_FONT_SPRITE, PI_MENU1);
        _yt += _PAD2;
        _yt += _DIST1; // Add blank line
    }
    else
    {
        break;//_i
    }
}
//RandoOTHER_state RandoOTHER_state_ITEMS



/*
// Lower Bar
_count = Main_CLMS;
_xl  = viewXC();
_xl -= (_count<<3)>>1;
_yt  = RandoDescription_YT;
_yt -= $0A;
pal_swap_set(p.palette_image, PI_MENU1, false);
for(_i=0; _i<_count; _i++) draw_background_part(ts_Menu01, $0<<3,$2<<3, 8,8, _xl+(_i<<3),_yt);
pal_swap_reset();
*/




