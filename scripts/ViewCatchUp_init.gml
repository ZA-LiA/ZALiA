/// ViewCatchUp_init()


switch(global.ViewCatchUp_VER)
{
    case 1:{
    global.ViewCatchUp_state  = 0;
    global.ViewCatchUp_move_x = 0;
    global.ViewCatchUp_move_y = 0;
    
    if (global.pc.x!=viewXC())
    {
        if!(g.view_lock&$1) global.ViewCatchUp_state |= $1;
        if!(g.view_lock&$2) global.ViewCatchUp_state |= $2;
    }
    
    if (global.pc.y!=viewYC())
    {
        if!(g.view_lock&$4) global.ViewCatchUp_state |= $4;
        if!(g.view_lock&$8) global.ViewCatchUp_state |= $8;
    }
    break;}
    
    
    case 2:{
    if ((global.pc.x>viewXC() && !(g.view_lock&$1)) 
    ||  (global.pc.x<viewXC() && !(g.view_lock&$2)) )
    {
        if (global.pc.x>viewXC()) global.ViewCatchUp_state |= $1;
        else                      global.ViewCatchUp_state |= $2;
        
        global.ViewCatchUp_x_start    = viewXC();
        global.ViewCatchUp_x_end      = global.pc.x;
        global.ViewCatchUp_x_distance = global.ViewCatchUp_x_end - global.ViewCatchUp_x_start;
        global.ViewCatchUp_x_time     = 0;
        global.ViewCatchUp_x_duration = clamp(floor(abs(global.ViewCatchUp_x_distance)/global.ViewCatchUp_DIST2), global.ViewCatchUp_duration_MIN,global.ViewCatchUp_duration_MAX);
    }
    
    if ((global.pc.y>viewYC() && !(g.view_lock&$4)) 
    ||  (global.pc.y<viewYC() && !(g.view_lock&$8)) )
    {
        if (global.pc.y>viewYC()) global.ViewCatchUp_state |= $4;
        else                      global.ViewCatchUp_state |= $8;
        
        global.ViewCatchUp_y_start    = viewYC();
        global.ViewCatchUp_y_end      = global.pc.y;
        global.ViewCatchUp_y_distance = global.ViewCatchUp_y_end - global.ViewCatchUp_y_start;
        global.ViewCatchUp_y_time     = 0;
        global.ViewCatchUp_y_duration = clamp(floor(abs(global.ViewCatchUp_y_distance)/global.ViewCatchUp_DIST2), global.ViewCatchUp_duration_MIN,global.ViewCatchUp_duration_MAX);
    }
    break;}//case 2
}//switch(global.ViewCatchUp_VER)




