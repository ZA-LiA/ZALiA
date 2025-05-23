/// GraphicsEffectsEditor_Create()


var _i, _a,_b, _idx, _val, _num,_num1,_num2;
var _x,_y, _x1,_y1;
var _dk,_dk1,_dk2,_dk3;
var _exists;

var _font_sprite, _font_w,_font_h;
Font1_SPRITE = spr_Font2_1;
var _Font1_W = sprite_get_width( Font1_SPRITE);
var _Font1_H = sprite_get_height(Font1_SPRITE);
LEADING1 = 6;

var _DIST1  = _Font1_H;
    _DIST1 += LEADING1; // padding
//
var _DIST2  = _Font1_W<<1;

var _dg_HEIGHT = $0C;

dm = ds_map_create();
dg_menu = ds_grid_create(0,0);
dg_menu_idx = -1;




PI_MENU1 = global.PI_GUI1;
PI_DARK1 = global.PI_GUI2;



                 _a=-1;
state_CLOSED = ++_a;
state_OPEN   = ++_a;
state = state_CLOSED;







var _UserPref_dm = ds_map_create();
var _UserPref_FILE_NAME = STR_Game+STR_Preferences+"01"+".txt";
if (file_exists(_UserPref_FILE_NAME))
{
    var _UserPref_FILE = file_text_open_read(working_directory+_UserPref_FILE_NAME);
    var _encoded       = file_text_read_string(_UserPref_FILE);
    file_text_close(_UserPref_FILE);
    var _dm_FILE = json_decode(_encoded);
    if (_dm_FILE!=-1) // -1: json_decode() failed
    {
        global.RetroShaders_enabled       = val(_dm_FILE[?"_Retro_Shaders_Enabled"],       global.RetroShaders_enabled);
        global.RetroShaders_surface_scale = val(_dm_FILE[?"_Retro_Shaders_Surface_Scale"], global.RetroShaders_surface_scale);
        global.application_surface_draw_enable_state = !global.RetroShaders_enabled;
        application_surface_draw_enable(global.application_surface_draw_enable_state);
        update_shaders_surf_resize();
        
        _encoded = _dm_FILE[?"_Graphics_Effects"+STR_Preferences];
        if(!is_undefined(_encoded))
        {
                _val = json_decode(_encoded);
            if (_val!=-1) ds_map_copy(_UserPref_dm,_val);
        }
        
        ds_map_destroy(_dm_FILE); _dm_FILE=undefined;
    }
}








XL0 = $10;
XL1 = XL0+_DIST2;
XL2 = XL1+_DIST2;
YT0 = $28;
var _values_xl = 0;


_y1 = YT0;
_y  = _y1;
// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL0;
_x  = _x1;
_font_sprite = Font1_SPRITE;

                    _b=-1;
menu_focus_Main = ++_b;
ds_grid_clear( dg_menu,0);
ds_grid_resize(dg_menu,0,_dg_HEIGHT);
dg_menu_idx = -1;
/*
dg_menu_idx = -1;
ds_grid_resize(dg_menu,(++dg_menu_idx)+1,_dg_HEIGHT);
Main_DATA = ++dg_menu_idx;
ds_grid_resize(dg_menu, dg_menu_idx+1, _dg_HEIGHT);
dg_menu[#$0,$0] = STR_Main; // menu name
dg_menu[#$0,$1] = 1;               // cursor idx
dg_menu[#$0,$2] = dg_menu[#$0,$1]; // cursor idx default
*/

/*
_dk = STR_Option+STR_Count;
dm[?_dk] = val(dm[?_dk])+1;
_num1 =    val(dm[?_dk]);
_num2 = dg_menu_idx+1;
_dk1 = STR_Option+hex_str(_num1);
_dk2 = STR_Main  +hex_str(_num2);
dm[?_dk1+STR_Menu]    = STR_Main;
dm[?_dk1+STR_Datakey] = _dk2;

dm[?STR_Main+STR_Count] = _num2;
dm[?_dk2+"_XL"]     = _x;
dm[?_dk2+"_YT"]     = _y;
dm[?_dk2+STR_Text]  = "EFFECTS STATE";
dm[?_dk2+STR_Value] = g.RetroShaders_VER; // current value/setting
if ( dm[?_dk2+STR_Value])
{    dm[?_dk2+STR_Value+STR_Text] = "ON";  }
else dm[?_dk2+STR_Value+STR_Text] = "OFF";
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;
*/
Main_ENABLE = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "EFFECTS STATE", 1,global.RetroShaders_enabled,false,true);
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;
if (dg_menu[#dg_menu_idx,$5]) dg_menu[#dg_menu_idx,$A] = "ON";  // value text
else                          dg_menu[#dg_menu_idx,$A] = "OFF"; // value text

Main_DETAIL = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "DETAIL", -1, global.RetroShaders_surface_scale, 2,4);
dg_menu[#dg_menu_idx,$A] = string(dg_menu[#dg_menu_idx,$5])+"X";
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_BRIGHTNESS = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "BRIGHTNESS");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_SATURATION = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "SATURATION");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_SCANLINES = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "SCANLINES");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_BLOOM = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "BLOOM");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_BLUR = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "BLUR");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_DEFAULT = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "RESTORE ALL DEFAULTS");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;

Main_BACK = dg_menu_idx+1;
GraphicsEffectsEditor_Create_1(_x,_y, "CLOSE");
_y += sprite_get_height(dg_menu[#dg_menu_idx,$3])+LEADING1;


Main_cursor = 0;

for(_i=ds_grid_width(dg_menu)-1; _i>=0; _i--)
{
    _x  = dg_menu[#_i,$0];
    _x += string_length(dg_menu[#_i,$2])*sprite_get_width(dg_menu[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}

dg_Main = ds_grid_create(0,0);
ds_grid_copy(dg_Main,dg_menu);
ds_grid_clear( dg_menu,0);
ds_grid_resize(dg_menu,0,0);
dg_menu_idx = -1;








// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL1;
_x  = _x1;
_font_sprite = Font1_SPRITE;

menu_focus_Brightness = ++_b;
dg_Main[#Main_BRIGHTNESS,$9] = _b;

dg_Brightness = ds_grid_create(0,_dg_HEIGHT);
                      dg_menu_idx=-1;
Brightness_ENABLE = ++dg_menu_idx;
ds_grid_resize(dg_Brightness, dg_menu_idx+1, ds_grid_height(dg_Brightness));
dg_Brightness[#dg_menu_idx,$0] = _x; // XL
dg_Brightness[#dg_menu_idx,$1] = _y; // YT
dg_Brightness[#dg_menu_idx,$2] = "STATE"; // 
dg_Brightness[#dg_menu_idx,$3] = _font_sprite;
dg_Brightness[#dg_menu_idx,$4] = true; // option is available
dg_Brightness[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Brightness+STR_State], false); // current setting
dg_Brightness[#dg_menu_idx,$8] = dg_Brightness[#dg_menu_idx,$5]; // default
dg_Brightness[#dg_menu_idx,$9] = menu_focus_Brightness;
if (dg_Brightness[#dg_menu_idx,$5]) dg_Brightness[#dg_menu_idx,$A] = "ON";  // value text
else                                dg_Brightness[#dg_menu_idx,$A] = "OFF"; // value text
dg_Main[#Main_BRIGHTNESS,$5] = dg_Brightness[#dg_menu_idx,$5];
dg_Main[#Main_BRIGHTNESS,$A] = dg_Brightness[#dg_menu_idx,$A];
_y += sprite_get_height(dg_Brightness[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Brightness_EDIT    = ++dg_menu_idx;
ds_grid_resize(dg_Brightness, dg_menu_idx+1, ds_grid_height(dg_Brightness));
dg_Brightness[#dg_menu_idx,$0] = _x; // XL
dg_Brightness[#dg_menu_idx,$1] = _y; // YT
dg_Brightness[#dg_menu_idx,$2] = "EDIT"; // 
dg_Brightness[#dg_menu_idx,$3] = _font_sprite;
dg_Brightness[#dg_menu_idx,$4] = true; // option is available
dg_Brightness[#dg_menu_idx,$5] =  val(_UserPref_dm[?STR_Brightness+"A"], 0.00); // current setting
//dg_Brightness[#dg_menu_idx,$5] = -0.08; // current setting
dg_Brightness[#dg_menu_idx,$6] = -1.00; // min
dg_Brightness[#dg_menu_idx,$7] =  1.00; // max
dg_Brightness[#dg_menu_idx,$8] = dg_Brightness[#dg_menu_idx,$5]; // default
dg_Brightness[#dg_menu_idx,$9] = menu_focus_Brightness;
dg_Brightness[#dg_menu_idx,$A] = string_format(dg_Brightness[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Brightness[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Brightness_DEFAULT = ++dg_menu_idx;
ds_grid_resize(dg_Brightness, dg_menu_idx+1, ds_grid_height(dg_Brightness));
dg_Brightness[#dg_menu_idx,$0] = _x; // XL
dg_Brightness[#dg_menu_idx,$1] = _y; // YT
dg_Brightness[#dg_menu_idx,$2] = "RESTORE DEFAULTS"; // 
dg_Brightness[#dg_menu_idx,$3] = _font_sprite;
dg_Brightness[#dg_menu_idx,$4] = true; // option is available
dg_Brightness[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Brightness[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Brightness_BACK    = ++dg_menu_idx;
ds_grid_resize(dg_Brightness, dg_menu_idx+1, ds_grid_height(dg_Brightness));
dg_Brightness[#dg_menu_idx,$0] = _x; // XL
dg_Brightness[#dg_menu_idx,$1] = _y; // YT
dg_Brightness[#dg_menu_idx,$2] = "BACK"; // 
dg_Brightness[#dg_menu_idx,$3] = _font_sprite;
dg_Brightness[#dg_menu_idx,$4] = true; // option is available
dg_Brightness[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Brightness[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Brightness_cursor = 0;

for(_i=ds_grid_width(dg_Brightness)-1; _i>=0; _i--)
{
    if(!dg_Brightness[#_i,$B]) dg_Brightness[#_i,$B] = PI_MENU1;
    _x  = dg_Brightness[#_i,$0];
    _x += string_length(dg_Brightness[#_i,$2])*sprite_get_width(dg_Brightness[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}




// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL1;
_x  = _x1;
_font_sprite = Font1_SPRITE;

menu_focus_Saturation = ++_b;
dg_Main[#Main_SATURATION,$9] = _b;

dg_Saturation = ds_grid_create(0,_dg_HEIGHT);
                       dg_menu_idx=-1;
Saturation_ENABLE = ++dg_menu_idx;
ds_grid_resize(dg_Saturation, dg_menu_idx+1, ds_grid_height(dg_Saturation));
dg_Saturation[#dg_menu_idx,$0] = _x; // XL
dg_Saturation[#dg_menu_idx,$1] = _y; // YT
dg_Saturation[#dg_menu_idx,$2] = "STATE"; // 
dg_Saturation[#dg_menu_idx,$3] = _font_sprite;
dg_Saturation[#dg_menu_idx,$4] = true; // option is available
dg_Saturation[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Saturation+STR_State], true); // current setting
dg_Saturation[#dg_menu_idx,$8] = dg_Saturation[#dg_menu_idx,$5]; // default
if (dg_Saturation[#dg_menu_idx,$5]) dg_Saturation[#dg_menu_idx,$A] = "ON";  // value text
else                                dg_Saturation[#dg_menu_idx,$A] = "OFF"; // value text
dg_Main[#Main_SATURATION,$5] = dg_Saturation[#dg_menu_idx,$5];
dg_Main[#Main_SATURATION,$A] = dg_Saturation[#dg_menu_idx,$A];
_y += sprite_get_height(dg_Saturation[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Saturation_EDIT    = ++dg_menu_idx;
ds_grid_resize(dg_Saturation, dg_menu_idx+1, ds_grid_height(dg_Saturation));
dg_Saturation[#dg_menu_idx,$0] = _x; // XL
dg_Saturation[#dg_menu_idx,$1] = _y; // YT
dg_Saturation[#dg_menu_idx,$2] = "EDIT"; // 
dg_Saturation[#dg_menu_idx,$3] = _font_sprite;
dg_Saturation[#dg_menu_idx,$4] = true; // option is available
dg_Saturation[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Saturation+"A"], -0.075); // current setting
//dg_Saturation[#dg_menu_idx,$5] =  0.00; // current setting
//dg_Saturation[#dg_menu_idx,$5] = -0.01; // current setting
dg_Saturation[#dg_menu_idx,$6] = -1.00; // min
dg_Saturation[#dg_menu_idx,$7] =  1.00; // max
dg_Saturation[#dg_menu_idx,$8] = dg_Saturation[#dg_menu_idx,$5]; // default
dg_Saturation[#dg_menu_idx,$A] = string_format(dg_Saturation[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Saturation[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Saturation_DEFAULT = ++dg_menu_idx;
ds_grid_resize(dg_Saturation, dg_menu_idx+1, ds_grid_height(dg_Saturation));
dg_Saturation[#dg_menu_idx,$0] = _x; // XL
dg_Saturation[#dg_menu_idx,$1] = _y; // YT
dg_Saturation[#dg_menu_idx,$2] = "RESTORE DEFAULTS"; // 
dg_Saturation[#dg_menu_idx,$3] = _font_sprite;
dg_Saturation[#dg_menu_idx,$4] = true; // option is available
dg_Saturation[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Saturation[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Saturation_BACK    = ++dg_menu_idx;
ds_grid_resize(dg_Saturation, dg_menu_idx+1, ds_grid_height(dg_Saturation));
dg_Saturation[#dg_menu_idx,$0] = _x; // XL
dg_Saturation[#dg_menu_idx,$1] = _y; // YT
dg_Saturation[#dg_menu_idx,$2] = "BACK"; // 
dg_Saturation[#dg_menu_idx,$3] = _font_sprite;
dg_Saturation[#dg_menu_idx,$4] = true; // option is available
dg_Saturation[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Saturation[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Saturation_cursor = 0;

for(_i=ds_grid_width(dg_Saturation)-1; _i>=0; _i--)
{
    if(!dg_Saturation[#_i,$B]) dg_Saturation[#_i,$B] = PI_MENU1;
    _x  = dg_Saturation[#_i,$0];
    _x += string_length(dg_Saturation[#_i,$2])*sprite_get_width(dg_Saturation[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}




// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL1;
_x  = _x1;
_font_sprite = Font1_SPRITE;

menu_focus_Scanlines = ++_b;
dg_Main[#Main_SCANLINES,$9] = _b;

dg_Scanlines = ds_grid_create(0,_dg_HEIGHT);
                      dg_menu_idx=-1;
Scanlines_ENABLE = ++dg_menu_idx;
ds_grid_resize(dg_Scanlines, dg_menu_idx+1, ds_grid_height(dg_Scanlines));
dg_Scanlines[#dg_menu_idx,$0] = _x; // XL
dg_Scanlines[#dg_menu_idx,$1] = _y; // YT
dg_Scanlines[#dg_menu_idx,$2] = "STATE"; // 
dg_Scanlines[#dg_menu_idx,$3] = _font_sprite;
dg_Scanlines[#dg_menu_idx,$4] = true; // option is available
dg_Scanlines[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Scanlines+STR_State], true); // current setting
//dg_Scanlines[#dg_menu_idx,$5] = false; // current setting
dg_Scanlines[#dg_menu_idx,$8] = dg_Scanlines[#dg_menu_idx,$5]; // default
if (dg_Scanlines[#dg_menu_idx,$5]) dg_Scanlines[#dg_menu_idx,$A] = "ON";  // value text
else                               dg_Scanlines[#dg_menu_idx,$A] = "OFF"; // value text
dg_Main[#Main_SCANLINES,$5] = dg_Scanlines[#dg_menu_idx,$5];
dg_Main[#Main_SCANLINES,$A] = dg_Scanlines[#dg_menu_idx,$A];
_y += sprite_get_height(dg_Scanlines[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Scanlines_EDIT    = ++dg_menu_idx;
//Scanlines_INTENSITY = ++dg_menu_idx;
ds_grid_resize(dg_Scanlines, dg_menu_idx+1, ds_grid_height(dg_Scanlines));
dg_Scanlines[#dg_menu_idx,$0] = _x; // XL
dg_Scanlines[#dg_menu_idx,$1] = _y; // YT
dg_Scanlines[#dg_menu_idx,$2] = "EDIT"; // 
dg_Scanlines[#dg_menu_idx,$3] = _font_sprite;
dg_Scanlines[#dg_menu_idx,$4] = true; // option is available
dg_Scanlines[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Scanlines+"A"], 0.5); // current setting
//dg_Scanlines[#dg_menu_idx,$5] = 0.00; // current setting
//dg_Scanlines[#dg_menu_idx,$5] = 0.001; // current setting
//dg_Scanlines[#dg_menu_idx,$6] =-1.00; // min
dg_Scanlines[#dg_menu_idx,$6] = 0.00; // min
dg_Scanlines[#dg_menu_idx,$7] = 1.00; // max
dg_Scanlines[#dg_menu_idx,$8] = dg_Scanlines[#dg_menu_idx,$5]; // default
dg_Scanlines[#dg_menu_idx,$A] = string_format(dg_Scanlines[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Scanlines[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Scanlines_DEFAULT = ++dg_menu_idx;
ds_grid_resize(dg_Scanlines, dg_menu_idx+1, ds_grid_height(dg_Scanlines));
dg_Scanlines[#dg_menu_idx,$0] = _x; // XL
dg_Scanlines[#dg_menu_idx,$1] = _y; // YT
dg_Scanlines[#dg_menu_idx,$2] = "RESTORE DEFAULTS"; // 
dg_Scanlines[#dg_menu_idx,$3] = _font_sprite;
dg_Scanlines[#dg_menu_idx,$4] = true; // option is available
dg_Scanlines[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Scanlines[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Scanlines_BACK    = ++dg_menu_idx;
ds_grid_resize(dg_Scanlines, dg_menu_idx+1, ds_grid_height(dg_Scanlines));
dg_Scanlines[#dg_menu_idx,$0] = _x; // XL
dg_Scanlines[#dg_menu_idx,$1] = _y; // YT
dg_Scanlines[#dg_menu_idx,$2] = "BACK"; // 
dg_Scanlines[#dg_menu_idx,$3] = _font_sprite;
dg_Scanlines[#dg_menu_idx,$4] = true; // option is available
dg_Scanlines[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Scanlines[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Scanlines_cursor = 0;

for(_i=ds_grid_width(dg_Scanlines)-1; _i>=0; _i--)
{
    if(!dg_Scanlines[#_i,$B]) dg_Scanlines[#_i,$B] = PI_MENU1;
    _x  = dg_Scanlines[#_i,$0];
    _x += string_length(dg_Scanlines[#_i,$2])*sprite_get_width(dg_Scanlines[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}




// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL1;
_x  = _x1;
_font_sprite = Font1_SPRITE;

menu_focus_Bloom = ++_b;
dg_Main[#Main_BLOOM,$9] = _b;

dg_Bloom = ds_grid_create(0,_dg_HEIGHT);
                 dg_menu_idx=-1;
Bloom_ENABLE = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "STATE"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+STR_State], true); // current setting
//dg_Bloom[#dg_menu_idx,$5] = false; // current setting
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
if (dg_Bloom[#dg_menu_idx,$5]) dg_Bloom[#dg_menu_idx,$A] = "ON";  // value text
else                           dg_Bloom[#dg_menu_idx,$A] = "OFF"; // value text
dg_Main[#Main_BLOOM,$5] = dg_Bloom[#dg_menu_idx,$5];
dg_Main[#Main_BLOOM,$A] = dg_Bloom[#dg_menu_idx,$A];
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_A = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "A"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.1655); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0005; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0004; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_B = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "B"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.006); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0010; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0120; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_C = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "C"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.02); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0060; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0090; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_D = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "D"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.013); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0025; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.0075; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_E = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "E"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.44); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.3400; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.3000; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_F = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "F"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.51); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.6400; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.5000; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_G = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "G"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Bloom+dg_Bloom[#dg_menu_idx,$2]], 0.16); // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.2000; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.2600; // current setting
//dg_Bloom[#dg_menu_idx,$5] = 0.2500; // current setting
dg_Bloom[#dg_menu_idx,$6] = 0.00; // min
dg_Bloom[#dg_menu_idx,$7] = 1.00; // max
dg_Bloom[#dg_menu_idx,$8] = dg_Bloom[#dg_menu_idx,$5]; // default
dg_Bloom[#dg_menu_idx,$A] = string_format(dg_Bloom[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_DEFAULT = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "RESTORE DEFAULTS"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_BACK    = ++dg_menu_idx;
ds_grid_resize(dg_Bloom, dg_menu_idx+1, ds_grid_height(dg_Bloom));
dg_Bloom[#dg_menu_idx,$0] = _x; // XL
dg_Bloom[#dg_menu_idx,$1] = _y; // YT
dg_Bloom[#dg_menu_idx,$2] = "BACK"; // 
dg_Bloom[#dg_menu_idx,$3] = _font_sprite;
dg_Bloom[#dg_menu_idx,$4] = true; // option is available
dg_Bloom[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Bloom[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Bloom_cursor = 0;

for(_i=ds_grid_width(dg_Bloom)-1; _i>=0; _i--)
{
    if(!dg_Bloom[#_i,$B]) dg_Bloom[#_i,$B] = PI_MENU1;
    _x  = dg_Bloom[#_i,$0];
    _x += string_length(dg_Bloom[#_i,$2])*sprite_get_width(dg_Bloom[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}



// ++++++++++++++++++++++++++++++++++++++++++++++++
// ------------------------------------
_x1 = XL1;
_x  = _x1;
_font_sprite = Font1_SPRITE;

menu_focus_Blur = ++_b;
dg_Main[#Main_BLUR,$9] = _b;

dg_Blur = ds_grid_create(0,_dg_HEIGHT);
                 dg_menu_idx=-1;
Blur_ENABLE  = ++dg_menu_idx;
ds_grid_resize(dg_Blur, dg_menu_idx+1, ds_grid_height(dg_Blur));
dg_Blur[#dg_menu_idx,$0] = _x; // XL
dg_Blur[#dg_menu_idx,$1] = _y; // YT
dg_Blur[#dg_menu_idx,$2] = "STATE"; // 
dg_Blur[#dg_menu_idx,$3] = _font_sprite;
dg_Blur[#dg_menu_idx,$4] = true; // option is available
dg_Blur[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Blur+STR_State], true); // current setting
//dg_Blur[#dg_menu_idx,$5] = false; // current setting
dg_Blur[#dg_menu_idx,$8] = dg_Blur[#dg_menu_idx,$5]; // default
if (dg_Blur[#dg_menu_idx,$5]) dg_Blur[#dg_menu_idx,$A] = "ON";  // value text
else                          dg_Blur[#dg_menu_idx,$A] = "OFF"; // value text
dg_Main[#Main_BLUR,$5] = dg_Blur[#dg_menu_idx,$5];
dg_Main[#Main_BLUR,$A] = dg_Blur[#dg_menu_idx,$A];
_y += sprite_get_height(dg_Blur[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Blur_EDIT    = ++dg_menu_idx;
ds_grid_resize(dg_Blur, dg_menu_idx+1, ds_grid_height(dg_Blur));
dg_Blur[#dg_menu_idx,$0] = _x; // XL
dg_Blur[#dg_menu_idx,$1] = _y; // YT
dg_Blur[#dg_menu_idx,$2] = "EDIT"; // 
dg_Blur[#dg_menu_idx,$3] = _font_sprite;
dg_Blur[#dg_menu_idx,$4] = true; // option is available
//dg_Blur[#dg_menu_idx,$5] = 0.50; // current setting
dg_Blur[#dg_menu_idx,$5] = val(_UserPref_dm[?STR_Blur+"A"], 1.0); // current setting
//dg_Blur[#dg_menu_idx,$5] = 0.75; // current setting
dg_Blur[#dg_menu_idx,$6] = 0.00; // min
dg_Blur[#dg_menu_idx,$7] = 1.00; // max
dg_Blur[#dg_menu_idx,$8] = dg_Blur[#dg_menu_idx,$5]; // default
dg_Blur[#dg_menu_idx,$A] = string_format(dg_Blur[#dg_menu_idx,$5], 1,4); // value text
_y += sprite_get_height(dg_Blur[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Blur_DEFAULT = ++dg_menu_idx;
ds_grid_resize(dg_Blur, dg_menu_idx+1, ds_grid_height(dg_Blur));
dg_Blur[#dg_menu_idx,$0] = _x; // XL
dg_Blur[#dg_menu_idx,$1] = _y; // YT
dg_Blur[#dg_menu_idx,$2] = "RESTORE DEFAULTS"; // 
dg_Blur[#dg_menu_idx,$3] = _font_sprite;
dg_Blur[#dg_menu_idx,$4] = true; // option is available
dg_Blur[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Blur[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Blur_BACK    = ++dg_menu_idx;
ds_grid_resize(dg_Blur, dg_menu_idx+1, ds_grid_height(dg_Blur));
dg_Blur[#dg_menu_idx,$0] = _x; // XL
dg_Blur[#dg_menu_idx,$1] = _y; // YT
dg_Blur[#dg_menu_idx,$2] = "BACK"; // 
dg_Blur[#dg_menu_idx,$3] = _font_sprite;
dg_Blur[#dg_menu_idx,$4] = true; // option is available
dg_Blur[#dg_menu_idx,$A] = -1; // value text
_y += sprite_get_height(dg_Blur[#dg_menu_idx,$3])+LEADING1;
//                                                          //
Blur_cursor = 0;

for(_i=ds_grid_width(dg_Blur)-1; _i>=0; _i--)
{
    if(!dg_Blur[#_i,$B]) dg_Blur[#_i,$B] = PI_MENU1;
    _x  = dg_Blur[#_i,$0];
    _x += string_length(dg_Blur[#_i,$2])*sprite_get_width(dg_Blur[#_i,$3]);
    _values_xl = max(_values_xl, _x);
}



menu_state = menu_focus_Main;




// ========================================================================
// ------------------------------------------------------------------------
timer = 0;


Values_XR  = _values_xl;
Values_XR += $20; // padding
Values_XR += $8;  // for "-" character


pressed_start    = false;
pressed_select   = false;
pressed_a        = false;
pressed_b        = false;
pressed_right    = false;
pressed_left     = false;
pressed_down     = false;
pressed_up       = false;
pressed_confirm1 = false;
pressed_confirm2 = false;
pressed_backout  = false;
pressed_move_cursor_v = false; // vertical
pressed_move_cursor_h = false; // horizontal


DURATION0 = 4;
DURATION1 = 8;


SOUND_CONFIRM1 = get_audio_theme_track(dk_ChooseChar);         // snd_Choose_Char_1a
SOUND_CONFIRM2 = get_audio_theme_track(dk_ItemDrop);           // snd_Item_Drop_1a
SOUND_CURSOR1  = get_audio_theme_track(dk_CursorSpellMenu);    // snd_Cursor_Move_1a
SOUND_CURSOR2  = get_audio_theme_track(dk_CursorFileSelect);   // snd_Cursor_Move_2a
SOUND_CURSOR3  = get_audio_theme_track(dk_CursorRegisterName); // snd_Cursor_Move_3a
SOUND_BACK     = get_audio_theme_track(STR_Stab);              // snd_Sword_Stab_1a
SOUND_VOLUME   = 0.65;




ds_grid_destroy(dg_menu); dg_menu=undefined;
ds_map_destroy(_UserPref_dm); _UserPref_dm=undefined;




