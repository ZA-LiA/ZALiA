/// draw_skull_1a(x,y, *xscale,*yscale, *palidx, *preset, *mouth open level, *mouth, *horns, *skull, *nose, *eyes, *pupils)


var               _arg=0;
var _X = argument[_arg++];
var _Y = argument[_arg++];

var                      _XSCALE     = 1;
if (argument_count>_arg) _XSCALE     = sign_(argument[_arg++]);

var                      _YSCALE     = 1;
if (argument_count>_arg) _YSCALE     = sign_(argument[_arg++]);


var                      _PALIDX     = PI_MOB_RED;
if (argument_count>_arg) _PALIDX     = argument[_arg++];

var                      _PRESET     = 0; // 1,2,3,
if (argument_count>_arg) _PRESET     = argument[_arg++];


var                      _mouth_open = -1; // 0,1,2,3,
if (argument_count>_arg) _mouth_open = argument[_arg++];

var                      _mouth      = 0; // 1,2,3,
if (argument_count>_arg) _mouth      = argument[_arg++];


var                      _horns      = 0; // 1,
if (argument_count>_arg) _horns      = argument[_arg++];

var                      _skull      = 0; // 1,2,
if (argument_count>_arg) _skull      = argument[_arg++];

var                      _nose       = 0; // 1,
if (argument_count>_arg) _nose       = argument[_arg++];


var                      _eyes       = 0; // 1,2,3,4,5,6
if (argument_count>_arg) _eyes       = argument[_arg++];

var                      _pupils     = 0; // 1,2
if (argument_count>_arg) _pupils     = argument[_arg++];



// You can choose a preset AND specify custom values for each property.
switch(_PRESET)
{
    case 1:{
    if!(_mouth_open+1) _mouth_open = 1; // 1: skull yoff  0, mouth yoff +1
    if(!_mouth)  _mouth  = 2; // 2: small
    if(!_horns)  _horns  = 1;
    if(!_skull)  _skull  = 1;
    if(!_nose)   _nose   = 1;
    if(!_eyes)   _eyes   = 1; // 1: Anger1 w/ top+btm
    if(!_pupils) _pupils = 2; // 2: large
    break;}
    
    case 2:{
    if!(_mouth_open+1) _mouth_open = 2; // 2: skull yoff -1, mouth yoff +1
    if(!_mouth)  _mouth  = 1; // 1: normal - teeth detail
    if(!_horns)  _horns  = 1;
    if(!_skull)  _skull  = 1;
    if(!_nose)   _nose   = 1;
    if(!_eyes)   _eyes   = 1; // 1: Anger1 w/ top+btm
    if(!_pupils) _pupils = 2; // 2: large
    break;}
    
    case 3:{
    if!(_mouth_open+1) _mouth_open = 3; // 3: skull yoff -1, mouth yoff +2
    if(!_mouth)  _mouth  = 1; // 1: normal - teeth detail
    if(!_horns)  _horns  = 1;
    if(!_skull)  _skull  = 1;
    if(!_nose)   _nose   = 1;
    if(!_eyes)   _eyes   = 1; // 1: Anger1 w/ top+btm
    if(!_pupils) _pupils = 2; // 2: large
    break;}
}//switch(_PRESET)




switch( _mouth){
case 1:{_mouth=spr_GanonSkull_Mouth1a; break;} // normal - teeth detail
case 2:{_mouth=spr_GanonSkull_Mouth2a; break;} // small
case 3:{_mouth=spr_GanonSkull_Mouth1b; break;} // normal - no detail(more full)
}

switch( _horns){
case 1:{_horns=spr_GanonSkull_Horns1a; break;}
}

switch( _skull){
case 1:{_skull=spr_GanonSkull_Main1a; break;} // 1a: norm
case 2:{_skull=spr_GanonSkull_Main2a; break;} // 2a: long
}

switch( _nose){
case 1:{_nose=spr_GanonSkull_Nose1a; break;}
}

switch( _eyes){
case 1:{_eyes=spr_GanonSkull_Eyes1a; break;} // 1a: Anger1   - top, btm
case 2:{_eyes=spr_GanonSkull_Eyes1b; break;} // 1b: Anger1   - top
case 3:{_eyes=spr_GanonSkull_Eyes2a; break;} // 2a: Surprise - top, btm
case 4:{_eyes=spr_GanonSkull_Eyes2b; break;} // 2b: Surprise - top
case 5:{_eyes=spr_GanonSkull_Eyes1c; break;} // 1c: Anger2   - top, btm
case 6:{_eyes=spr_GanonSkull_Eyes1d; break;} // 1d: Anger2   - top
}

switch( _pupils){
case 1:{_pupils=spr_GanonSkull_Pupils1a; break;} // small
case 2:{_pupils=spr_GanonSkull_Pupils2a; break;} // large
}




var _yoff_mouth = 0;
var _yoff_skull = 0;
switch(_mouth_open){
case 0:{_yoff_mouth=0; _yoff_skull= 0; break;} // 0: skull yoff  0, mouth yoff  0
case 1:{_yoff_mouth=1; _yoff_skull= 0; break;} // 1: skull yoff  0, mouth yoff +1
case 2:{_yoff_mouth=1; _yoff_skull=-1; break;} // 2: skull yoff -1, mouth yoff +1
case 3:{_yoff_mouth=2; _yoff_skull=-1; break;} // 3: skull yoff -1, mouth yoff +2
}



pal_swap_set(p.palette_image,_PALIDX);
draw_sprite_(_mouth,0,  _X, _Y+_yoff_mouth, -1, _XSCALE,_YSCALE);
draw_sprite_(_horns,0,  _X, _Y+_yoff_skull, -1, _XSCALE,_YSCALE);
draw_sprite_(_skull,0,  _X, _Y+_yoff_skull, -1, _XSCALE,_YSCALE);
draw_sprite_(_nose,0,   _X, _Y+_yoff_skull, -1, _XSCALE,_YSCALE);
draw_sprite_(_eyes,0,   _X, _Y+_yoff_skull, -1, _XSCALE,_YSCALE);
draw_sprite_(_pupils,0, _X, _Y+_yoff_skull, -1, _XSCALE,_YSCALE);
pal_swap_reset();




