/// Stalfoon_update()

hspd_impel = 0;
/*
if (stun_timer)
{   // DE40
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/


// ------------------------------------------------------
// ------------------------------------------------------
// ------------------------------------------------------
if (cs&CS_BD1) enemy_collide_pc_body();

GO_update_cs();

// DE40
GOB_update_2();

facing_dir = dir_to_pc(id);
//if !(g.timer0&$3F) facing_dir = dir_to_pc(id);





if (hspd_pushback) hspd_impel = byte_dir(hspd_pushback);
GOB_update_1(true); // update hspdPB

GO_update_cs();

updateX();




switch (hover_type)
{
    case 1: { // Rebonack-like hover
        // var _Y_OFF = 1 + (hp <= (SPAWN_HP >>1));
        var                      _TIMING = 7;
        if (hp <= (SPAWN_HP>>1)) _TIMING = 3;
        
        if !(   g.counter1 &     _TIMING){
                                               var _Y_OFF=1;
            if (g.counter1 & $20) set_xlyt(id, xl, yt-_Y_OFF);
            else                  set_xlyt(id, xl, yt+_Y_OFF);
        }
    break;  }
    
    
    
    case 2: { // Ra wave
        // show_debug_message("vspd "+hex_str(vspd)+", vspd_add_dir "+string(vspd_add_dir)+", grav "+hex_str(grav));
        vspd = byte(vspd + vspd_add_dir);
        // vspd = byte(vspd + byte(1 * vspd_add_dir));
        // if (g.timer0 & 1) vspd = byte(vspd + byte(1 * vspd_add_dir));
        // vspd = byte(min(abs8b(vspd), VSPD_MAX) * sign8b(vspd));
        if (abs8b(vspd) == VSPD_MAX) vspd_add_dir *= -1;
        updateY();
    break;  }
} // switch





var _home_dir = sign(x - g.pc.x);

var _c1 = ocsH3(id);                // all w on screen 
var _c2 = ocsH1(id) && is_aggro;    // any w on screen & aggro last frame

// Much of this is similar to IronKnuckle behavior
if ((_c1 | _c2) 
&&  abs(spawn_y - g.pc.yt) <= 41 )
{
    is_aggro = true;
    
    var _dist = abs(x - g.pc.x);
        _c1   =  _dist <  $50 && g.pc.hspd_dir != facing_dir;  // back away from pc
        _c2   = (_dist >= $58 && g.pc.hspd_dir == facing_dir); // move torward   pc
    
    if (is_facing_pc_(id))
    {
        _c2 &= (abs(g.pc.hspd_impel) || _dist >= DIST_ATK);
        
        if ((_c1 || _c2) 
        &&  g.pc.hspd )
        // &&  !g.pc.ogr )
        {
            _c1 &= abs8b(hspd) < HSPD_MAX_AWAY;
            _c2 &= abs8b(hspd) < HSPD_MAX_TWRD;
            // _c2 &= abs8b(hspd) < g.pc.hspd;
            // _c1 &= g.pc.hspd_impel;
            
            if ((_c1 || _c2) 
            &&  abs8b(hspd) < abs8b(g.pc.hspd) )
            {
                hspd = byte(hspd +  g.pc.hspd_dir);
                hspd_impel =        g.pc.hspd_dir;
            }
            
            // hspd_impel = true;
        }
        
        
        
        
        if (_dist < DIST_ATK 
        &&  (!hspd || sign8b(hspd) == _home_dir) 
        &&  abs8b(hspd) <= HSPD_TO_HOME 
        && !hspd_impel )
        {
            // Move back toward home
            if (hspd < byte(HSPD_TO_HOME * _home_dir))
            {
                hspd = byte(hspd         + _home_dir);
                hspd_impel =               _home_dir;
            }
            
            // hspd_impel = true;
        }
    }
    
    
    
    
    
    
         counter = byte(counter+1);
    
    if !(counter & $3F)
    {
        // if facing pc & pc facing away(like Mario Boo behavior)
        if (_dist >= DIST_ATK - 8 
        &&  is_facing_pc_(id) 
        &&  g.pc.hspd_dir == facing_dir         // pc facing away from enemy
        &&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
        {
            // Create Bullet1, pID $10. PI_MOB3: blue
            GOC1_create(xl,yt, facing_dir, projectile,projectile_ver, id, global.PI_MOB_BLU); // 
            if (counter < $80) counter = $80 + $20; // 2nd Bullet fires on $C0
            else               counter = 0;         // After 2nd Bullet
        }
        else
        {
            counter &= $7F; // lose token for 2nd bullet
        }
    }
}
else
{
    if (is_aggro) // if was aggro last frame
    {
        // Start process for waiting to turn around
        counter |= 1;
        timer = DUR_PACE; // $50(80): about 1.33 sec
    }
    is_aggro = false;
    
    counter &= $7F; // lose token for 2nd bullet
    
    // 0: moving, 1: still, waiting to turn around
    if!(counter & 1) 
    {
        hspd = byte(HSPD_PACE * facing_dir);
        hspd_impel = facing_dir;
    }
    
    if(!timer)
    {
        if (counter & 1) facing_dir *= -1; // turn around
        timer = DUR_PACE; // $50(80): about 1.33 sec
        counter = byte(counter + 1);
    }
}




// Smooth stopping
if(!hspd_impel) 
{
        hspd = byte(hspd + -sign8b(hspd));
    
    // if (sign8b(hspd) != _home_dir 
    // &&  sign8b(hspd) == g.pc.hspdDir 
    // &&   abs8b(hspd) > abs8b(g.pc.hspd) )
    if (sign8b(hspd) != _home_dir 
    &&  abs8b(hspd) > abs8b(g.pc.hspd) )
    {
        hspd = byte(hspd + -sign8b(hspd));
    }
}




