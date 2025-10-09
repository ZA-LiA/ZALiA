/// Magnot_update()


updateX();
updateY();


if (Idle_timer)
{   Idle_timer--;  }

if(!Idle_timer 
&& !hspd 
&& !vspd 
&&  ocsHV2(id) ) // if (at least 8 of width AND any height) are in ocs area
{
    if (auto_return_state)
    {
             if (move_dirs&$3) hspd = (speed1*sign_(global.pc.x-x)) &$FF;
        else if (move_dirs&$C) vspd = (speed1*sign_(global.pc.y-y)) &$FF;
    }
    else
    {
        trig_canDraw = true;
        if (global.pc.hspd 
        ||  global.pc.vspd )
        {
                 if (move_dirs&$3 && collide_pc_body(trig_hori_x,trig_hori_y,trig_hori_w,trig_hori_h)) hspd = (speed1*sign_(global.pc.x-x)) &$FF;
            else if (move_dirs&$C && collide_pc_body(trig_vert_x,trig_vert_y,trig_vert_w,trig_vert_h)) vspd = (speed1*sign_(global.pc.y-y)) &$FF;
        }
    }
}



GO_update_cs();

if (cs&$F)
{
    hspd = 0;
    vspd = 0;
    
    set_xlyt(id, round8(xl), round8(yt));
    GO_update_cs();
    update_trig_hb_1();
    
    auto_return_state = !auto_return_state;
    Idle_timer = Idle_DURATION1;
}


GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();


SpikeTrap_out_of_bounds(id);
/*
var                      _OFF = $08;
if (x <= cam_xl_min() + -_OFF 
||  x >= cam_xr_max() +  _OFF 
||  y <= cam_yt_min() + -_OFF 
||  y >= cam_yb_max() +  _OFF )
{
    despawn_gob(id);
    state = 0;
}
*/





