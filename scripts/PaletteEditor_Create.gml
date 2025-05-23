/// PaletteEditor_Create()

show_debug_message("PaletteEditor_Create()");


var _i,_j, _a, _idx, _val1,_val2,_val3, _count,_count1, _dist;
var _x,_y, _xl,_yt, _w,_h;
var _pad,_pad0,_pad1;
var _sprite, _color;
var _text, _len,_len1, _pos;
var _dk,_dk1,_dk2,_dk3;
var _dl = ds_list_create();
var _SCALE1 = 6;


dk_XL = "_XL";


depth = DEPTH_HUD;
//depth = DEPTH_HUD-8;


                  _i=0;
state_IDLE      = _i++; // IDLE
state_EDIT1A    = _i++; // pick a color in a palette to change
state_EDIT1B    = _i++; // picking a new color from a color grid
state_BGR_COLOR = _i++; // Pick background color
state           = state_IDLE;




gui_PAD1 = $4; // camera pad
//gui_PAD1 = $8; // camera pad
gui_PAD2 = $8; // editor elements x separator
//gui_PAD2 = $A; // editor elements x separator
gui_PAD3 = $2;
gui_Background_ALPHA = 0.7;




// -1 Upper left, 0 Center left, 1 Bottom left
gui_alignment = -1;
gui_state_at_sess_start = 0;
gui_XLOFF = gui_PAD3; // camera pad
gui_YTOFF = gui_PAD3; // camera pad
//gui_XLOFF = gui_PAD1; // camera pad
//gui_YTOFF = gui_PAD1; // camera pad
gui_xl    = 0;
gui_yt    = 0;


// TODO: Need text says what input to confirm changes, and cancel
Font1_sprite = spr_Font3_1;
//Font1_sprite = spr_Font2_1;
//Font1_sprite = spr_Font1;
Font1_W = sprite_get_width( Font1_sprite);
Font1_H = sprite_get_height(Font1_sprite);
color_old = 0;
color_new = 0;








ColorOutline1_surf   = 0;
ColorOutline1_COLOR1 = c_black;
ColorOutline1_COLOR2 = c_white;
ColorOutline1_Outline_W = 2;
ColorOutline1_W  = _SCALE1 + (ColorOutline1_Outline_W<<1);
ColorOutline1_H  = ColorOutline1_W;








// PalView: For viewing whole palette ---------------------------------------
PalView_enabled = false;
PalView_SCALE1  = 2;
PalView_SCALE2  = PalView_SCALE1<<1;
PalView_Outline_W = 2;
PalView_PAD1    = $02 * PalView_SCALE1;
PalView_w       = (global.palette_image_w*PalView_SCALE1) + PalView_Outline_W;
PalView_h       = (global.palette_image_h*PalView_SCALE1) + PalView_Outline_W;
PalView_XL      = $01<<3;
PalView_xl      = PalView_XL;
PalView_YT      = $05<<3;
PalView_yt      = PalView_YT;
PalView_PAL_COUNT_PC     = val(global.dm_pi[?"PC"+STR_Count]);
PalView_PAL_COUNT_PC    += 1; // disguise
PalView_PAL_COUNT_PC    += val(global.dm_pi[?"SPELL_PC"+STR_Count]);
PalView_PAL_COUNT_CUCCO  = val(global.dm_pi[?"CUCCO"+STR_Count]);
PalView_PAL_COUNT_CUCCO += 1; // disguise
PalView_PAL_COUNT_CUCCO += val(global.dm_pi[?"CUCCO_SPELL"+STR_Count]);
PalView_Outline_COLOR1   = c_black;
PalView_Outline_COLOR2   = c_white;








// GameObject Palettes ------------------------------------------
ObjPal_COL_SIZE   = 4;
ObjPalOutline_W   = 1;
ObjPal_DIST1      = ObjPal_COL_SIZE +  ObjPalOutline_W;
ObjPalBgr1_W      = ObjPal_COL_SIZE + (ObjPalOutline_W<<1);
ObjPalBgr1_H      = ObjPal_COL_SIZE *  global.COLORS_PER_PALETTE;
ObjPalBgr1_H     += ObjPalOutline_W * (global.COLORS_PER_PALETTE+1);
ObjPalBgr2_W      = ObjPalBgr1_W + (ObjPalOutline_W<<1);
ObjPalBgr2_H      = ObjPalBgr1_H + (ObjPalOutline_W<<1);
ObjPal_YT_OFFSET  = ObjPalBgr2_H;
ObjPal_YT_OFFSET += 2; // obj sprite pad
ObjPal_surf_W     = ObjPalBgr2_W;
ObjPal_surf_H     = ObjPalBgr2_H;
ObjPal_surf       = surface_create(ObjPal_surf_W,ObjPal_surf_H);
ObjPal_FONT       = spr_Font2_1;
ObjPal_FONT_W     = sprite_get_width( ObjPal_FONT);
ObjPal_FONT_H     = sprite_get_height(ObjPal_FONT);








Cursor_can_draw = false;
Cursor_COLOR = c_orange;
//Cursor_COLOR = $00A0FF;
Cursor_W     = _SCALE1 + 4;
Cursor_H     = Cursor_W;
Cursor_xl    = 0;
Cursor_yt    = 0;
Cursor_surf  = 0;








// Edit mode
PalEdit_SCALE = _SCALE1;
PalEdit_Outline_W = 2;
PalEdit_X_BASE  = gui_XLOFF;
PalEdit_X_BASE -= PalEdit_Outline_W;
PalEdit_X_BASE  = max(0,PalEdit_X_BASE);
PalEdit_xl = 0;
PalEdit_yt = 0;
PalEdit_Outline_surf = 0;
PalEdit_color_before_edit = 0;


PalEdit_dm = ds_map_create();
var _GROUP_SPACING  = PalEdit_SCALE;
    _GROUP_SPACING += $0; // extra spacing
    //_GROUP_SPACING += $2; // extra spacing
    //_GROUP_SPACING += $4; // extra spacing
_count1 = 0;
PalEdit_group_count = 0;
_xl = 0;
_yt = 0;

PalEdit_dm[?STR_Palette+dk_XL] = _xl;




// BGR ----------------------------------------------------------
if (true)
{
    PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+dk_XL] = _xl;
    
    if (val(global.dm_pi[?"BGR"+STR_Count])>0)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "BGR 1";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR1;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"BGR"+STR_Count])>1)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "BGR 2";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR2;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"BGR"+STR_Count])>2)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "BGR 3";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR3;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"BGR"+STR_Count])>3)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "BGR 4";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR4;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"BGR"+STR_Count])>4)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "BGR 5";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR5;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+dk_XL]);
}




// PC ----------------------------------------------------------
if (false)
{
    _xl += _GROUP_SPACING; // palette group padding
    PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+dk_XL] = _xl;
    
    if (val(global.dm_pi[?"PC"+STR_Count])>0)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.1";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC1;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"PC"+STR_Count])>1)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.2";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC2;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"PC"+STR_Count])>2)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.3";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC3;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "PLAYER DISGUISE";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_DISGUISE_PC;
    PalEdit_dm[?_dk1+dk_XL] = _xl;
    _xl += PalEdit_SCALE;
    
    PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+dk_XL]);
}




// CUCCO ----------------------------------------------------------
if (false)
{
    _xl += _GROUP_SPACING; // palette group padding
    PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+dk_XL] = _xl;
    
    if (val(global.dm_pi[?"CUCCO"+STR_Count])>0)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.1";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO1;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"CUCCO"+STR_Count])>1)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.2";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO2;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"CUCCO"+STR_Count])>2)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.3";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO3;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "CUCCO DISGUISE";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_DISGUISE_CUCCO;
    PalEdit_dm[?_dk1+dk_XL] = _xl;
    _xl += PalEdit_SCALE;
    
    PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+dk_XL]);
}




// MOBS ----------------------------------------------------------
if (false)
{
    _xl += _GROUP_SPACING; // palette group padding
    PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+dk_XL] = _xl;
    
    if (val(global.dm_pi[?"MOB"+STR_Count])>0)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "MOB ORANGE";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_MOB_ORG;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"MOB"+STR_Count])>1)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "MOB RED";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_MOB_RED;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"MOB"+STR_Count])>2)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "MOB BLUE";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_MOB_BLU;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    if (val(global.dm_pi[?"MOB"+STR_Count])>3)
    {
        _dk1 = STR_Palette+hex_str(++_count1);
        PalEdit_dm[?_dk1+STR_Name] = "MOB PURPLE";
        PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_MOB_PUR;
        PalEdit_dm[?_dk1+dk_XL] = _xl;
        _xl += PalEdit_SCALE;
    }
    
    PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+dk_XL]);
}




PalEdit_PALS_W = _xl - val(PalEdit_dm[?STR_Palette+dk_XL]);
PalEdit_PALS_H = global.COLORS_PER_PALETTE * PalEdit_SCALE;
PalEdit_PAL_COUNT = _count1;
PalEdit_Cursor_clm = 0;
PalEdit_Cursor_row = 0;
//PalEdit_Cursor_color = 0; // the palette color under the cursor








// Color Grid ----------------------------------------------------------
ColorGrid_VER   = 2;
ColorGrid_surf  = 0;
ColorGrid_SCALE = _SCALE1;
ColorGrid_Outline_W = 2;
ColorGrid_dl_colors = ds_list_create();
switch(ColorGrid_VER)
{
    default:{
    ColorGrid_CLMS = sprite_get_width( spr_color_grid_2c);
    ColorGrid_ROWS = sprite_get_height(spr_color_grid_2c);
    for(_i=0; _i<ColorGrid_ROWS; _i++)
    {
        for(_j=0; _j<ColorGrid_CLMS; _j++)
        {
            _idx = (_i<<4)|_j;
            _color = p.dl_COLOR[|_idx];
            ds_list_add(ColorGrid_dl_colors,_color);
        }
    }
    break;}//default
    
    case 2:{
    ColorGrid_CLMS = p.ColorGrid_CLMS;
    ColorGrid_ROWS = p.ColorGrid_ROWS;
    ds_list_copy(ColorGrid_dl_colors,global.dl_COLOR01);
    if (ColorGrid_ROWS>ColorGrid_CLMS)
    {   // grid is in portrait layout, change it to landscape so it isn't getting in the way of the background too much
        ds_list_clear(_dl);
        for(_j=0; _j<ColorGrid_CLMS; _j++)
        {
            for(_i=ColorGrid_ROWS-1; _i>=0; _i--)
            {
                _idx = (ColorGrid_CLMS*_i) + _j;
                ds_list_add(_dl, ColorGrid_dl_colors[|_idx]);
            }
        }
        ds_list_copy(ColorGrid_dl_colors, _dl);
        _val1 = ColorGrid_CLMS;
        _val2 = ColorGrid_ROWS;
        ColorGrid_CLMS = _val2;
        ColorGrid_ROWS = _val1;
    }
    break;}//case 2
}//switch(ColorGrid_VER)
ColorGrid_Cursor_clm = 0;
ColorGrid_Cursor_row = 0;
ColorGrid_W  = (ColorGrid_CLMS*ColorGrid_SCALE) + (ColorGrid_Outline_W<<1);
ColorGrid_H  = (ColorGrid_ROWS*ColorGrid_SCALE) + (ColorGrid_Outline_W<<1);;
ColorGrid_xl = 0;
ColorGrid_yt = 0;
//ColorGrid_Cursor_color = 0;

ColorGrid_X_BASE  = gui_XLOFF;
ColorGrid_X_BASE += PalEdit_PALS_W;
ColorGrid_X_BASE += gui_PAD2; // pad
ColorGrid_X_BASE -= ColorGrid_Outline_W;








Info1_can_draw = false;

Info1_FONT   = spr_Font3_1;
Info1_FONT_W = sprite_get_width( Info1_FONT);
Info1_FONT_H = sprite_get_height(Info1_FONT);
Info1_PAD1   = $2; // Info1AreaBackground_ text pad
Info1_PAD2   = $2; // text line spacing
Info1_DIST1  = Info1_FONT_H + Info1_PAD2; // dist to next text line
Info1_DIST1 += $2; // micro adj

Info1Background_COLOR = p.C_BLK1;
Info1Background_ALPHA = gui_Background_ALPHA;
//Info1Area_H  = $4<<3;
Info1Area_h  = 0;
Info1Area_xl = 0;
Info1Area_yt = 0;


_dk1 = "GP-";
Info1_dg_H = $E;
Info1_dg = ds_grid_create(0,Info1_dg_H);
//_yt = Info1Area_Y_BASE;

_i = -1;
_j=0; _dk2="B"; _dk3=_dk1+_dk2;
ds_grid_resize(Info1_dg, (++_i)+1, Info1_dg_H);
Info1_dg[#_i,_j++] = _dk3+": CANCEL CHANGES AND EXIT";
//Info1_dg[#_i,_j++] = _dk3+",ESC,BACKSPACE: CANCEL CHANGES";
Info1_dg[#_i,_j++] = 0; // xl
Info1_dg[#_i,_j++] = 0; // yt
Info1_dg[#_i,_j++] = string(state_EDIT1A)+string(state_EDIT1B)+string(state_BGR_COLOR); // can draw conditions

_j=0; //_dk2="B"; _dk3=_dk1+_dk2;
ds_grid_resize(Info1_dg, (++_i)+1, Info1_dg_H);
Info1_dg[#_i,_j++] = "START: CONFIRM CHANGES AND EXIT";
//Info1_dg[#_i,_j++] = "START,ENTER: CONFIRM CHANGES";
Info1_dg[#_i,_j++] = 0; // xl
Info1_dg[#_i,_j++] = 0; // yt
Info1_dg[#_i,_j++] = string(state_EDIT1A)+string(state_EDIT1B)+string(state_BGR_COLOR); // can draw conditions

_j=0; _dk2="A"; _dk3=_dk1+_dk2;
ds_grid_resize(Info1_dg, (++_i)+1, Info1_dg_H);
Info1_dg[#_i,_j++] = _dk3+": PICK NEW COLOR";
//Info1_dg[#_i,_j++] = _dk3+": EDIT COLOR";
//Info1_dg[#_i,_j++] = _dk3+": SELECT COLOR";
Info1_dg[#_i,_j++] = 0; // xl
Info1_dg[#_i,_j++] = 0; // yt
Info1_dg[#_i,_j++] = string(state_EDIT1A)+string(state_EDIT1B); // can draw conditions

_j=0; _dk2="X"; _dk3=_dk1+_dk2;
ds_grid_resize(Info1_dg, (++_i)+1, Info1_dg_H);
Info1_dg[#_i,_j++] = _dk3+","+_dk3+"+LT,"+_dk3+"+RT: RANDOMIZE COLOR(S)";
Info1_dg[#_i,_j++] = 0; // xl
Info1_dg[#_i,_j++] = 0; // yt
Info1_dg[#_i,_j++] = string(state_EDIT1A); // can draw conditions

_j=0; _dk2="Y"; _dk3=_dk1+_dk2;
ds_grid_resize(Info1_dg, (++_i)+1, Info1_dg_H);
Info1_dg[#_i,_j++] = _dk3+","+_dk3+"+LT,"+_dk3+"+RT: VIEW PREVIOUS COLOR(S)";
Info1_dg[#_i,_j++] = 0; // xl
Info1_dg[#_i,_j++] = 0; // yt
Info1_dg[#_i,_j++] = string(state_EDIT1A)+string(state_EDIT1B)+string(state_BGR_COLOR); // can draw conditions


Info1_dg_W = ds_grid_width(Info1_dg);


_len1 = string_length(_dk1); // _dk1 = "GP-";
for(_i=Info1_dg_W-1; _i>=0; _i--)
{
    _idx = $5; // $5: first index of button sprite data
    _text = Info1_dg[#_i,$0];
    _count1 = string_count(_dk1,_text);
    for(_j=0; _j<_count1; _j++)
    {
        _pos = string_pos(_dk1,_text);
        if(!_pos) break;//_j
        
        _dk2 = string_char_at(_text,_pos+_len1); // "A","B","X","Y"
        if (_pos>1) _val1 = string_copy(_text, 1, _pos-1);
        else        _val1 = "";
        _text = _val1 + _dk2 + strR(_text, _pos+_len1+1);
        //_text = strReplaceAt(_text, _pos, _len1+1, "["+_dk2+"]");
        
        _sprite = Input.Buttons_dm[?dk_XBox+"_"+_dk2+STR_Sprite];
        if(!is_undefined(_sprite))
        {
            _w = sprite_get_width( _sprite);
            _h = sprite_get_height(_sprite);
            Info1_dg[#_i,_idx]  = _sprite; // sprite
            _idx++;
            
            Info1_dg[#_i,_idx]  = Info1_FONT_W * (_pos-1); // sprite x base
            Info1_dg[#_i,_idx] += _w>>1;
            if (_j) Info1_dg[#_i,_idx] -= $3; // make room for "+"
            else    Info1_dg[#_i,_idx] -= $2; // make room for "," or ":"
            _idx++;
            
            Info1_dg[#_i,_idx]  = Info1_FONT_H>>1; // sprite y base
            Info1_dg[#_i,_idx] -= $1; // micro adj
            _idx++;
        }
        else
        {
            _idx += 3;
        }
    }
    
    Info1_dg[#_i,$0] = _text;
}
/*
Buttons_dm[?string(gp_face1)+STR_Name] = "FACE1"; // Xbox A button
Buttons_dm[?string(gp_face2)+STR_Name] = "FACE2"; // Xbox B button
Buttons_dm[?string(gp_face3)+STR_Name] = "FACE3"; // Xbox X button
Buttons_dm[?string(gp_face4)+STR_Name] = "FACE4"; // Xbox Y button
*/


_len1 = 0;
for(_i=Info1_dg_W-1; _i>=0; _i--) _len1 = max(_len1, string_length(Info1_dg[#_i,0]));
_val1  = Info1_FONT_W * _len1;
_val1 += Info1_PAD2<<1; // text pad
Info1Area_W = _val1;

_val1  = ColorGrid_X_BASE + ColorGrid_W;
_val1 += $6; // color grid pad
_val2  = viewW();
_val2 -= gui_PAD3; // camera pad
_val2 -= Info1Area_W;
Info1Area_X_BASE  = max(_val1,_val2);

Info1Area_Y_BASE  = gui_PAD3;
//Info1Area_Y_BASE  = gui_YTOFF;
//Info1Area_Y_BASE -= $2; // micro adj








DELAY1_DUR = $10;
DELAY2_DUR = $20;
DELAY3_DUR = $40;
DELAY4_DUR = $40;
DELAY5_DUR = $FF;
timer      = DELAY4_DUR;


PP   = 0; // 'P' key Pressed
PP0  = 0; // 'P' is ONLY key Pressed
PH   = 0; // 'P' key Held
PH0  = 0; // 'P' is ONLY key Held

CTL  = 0;
SHF  = 0;
ALT  = 0;
CTL0 = 0; // ONLY CTL held
SHF0 = 0; // ONLY SHF held
ALT0 = 0; // ONLY ALT held


EditRequested_Pal_counter = 0;
EditRequested_Bgr_counter = 0;


// Palette history for the current palette editing session.
dl_hist_sess     = ds_list_create();
//dl_hist_sess_MAX = $80;

// Palette history for the current rm.
dl_hist_room     = ds_list_create();
//dl_hist_room_MAX = $80;
//
// A backup if session is cancelled.
pal_before_edit_sess  = "";
pal_before_edit_color = "";
pal_during_edit       = ""; // Current palette affecting screen while in edit mode(STATE_PKM2)


BgrColor_before_edit = global.BackgroundColor_scene;
BgrColor_during_edit = BgrColor_before_edit;




ds_list_destroy(_dl); _dl=undefined;




