/// update_view_1()


//var _DEBUG = keyboard_check_pressed(vk_f7);
var _pad   = 0;
var _diff  = 0;
var _dist0 = 0;

var                 _PC_DIR_BITS  = $0;
if (pc.x_change!=0) _PC_DIR_BITS |= $1<<(!pc.x_change_dir); // $1 or $2
if (pc.y_change!=0) _PC_DIR_BITS |= $4<<(!pc.y_change_dir); // $4 or $8




      view_at_rm_edge  = 0;
// D4FE: JSR 9925
// ----------------------------------------------------------------------------
// --------------  HORIZONTAL  -------------------------------------
if(!cam_xl_range())
{     view_at_rm_edge |= $3;  }
//if (_DEBUG) show_debug_message("update_view_1(). pc.x=$"+hex_str(pc.x)+" pc.x_change="+string(pc.x_change)+" pc.y_change="+string(pc.y_change)+" _PC_DIR_BITS=$"+hex_str(_PC_DIR_BITS)+", pc.x_change_dir="+string(pc.x_change_dir)+" pc.view_xl_dist="+string(pc.view_xl_dist)+", viewXL()=$"+hex_str(viewXL())+" cam_xl_min()=$"+hex_str(cam_xl_min())+", view_at_rm_edge=$"+hex_str(view_at_rm_edge)+" g.view_lock_rm=$"+hex_str(view_lock_rm)+" view_lock=$"+hex_str(view_lock));

if(!( view_at_rm_edge &  $3) 
&& !((view_lock       &  $3) & _PC_DIR_BITS) )
{
    _diff = 0;
    _pad  = 2; // stop cam if less than 4 pixels from edge
    
    // RIGHT ----------------------------
    if (cam_xr_max()-viewXR() <= _pad) // if view is close enough to its max
    {
        if (pc.x_change_dir            // pc moving right
        ||  pc.view_xl_dist>viewW_() ) // pc right of cam center
        {
            view_at_rm_edge |= $1; // $1 right
        }
    }
    
    // LEFT ----------------------------
    if (viewXL()-cam_xl_min() <= _pad)
    {
        if(!pc.x_change_dir            // pc moving left
        ||  pc.view_xl_dist<viewW_() ) // pc left of cam center
        {
            view_at_rm_edge |= $2; // $2 left
        }
    }
    
    
    
    if (use_smooth_cam_x 
    || !(view_at_rm_edge&$3) )
    {
        //if (_DEBUG) show_debug_message("update_view_1(). pc.x=$"+hex_str(pc.x)+" viewXC()=$"+hex_str(viewXC())+", abs(pc.x-viewXC())="+string(abs(pc.x-viewXC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,1,4));
        if ((global.ViewCatchUp_state&$1 && pc.x>viewXC()) 
        ||  (global.ViewCatchUp_state&$2 && pc.x<viewXC()) )
        {
            _dist0 = abs(pc.x-viewXC());
            global.ViewCatchUp_move_x += global.ViewCatchUp_SPEED_X * min((_dist0/global.ViewCatchUp_DIST1),1.00);
            _diff  = min(floor(global.ViewCatchUp_move_x), _dist0);
            _diff *= sign_(pc.x>viewXC());
            //show_debug_message("update_view_1(). viewXL()=$"+hex_str(viewXL())+" _dist0="+string(_dist0)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,4,4)+" frac(global.ViewCatchUp_move_x)="+string_format(frac(global.ViewCatchUp_move_x),4,4)+" _diff="+string(_diff));
            global.ViewCatchUp_move_x  = frac(global.ViewCatchUp_move_x);
        }
        else if(!global.ViewCatchUp_state)
        {
            _diff = update_view_1a(pc.x_change, use_smooth_cam_x, pc.x,viewXC());
        }
        
        if (_diff!=0)
        {
            var _viewXL = viewXL();
            var _XL = clamp(viewXL()+_diff, cam_xl_min(),cam_xl_max());
            set_camera_xy(_XL, viewYT());
            
            if (_viewXL!=viewXL()) view_dir_x = sign(viewXL()-_viewXL);
        }
        
        
        //if (_DEBUG) show_debug_message("update_view_1(). pc.x=$"+hex_str(pc.x)+" viewXC()=$"+hex_str(viewXC())+", abs(pc.x-viewXC())="+string(abs(pc.x-viewXC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,1,4));
        if (global.ViewCatchUp_state&$3)
        {
            if (pc.x==viewXC() 
            ||  viewXL()-cam_xl_min()<=_pad 
            ||  cam_xr_max()-viewXR()<=_pad )
            {
                     if (viewXL()-cam_xl_min()<=_pad) view_at_rm_edge |= $2; // $2 left
                else if (cam_xr_max()-viewXR()<=_pad) view_at_rm_edge |= $1; // $1 right
                
                if (global.ViewCatchUp_state&$1) global.ViewCatchUp_state ^= $1;
                if (global.ViewCatchUp_state&$2) global.ViewCatchUp_state ^= $2;
                global.ViewCatchUp_move_x = 0;
            }
        }
    }
}






// ----------------------------------------------------------------------------
// --------------  VERTICAL  -------------------------------------
if(!cam_yt_range())
{     view_at_rm_edge |= $C;  }
//if (_DEBUG) show_debug_message("update_view_1(). pc.x=$"+hex_str(pc.x)+" pc.x_change="+string(pc.x_change)+" pc.y_change="+string(pc.y_change)+" _PC_DIR_BITS=$"+hex_str(_PC_DIR_BITS)+", pc.y_change_dir="+string(pc.y_change_dir)+" pc.view_yt_dist="+string(pc.view_yt_dist)+", viewYT()=$"+hex_str(viewYT())+" cam_yt_min()=$"+hex_str(cam_yt_min())+", view_at_rm_edge=$"+hex_str(view_at_rm_edge)+" g.view_lock_rm=$"+hex_str(view_lock_rm)+" view_lock=$"+hex_str(view_lock));

if(!( view_at_rm_edge &  $C) 
&& !((view_lock       &  $C) & _PC_DIR_BITS) )
{
    _diff = 0;
    _pad  = 0;
    
    // DOWN ----------------------------
    if (cam_yb_max()-viewYB() <= _pad)
    {
        if (pc.y_change_dir            // pc moving down
        ||  pc.view_yt_dist>viewH_() ) // pc below view center
        {
            view_at_rm_edge |= $4; // $4 bottom
        }
    }
    
    // UP ----------------------------
    if (viewYT()-cam_yt_min() <= _pad)
    {
        if(!pc.y_change_dir            // pc moving up
        ||  pc.view_yt_dist<viewH_() ) // pc above view center
        {
            view_at_rm_edge |= $8; // $8 top
        }
    }
    
    
    if (use_smooth_cam_y 
    || !(view_at_rm_edge&$C) )
    {
        //if (_DEBUG) show_debug_message("update_view_1(). pc.y=$"+hex_str(pc.y)+" viewYC()=$"+hex_str(viewYC())+", abs(pc.y-viewYC())="+string(abs(pc.y-viewYC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_y="+string_format(global.ViewCatchUp_move_y,1,4));
        if ((global.ViewCatchUp_state&$4 && pc.y>viewYC()) 
        ||  (global.ViewCatchUp_state&$8 && pc.y<viewYC()) )
        {
            _dist0 = abs(pc.y-viewYC());
            global.ViewCatchUp_move_y += global.ViewCatchUp_SPEED_Y * min((_dist0/global.ViewCatchUp_DIST1),1.00);
            _diff  = min(floor(global.ViewCatchUp_move_y), _dist0);
            _diff *= sign_(pc.y>viewYC());
            global.ViewCatchUp_move_y  = frac(global.ViewCatchUp_move_y);
        }
        else if(!global.ViewCatchUp_state)
        {
            _diff = update_view_1a(pc.y_change, use_smooth_cam_y, pc.y,viewYC());
        }
        
        if (_diff!=0)
        {
            var _viewYT = viewYT();
            var _YT = clamp(viewYT()+_diff, cam_yt_min(),cam_yt_max());
            set_camera_xy(viewXL(), _YT);
            
            if (_viewYT!=viewYT()) view_dir_y = sign(viewYT()-_viewYT);
        }
        
        
        //if (_DEBUG) show_debug_message("update_view_1(). pc.y=$"+hex_str(pc.y)+" viewYC()=$"+hex_str(viewYC())+", abs(pc.y-viewYC())="+string(abs(pc.y-viewYC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_y="+string_format(global.ViewCatchUp_move_y,1,4));
        if (global.ViewCatchUp_state&$C)
        {
            if (pc.y==viewYC() 
            ||  viewYT()-cam_yt_min()<=_pad 
            ||  cam_yb_max()-viewYB()<=_pad )
            {
                     if (viewYT()-cam_yt_min()<=_pad) view_at_rm_edge |= $8; // $8 top
                else if (cam_yb_max()-viewYB()<=_pad) view_at_rm_edge |= $4; // $4 bottom
                
                if (global.ViewCatchUp_state&$4) global.ViewCatchUp_state ^= $4;
                if (global.ViewCatchUp_state&$8) global.ViewCatchUp_state ^= $8;
                global.ViewCatchUp_move_y = 0;
            }
        }
    }
}




update_view_og();


if (view_update_order==1)
{   // Added 2023/11/01 so that if a GO moves PC and 
    // update_Camera_1a() is called again after 
    // GO update, it doesn't cause a double cam move.
    pc.x_change=0;
    pc.y_change=0;
}




