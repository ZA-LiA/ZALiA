/// gui_tmr_cursor_v()


if(!Input.heldV) return 0;


var _C1 = Input.heldV != (Input.heldPrev&(Input.D|Input.U));

if(!_C1) g.gui_timer1--; // menu timer


if (_C1 
|| !g.gui_timer1 )
{
    if (_C1) g.gui_timer1 = $10; // delay auto-scroll
    else     g.gui_timer1 = $07; // auto-scroll
    
    return Input.heldV;
}


return 0;




