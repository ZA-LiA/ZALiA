/// OptionsMenu_Draw_DevTools(YT)


var _YT0 = argument[0];

var _i, _x,_y, _xl,_yt, _xl1,_yt1;
var _DIST1 = $4; // line spacing
var _pi;
var _text, _font, _font_w,_font_h;

var _dg_state_text = ds_grid_create(3,2);
    _dg_state_text[#0,0] = "OFF";
    _dg_state_text[#0,1] = "ON";
//                                          //
    _dg_state_text[#1,0] = "HIDE";
    _dg_state_text[#1,1] = "SHOW";
//                                          //
    _dg_state_text[#2,0] = "NO";
    _dg_state_text[#2,1] = "YES";
//                                          //


_yt1  = _YT0;
_yt1 += _DIST1; // pad




for(_i=0; _i<DevTools.COUNT; _i++)
{
    if(!OptionsMenu_option_is_avail(menu_state_DEV_TOOLS,_i))
    {
        continue;//_i
    }
    
    
    _text = DevTools_dg[#_i,0];
    _font = DevTools_dg[#_i,1];
    _font_w = sprite_get_width( _font);
    _font_h = sprite_get_height(_font);
    
    
    switch(_i){
    case DevTools.APP_PERFORMANCE:{_yt1+=_DIST1; break;} // extra spacing
    case DevTools.EXITS:          {_yt1+=_DIST1; break;} // extra spacing
    case DevTools.BACK:           {_yt1+=_DIST1; break;} // extra spacing
    }
    
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    if (_i==DevTools_cursor) _pi = PI_MENU1;
    else                     _pi = PI_MENU2;
    _xl = TextArea1_xl;
    draw_text_(_xl,_yt1, _text, _font, _pi);
    
    
    _text = 0;
    switch(_i){
    case DevTools.DEV_TOOLS_STATE:{_text=_dg_state_text[#0,sign(g.DevTools_state)]; break;}
    case DevTools.APP_PERFORMANCE:{_text=_dg_state_text[#1,sign(g.can_show_debug_overlay)]; break;}
    case DevTools.HITBOXES:       {_text=_dg_state_text[#1,sign(g.can_draw_hb)]; break;}
    case DevTools.SCP:            {_text=_dg_state_text[#1,sign(g.can_draw_cs)]; break;}
    case DevTools.XY:             {_text=_dg_state_text[#1,sign(g.canDraw_ogXY)]; break;}
    //case DevTools.OCS:            {_text=_dg_state_text[#1,sign(g.can_draw_ocs)]; break;}
    case DevTools.OG_CAM:         {_text=_dg_state_text[#1,sign(g.can_draw_og_cam_outline)]; break;}
    case DevTools.HP:             {_text=_dg_state_text[#1,sign(g.can_draw_hp)]; break;}
    case DevTools.SPRITE_OUTLINE: {_text=string(g.canDrawSprOutline); break;}
    case DevTools.FRAME_COUNT:    {_text=_dg_state_text[#1,sign(global.App_frame_count_can_draw)]; break;}
    //case DevTools.BGR_BLACK:      {_text=_dg_state_text[#0,sign(g.all_bg_black_only)]; break;}
    
    case DevTools.EXITS:          {_text=_dg_state_text[#1,sign(g.can_draw_Exit_hb)]; break;}
    case DevTools.SOLID_TILES:    {_text=_dg_state_text[#1,sign(g.can_show_t_solid)]; break;}
    case DevTools.UNIQUE_TILES:   {_text=_dg_state_text[#1,sign(g.can_show_t_unique)]; break;}
    case DevTools.DUNGEON_MAP:    {_text=_dg_state_text[#2,sign(g.dev_DungeonMapShowAll)]; break;}
    case DevTools.ADD_ITEMS:      {_text=_dg_state_text[#0,sign(g.use_StabToCheat)]; break;}
    case DevTools.PC_DASH:        {_text=_dg_state_text[#0,sign(g.DevDash_state)]; break;} // 0: Off, 1: On, 2: On and dash input held
    //case DevTools.INVULNERABILITY:{_text=string(g.dev_invState&$F); break;}
    }//switch(_i)
    
    if (_text!=0)
    {
        _xl  = TextArea2_xr;
        _xl -= string_length(_text) * _font_w;
        if (_i==DevTools_cursor)
        {
            _pi = PI_MENU1;
        }
        else
        {
            if (_text==_dg_state_text[#0,0] 
            ||  _text==_dg_state_text[#1,0] 
            ||  _text==_dg_state_text[#2,0] )
            {
                _pi = PI_DARK1;
            }
            else
            {
                _pi = PI_MENU2;
            }
        }
        draw_text_(_xl,_yt1, _text, _font, _pi);
    }
    
    
    
    if (_i==DevTools_cursor)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU1);
    }
    
    
    
    
    _yt1 += _font_h; // text yb
    _yt1 += _DIST1;  // line spacing
}




ds_grid_destroy(_dg_state_text); _dg_state_text=undefined;




