/// FileSelect_build_surfaces_1(STR_Register or STR_Eliminate)


switch(argument[0])
{
    default:{exit;} // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    case STR_Register:{
    if (surface_exists(REGISTER_surf)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
    
    case STR_Eliminate:{
    if (surface_exists(ELIMINATE_surf)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
}




// ---------------------------------------------------------------------------------
var _i,_j;
var _idx = 0;
var _x,_y, _x1,_y1, _dist1,_dist2;
var _clms, _rows;
var _tsrc, _ts_x,_ts_y;
var _text, _len, _char_w;
switch(argument[0])
{
    case STR_Register:{
    var _DrawArea_XL = REGISTER_surf_DrawArea_XL;
    var _DrawArea_XC = viewXC();
    var _DrawArea_YT = REGISTER_surf_DrawArea_YT;
    break;}
    
    case STR_Eliminate:{
    var _DrawArea_XL = ELIMINATE_surf_DrawArea_XL;
    var _DrawArea_XC = viewXC();
    var _DrawArea_YT = ELIMINATE_surf_DrawArea_YT;
    break;}
}

var _DrawArea_W = (_DrawArea_XC-_DrawArea_XL)<<1;

var _Y1  = $03<<3; // YT of save files
    _Y1 +=($03<<3)*SAVE_FILE_MAX; // + total height of save files for YT of "RANDO"/"END"
    _Y1 += $01<<3; // + extra "RANDO"/"END" pad
    _Y1 += _DrawArea_YT;
// YT of "END"
switch(argument[0]){
case STR_Register: {var _Y2=_Y1+($02<<3); break;}
case STR_Eliminate:{var _Y2=_Y1; break;}
}
var _Y3  = _Y2;    // YT of "END"
    _Y3 += $02<<3; // YT of window border
//

switch(argument[0])
{
    case STR_Register:{
    REGISTER_surf = surface_create(REGISTER_surf_W,REGISTER_surf_H);
    surface_set_target(REGISTER_surf);
    draw_clear_alpha(c_black,0);
    break;}
    
    case STR_Eliminate:{
    ELIMINATE_surf = surface_create(ELIMINATE_surf_W,ELIMINATE_surf_H);
    surface_set_target(ELIMINATE_surf);
    draw_clear_alpha(c_black,0);
    break;}
}

pal_swap_set(global.palette_image, PI_MENU1);





// HEADER =======================
switch(argument[0]){
case STR_Register: {_text=" REGISTER YOUR NAME "; break;}
case STR_Eliminate:{_text=" ELIMINATION MODE "; break;}
}
_char_w = 8;
_len = string_length(_text);
_dist1 = _len*_char_w;

// Horizontal bar
_tsrc = g.dl_MenuFrame_TSRC[|0]; // 0: Horizontal bar
_ts_x = ((_tsrc>>0)&$F) <<3;
_ts_y = ((_tsrc>>4)&$F) <<3;

_dist2  = _DrawArea_W>>1; // half w of header
_dist2 -= _dist1>>1; // w available for an end bar
_clms  = _dist2>>3;  // Number of horizontal bar tiles on each side of header text
_clms -= _clms&$1;   // round down to even

_dist2 = _DrawArea_W>>1; // half w of header
_x1 = _DrawArea_XC - _dist2; // XL of header
_x = _x1; // XL of left end bar (XL of header)
_y = _DrawArea_YT;   // YT of header
repeat(2)
{
    for(_i=0; _i<_clms; _i++) draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x+(_i<<3),_y);
    _x  = _DrawArea_XC + _dist2; // XR of right end bar
    _x -= _clms<<3;              // XL of right end bar
}

// Header text
_x = _DrawArea_XC - (_dist1>>1);
draw_text_(_x,_y, _text);





// "RANDO" & "END" =======================
_x  = SAVE_NAME_X2;
_y  = REGISTER_RANDO_TEXT_YT;
//_y  = _Y1;
//_y += RandoOptions_YOFF1;
if (argument[0]==STR_Register) draw_text_(_x,_y, "RANDO");
_y  = _Y2;
_y += RandoOptions_YOFF1;
draw_text_(_x,_y, "DONE");




// CHAR TABLE =======================
_clms = CharTable_Window_CLMS; // number of window clms
_dist2 = (_clms<<3)>>1; // half w of the table window

_x1 = _DrawArea_XC - _dist2; // XL of window border
_x1 = (_x1>>3)<<3;       // make sure window is aligned w/ the grid
_x  = _x1;    // XL of window border
_x += $01<<3; // + left window border
_x += $01<<3; // + left text pad to get XL of text area

_y1  = _Y3;    // YT of window border
_y1 += $01<<3; // + top window border
_y1 += $01<<3; // + top text pad to get YT of text area
for(_i=ds_list_size(CharTable_dl)-1; _i>=0; _i--)
{
    _y  = _y1; // 1st line text YT
    _y += ($02<<3)*_i; // + dist between text rows
    draw_text_(_x,_y, CharTable_dl[|_i]);
}

// CHAR TABLE WINDOW BORDER =======================
_idx = 2; // 2: Corner tile
_y1 = _Y3; // YT of window border
_rows  = ds_list_size(CharTable_dl); // text rows
_rows += _rows+1; // + space inbetween text rows
_rows += $02;     // + top & bottom window borders
for(_i=0; _i<_rows; _i++)
{
    for(_j=0; _j<_clms; _j++)
    {
        if (_i==0 
        ||  _i==_rows-1 )
        {   // Top & Bottom rows
            if (_j==0 
            ||  _j==_clms-1 )
            {    _idx=2;  } // 2: Corner
            else _idx=0;    // 0: Horizontal bar
        }
        else
        {   // Sides
            if (_j==0 
            ||  _j==_clms-1 )
            {    _idx=1;  } // 1: Vertical bar
            else continue;// _j
        }
        
        _tsrc = g.dl_MenuFrame_TSRC[|_idx];
        _ts_x = ((_tsrc>>0)&$F) <<3;
        _ts_y = ((_tsrc>>4)&$F) <<3;
        
        _x = _x1 + (_j<<3);
        _y = _y1 + (_i<<3);
        draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
    }
}

pal_swap_reset();
surface_reset_target();

switch(argument[0]){
case STR_Register: {{if (surface_exists(REGISTER_surf)) show_debug_message("FileSelect_build_surfaces(). "+"`REGISTER_surf` created!");} break;}
case STR_Eliminate:{{if (surface_exists(ELIMINATE_surf)) show_debug_message("FileSelect_build_surfaces(). "+"`ELIMINATE_surf` created!");} break;}
}




