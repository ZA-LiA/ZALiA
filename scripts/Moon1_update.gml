/// Moon1_update()


var _x,_y;

if (CAM_LOCKED)
{
    _x  = viewXL() + X_OFF;
    _x += (room_width -viewXR()) div ADJUST_DIST;
    
    _y  = viewYT() + Y_OFF;
    _y += (room_height-viewYB()) div ADJUST_DIST;
    
    set_xy(id, _x,_y);
}
else
{
    _x  = X1;
    //_x -= $08<<3;
    //_x -= (room_width-viewXR()) div $40;
    
    _y  = Y1;
    //_y -= 
    
    set_xy(id, _x,_y);
}


can_draw_self = true;




