/// SpikeBall1_update()


var _can_explode = !timer;
//
if(!_can_explode)
{
    var _EXTRA = 2;
    var _collided = false;
    var _off = ((abs8b(hspd)>>4)+_EXTRA) * byte_dir(hspd);
    if (collisionProjCS(_off,0) 
    || !pointInRect(x+_off,y, viewXL(),viewYT(),viewW(),viewH()) )
    //|| !point_in_rect(x+_off,y, viewXL(),viewYT(),viewW(),viewH()) )
    {
        hspd        = byte_negate(hspd);
        hspd_dir    = byte_dir(   hspd);
        _collided = true;
    }
    
    
        _off = ((abs8b(vspd)>>4)+_EXTRA) * byte_dir(vspd);
    if (collisionProjCS(0,_off) 
    || !pointInRect(x,y+_off, viewXL(),viewYT(),viewW(),viewH()) )
    //|| !point_in_rect(x,y+_off, viewXL(),viewYT(),viewW(),viewH()) )
    {
        vspd        = byte_negate(vspd);
        vspd_dir    = byte_dir(   vspd);
        _collided = true;
    }
    
    if (   _collided){
            collided_solid_counter++;
        if (collided_solid_counter>=$A){
            _can_explode=true;
        }
    }
}



if (_can_explode)
{
    disintegrate_counter = $F2;
    state = state_EXPLODE;
}
else
{
    Projectile_update_3a(despawn_offscreen_hor); // 
}




