/// PlatformA_update()


x_prev = x;
y_prev = y;


GO_update_cam_vars();


update_cs_points_1();
GO_update_cs_1();


update_EF11();








// --------------------------------------------------------------------
switch(ver)
{
    // --------------------------------------------------------------------
    case 1:{ // ------------  PATH MOVEMENT ---------------------
    if (ds_grid_width(dg_path)<=1)
    {   // Only 1 location. Does not move.
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    if (timer)
    {
        timer--;
        if(!timer)
        {
            hspd_dir = sign(dg_path[#location_b,1]-dg_path[#location_a,1]);
            hspd     = (hspd1*hspd_dir)&$FF;
            
            vspd_dir = sign(dg_path[#location_b,2]-dg_path[#location_a,2]);
            vspd     = (vspd1*vspd_dir)&$FF;
        }
        else
        {
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    
    
    
    // --------------------------------------------------------------------
    if (hspd && !(cs&$3)) updateX();
    if (vspd && !(cs&$C)) updateY();
    
    
    update_cs_points_1();
    GO_update_cs_1();
    var _X_CS_COND = hspd && cs&$3 && bit_dir(cs&$3)==sign8b(hspd);
    var _Y_CS_COND = vspd && cs&$C && bit_dir(cs&$C)==sign8b(vspd);
    if (_X_CS_COND 
    ||  _Y_CS_COND )
    {
        var _x = x;
        var _y = y;
        if (_X_CS_COND) _x = (((xl>>3) + (hspd&$80&&xl&$7))<<3) + ww_;
        if (_Y_CS_COND) _y = (((yt>>3) + (vspd&$80&&yt&$7))<<3) + hh_;
        
        set_xy(id, _x,_y);
    }
    
    
    BodyHB_xl = x - (BodyHB_w>>1);
    BodyHB_yt = y - (BodyHB_h>>1);
    
    
    var  _X_DIST1 = (x-dg_path[#location_b,1]) * sign8b(hspd);
    var  _Y_DIST1 = (y-dg_path[#location_b,2]) * sign8b(vspd);
    if ((_X_DIST1>=0 || _X_CS_COND) 
    &&  (_Y_DIST1>=0 || _Y_CS_COND) )
    {
        if (_X_DIST1>=0) set_xy(id, dg_path[#location_b,1], y);
        if (_Y_DIST1>=0) set_xy(id, x, dg_path[#location_b,2]);
        
        location_a = location_b;
        
        if(!inRange(location_a+path_dir, 0,ds_grid_width(dg_path)-1))
        {
            path_dir = -path_dir;
            timer = DELAY1_DUR;
        }
        else
        {
            timer = DELAY2_DUR;
        }
        
        location_b = location_a + path_dir;
        
        hspd = 0;
        vspd = 0;
    }
    break;}//case 1:{
    
    
    
    
    
    
    
    // --------------------------------------------------------------------
    case 2:{ // --------------  CIRCULAR MOVEMENT  ----------------
    if (timer){timer--; break;}
    
    // --------------------------------------------------------------------
    if (path_dir!=0) // You can set spin_dir to 0 to stop all movement.
    {
                      angle += speed1 * -path_dir; // -path_dir: bc, in degrees, clockwise goes backwards.
        if (angle<=0) angle += 360;
        else          angle %= 360;
        
        set_xy_len_ang(id, dg_path[#location_a,1], dg_path[#location_a,2], radius, angle);
    }
    
    update_body_hb_1a();
    break;}//case 2:{
}//switch(ver)








// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
Platform_update_1a();
// --------------------------------------------------------------------
GO_update_cam_vars();
update_EF11();




/*
/// PlatformA_update()


x_prev = x;
y_prev = y;


GO_update_cam_vars();
GO_update_cs();
update_EF11();








// --------------------------------------------------------------------
switch(ver)
{
    // --------------------------------------------------------------------
    case 1:{ // ------------  PATH MOVEMENT ---------------------
    if (ds_grid_width(dg_path)<=1)
    {   // Only 1 location. Does not move.
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    if (timer)
    {
        timer--;
        if(!timer)
        {
            hspd_dir = sign(dg_path[#location_b,1]-dg_path[#location_a,1]);
            hspd     = (hspd1*hspd_dir)&$FF;
            
            vspd_dir = sign(dg_path[#location_b,2]-dg_path[#location_a,2]);
            vspd     = (vspd1*vspd_dir)&$FF;
        }
        else
        {
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    
    
    
    // --------------------------------------------------------------------
    if (hspd && !(cs&$3)) updateX();
    if (vspd && !(cs&$C)) updateY();
    
    
    update_body_hb_1a();
    
    
    if (((x-dg_path[#location_b,1]) * sign8b(hspd))>=0 
    &&  ((y-dg_path[#location_b,2]) * sign8b(vspd))>=0 )
    {
        set_xy(id, dg_path[#location_b,1], dg_path[#location_b,2]);
        
        location_a = location_b;
        
        if(!inRange(location_a+path_dir, 0,ds_grid_width(dg_path)-1))
        {
            path_dir = -path_dir;
            timer = DELAY1_DUR;
        }
        else
        {
            timer = DELAY2_DUR;
        }
        
        location_b = location_a + path_dir;
        
        hspd = 0;
        vspd = 0;
    }
    break;}//case 1:{
    
    
    
    
    
    
    
    // --------------------------------------------------------------------
    case 2:{ // --------------  CIRCULAR MOVEMENT  ----------------
    if (timer){timer--; break;}
    
    // --------------------------------------------------------------------
    if (path_dir!=0) // You can set spin_dir to 0 to stop all movement.
    {
                      angle += speed1 * -path_dir; // -path_dir: bc, in degrees, clockwise goes backwards.
        if (angle<=0) angle += 360;
        else          angle %= 360;
        
        set_xy_len_ang(id, dg_path[#location_a,1], dg_path[#location_a,2], radius, angle);
    }
    
    update_body_hb_1a();
    break;}//case 2:{
}//switch(ver)








// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
Platform_update_1a();
// --------------------------------------------------------------------
GO_update_cam_vars();
update_EF11();
*/
