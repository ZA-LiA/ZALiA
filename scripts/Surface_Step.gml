/// Surface_Step()


x = view_xview[0];
y = view_yview[0];


Window_w = window_get_width();
Window_h = window_get_height();
application_surface_w = surface_get_width( application_surface);
application_surface_h = surface_get_height(application_surface);


can_update_frame_ = can_update_frame();








if (can_update_frame_ 
&&  g.FallScene_timer<3 )
{
    if (g.ChangeRoom_timer>0 
    ||  is_exiting_rm() 
    ||  is_exiting_ow() )
    {   // Draw screen a solid color
        draw_clear_color = global.BackgroundColor_scene;
    }
}








if (can_update_frame_ 
&&  g.MaskWideView )
{
    // 0: Off
    // 1: Draw masks. Waiting for the start animation cue
    // 2: Draw and animate masks
    switch(g.MaskWideView)
    {
        case 1:{
        with(TitleScreen)
        {
            if(!(counter&$3) 
            &&  title_y>0 )
            {
                g.MaskWideView = 2; // 2: play animation
                break;//with(TitleScreen)
            }
        }
        break;}//case 1
        
        
        case 2:{ // 2: play animation
        g.MaskWideView_w = max(g.MaskWideView_w-.25, 0);
        break;}//case 2
    }//switch(g.MaskWideView)
    
    
    if (g.MaskWideView_w<=0)
    {
        g.MaskWideView = 0;
    }
}








ScreenShake_surf_xl = 0;
ScreenShake_surf_yt = 0;

if (can_update_frame_)
{
    if (g.ScreenShake_user_pref 
    &&  g.ScreenShake_timer )
    {
        g.ScreenShake_timer--;
        
        
        if (g.ScreenShake_strength_x)
        {   g.ScreenShake_xoff = (irandom(g.ScreenShake_strength_x-1)+1) * choose(1,-1);  }
        
        if (g.ScreenShake_strength_y)
        {   g.ScreenShake_yoff = (irandom(g.ScreenShake_strength_y-1)+1) * choose(1,-1);  }
        
        if (g.ScreenShake_xoff!=0 
        ||  g.ScreenShake_yoff!=0 )
        {
            if (global.application_surface_draw_enable_state)
            {
                ScreenShake_surf_xl = g.ScreenShake_xoff+viewXL();
                ScreenShake_surf_yt = g.ScreenShake_yoff+viewYT();
            }
            else
            {
                ScreenShake_surf_xl = g.ScreenShake_xoff*(application_surface_w div BASE_GAME_RESOLUTION_W);
                ScreenShake_surf_yt = g.ScreenShake_yoff*(application_surface_h div BASE_GAME_RESOLUTION_H);
            }
        }
    }
    else
    {
        g.ScreenShake_timer      = 0;
        g.ScreenShake_xoff       = 0;
        g.ScreenShake_yoff       = 0;
        g.ScreenShake_strength_x = 0;
        g.ScreenShake_strength_y = 0;
    }
}








can_draw_keys  = false;
can_draw_hints = false;
if (g.room_type=="A" 
&&  g.gui_state==g.gui_state_PAUSE 
&&  g.PAUSE_MENU.state&$3!=g.PAUSE_MENU.state_MAP )
{
    var _KEYS_REQUESTED = keyboard_check(vk_f4) || Input.GP_Other2_held; // GP_Face4_held, GP_Other2_held (xbox Y)
    var _HINT_REQUESTED = keyboard_check(vk_f3) || Input.GP_Other1_held; // GP_Face2_held, GP_Other1_held (xbox B)
    //var _KEYS_REQUESTED = keyboard_check(vk_f4) || Input.GP_Face4_held; // GP_Face4_held, GP_Other2_held (xbox Y)
    //var _HINT_REQUESTED = keyboard_check(vk_f3) || Input.GP_Face2_held; // GP_Face2_held, GP_Other1_held (xbox B)
    
    if (_KEYS_REQUESTED 
    && !_HINT_REQUESTED 
    &&  val(global.dm_save_file_settings[?STR_Randomize+STR_Key+STR_Locations]) )
    {
        can_draw_keys  = true;
    }
    
    
    if (_HINT_REQUESTED 
    && !_KEYS_REQUESTED 
    &&  global.RandoHints_enabled 
    &&  val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) )
    {
        can_draw_hints = true;
    }
}








if (global.RenderFrameDelay_timer)
{   global.RenderFrameDelay_timer--;  }




AppVersion_can_draw = keyboard_check(vk_f8);
if (AppVersion_can_draw)
{
    AppVersion_xl = viewXL()+8;
    AppVersion_yt = viewYT()+8;
}




RetroShaders_can_draw = false;
if (RetroShaders_CAN_USE)
{
    if (global.RetroShaders_enabled)
    {
        RetroShaders_can_draw =  (shd_SaturationBrightness_IS_COMPILED && (GEE.dg_Saturation[#GEE.Saturation_ENABLE,$5] || GEE.dg_Brightness[#GEE.Brightness_ENABLE,$5])) 
                             ||  (shd_ScanLines01_IS_COMPILED          &&  GEE.dg_Scanlines[# GEE.Scanlines_ENABLE, $5]) 
                             ||  (shd_Bloom01_IS_COMPILED              &&  GEE.dg_Bloom[#     GEE.Bloom_ENABLE,     $5]) 
                             ||  (shd_Blur01_IS_COMPILED               &&  GEE.dg_Blur[#      GEE.Blur_ENABLE,      $5]);
    }
    
    if (RetroShaders_can_draw)
    {
        RetroShaders_u_dist_x = 1.0/application_surface_w;
        RetroShaders_u_dist_y = 1.0/application_surface_h;
        RetroShaders_u_pixel_scale_x = Window_w/application_surface_w;
        RetroShaders_u_pixel_scale_y = Window_h/application_surface_h;
        
        RetroShaders_SaturationBrightness_can_draw = shd_SaturationBrightness_IS_COMPILED && (GEE.dg_Saturation[#GEE.Saturation_ENABLE,$5] || GEE.dg_Brightness[#GEE.Brightness_ENABLE,$5]);
        RetroShaders_Saturation_amount = GEE.dg_Saturation[#GEE.Saturation_EDIT,$5]*(GEE.dg_Saturation[#GEE.Saturation_ENABLE,$5]>0);
        RetroShaders_Brightness_amount = GEE.dg_Brightness[#GEE.Brightness_EDIT,$5]*(GEE.dg_Brightness[#GEE.Brightness_ENABLE,$5]>0);
        
        RetroShaders_Scanlines_can_draw = shd_ScanLines01_IS_COMPILED && GEE.dg_Scanlines[#GEE.Scanlines_ENABLE,$5];
        RetroShaders_Scanlines_line_height = max(1.0, global.RetroShaders_surface_scale/2.0);
        
        RetroShaders_Bloom_can_draw = shd_Bloom01_IS_COMPILED && GEE.dg_Bloom[#GEE.Bloom_ENABLE,$5];
        
        RetroShaders_Blur_can_draw = GEE.dg_Blur[#GEE.Blur_ENABLE,$5];
        //RetroShaders_Blur_can_draw &= (RetroShaders_Blur_VER==1 && shd_Blur01_IS_COMPILED) || (RetroShaders_Blur_VER==2 && shd_Blur02_IS_COMPILED);
    }
}




// Set the tile pal swap for this frame
color_tiles();




if (DEV) dev_tile_highlighting();




