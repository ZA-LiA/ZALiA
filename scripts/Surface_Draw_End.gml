/// Surface_Draw_End()


if (can_update_frame_)
{
    if (draw_clear_color!=-1)
    {
        // clear the entire screen with any color
        draw_clear(draw_clear_color);
        draw_clear_color = -1;
    }
    else
    {
        if (g.FallScene_timer>2)
        {
            draw_falling_scene();
        }
        
        
        
        
        if (g.MaskWideView 
        &&  g.MaskWideView_w>0 )
        {
            draw_sprite_(spr_1x1_WHT,0, viewXL(),                 viewYT(), -1, g.MaskWideView_w,viewH(), p.C_BLK1);
            draw_sprite_(spr_1x1_WHT,0, viewXR()-g.MaskWideView_w,viewYT(), -1, g.MaskWideView_w,viewH(), p.C_BLK1);
        }
        
        
        
        
        // Screenshake
        if (ScreenShake_surf_xl!=0 
        ||  ScreenShake_surf_yt!=0 )
        {
            var          _SURF = surface_create(application_surface_w,application_surface_h);
            surface_copy(_SURF, 0,0, application_surface);
            
            if (global.application_surface_draw_enable_state)
            {
                draw_clear_alpha(c_black,0);
                draw_surface(_SURF, ScreenShake_surf_xl,ScreenShake_surf_yt);
            }
            else
            {
                surface_set_target(_SURF);
                draw_clear_alpha(c_black,0);
                draw_surface(application_surface, ScreenShake_surf_xl,ScreenShake_surf_yt);
                surface_reset_target();
                surface_copy(application_surface, 0,0, _SURF);
            }
            
            surface_free(_SURF);
        }
    }
}








// srf_app_paused_frame: Save a copy of a frame for when pausing the app.
if (can_update_frame_)
{
    if(!surface_exists(srf_app_paused_frame)) srf_app_paused_frame = surface_create(application_surface_w,application_surface_h);
    surface_copy(srf_app_paused_frame, 0,0, application_surface);
}
else if (surface_exists(srf_app_paused_frame))
{
    surface_copy(application_surface, 0,0, srf_app_paused_frame);
}









// GUI -------------------------------------------------------------
// ---------------------------------------------------------
// Rando Key Stats
if (can_draw_keys) draw_key_stats();
// Rando Hints
if (can_draw_hints) draw_rando_hints();


if (g.dev_invState&$FF8)
{   // Invulnerability(dev only) State
    dev_draw_invState();
}

if (global.RenderFrameDelay_state 
&&  global.RenderFrameDelay_timer )
{   // Draw the state of the Frame Delay option
    draw_RenderFrameDelay_state();
}

// Draw the App Paused Icon
dev_draw_app_paused_icon();
//debug_draw_data();

// Draw app frame count
dev_draw_app_frame_count();

// Draw the app version
if (AppVersion_can_draw)
{
    draw_sprite_(spr_1x1_WHT,0, AppVersion_xl,AppVersion_yt, -1, (string_length(AppVersion_TEXT)<<8)+(AppVersion_PAD<<1), 8+(AppVersion_PAD<<1), c_black);
    draw_text_(AppVersion_xl+AppVersion_PAD, AppVersion_yt+AppVersion_PAD, AppVersion_TEXT);
}








// ------------------------------------------------------------------------------------
//can_update_frame_ = can_update_frame();








// Trying to set up a system to flip through previews of rooms
//preview_scene();




/* // Convert 1024x1024 spritesheet images to smaller images. Getting rid of unused rows.
if (keyboard_check_pressed(vk_f7))
{
    var _i,_j,_k, _idx, _dk;
    var _xl1,_yt1, _xl2,_yt2;
    var _creator_name, _char_name;
    var _spritesheet1,_spritesheet2;
    var _color1, _palette;
    var _pos, _str;
    var _COLOR1 = c_fuchsia;
    var _COUNT1 = val(g.pc.dm_spritesheets[?STR_Set+STR_Count]);
    var _FRAME_W1 = $40;
    var _FRAME_H1 = $40;
    var _dl_rows = ds_list_create();
    ds_list_add(_dl_rows,$0,$1,$2,$3,$5,$6,$7,$8,$9,$E);
    var _COUNT2 = ds_list_size(_dl_rows);
    var _SURF_W = _FRAME_W1*$10;
    var _SURF_H = _FRAME_H1*_COUNT2;
    var _ss_surf = surface_create(_SURF_W,_SURF_H);
    
    for(_i=0; _i<1; _i++)
    //for(_i=1; _i<_COUNT1; _i++)
    {
        _dk =       val(g.pc.dm_spritesheets[?hex_str(_i)+STR_Datakey], STR_undefined);
        _spritesheet1 = g.pc.dm_spritesheets[?_dk+STR_Sprite];
        if (is_undefined(_spritesheet1)) continue;//_i
        
        _creator_name = val(g.pc.dm_spritesheets[?hex_str(_i)+STR_Creator], STR_undefined);
        _creator_name = string_lettersdigits(_creator_name);
        _char_name    = val(g.pc.dm_spritesheets[?hex_str(_i)+STR_Name],    STR_undefined);
        _char_name    = string_lettersdigits(_char_name);
        
        _palette      = g.pc.dm_spritesheets[?_dk+STR_Palette];
        
        surface_set_target(_ss_surf);
        draw_clear_alpha(c_black,0);
        
        for(_j=0; _j<_COUNT2; _j++)
        {
            _yt1 = _FRAME_H1 * _dl_rows[|_j];
            _yt2 = _FRAME_H1 * _j;
            for(_k=0; _k<$10; _k++)
            {
                _xl1 = _FRAME_W1 * _k;
                _xl2 = _xl1;
                
                draw_sprite_part_(_spritesheet1,0, _xl1,_yt1, _FRAME_W1,_FRAME_H1, _xl2,_yt2);
                if (_dl_rows[|_j]==$2) draw_sprite_part_(_spritesheet1,0, _xl1,_FRAME_H1*$4, _FRAME_W1,_FRAME_H1, _xl2,_yt2);
                //if(!_j && _k==$F)      draw_sprite_part_(_spritesheet1,0, _xl1,_FRAME_H1*$F, _FRAME_W1,_FRAME_H1, _xl2,_yt2);
            }
        }
        
        if(!is_undefined(_palette))
        {
            _xl1 = _SURF_W - _FRAME_W1;
            _yt1 = _SURF_H - _FRAME_H1;
            for(_j=0; _j<3; _j++)
            {
                _yt2 = _yt1 + (3*_j);
                for(_k=0; _k<3; _k++)
                {
                    _pos  = _j * (COL_PER_PAL<<1);
                    _pos += 2;
                    _pos += _k<<1;
                    _pos += 1; // because string
                    _idx = string_copy(_palette, _pos, 2);
                    _idx = str_hex(_idx);
                    _color1 = p.dl_COLOR[|_idx];
                    
                    _xl2 = _xl1 + (2*_k);
                    draw_sprite_(spr_1x1_WHT,0, _xl2,_yt2, -1, 2,2, _color1);
                }
            }
        }
        
        draw_point_colour(        0,        0, _COLOR1);
        draw_point_colour(_SURF_W-1,        0, _COLOR1);
        draw_point_colour(        0,_SURF_H-1, _COLOR1);
        draw_point_colour(_SURF_W-1,_SURF_H-1, _COLOR1);
        
        _spritesheet2 = sprite_create_from_surface(_ss_surf, 0,0,_SURF_W,_SURF_H, false,false,0,0);
        surface_reset_target();
        _str = string(_i);
        if (_i<10) _str = "0"+_str;
        sprite_save(_spritesheet2, 0, "PCSpritesheet_"+_str+"_"+_char_name+".png");
        //sprite_save(_spritesheet2, 0, "PCSpritesheet_"+hex_str(_i)+"_"+_char_name+".png");
        //sprite_save(_spritesheet2, 0, "PCSpritesheet_"+_creator_name+"_"+_char_name+".png");
        sprite_delete(_spritesheet2);
    }
    
    surface_reset_target();
    surface_free(_ss_surf);
    ds_list_destroy(_dl_rows); _dl_rows=undefined;
}
*/




