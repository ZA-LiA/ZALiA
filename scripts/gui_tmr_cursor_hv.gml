/// gui_tmr_cursor_hv(0_hor  1_ver)


// 9DF6
var            _HELD = 0;
if (argument0) _HELD = Input.heldV;
else           _HELD = Input.heldH;

if(!_HELD) return 0;



var            _C1 = 0;
if (argument0) _C1 = _HELD != Input.heldPrev&(Input.D|Input.U); // $C: Dwn $4 | Up  $8
else           _C1 = _HELD != Input.heldPrev&(Input.R|Input.L); // $3: Rgt $1 | Lft $2

if(!_C1) // Same button from last frame still being held
{
    if (argument0) g.gui_timer1--; // Vertical
    else           g.gui_timer2--; // Horizontal
}




if (argument0)
{
    // Vertical
    if (_C1 
    || !g.gui_timer1 )
    {
        if (_C1) g.gui_timer1 = $10; // delay auto-scroll
        else     g.gui_timer1 = $07; // auto-scroll
        
        return _HELD;
    }
}
else
{
    // Horizontal
    if (_C1 
    || !g.gui_timer2 )
    {
        if (_C1) g.gui_timer2 = $10; // delay auto-scroll
        else     g.gui_timer2 = $07; // auto-scroll
        
        return _HELD;
    }
}


return 0;




