/// Surface_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("Surface_Create() START");
}


depth = DEPTH_SURFACE;

x = 0
y = 0;



//WW = application_surface_W;
//HH = application_surface_H;
//ww = WW;
//hh = HH;

//WW = view_wport[0];
//HH = view_hport[0];
//ww = WW;
//hh = HH;
//surface_resize(application_surface, WW,HH);


//srf_view_W = WW<<1;
//srf_view_H = HH<<1;
//srf_view = -1;
//view_surface_id[0] = srf_view;


timer = 0;

can_update_frame_ = false;

ScreenShake_surf_xl = 0;
ScreenShake_surf_yt = 0;

application_surface_w = surface_get_width( application_surface);
application_surface_h = surface_get_height(application_surface);

srf_app_paused_frame = 0;




can_draw_hints = false;
can_draw_keys  = false;

AppVersion_can_draw = false;
AppVersion_TEXT     = "V-"+GM_version;;
AppVersion_xl       = 0;
AppVersion_yt       = 0;
AppVersion_PAD      = 1;


Window_w = window_get_width();
Window_h = window_get_height();



// draw_clear_color:  Will clear the screen right before 
// capturing an image of the application surface so 
// everything is a solid color.
// Must be set every frame as it will set itself to -1 
// after clearing the screen.
// -1 means will NOT call draw_clear()
draw_clear_color = p.C_BLK1; // First frame clear the screen with black


g.surf = id;




    RoomPreview_VER = 0;
if (RoomPreview_VER)
{
    RoomPreview_surf    = 0;
    //RoomPreview_state   = 0;
    RoomPreview_XL      = 0;
    RoomPreview_YT      = 0;
    RoomPreview_w       = PAGE_W;
    RoomPreview_h       = PAGE_H;
    RoomPreview_rm_name = RM_NAME_NPALACE;
    RoomPreview_KEY1    = vk_f2;
    RoomPreview_KEY2    = vk_f3;
}




//global.application_surface_draw_enable_STATE = true;
RetroShaders_can_draw = false;
RetroShaders_u_dist_x = 0.00;
RetroShaders_u_dist_y = 0.00;
RetroShaders_u_pixel_scale_x = 0.00;
RetroShaders_u_pixel_scale_y = 0.00;

RetroShaders_SaturationBrightness_can_draw = false;
RetroShaders_Saturation_amount = 0;
RetroShaders_Brightness_amount = 0;

RetroShaders_Scanlines_can_draw = false;
RetroShaders_Scanlines_line_height = 0;

RetroShaders_Bloom_can_draw = false;

RetroShaders_Blur_can_draw = false;
//RetroShaders_Blur_VER = 2;


shd_SaturationBrightness_IS_COMPILED = shader_is_compiled(shd_SaturationBrightness);
shd_ScanLines01_IS_COMPILED          = shader_is_compiled(shd_ScanLines01);
shd_Bloom01_IS_COMPILED              = shader_is_compiled(shd_Bloom01);
shd_Blur01_IS_COMPILED               = shader_is_compiled(shd_Blur01);

if (global.RetroShaders_IS_LIVE 
&&  shaders_are_supported() 
&&  (shd_SaturationBrightness_IS_COMPILED || shd_ScanLines01_IS_COMPILED || shd_Bloom01_IS_COMPILED || shd_Blur01_IS_COMPILED) )
{
    RetroShaders_CAN_USE = true;
    GEE = instance_create(0,0,GraphicsEffectsEditor);
}
else
{
    RetroShaders_CAN_USE = false;
}
/*
RetroShaders_CAN_USE  = false;
shd_SaturationBrightness_IS_COMPILED = false;
shd_ScanLines01_IS_COMPILED          = false;
shd_Bloom01_IS_COMPILED              = false;
shd_Blur01_IS_COMPILED               = false;

if (global.RetroShaders_IS_LIVE 
&&  shaders_are_supported() )
{
    shd_SaturationBrightness_IS_COMPILED = shader_is_compiled(shd_SaturationBrightness);
    shd_ScanLines01_IS_COMPILED          = shader_is_compiled(shd_ScanLines01);
    shd_Bloom01_IS_COMPILED              = shader_is_compiled(shd_Bloom01);
    shd_Blur01_IS_COMPILED               = shader_is_compiled(shd_Blur01);
    
    if (shd_SaturationBrightness_IS_COMPILED 
    ||  shd_ScanLines01_IS_COMPILED 
    ||  shd_Bloom01_IS_COMPILED 
    ||  shd_Blur01_IS_COMPILED )
    {
        RetroShaders_CAN_USE = true;
        GEE = instance_create(0,0,GraphicsEffectsEditor);
    }
}
*/




/*
var _VAL1=$80000000;
var _VAL2=$800;
testval1=_VAL1-_VAL2;
testval2=_VAL1+_VAL2;
//testval1=-1024;
//testval2=-testval1;
//teststr1=undefined;
*/




if (DEV)
{
    show_debug_message("Surface_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




