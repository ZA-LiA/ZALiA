/// gui_tmr_cursor_h()


if(!Input.heldH) return 0;


var _C1 = Input.heldH != (Input.heldPrev&(Input.R|Input.L));

if(!_C1) g.gui_timer2--; // menu timer


if (_C1 
|| !g.gui_timer2 )
{
    if (_C1) g.gui_timer2 = $10; // delay auto-scroll
    else     g.gui_timer2 = $07; // auto-scroll
    
    return Input.heldH;
}


return 0;




