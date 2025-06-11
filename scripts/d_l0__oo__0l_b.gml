/// d_l0__oo__0l_b()


// for enabling
var _TIME1 = ROOM_SPEED_BASE * 60;
if (DEV) _TIME1 = $100;

// for disabling
var _TIME2 = $100;


var _BUTTON_ENABLE  = Input.GP_Up_held;
var _BUTTON_DISABLE = _BUTTON_ENABLE;
//var _BUTTON_DISABLE = Input.GP_Down_held;

var _C1 = gui_state==gui_state_DIALOGUE1 
      &&  dialogue_source 
      &&  dialogue_source.is_talking 
      && (_BUTTON_ENABLE || _BUTTON_DISABLE) 
      && !Input.heldH 
      && !Input.heldSC;
//
/*
heldH  = 0;  // Horizontal
heldHV = 0;  // Horizontal & Vertical
heldS  = 0;  // Start & Select
heldC  = 0;  // B & A
heldSC = 0;  // Start, Select, B, A
*/

if (_C1
&&  dialogue_source.dialogue_datakey==_8w8_ )
{   //_TwT_=ROOM_SPEED_BASE*60; // 1 min in frames
    if (_OwO_>=0) _OwO_++;
    if ((_BUTTON_ENABLE  && !_YwY_ && _OwO_>=_TIME1)   // enable
    ||  (_BUTTON_DISABLE &&  _YwY_ && _OwO_>=_TIME2) ) // disable
    {
        _YwY_=!_YwY_;
        _OwO_=-1;
        if (_YwY_) aud_play_combo1($11);
        else       aud_play_combo1($12);
    }
}
else if (_OwO_) _OwO_--;

if (_OwO_==-1 
&&  gui_state==gui_state_NONE )
{
    _OwO_=0;
}




if (_C1
&&  dialogue_source.dialogue_datakey==_8x8_ )
{   //_TwT_=ROOM_SPEED_BASE*60; // 1 min in frames
    if (_OxO_>=0) _OxO_++;
    if ((_BUTTON_ENABLE  && !_YxY_ && _OxO_>=_TIME1)   // enable
    ||  (_BUTTON_DISABLE &&  _YxY_ && _OxO_>=_TIME2) ) // disable
    {
        _YxY_=!_YxY_;
        _OxO_=-1;
        if (_YxY_) aud_play_combo1($11);
        else       aud_play_combo1($12);
    }
}
else if (_OxO_) _OxO_--;

if (_OxO_==-1 
&&  gui_state==gui_state_NONE )
{
    _OxO_=0;
}




