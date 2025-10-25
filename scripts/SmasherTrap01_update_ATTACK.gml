/// SmasherTrap01_update_ATTACK()


///*
var _i,_j, _x,_y, _count;
var _X_PREV = x;
var _Y_PREV = y;
var _collided_solid = false;
var _progress = 0;
var _x_change = 0;
var _y_change = 0;




// ------------------------------------------------------------------------------------
// x movement -----------------------------------------------------------
if (attack_x_direction!=0)
{
    var _HEAD_X_PREV = attack_x_head_x;
    
    _progress = min(1.0, attack_x_time/attack_x_ACCEL_TIME);
    attack_x_speed = attack_x_speed_MAX * (_progress*_progress*_progress);
    attack_x_head_x += floor(attack_x_speed) * attack_x_direction;
    attack_x_time++;
    
    set_xy(id, attack_x_head_x+(ww_*-attack_x_direction), y);
    
    _x_change = attack_x_head_x - _HEAD_X_PREV;
    //if (update_idx==0) show_debug_message("SmasherTrap01_update_ATTACK(). "+" attack_x_speed_current="+string_format(attack_x_speed_current,4,16)+" _progress="+string_format(_progress,4,16)+" attack_x_time="+string(attack_x_time));
    
    if (_x_change!=0)
    {
        if(!_collided_solid)
        {
            _count = max(2,abs(_x_change)>>3);
            for(_i=0; _i<_count; _i++)
            {
                _x = _HEAD_X_PREV + ((_i<<3)*attack_x_direction);
                _x = clamp(_x, min(_HEAD_X_PREV,attack_x_head_x), max(_HEAD_X_PREV,attack_x_head_x));
                for(_j=0; _j<hh>>3; _j++)
                {
                    if (collide_solid_grid(_x+attack_x_direction, yt+(_j<<3)))
                    {
                        _collided_solid = true;
                        _x += ww_ * -attack_x_direction;
                        _x  = (_x>>3)<<3;
                        set_xy(id, _x,y);
                        _i=_count; break;//_j
                    }
                }
            }
        }
        
        
        if(!_collided_solid)
        {
            with(SmasherTrap01)
            {
                if (id!=other 
                &&  rectInRect(xl,yt,ww,hh, other.attack_x_head_x+other.attack_x_direction,other.yt,max(1,abs(_x_change)),other.hh) )
                {
                    _collided_solid = true;
                    _x  = x +  (ww_*-other.attack_x_direction);
                    _x += other.ww_*-other.attack_x_direction;
                    set_xy(other, _x, other.y);
                    break;//with(SmasherTrap01)
                }
            }
        }
    }
    
    
    attack_x_head_x = x + (ww_*attack_x_direction);
    _x_change = attack_x_head_x - _HEAD_X_PREV;
    if (_x_change!=0)
    {
        hspd = abs(_x_change)<<4;
        hspd = (hspd*attack_x_direction)&$FF;
    }
}




// ------------------------------------------------------------------------------------
// y movement -----------------------------------------------------------
if (attack_y_direction!=0)
{
    var _HEAD_Y_PREV = attack_y_head_y;
    
    _progress = min(1.0, attack_y_time/attack_y_ACCEL_TIME);
    attack_y_speed = attack_y_speed_MAX * (_progress*_progress*_progress);
    attack_y_head_y += floor(attack_y_speed) * attack_y_direction;
    attack_y_time++;
    
    set_xy(id, x, attack_y_head_y+(hh_*-attack_y_direction));
    
    
    _y_change = attack_y_head_y - _HEAD_Y_PREV;
    
    
    if (_y_change!=0)
    {
        if(!_collided_solid)
        {
            _count = max(2,abs(_y_change)>>3);
            for(_i=0; _i<_count; _i++)
            {
                _y = _HEAD_Y_PREV + ((_i<<3)*attack_y_direction);
                _y = clamp(_y, min(_HEAD_Y_PREV,attack_y_head_y), max(_HEAD_Y_PREV,attack_y_head_y));
                for(_j=0; _j<ww>>3; _j++)
                {
                    if (collide_solid_grid(xl+(_j<<3), _y+attack_y_direction))
                    {
                        _collided_solid = true;
                        _y += hh_ * -attack_y_direction;
                        _y  = (_y>>3)<<3;
                        set_xy(id, x,_y);
                        _i=_count; break;//_j
                    }
                }
            }
        }
        
        
        if(!_collided_solid)
        {
            with(SmasherTrap01)
            {
                if (id!=other 
                &&  rectInRect(xl,yt,ww,hh, other.xl,other.attack_y_head_y+other.attack_y_direction,other.ww,max(1,abs(_y_change))) )
                {
                    _collided_solid = true;
                    _y  = y +  (hh_*-other.attack_y_direction);
                    _y += other.hh_*-other.attack_y_direction;
                    set_xy(other, other.x, _y);
                    break;//with(SmasherTrap01)
                }
            }
        }
    }
    
    
    attack_y_head_y = y + (hh_*attack_y_direction);
    _y_change = attack_y_head_y - _HEAD_Y_PREV;
    if (_y_change!=0)
    {
        vspd = abs(_y_change)<<4;
        vspd = (vspd*attack_y_direction)&$FF;
    }
}




if(!rectInRect(xl,yt,ww,hh, 0,0,g.rm_w,g.rm_h))
{
    instance_destroy();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ------------------------------------------------------------------------------------
// PC interaction --------------------------------------------------------------
update_body_hb();

if (_x_change!=0 
&&  hINh(global.pc.csLft1Y,global.pc.csLft2Y-global.pc.csLft1Y, BodyHB_yt,BodyHB_h) )
{
    var _pc_x_change = 0;
    with(global.pc) updateCSPoints();
    
    if (_x_change)
    {
        if (pointInRect(global.pc.csLft1X,global.pc.csLft1Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) 
        ||  pointInRect(global.pc.csLft2X,global.pc.csLft2Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
        {
            _pc_x_change = attack_x_head_x - global.pc.csLft1X;
        }
    }
    else
    {
        if (pointInRect(global.pc.csRgt1X,global.pc.csRgt1Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) 
        ||  pointInRect(global.pc.csRgt2X,global.pc.csRgt2Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
        {
            _pc_x_change = attack_x_head_x - global.pc.csRgt1X;
        }
    }
    
    if (_pc_x_change!=0)
    {
        with(global.pc) set_xy(id, x+_pc_x_change, y); // push PC
        global.pc.x_change +=  _pc_x_change;
        with(global.pc) updateCSPoints();
        
        // Smash PC --------------------------------
        if (f.hp 
        && !global.pc.iframes_timer )
        {
            var _qualifies = false;
            if (_pc_x_change){var _1X=global.pc.csRgt1X; var _1Y=global.pc.csRgt1Y; var _2X=global.pc.csRgt2X; var _2Y=global.pc.csRgt2Y;}
            else             {var _1X=global.pc.csLft1X; var _1Y=global.pc.csLft1Y; var _2X=global.pc.csLft2X; var _2Y=global.pc.csLft2Y;}
            
            if (collide_solid_grid(_1X,_1Y) 
            ||  collide_solid_grid(_2X,_2Y) )
            {
                _qualifies = true;
            }
            else
            {
                for(_i=ds_list_size(g.dl_solid_inst)-1; _i>=0; _i--)
                {
                    if(!is_undefined(   g.dl_solid_inst[|_i]) 
                    &&  instance_exists(g.dl_solid_inst[|_i]) 
                    &&                  g.dl_solid_inst[|_i].state 
                    &&                  g.dl_solid_inst[|_i]!=id )
                    {
                        if (pointInRect(_1X,_1Y, g.dl_solid_inst[|_i].BodyHB_xl,g.dl_solid_inst[|_i].BodyHB_yt,g.dl_solid_inst[|_i].BodyHB_w,g.dl_solid_inst[|_i].BodyHB_h) 
                        ||  pointInRect(_2X,_2Y, g.dl_solid_inst[|_i].BodyHB_xl,g.dl_solid_inst[|_i].BodyHB_yt,g.dl_solid_inst[|_i].BodyHB_w,g.dl_solid_inst[|_i].BodyHB_h) )
                        {
                            _qualifies = true;
                            break;//_i
                        }
                    }
                }
            }
            
            // Smash PC
            if (_qualifies)
            {
                var _damage = get_stat_max(STR_Heart);
                // TODO: `solid_clip_correction` will also put pc above trap. Should that qualify for half damage?
                if (global.pc.cp1Y-yt<4) _damage = _damage>>1; // Because damage boost will put pc above of trap
                PC_take_damage(id,_damage);
            }
        }
    }
}


if (_y_change!=0 
&&  f.hp 
&& !global.pc.iframes_timer 
&&  wINw(global.pc.csTop1X,global.pc.csTop2X-global.pc.csTop1X, BodyHB_xl,BodyHB_w) )
{
    if ((inRange(global.pc.csTop1Y, BodyHB_yt,(BodyHB_yt+BodyHB_h)-1) && global.pc.cs&$4) 
    ||  (inRange(global.pc.csBtm1Y, BodyHB_yt,(BodyHB_yt+BodyHB_h)-1) && global.pc.cs&$8) )
    {   // Smash PC
        var _damage = get_stat_max(STR_Heart);
        if (sign_(global.pc.x<x)==global.pc.xScale  // if knockback will be AWAY from trap
        &&  abs(global.pc.x-x)>=(BodyHB_w>>1)+(((global.pc.csTop2X-global.pc.csTop1X)>>1)-4) )
        {
            _damage = _damage>>1; // Because damage boost will put pc outside of trap
        }
        PC_take_damage(id,_damage);
    }
}








// ------------------------------------------------------------------------------------
// --------------------------------------------------------------------
if (_collided_solid)
{
    aud_play_combo1($F);
    g.ScreenShake_timer = $10;
    if (attack_x_direction!=0) g.ScreenShake_strength_x = 1;
    else                       g.ScreenShake_strength_y = 1;
    
    sub_state = sub_state_DONE;
}
//*/








/*
var _start    = argument[0]; start x
var _change   = argument[1]; end x - start x
var _time     = argument[2]; time elapsed
var _duration = argument[3]; anim duration

_time /= _duration;

return _change*_time*_time*_time + _start;
*/

/* // This method uses an animation ease which looks smoother but requires an end point which could potentially change or be unknown at start.
var _i,_j, _x,_y, _count;
var _X_PREV = x;
var _Y_PREV = y;
var _x_change = 0;
var _y_change = 0;
var _collided_solid = false;
var _progress = 0;

if (attack_x_time<attack_x_duration 
||  attack_y_time<attack_y_duration )
{
    // ------------------------------------------------------------------------------------
    // x movement -----------------------------------------------------------
    if(!_collided_solid 
    &&  attack_x_time<attack_x_duration )
    {
        var _HEAD_X_PREV = attack_x_head_x;
        _val1 = ease_in(attack_x_head_start_x, attack_x_distance, attack_x_time, attack_x_duration);
        attack_x_head_x = floor(_val1);
        if (update_idx==0) show_debug_message("SmasherTrap01_update_ATTACK(). "+" xchangeprev="+string_format(xchangeprev,4,16)+" _val1="+string_format(_val1,4,16)+", diff="+string_format(abs(_val1-xchangeprev),4,16)+" %="+string_format(xchangeprev/_val1,4,32)+" diff%="+string_format(xchangeprevdiff/(_val1-xchangeprev),4,32));
        xchangeprevdiff=abs(_val1-xchangeprev);
        xchangeprev=_val1;
        //if (update_idx==0) show_debug_message("SmasherTrap01_update_ATTACK(). "+" abs(attack_x_head_x-_HEAD_X_PREV)="+string(abs(attack_x_head_x-_HEAD_X_PREV)));
        //attack_x_head_x = floor(ease_in(attack_x_head_start_x, attack_x_distance, attack_x_time, attack_x_duration));
        set_xy(id, attack_x_head_x+(ww_*-attack_x_direction), y);
        attack_x_time++;
        
        if (attack_x_time>=attack_x_duration)
        {   // in case it doesn't make it to destination due to fractions
            set_xy(id, attack_x_head_end_x+(ww_*-attack_x_direction), y);
            attack_x_head_x = x + (ww_*attack_x_direction);
            //_will_screen_shake = true;
            //show_debug_message("x=$"+hex_str(x)+" y=$"+hex_str(y)+", attack_x_head_x=$"+hex_str(attack_x_head_x)+" attack_x_head_start_x=$"+hex_str(attack_x_head_start_x)+" attack_x_head_end_x=$"+hex_str(attack_x_head_end_x));
        }
        _x_change = attack_x_head_x - _HEAD_X_PREV;
        
        
        if (_x_change!=0)
        {
            if(!_collided_solid)
            {
                //_count = max(2,abs(_x_change)>>3);
                if (abs(_x_change)<ww) _count = 1;
                else                   _count = max(1,abs(_x_change)>>3);
                for(_i=0; _i<_count; _i++)
                {
                    //_x = _HEAD_X_PREV + ((_i<<3)*attack_x_direction);
                    //_x = clamp(_x, min(_HEAD_X_PREV,attack_x_head_x), max(_HEAD_X_PREV,attack_x_head_x));
                    _x = min(_HEAD_X_PREV,attack_x_head_x) + (_i<<3);
                    for(_j=0; _j<hh>>3; _j++)
                    {
                        if (collide_solid_grid(_x+attack_x_direction, yt+(_j<<3)))
                        {
                            _collided_solid = true;
                            //_will_screen_shake = true;
                            set_xy(id, _x+(ww_*-attack_x_direction), y);
                            _i=_count; break;//_j
                        }
                    }
                }
            }
            
            
            if(!_collided_solid)
            {
                with(SmasherTrap01)
                {
                    if (id!=other 
                    //&&  rectInRect(xl,yt,ww,hh, other.attack_x_head_x+other.attack_x_direction,other.yt,max(1,abs(_x_change)),other.hh) )
                    &&  rectInRect(xl,yt,ww,hh, min(_HEAD_X_PREV,other.attack_x_head_x)+other.attack_x_direction,other.yt,max(1,abs(_x_change)),other.hh) )
                    {
                        _collided_solid = true;
                        //_will_screen_shake = true;
                        _x  = x +  (ww_*-other.attack_x_direction);
                        _x += other.ww_*-other.attack_x_direction;
                        set_xy(other, _x, other.y);
                        break;//with(SmasherTrap01)
                    }
                }
            }
        }
        
        
        attack_x_head_x = x + (ww_*attack_x_direction);
        _x_change = attack_x_head_x - _HEAD_X_PREV;
        if (_x_change!=0)
        {
            hspd = abs(_x_change)<<4;
            hspd = (hspd*attack_x_direction)&$FF;
        }
    }
    
    
    
    
    // ------------------------------------------------------------------------------------
    // y movement -----------------------------------------------------------
    if(!_collided_solid 
    &&  attack_y_time<attack_y_duration )
    {
        var _HEAD_Y_PREV = attack_y_head_y;
        attack_y_head_y = floor(ease_in(attack_y_head_start_y, attack_y_distance, attack_y_time, attack_y_duration));
        set_xy(id, x, attack_y_head_y+(hh_*-attack_y_direction));
        attack_y_time++;
        
        
        if (attack_y_time>=attack_y_duration)
        {   // in case it doesn't make it to destination due to fractions
            set_xy(id, x, attack_y_head_end_y+(hh_*-attack_y_direction));
            attack_y_head_y = y + (hh_*attack_y_direction);
            //_will_screen_shake = true;
        }
        _y_change = attack_y_head_y - _HEAD_Y_PREV;
        
        
        if (_y_change!=0)
        {
            if(!_collided_solid)
            {
                //_count = max(2,abs(_y_change)>>3);
                if (abs(_y_change)<hh) _count = 1;
                else                   _count = max(1,abs(_y_change)>>3);
                for(_i=0; _i<_count; _i++)
                {
                    //_y = _HEAD_Y_PREV + ((_i<<3)*attack_y_direction);
                    //_y = clamp(_y, min(_HEAD_Y_PREV,attack_y_head_y), max(_HEAD_Y_PREV,attack_y_head_y));
                    _y = min(_HEAD_Y_PREV,attack_y_head_y) + (_i<<3);
                    for(_j=0; _j<ww>>3; _j++)
                    {
                        if (collide_solid_grid(xl+(_j<<3), _y+attack_y_direction))
                        {
                            _collided_solid = true;
                            //_will_screen_shake = true;
                            set_xy(id, x, _y+(hh_*-attack_y_direction));
                            _i=_count; break;//_j
                        }
                    }
                }
            }
            
            
            if(!_collided_solid)
            {
                with(SmasherTrap01)
                {
                    if (id!=other 
                    //&&  rectInRect(xl,yt,ww,hh, other.xl,other.attack_y_head_y+other.attack_y_direction,other.ww,max(1,abs(_y_change))) )
                    &&  rectInRect(xl,yt,ww,hh, other.xl,min(_HEAD_Y_PREV,other.attack_y_head_y)+other.attack_y_direction,other.ww,max(1,abs(_y_change))) )
                    {
                        _collided_solid = true;
                        //_will_screen_shake = true;
                        _y  = y +  (hh_*-other.attack_y_direction);
                        _y += other.hh_*-other.attack_y_direction;
                        set_xy(other, other.x, _y);
                        break;//with(SmasherTrap01)
                    }
                }
            }
        }
        
        
        attack_y_head_y = y + (hh_*attack_y_direction);
        _y_change = attack_y_head_y - _HEAD_Y_PREV;
        if (_y_change!=0)
        {
            vspd = abs(_y_change)<<4;
            vspd = (vspd*attack_y_direction)&$FF;
        }
    }
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------------------------
    // PC interaction --------------------------------------------------------------
    update_body_hb();
    
    if (_x_change!=0 
    &&  hINh(global.pc.csLft1Y,global.pc.csLft2Y-global.pc.csLft1Y, BodyHB_yt,BodyHB_h) )
    {
        var _pc_x_change = 0;
        with(global.pc) updateCSPoints();
        
        if (_x_change)
        {
            if (pointInRect(global.pc.csLft1X,global.pc.csLft1Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) 
            ||  pointInRect(global.pc.csLft2X,global.pc.csLft2Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
            {
                _pc_x_change = attack_x_head_x - global.pc.csLft1X;
            }
        }
        else
        {
            if (pointInRect(global.pc.csRgt1X,global.pc.csRgt1Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) 
            ||  pointInRect(global.pc.csRgt2X,global.pc.csRgt2Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
            {
                _pc_x_change = attack_x_head_x - global.pc.csRgt1X;
            }
        }
        
        if (_pc_x_change!=0)
        {
            with(global.pc) set_xy(id, x+_pc_x_change, y); // push PC
            global.pc.x_change +=  _pc_x_change;
            with(global.pc) updateCSPoints();
            
            // Smash PC --------------------------------
            if (f.hp 
            && !global.pc.iframes_timer )
            {
                var _qualifies = false;
                if (_pc_x_change){var _1X=global.pc.csRgt1X; var _1Y=global.pc.csRgt1Y; var _2X=global.pc.csRgt2X; var _2Y=global.pc.csRgt2Y;}
                else             {var _1X=global.pc.csLft1X; var _1Y=global.pc.csLft1Y; var _2X=global.pc.csLft2X; var _2Y=global.pc.csLft2Y;}
                
                if (collide_solid_grid(_1X,_1Y) 
                ||  collide_solid_grid(_2X,_2Y) )
                {
                    _qualifies = true;
                }
                else
                {
                    for(_i=ds_list_size(g.dl_solid_inst)-1; _i>=0; _i--)
                    {
                        if(!is_undefined(   g.dl_solid_inst[|_i]) 
                        &&  instance_exists(g.dl_solid_inst[|_i]) 
                        &&                  g.dl_solid_inst[|_i].state 
                        &&                  g.dl_solid_inst[|_i]!=id )
                        {
                            if (pointInRect(_1X,_1Y, g.dl_solid_inst[|_i].BodyHB_xl,g.dl_solid_inst[|_i].BodyHB_yt,g.dl_solid_inst[|_i].BodyHB_w,g.dl_solid_inst[|_i].BodyHB_h) 
                            ||  pointInRect(_2X,_2Y, g.dl_solid_inst[|_i].BodyHB_xl,g.dl_solid_inst[|_i].BodyHB_yt,g.dl_solid_inst[|_i].BodyHB_w,g.dl_solid_inst[|_i].BodyHB_h) )
                            {
                                _qualifies = true;
                                break;//_i
                            }
                        }
                    }
                }
                
                // Smash PC
                if (_qualifies)
                {
                    var _damage = get_stat_max(STR_Heart);
                    if (global.pc.cp1Y-yt<4) _damage = _damage>>1; // Because damage boost will put pc outside of trap
                    PC_take_damage(id,_damage);
                }
            }
        }
    }
    
    
    if (_y_change!=0 
    &&  f.hp 
    && !global.pc.iframes_timer 
    &&  wINw(global.pc.csTop1X,global.pc.csTop2X-global.pc.csTop1X, BodyHB_xl,BodyHB_w) )
    {
        if ((inRange(global.pc.csTop1Y, BodyHB_yt,(BodyHB_yt+BodyHB_h)-1) && global.pc.cs&$4) 
        ||  (inRange(global.pc.csBtm1Y, BodyHB_yt,(BodyHB_yt+BodyHB_h)-1) && global.pc.cs&$8) )
        {   // Smash PC
            var _damage = get_stat_max(STR_Heart);
            if (sign_(global.pc.x<x)==global.pc.xScale  // if knockback will be AWAY from trap
            &&  abs(global.pc.x-x)>=(BodyHB_w>>1)+(((global.pc.csTop2X-global.pc.csTop1X)>>1)-4) )
            {
                _damage = _damage>>1; // Because damage boost will put pc outside of trap
            }
            PC_take_damage(id,_damage);
        }
    }
}








// ------------------------------------------------------------------------------------
// --------------------------------------------------------------------
if (_collided_solid 
||  (attack_x_time>=attack_x_duration && attack_y_time>=attack_y_duration) )
{
    attack_x_time = attack_x_duration;
    attack_y_time = attack_y_duration;
    
    if (_collided_solid)
    {
        aud_play_combo1($F);
        g.ScreenShake_timer = $10;
        if (attack_x_duration) g.ScreenShake_strength_x = 1;
        else                   g.ScreenShake_strength_y = 1;
    }
    else
    {
        if (attack_x_duration) set_xy(id, attack_x_head_end_x+(ww_*-attack_x_direction), y);
        else                   set_xy(id, x, attack_y_head_end_y+(hh_*-attack_y_direction));
    }
    
    sub_state = sub_state_DONE;
}
*/




