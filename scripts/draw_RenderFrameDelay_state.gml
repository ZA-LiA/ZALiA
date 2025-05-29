/// draw_RenderFrameDelay_state()


var _XOFF = 0;
var _YOFF = $28;
var _Text_XOFF = 4;
var _Text_YOFF = 2;

var _TEXT = "RENDER FRAME DELAY - " + string(global.RenderFrameDelay_state);
var _W = (_Text_XOFF<<1) + (string_length(_TEXT)<<3);
var _H = (_Text_YOFF<<1) + 8;
var _X = viewXR() - _XOFF - _W + _Text_XOFF;
var _Y = viewYT() + _YOFF      + _Text_YOFF;

draw_rect(c_black, _X,_Y, _W,_H);
draw_text_(_X,_Y, _TEXT);




