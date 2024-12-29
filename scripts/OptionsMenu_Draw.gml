/// OptionsMenu_Draw()


if(!draw_rows_count) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
var _i,_j, _idx, _val, _count, _color;
var _x,_y;
var _tsrc, _ts_x,_ts_y;
var _font, _font_w,_font_h, _pos, _len;
var _size, _lvl, _option_num;
var _text, _text2;
var _pi = PI_MENU;


var _ar_STATE_TEXT1=0;
    _ar_STATE_TEXT1[1]="ON";
    _ar_STATE_TEXT1[0]="OFF";
//
var _ar_STATE_TEXT2=0;
    _ar_STATE_TEXT2[1]="SHOW";
    _ar_STATE_TEXT2[0]="HIDE";
//
var _ar_STATE_TEXT3=0;
    _ar_STATE_TEXT3[1]="YES";
    _ar_STATE_TEXT3[0]="NO";
//



var _MenuWindow_W  = draw_clms_count<<3;
var _MenuWindow_H  = draw_rows_count<<3;
var _MenuWindow_YB = drawY+_MenuWindow_H;
/*
var _MenuWindow_ROWS = draw_rows_count;
var _MenuWindow_W  = draw_clms_count<<3;
var _MenuWindow_H  = _MenuWindow_ROWS<<3;
var _MenuWindow_YB = drawY+_MenuWindow_H;
if (_MenuWindow_YB>=viewYB()-$8)
{   // this is a cheap fix instead of revamping the system
    _val = $8|(drawY&$7);
    _MenuWindow_YB =viewYB()-$10;
    _MenuWindow_YB+=_val;
    _MenuWindow_H  = _MenuWindow_YB-drawY;
    _MenuWindow_ROWS = _MenuWindow_H>>3;
}
*/


var _Cursor_XL  = drawX;
    _Cursor_XL += $8; // window border
    _Cursor_XL += $4; // pad
    _Cursor_XL -= $2; // micro adjustment
//
//var _CURS_X = drawX + (XOFF_CURS<<3);
//var _TEXT_X = drawX + $10;
//var _TEXT_X = drawX + (XOFF_TEXT<<3);

var _TextArea1_XL  = _Cursor_XL;
    _TextArea1_XL += $8; // bottle sprite width
    _TextArea1_XL += $2; // pad
//
/*
var _TextArea1_XL  = drawX;
    _TextArea1_XL += $8; // window border
    _TextArea1_XL += $4; // pad
    _TextArea1_XL += $8; // bottle cursor width
//
*/

var _TextArea2_XR  = drawX+_MenuWindow_W;
    _TextArea2_XR -= $8; // window border
    _TextArea2_XR -= $4; // pad
//
var _TextArea2_XL  = _TextArea2_XR;
    _TextArea2_XL -= Font2_CHAR_SIZE*4; // dist of 4 chars
//
/*
var _TextArea2_XL  = drawX+_MenuWindow_W;
    _TextArea2_XL -= $8; // window border
    _TextArea2_XL -= $4; // pad
    _TextArea2_XL -= Font2_CHAR_SIZE*4; // 4 char text width
//
*/



// ----------------------------------------------------------------------------------
// Draw menu background
switch(3)
{
    default:{ // Draw menu background solid black
    draw_sprite_(spr_1x1_WHT,0, drawX,drawY, -1, _MenuWindow_W,_MenuWindow_H, c_black);
    break;}//default
    
    case 2:{ // Draw menu background with a texture to give a backdrop/contrast for pc skins using a lot of black
    for(_i=0; _i<draw_rows_count; _i++) // each row
    {
        for(_j=draw_clms_count-1; _j>=0; _j--) // 8x8. each column of the row
        {
            _ts_x = $D<<3;
            _ts_y = $F<<3;
            _x    = drawX+(_j<<3);
            _y    = drawY+(_i<<3);
            draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
    break;}//case 2
    
    case 3:{
    var _PAD = 2;
    draw_sprite_(spr_1x1_WHT,0, drawX+_PAD,drawY+_PAD, -1, _MenuWindow_W-(_PAD<<1),_MenuWindow_H-(_PAD<<1), c_black, 0.90);
    break;}
}//switch(background appearance)


// Draw menu frame
for(_i=0; _i<draw_rows_count; _i++) // each row
{
    for(_j=draw_clms_count-1; _j>=0; _j--) // 8x8. each column of the row
    {
        if (_i==0 
        ||  _i==draw_rows_max-1 
        ||  _j==0 
        ||  _j==draw_clms_count-1 )
        //||  _j==draw_clms_max-1 )
        {
                 if (inRange(_i,1,draw_rows_max-2))   _tsrc=g.dl_MenuFrame_TSRC[|1]; // 1: vertical bar
            else if (inRange(_j,1,draw_clms_count-2)) _tsrc=g.dl_MenuFrame_TSRC[|0]; // 0: horizontal bar
            else                                      _tsrc=g.dl_MenuFrame_TSRC[|2]; // 2: corner
            
            _ts_x = ((_tsrc>>0)&$F) <<3;
            _ts_y = ((_tsrc>>4)&$F) <<3;
            _x    = drawX+(_j<<3);
            _y    = drawY+(_i<<3);
            draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
        }
    }
}












// ----------------------------------------------------------------------------------
//_font = spr_Font3_1; // Testing fonts
_font = Font1;
_font_w = sprite_get_width( _font);
_font_h = sprite_get_height(_font);

pal_swap_set(p.palette_image, PI_MENU);
_y = drawY + (YOFF_HEAD*_font_h);
if (_y+_font_h < _MenuWindow_YB-$8)
//if (_y+_font_h < _MenuWindow_YB-$10)
{
    switch(Menu_in_focus){
    default:                  {_text="OPTIONS"; break;}
    case   Menu_INPUT_CONFIG: {_text=dg_MainOptions[#MainOption_INPUT_CONFIG,0]; break;}
    case   Menu_AUDIO_CUSTOM: {_text="CUSTOMIZE RANDOM AUDIO"; break;}
    case   Menu_DEV_TOOLS:    {_text=dg_MainOptions[#MainOption_DEV_TOOLS,0]; break;}
    case   Menu_RANDO_OPTIONS:{_text="RANDO OPTIONS"; break;} // pad
    }
    _text = "-"+_text+"-";
    _x  = drawX+(_MenuWindow_W>>1); // window xc
    _x -= (string_length(_text)*_font_w)>>1;
    draw_text_(_x,_y, _text, _font);
}
pal_swap_reset();

_y += _font_h; // bottom of head
switch(Menu_in_focus){
case Menu_MAIN:         {_y+=$6; break;} // pad
//case Menu_MAIN:        {_y+=$8; break;} // pad
case Menu_AUDIO_CUSTOM: {_y+=$8; break;} // pad
case Menu_INPUT_CONFIG: {_y+=$8; break;} // pad
case Menu_DEV_TOOLS:    {_y+=$4; break;} // pad
case Menu_RANDO_OPTIONS:{_y+=$4; break;} // pad
}










switch(Menu_in_focus)
{
    // =========================================================================
    // ------------------------------------------------------------------
    case Menu_MAIN:{
    //var _x1;
    var _y1 = _y;
    var _DIST1 = 4;
    var _DIST2 = 8;
    
    pal_swap_set(p.palette_image, PI_MENU);
    for(_i=0; _i<MainOption_COUNT; _i++)
    {
        if(!OptionsMenu_option_is_avail(Menu_MAIN,_i))
        {
            continue;//_i
        }
        
        
        _text = dg_MainOptions[#_i,0];
        _font = dg_MainOptions[#_i,1];
        _font_w = sprite_get_width( _font);
        _font_h = sprite_get_height(_font);
        
        
        
        _x = _TextArea1_XL;
        switch(_i){
        default:                     {_y1+=_DIST1; break;} // extra pad
        case MainOption_SND_VOL:     {_y1+=$0; break;} // extra pad
        case MainOption_MUS_VOL:     {_y1+=$0; break;} // extra pad
        //case MainOption_MUSIC_SET:   {_y1+=$3; break;} // extra pad
        case MainOption_MUSIC_SET:   {_y1+=_DIST1; break;} // extra pad
        case MainOption_INPUT_CONFIG:{_y1+=_DIST2; break;} // extra pad
        case MainOption_PC_SPRITES:  {_y1+=_DIST2; break;} // extra pad
        case MainOption_FULLSCREEN:  {_y1+=$0; break;} // extra pad
        //case MainOption_FLASHING:    {_y1+=$2C; break;} // extra pad
        case MainOption_CLOSE:       {_y1+=_DIST2; break;} // extra pad
        //case MainOption_CLOSE:       {_y1+=$C; break;} // extra pad
        }
        
        if (_y1+_font_h >= _MenuWindow_YB)
        {
            break;//_i
        }
        
        
        
        
        _pi = PI_MENU;
        
        if (_i==MainOption_SND_VOL 
        ||  _i==MainOption_MUS_VOL  )
        {
            if (_i==MainOption_SND_VOL) _lvl = Audio.snd_vol;
            else                        _lvl = Audio.mus_vol;
            
            _text += string_repeat("+",    _lvl);
            _text += string_repeat(".", 10-_lvl);
            _text += string_repeat(" ",  1+_lvl<10);
            _text += string(_lvl);
        }
        else if (_i==MainOption_MUSIC_SET)
        {
            _val = string_lettersdigits(string_upper(Audio.audio_set));
            _val = val(Audio.dm[?STR_Audio+STR_Set+STR_Creator+STR_Name+Audio.audio_set], _val);
            _text += ": "+_val;
            if (Audio.audio_set==dk_RandomCustom) _text += " (PRESS START)";
        }
        else if (_i==MainOption_FLASHING)
        {
            _x  = drawX+_MenuWindow_W; // window xr
            _x -= 8; // window border
            _x -= 4; // pad
            _x -= BackgroundFlash_W;
            
            _y  = _y1;       // text yt
            _y += _font_h>>1; // text yc
            _y -= BackgroundFlash_H>>1; // color box yt
            
            if(!p.BackgroundFlash_setting) _color = p.dg_color_seq[#0,g.counter0&$3];
            else                           _color = p.dl_BackgroundFlash_COLORS[|p.BackgroundFlash_setting];
            
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, BackgroundFlash_W,BackgroundFlash_H, _color);
        }
        else if (_i==MainOption_PC_SPRITES)
        {
            var _y2;
            var _PAD1 = 1; // player skin yt,yb pad
            var _DIST3 = (g.pc.Spritesheet_H>>1) - $8;
            
            _idx = val(g.pc.dm_skins[?STR_Current+STR_Idx]);
            _text += string(_idx+1)+"/"+string(val(g.pc.dm_skins[?STR_Set+STR_Count]));
            _text += ": " + val(g.pc.dm_skins[?hex_str(_idx)+STR_Name], STR_undefined);;
            _x = _TextArea1_XL;
            _y = _y1;
            draw_text_(_x,_y, _text, _font, PI_MENU);
            
            _text = "BY: ";
            _x  = _TextArea1_XL + (_DIST3<<1);
            _y  = _y1 + _font_h;
            _y += _DIST1;
            draw_text_(_x,_y, _text, _font, PI_MENU);
            
            _x += _font_w*string_length(_text);
            _text2 = val(g.pc.dm_skins[?hex_str(_idx)+STR_Creator], STR_undefined);
            _val = ", ";
            _len = string_length(_val);
            _j = string_count(",",_text2) + 1;
            while (_j)
            {
                _j--;
                _pos = string_pos(_val,_text2);
                if (_pos)
                {
                    _text  = string_copy(_text2, 1, _pos+(_len-1));
                    _text2 = strR(_text2, _pos+_len);
                }
                else
                {
                    _text  = _text2;
                }
                
                draw_text_(_x,_y, _text, _font, PI_MENU);
                _y += _font_h+2;
                
                if(!_pos) break;//while (_j)
            }
            
            _x = _TextArea1_XL + _DIST3;
            _y2  = _y1 + _font_h;
            _y2 += _DIST3;
            _y = _y2;
            if (_y+(g.pc.Spritesheet_H>>1) < _MenuWindow_YB)
            {
                draw_pc_skin(_x,_y, 1,1, g.pc.behavior_WALK1+PCSpriteWalk_frame, false, -1,-1, PI_PC_1,PI_PC_SWORD);
            }
            
            
            if (_i==MainOption)
            {
                _x = _Cursor_XL;
                _y = _y1;
                draw_spr_aligned(spr_menu_bottle_icon, _x,_y, -1,-1);
            }
            
            
            _y1 = _y2 + _DIST3;
            continue;//_i
        }
        else if (_i==MainOption_RANDO_OPTIONS)
        {
            if(!RandoOptionsMenu_is_available)
            {
                _pi = PI_DARK2;
            }
        }
        
        
        
        _x = _TextArea1_XL;
        _y = _y1;
        draw_text_(_x,_y, _text, _font, _pi);
        
        
        
        
        if (_i==MainOption_SND_VOL 
        ||  _i==MainOption_MUS_VOL  )
        {
            if (_lvl)
            {
                _x += string_length(dg_MainOptions[#_i,0])*_font_w;
                _y = _y1;
                repeat(_lvl)
                {
                    draw_rect(p.C_WHT1, _x+1,_y+1, _font_w-2,_font_h-2);
                    _x+=_font_w;
                }
            }
        }
        
        
        switch(_i)
        {
            case MainOption_FULLSCREEN:{
            if (window_get_fullscreen()) _text = "FULLSCREEN";
            else                         _text = "WINDOWED";
            _x  = _TextArea2_XR;
            _x -= string_length(_text)*_font_w;
            _y = _y1;
            draw_text_(_x,_y, _text, _font, PI_MENU);
            break;}
            
            
            case MainOption_APP_SCALE:{
            if(!window_get_fullscreen())
            {
                _text  = "x"+string(window_get_scale());
                _text += " ";
                _text += "("+string(window_get_width())+"x"+string(window_get_height())+")";
                _x  = _TextArea2_XR;
                _x -= string_length(_text)*_font_w;
                _y = _y1;
                draw_text_(_x,_y, _text, _font, PI_MENU);
            }
            break;}
        }
        
        
        
        
        _text2=0;
        switch(_i)
        {
            case MainOption_TORCH_LIGHTING:{
                switch(g.torch_lighting_method){
                default:{_text2="AUTO"; break;}
                case  0:{_text2="STAB"; break;}
                }
            break;}
            
            //case MainOption_HUD_STATE:         {_text2=_ar_STATE_TEXT1[sign(g.HUD_state)]; break;}
            //case MainOption_HUD_STATE:         {_text2=string(g.HUD_state); break;}
            //case MainOption_RENDER_DELAY:      {_text2=_ar_STATE_TEXT1[sign(g.RenderFrameDelay_state)]; break;}
            case MainOption_SCREEN_SHAKE:      {_text2=_ar_STATE_TEXT1[sign(g.ScreenShake_user_pref)]; break;}
            case MainOption_DIALOGUE_SPEED:    {_text2=string(g.mod_DLG_SPEED+1); break;}
            //case MainOption_SHOW_ACTIVE_SPELLS:{_text2=_ar_STATE_TEXT2[sign(g.mod_IndicateSpellActive)]; break;}
            case MainOption_STAB_FRENZY:       {_text2=_ar_STATE_TEXT1[sign(g.mod_StabFrenzy)]; break;}
            //case MainOption_CUCCO_PERMANANT:   {_text2=_ar_STATE_TEXT1[sign(g.CuccoSpell2_Option)]; break;}
            case MainOption_ANARKHYA_OW:       {_text2=_ar_STATE_TEXT1[sign(g.anarkhyaOverworld_use)]; break;}
            case MainOption_HALLOWEEN1:        {_text2=_ar_STATE_TEXT3[sign(global.Halloween1_enabled)]; break;}
        }
        
        if (_text2!=0)
        {
            _x = _TextArea2_XL;
            _y = _y1;
            
            if (_text2==_ar_STATE_TEXT1[0] 
            ||  _text2==_ar_STATE_TEXT2[0] 
            ||  _text2==_ar_STATE_TEXT3[0] )
            {    _pi = PI_DARK1;  }
            else _pi = PI_MENU;
            draw_text_(_x,_y, _text2, _font, _pi);
        }
        
        
        
        
        if (_i==MainOption)
        {
            _x = _Cursor_XL;
            _y = _y1;
            draw_spr_aligned(spr_menu_bottle_icon, _x,_y, -1,-1);
        }
        
        
        _y1 += _font_h; // text yb
    }
    pal_swap_reset();
    break;}//case Menu_MAIN
    
    
    
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case Menu_AUDIO_CUSTOM:{
    OptionsMenu_Draw_AudioCustom();
    break;}//case Menu_AUDIO_CUSTOM
    
    
    
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case Menu_INPUT_CONFIG:{
    _pi = PI_MENU;
    _y  = drawY+$20;
    
    for(_i=0; _i<InputConfigOption_COUNT; _i++)
    {
        _text = dg_InputConfigOptions[#_i,0];
        _font = dg_InputConfigOptions[#_i,1];
        _font_w = sprite_get_width( _font);
        _font_h = sprite_get_height(_font);
        
        _x = _TextArea1_XL;
        if (_i==InputConfigOption_DEFAULT) _y += $8; // extra pad
        
        if (_y+_font_h >= _MenuWindow_YB)
        {
            break;//_i
        }
        
        
        _text = dg_InputConfigOptions[#_i,0];
        
        if (InputConfigState==InputConfigState_EDITING 
        &&  _i!=InputConfigOption )
        {    _pi = PI_DARKLONK;  }
        else _pi = PI_MENU;
        
        draw_text_(_x,_y, _text, _font, _pi);
        
        
        if (_i < InputConfigOption_DEFAULT)
        {
            if (_font_w<8) _x  = _TextArea1_XL + ($10*_font_w);
            else           _x  = _TextArea1_XL + ($0C*_font_w);
            
            switch(_i){
            case InputConfigOption_RIGHT: {_val=Input.GP_right;  break;}
            case InputConfigOption_LEFT:  {_val=Input.GP_left;   break;}
            case InputConfigOption_DOWN:  {_val=Input.GP_down;   break;}
            case InputConfigOption_UP:    {_val=Input.GP_up;     break;}
            case InputConfigOption_MAGIC: {_val=Input.GP_magic;  break;}
            case InputConfigOption_PAUSE: {_val=Input.GP_pause;  break;}
            case InputConfigOption_ATTACK:{_val=Input.GP_attack; break;}
            case InputConfigOption_JUMP:  {_val=Input.GP_jump;   break;}
            }
            
            _text = val(Input.dm_GP_button_names[?string(_val)], "BUTTON");
            draw_text_(_x,_y, _text, _font, _pi);
        }
        
        
        
        if (_i==InputConfigOption)
        {
            _x = _Cursor_XL;
            draw_spr_aligned(spr_menu_bottle_icon, _x,_y, -1,-1, PI_MENU);
        }
        
        
        _y += _font_h;
        _y += _font_h; // extra pad
    }
    break;}//case Menu_INPUT_CONFIG
    
    
    
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case Menu_DEV_TOOLS:{
    for(_i=0; _i<DevTools_COUNT; _i++)
    {
        if(!OptionsMenu_option_is_avail(Menu_DEV_TOOLS,_i))
        {
            continue;//_i
        }
        
        
        _text = dg_DevTools[#_i,0];
        _font = dg_DevTools[#_i,1];
        _font_w = sprite_get_width( _font);
        _font_h = sprite_get_height(_font);
        
        _x = _TextArea1_XL;
        switch(_i){
        default:                      {_y+=$4; break;} // extra pad
        case DevTools_APP_PERFORMANCE:{_y+=$8; break;} // extra pad
        case DevTools_EXITS:          {_y+=$8; break;} // extra pad
        case DevTools_BACK:           {_y+=$8; break;} // extra pad
        }
        
        if (_y+_font_h >= _MenuWindow_YB)
        {
            break;//_i
        }
        
        
        
        draw_text_(_x,_y, _text, _font, PI_MENU);
        
        
        _text2=0;
        switch(_i){
        case DevTools_DEV_TOOLS_STATE:{_text2=_ar_STATE_TEXT1[sign(g.DevTools_state)]; break;}
        case DevTools_APP_PERFORMANCE:{_text2=_ar_STATE_TEXT2[sign(g.can_show_debug_overlay)]; break;}
        case DevTools_HITBOXES:       {_text2=_ar_STATE_TEXT2[sign(g.can_draw_hb)]; break;}
        case DevTools_SCP:            {_text2=_ar_STATE_TEXT2[sign(g.can_draw_cs)]; break;}
        case DevTools_XY:             {_text2=_ar_STATE_TEXT2[sign(g.canDraw_ogXY)]; break;}
        case DevTools_OCS:            {_text2=_ar_STATE_TEXT2[sign(g.can_draw_ocs)]; break;}
        case DevTools_OG_CAM:         {_text2=_ar_STATE_TEXT2[sign(g.can_draw_og_cam_outline)]; break;}
        case DevTools_HP:             {_text2=_ar_STATE_TEXT2[sign(g.can_draw_hp)]; break;}
        case DevTools_SPRITE_OUTLINE: {_text2=string(g.canDrawSprOutline); break;}
        case DevTools_FRAME_COUNT:    {_text2=_ar_STATE_TEXT2[sign(global.App_frame_count_can_draw)]; break;}
        case DevTools_BGR_BLACK:      {_text2=_ar_STATE_TEXT1[sign(g.all_bg_black_only)]; break;}
        
        case DevTools_EXITS:          {_text2=_ar_STATE_TEXT2[sign(g.can_draw_Exit_hb)]; break;}
        case DevTools_SOLID_TILES:    {_text2=_ar_STATE_TEXT1[sign(g.can_show_t_solid)]; break;}
        case DevTools_UNIQUE_TILES:   {_text2=_ar_STATE_TEXT1[sign(g.can_show_t_unique)]; break;}
        case DevTools_DUNGEON_MAP:    {_text2=_ar_STATE_TEXT1[sign(g.dev_DungeonMapShowAll)]; break;}
        case DevTools_ADD_ITEMS:      {_text2=_ar_STATE_TEXT1[sign(g.use_StabToCheat)]; break;}
        case DevTools_DOUBLE_JUMP:    {_text2=_ar_STATE_TEXT1[sign(g.DoubleJump_state)]; break;}
        //case DevTools_DOUBLE_JUMP:    {_text2=_ar_STATE_TEXT1[sign(f.items&ITM_FTHR)]; break;}
        case DevTools_PC_DASH:        {_text2=_ar_STATE_TEXT1[sign(g.DevDash_state)]; break;}
        case DevTools_INVULNERABILITY:{_text2=string(g.dev_invState&$F); break;}
        }//switch(_i)
        
        if (_text2!=0)
        {
            _x = _TextArea2_XL;
            
            if (_text2==_ar_STATE_TEXT1[0] 
            ||  _text2==_ar_STATE_TEXT2[0] )
            {    _pi = PI_DARK1;  }
            else _pi = PI_MENU;
            
            draw_text_(_x,_y, _text2, _font, _pi);
        }
        
        
        
        if (_i==DevTools_cursor)
        {
            _x = _Cursor_XL;
            draw_spr_aligned(spr_menu_bottle_icon, _x,_y, -1,-1);
        }
        
        
        
        _y += _font_h; // text yb
    }
    break;}//case Menu_DEV_TOOLS
    
    
    
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    case Menu_RANDO_OPTIONS:{
    //var _x1;
    var _y1 = _y;
    //var _text2;
    var _DIST1 = 4;
    var _option_is_avail = false;
    
    pal_swap_set(p.palette_image, PI_MENU);
    for(_i=0; _i<RandoOptions_COUNT; _i++)
    {
        //if(!OptionsMenu_option_is_avail(Menu_RANDO_OPTIONS,_i)) continue;//_i
        
        
        _text = dg_RandoOptions[#_i,0];
        _font = dg_RandoOptions[#_i,1];
        _font_w = sprite_get_width( _font);
        _font_h = sprite_get_height(_font);
        
        
        
        _y1 += _DIST1;
        if (_y1+_font_h >= _MenuWindow_YB)
        {
            break;//_i
        }
        
        
        
        _option_is_avail = OptionsMenu_option_is_avail(Menu_RANDO_OPTIONS,_i);
        
        _text2=0;
        switch(_i){
        case RandoOptions_MARK_ACQUIRED:   {if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(g.can_mark_acquired_item_locations)];} break;}
        case RandoOptions_MAPS_SHOW_KEYS:  {if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(g.RandoKeys_MAP_items_show_keys)];} break;}
        case RandoOptions_RANDO_ENEMY:     {if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(g.Rando_enemy)];} break;}
        case RandoOptions_RANDO_OW_TILES:  {if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(global.can_rando_ow_tsrc)];} break;}
        case RandoOptions_SCENES:          {if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(global.SceneRando_enabled)];} break;}
        case RandoOptions_RANDO_PALETTE:   {if (_option_is_avail){_text2=string(g.RandoPalette_state);} break;}
        case RandoOptions_MARK_HIDDEN_EXIT:{if (_option_is_avail){_text2=_ar_STATE_TEXT1[sign(g.hidden_item_exits_help)];} break;}
        }//switch(_i)
        
        if (_option_is_avail) _pi = PI_MENU;
        else                  _pi = PI_DARK2;
        
        _x = _TextArea1_XL;
        _y = _y1;
        draw_text_(_x,_y, _text, _font, _pi);
        
        if (_text2!=0)
        {
            _x = _TextArea2_XL;
            _y = _y1;
            
            _pi = PI_MENU;
            if (OptionsMenu_option_is_avail(Menu_RANDO_OPTIONS,_i))
            {
                if (_text2==_ar_STATE_TEXT1[0] 
                ||  _text2==_ar_STATE_TEXT2[0] )
                {
                    _pi = PI_DARK1;
                }
            }
            else
            {
                _pi = PI_DARK2;
            }
            
            draw_text_(_x,_y, _text2, _font, _pi);
        }
        
        
        
        
        if (_i==RandoOptions_cursor)
        {
            _x = _Cursor_XL;
            _y = _y1;
            draw_spr_aligned(spr_menu_bottle_icon, _x,_y, -1,-1);
        }
        
        
        _y1 += _font_h; // text yb
    }
    pal_swap_reset();
    break;}//case Menu_RANDO_OPTIONS
    
    
    
    
    
    
    
    // =========================================================================
    // ------------------------------------------------------------------
    default:{
    
    break;}//default
}//switch(Menu_in_focus)


//pal_swap_reset();








// ----------------------------------------------------------------
// ----------------------------------------------------------------
// ----------------------------------------------------------------
_ar_STATE_TEXT1 = 0;
_ar_STATE_TEXT2 = 0;

draw_rows_count = 0;



// ----------------------------------------------------------------------------------




