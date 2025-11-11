/// update_Fireball2()


// AD94: JSR BEF6
if (ver==1   // Barba fireball normal
||  ver==3 ) // Barba fireball bounce off walls
{
    // Only Barba fireball makes sound.
    aud_play_fire(true);
    // Sound._00ED |= $40;
}


var _can_expl = false;

if (ver==3)
{
    if (timer)   timer--;
    _can_expl = !timer;
    
    if(!_can_expl)
    {
        var _EXTRA = 2;
        
        var _off = ((abs8b(hspd)>>4)+_EXTRA) * byte_dir(hspd);
        if (collisionProjCS(_off, 0))
        {
            hspd     = byte_negate(hspd);
            hspd_dir = byte_dir(   hspd);
        }
        
        
            _off = ((abs8b(vspd)>>4)+_EXTRA) * byte_dir(vspd);
        if (collisionProjCS(0, _off))
        {
            vspd     = byte_negate(vspd);
            //vspd_dir = byte_dir(vspd);
        }
    }
}
else
{
    _can_expl = collisionProjCS(0,0);
}


// pID 4: AD97, pID 8: 9BC8
if (_can_expl)
// if (ogY(id) >= $90 && collisionProjCS(8)) // OG
{
            disintegrate_counter=$F2; // Barba fireball
    switch(ver){
    case 1:{disintegrate_counter=$F2; break;} // ADA4. Barba
    case 2:{disintegrate_counter=$F4; break;} // 9BCD. Thunderbird
    case 3:{disintegrate_counter=$F2; break;} // 
    }
    
    state = state_EXPLODE;
}
else
{
    // pID 4: ADBF,  pID 8: 9C45, 9C48 
    Projectile_update_3a(despawn_offscreen_hor); // pID 1D: vspd_adj == 1;
    // Projectile_update_1a(pID != 8); // pID 4
    // Projectile_update_1a(pID != 7); // pID 8
}




