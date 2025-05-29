/// dev_draw_invState()


var _xOff = 0;
var _yOff = $18;
var _textXOff = 4;
var _textYOff = 2;

var _text = "INV-" + string(g.dev_invState&$3);
var _w = (_textXOff<<1) + (string_length(_text)<<3);
var _h = (_textYOff<<1) + 8;
var _x = viewXR() - _xOff - _w + _textXOff;
var _y = viewYT() + _yOff      + _textYOff;

draw_rect(c_black, _x,_y, _w,_h);
draw_text_(_x,_y, _text);


// Draw timing -----------------------------------------------------------------
//if (g.counter0&$7) exit; //!!!!!!!!!!!!!!!!!!!!!!!!!! shift timing bit every x frames
if!(g.counter0&$7)
{
    if ( g.dev_invState &  $8)
    {    g.dev_invState &= $3;  } // Next shift would put timing bit next to state bits, so end draw here
    else g.dev_invState  = ((g.dev_invState>>1)&$FF8) | (g.dev_invState&$3);
}




