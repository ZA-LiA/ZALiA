/// update_view_1()


//var _DEBUG = keyboard_check_pressed(vk_f7);
var _pad   = 0;
var _diff  = 0;
var _dist0 = 0;

var                        _PC_DIR_BITS  = $0;
if (global.pc.x_change!=0) _PC_DIR_BITS |= $1<<(!global.pc.x_change_dir); // $1 or $2
if (global.pc.y_change!=0) _PC_DIR_BITS |= $4<<(!global.pc.y_change_dir); // $4 or $8


view_at_rm_edge  = 0;




// D4FE: JSR 9925
// ----------------------------------------------------------------------------
// --------------  HORIZONTAL  -------------------------------------
if(!cam_xl_range())
{     view_at_rm_edge |= $3;  }
//if (_DEBUG) show_debug_message("update_view_1(). global.pc.x=$"+hex_str(global.pc.x)+" global.pc.x_change="+string(global.pc.x_change)+" global.pc.y_change="+string(global.pc.y_change)+" _PC_DIR_BITS=$"+hex_str(_PC_DIR_BITS)+", global.pc.x_change_dir="+string(global.pc.x_change_dir)+" global.pc.view_xl_dist="+string(global.pc.view_xl_dist)+", viewXL()=$"+hex_str(viewXL())+" cam_xl_min()=$"+hex_str(cam_xl_min())+", view_at_rm_edge=$"+hex_str(view_at_rm_edge)+" g.view_lock_rm=$"+hex_str(view_lock_rm)+" view_lock=$"+hex_str(view_lock));

if(!( view_at_rm_edge &  $3) 
&& !((view_lock       &  $3) & _PC_DIR_BITS) )
{
    _diff = 0;
    _pad  = 2; // stop cam if less than 4 pixels from edge
    
    // RIGHT ----------------------------
    if (cam_xr_max()-viewXR()<=_pad) // if view is close enough to its max
    {
        if (global.pc.x_change_dir            // global.pc moving right
        ||  global.pc.view_xl_dist>viewW_() ) // global.pc right of cam center
        {
            view_at_rm_edge |= $1; // $1 right
        }
    }
    
    // LEFT ----------------------------
    if (viewXL()-cam_xl_min()<=_pad)
    {
        if(!global.pc.x_change_dir            // global.pc moving left
        ||  global.pc.view_xl_dist<viewW_() ) // global.pc left of cam center
        {
            view_at_rm_edge |= $2; // $2 left
        }
    }
    
    
    
    
    if (use_smooth_cam_x 
    || !(view_at_rm_edge&$3) )
    {
        //if (_DEBUG) show_debug_message("update_view_1(). global.pc.x=$"+hex_str(global.pc.x)+" viewXC()=$"+hex_str(viewXC())+", abs(global.pc.x-viewXC())="+string(abs(global.pc.x-viewXC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,1,4));
        switch(global.ViewCatchUp_VER)
        {
            default:{
            _diff = update_view_1a(global.pc.x_change, use_smooth_cam_x, global.pc.x,viewXC());
            break;}//default
            
            
            case 1:{
            if ((global.ViewCatchUp_state&$1 && global.pc.x>viewXC()) 
            ||  (global.ViewCatchUp_state&$2 && global.pc.x<viewXC()) )
            {
                _dist0 = abs(global.pc.x-viewXC());
                global.ViewCatchUp_move_x += global.ViewCatchUp_SPEED_X * min((_dist0/global.ViewCatchUp_DIST1),1.00);
                _diff  = min(floor(global.ViewCatchUp_move_x), _dist0);
                _diff *= sign_(global.pc.x>viewXC());
                //show_debug_message("update_view_1(). viewXL()=$"+hex_str(viewXL())+" _dist0="+string(_dist0)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,4,4)+" frac(global.ViewCatchUp_move_x)="+string_format(frac(global.ViewCatchUp_move_x),4,4)+" _diff="+string(_diff));
                global.ViewCatchUp_move_x  = frac(global.ViewCatchUp_move_x);
            }
            else
            {
                _diff = update_view_1a(global.pc.x_change, use_smooth_cam_x, global.pc.x,viewXC());
            }
            break;}//case 1
            
            
            case 2:{
            if (global.ViewCatchUp_x_duration 
            &&  global.ViewCatchUp_x_duration>global.ViewCatchUp_x_time )
            {
                var _X = floor(ease_in_out(global.ViewCatchUp_x_start, global.ViewCatchUp_x_distance, global.ViewCatchUp_x_time, global.ViewCatchUp_x_duration));
                _diff = _X - viewXC();
                global.ViewCatchUp_x_time++;
                
                if (global.ViewCatchUp_x_time>=global.ViewCatchUp_x_duration)
                {
                    _diff = global.ViewCatchUp_x_end - viewXC();
                }
            }
            else
            {
                _diff = update_view_1a(global.pc.x_change, use_smooth_cam_x, global.pc.x,viewXC());
            }
            break;}//case 2
        }//switch(global.ViewCatchUp_VER)
        
        
        if (_diff!=0)
        {
            var _viewXL = viewXL();
            var _XL = clamp(viewXL()+_diff, cam_xl_min(),cam_xl_max());
            set_camera_xy(_XL, viewYT());
            
            if (_viewXL!=viewXL()) view_dir_x = sign(viewXL()-_viewXL);
        }
        
        
        //if (_DEBUG) show_debug_message("update_view_1(). global.pc.x=$"+hex_str(global.pc.x)+" viewXC()=$"+hex_str(viewXC())+", abs(global.pc.x-viewXC())="+string(abs(global.pc.x-viewXC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_x="+string_format(global.ViewCatchUp_move_x,1,4));
        switch(global.ViewCatchUp_VER)
        {
            case 1:{
            if (global.ViewCatchUp_state&$3)
            {
                if (global.pc.x==viewXC() 
                ||  viewXL()-cam_xl_min()<=_pad 
                ||  cam_xr_max()-viewXR()<=_pad )
                {
                         if (viewXL()-cam_xl_min()<=_pad) view_at_rm_edge |= $2; // $2 left
                    else if (cam_xr_max()-viewXR()<=_pad) view_at_rm_edge |= $1; // $1 right
                    
                    if (global.ViewCatchUp_state&$1) global.ViewCatchUp_state ^= $1;
                    if (global.ViewCatchUp_state&$2) global.ViewCatchUp_state ^= $2;
                    global.ViewCatchUp_move_x = 0;
                    
                    g.pc_lock = 0;
                }
            }
            break;}//case 1
            
            
            case 2:{
            if (global.ViewCatchUp_x_duration)
            {
                if (global.ViewCatchUp_x_duration<=global.ViewCatchUp_x_time 
                ||  global.pc.x==viewXC() 
                ||  viewXL()-cam_xl_min()<=_pad 
                ||  cam_xr_max()-viewXR()<=_pad )
                {
                         if (viewXL()-cam_xl_min()<=_pad) view_at_rm_edge |= $2; // $2 left
                    else if (cam_xr_max()-viewXR()<=_pad) view_at_rm_edge |= $1; // $1 right
                    
                    global.ViewCatchUp_x_start    = 0;
                    global.ViewCatchUp_x_end      = 0;
                    global.ViewCatchUp_x_distance = 0;
                    global.ViewCatchUp_x_time     = 0;
                    global.ViewCatchUp_x_duration = 0;
                    
                    g.pc_lock = 0;
                }
            }
            
            if(!global.ViewCatchUp_x_duration)
            {
                if (global.ViewCatchUp_state&$1) global.ViewCatchUp_state ^= $1;
                if (global.ViewCatchUp_state&$2) global.ViewCatchUp_state ^= $2;
            }
            break;}//case 2
        }//switch(global.ViewCatchUp_VER)
    }
}






// ----------------------------------------------------------------------------
// --------------  VERTICAL  -------------------------------------
if(!cam_yt_range())
{     view_at_rm_edge |= $C;  }
//if (_DEBUG) show_debug_message("update_view_1(). global.pc.x=$"+hex_str(global.pc.x)+" global.pc.x_change="+string(global.pc.x_change)+" global.pc.y_change="+string(global.pc.y_change)+" _PC_DIR_BITS=$"+hex_str(_PC_DIR_BITS)+", global.pc.y_change_dir="+string(global.pc.y_change_dir)+" global.pc.view_yt_dist="+string(global.pc.view_yt_dist)+", viewYT()=$"+hex_str(viewYT())+" cam_yt_min()=$"+hex_str(cam_yt_min())+", view_at_rm_edge=$"+hex_str(view_at_rm_edge)+" g.view_lock_rm=$"+hex_str(view_lock_rm)+" view_lock=$"+hex_str(view_lock));

if(!( view_at_rm_edge &  $C) 
&& !((view_lock       &  $C) & _PC_DIR_BITS) )
{
    _diff = 0;
    _pad  = 0;
    
    // DOWN ----------------------------
    if (cam_yb_max()-viewYB()<=_pad)
    {
        if (global.pc.y_change_dir            // global.pc moving down
        ||  global.pc.view_yt_dist>viewH_() ) // global.pc below view center
        {
            view_at_rm_edge |= $4; // $4 bottom
        }
    }
    
    // UP ----------------------------
    if (viewYT()-cam_yt_min()<=_pad)
    {
        if(!global.pc.y_change_dir            // global.pc moving up
        ||  global.pc.view_yt_dist<viewH_() ) // global.pc above view center
        {
            view_at_rm_edge |= $8; // $8 top
        }
    }
    
    
    
    
    if (use_smooth_cam_y 
    || !(view_at_rm_edge&$C) )
    {
        //if (_DEBUG) show_debug_message("update_view_1(). global.pc.y=$"+hex_str(global.pc.y)+" viewYC()=$"+hex_str(viewYC())+", abs(global.pc.y-viewYC())="+string(abs(global.pc.y-viewYC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_y="+string_format(global.ViewCatchUp_move_y,1,4));
        switch(global.ViewCatchUp_VER)
        {
            default:{
            _diff = update_view_1a(global.pc.y_change, use_smooth_cam_y, global.pc.y,viewYC());
            break;}//default
            
            
            case 1:{
            if ((global.ViewCatchUp_state&$4 && global.pc.y>viewYC()) 
            ||  (global.ViewCatchUp_state&$8 && global.pc.y<viewYC()) )
            {
                _dist0 = abs(global.pc.y-viewYC());
                global.ViewCatchUp_move_y += global.ViewCatchUp_SPEED_Y * min((_dist0/global.ViewCatchUp_DIST1),1.00);
                _diff  = min(floor(global.ViewCatchUp_move_y), _dist0);
                _diff *= sign_(global.pc.y>viewYC());
                global.ViewCatchUp_move_y  = frac(global.ViewCatchUp_move_y);
            }
            else
            {
                _diff = update_view_1a(global.pc.y_change, use_smooth_cam_y, global.pc.y,viewYC());
            }
            break;}//case 1
            
            
            case 2:{
            if (global.ViewCatchUp_y_duration 
            &&  global.ViewCatchUp_y_duration>global.ViewCatchUp_y_time )
            {
                var _Y = floor(ease_in_out(global.ViewCatchUp_y_start, global.ViewCatchUp_y_distance, global.ViewCatchUp_y_time, global.ViewCatchUp_y_duration));
                _diff = _Y - viewYC();
                global.ViewCatchUp_y_time++;
                
                if (global.ViewCatchUp_y_time>=global.ViewCatchUp_y_duration)
                {
                    _diff = global.ViewCatchUp_y_end - viewYC();
                }
            }
            else
            {
                _diff = update_view_1a(global.pc.y_change, use_smooth_cam_y, global.pc.y,viewYC());
            }
            break;}//case 2
        }//switch(global.ViewCatchUp_VER)
        
        
        if (_diff!=0)
        {
            var _viewYT = viewYT();
            var _YT = clamp(viewYT()+_diff, cam_yt_min(),cam_yt_max());
            set_camera_xy(viewXL(), _YT);
            
            if (_viewYT!=viewYT()) view_dir_y = sign(viewYT()-_viewYT);
        }
        
        
        //if (_DEBUG) show_debug_message("update_view_1(). global.pc.y=$"+hex_str(global.pc.y)+" viewYC()=$"+hex_str(viewYC())+", abs(global.pc.y-viewYC())="+string(abs(global.pc.y-viewYC()))+" _diff="+string(_diff)+" global.ViewCatchUp_move_y="+string_format(global.ViewCatchUp_move_y,1,4));
        switch(global.ViewCatchUp_VER)
        {
            case 1:{
            if (global.ViewCatchUp_state&$C)
            {
                if (global.pc.y==viewYC() 
                ||  viewYT()-cam_yt_min()<=_pad 
                ||  cam_yb_max()-viewYB()<=_pad )
                {
                         if (viewYT()-cam_yt_min()<=_pad) view_at_rm_edge |= $8; // $8 top
                    else if (cam_yb_max()-viewYB()<=_pad) view_at_rm_edge |= $4; // $4 bottom
                    
                    if (global.ViewCatchUp_state&$4) global.ViewCatchUp_state ^= $4;
                    if (global.ViewCatchUp_state&$8) global.ViewCatchUp_state ^= $8;
                    global.ViewCatchUp_move_y = 0;
                    
                    g.pc_lock = 0;
                }
            }
            break;}//case 1
            
            
            case 2:{
            if (global.ViewCatchUp_y_duration)
            {
                if (global.ViewCatchUp_y_duration<=global.ViewCatchUp_y_time 
                ||  global.pc.y==viewYC() 
                ||  viewYT()-cam_yt_min()<=_pad 
                ||  cam_yb_max()-viewYB()<=_pad )
                {
                         if (viewYT()-cam_yt_min()<=_pad) view_at_rm_edge |= $8; // $8 top
                    else if (cam_yb_max()-viewYB()<=_pad) view_at_rm_edge |= $4; // $4 bottom
                    
                    global.ViewCatchUp_y_start    = 0;
                    global.ViewCatchUp_y_end      = 0;
                    global.ViewCatchUp_y_distance = 0;
                    global.ViewCatchUp_y_time     = 0;
                    global.ViewCatchUp_y_duration = 0;
                    
                    g.pc_lock = 0;
                }
            }
            
            if(!global.ViewCatchUp_y_duration)
            {
                if (global.ViewCatchUp_state&$4) global.ViewCatchUp_state ^= $4;
                if (global.ViewCatchUp_state&$8) global.ViewCatchUp_state ^= $8;
            }
            break;}//case 2
        }//switch(global.ViewCatchUp_VER)
    }
}




update_view_og();


// Added 2023/11/01 so that if a GO moves PC and 
// update_Camera_1() is called again after 
// GO update, it doesn't cause a double cam move.
global.pc.x_change = 0;
global.pc.y_change = 0;




