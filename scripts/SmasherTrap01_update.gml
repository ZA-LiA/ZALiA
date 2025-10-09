/// SmasherTrap01_update()


var _X_PREV = x;
var _Y_PREV = y;


hspd = 0;
vspd = 0;




switch(sub_state)
{
    case sub_state_IDLE:{
    if (trigger_x>=0 
    &&  trigger_y>=0 
    && !global.pc.ogr  // if pc on ground
    &&  pointInRect(global.pc.cp1X,global.pc.cp1Y, trigger_x-$10,trigger_y-$8,$20,$10) )
    {
        sub_state = sub_state_DELAY;
        break;//case sub_state_IDLE
    }
    break;}//case sub_state_IDLE
    
    
    
    
    case sub_state_DELAY:{
    if (DELAY_timer)
    {
        DELAY_timer--;
        break;//case sub_state_DELAY
    }
    
    sub_state = sub_state_TELL;
    break;}//case sub_state_DELAY
    
    
    
    
    case sub_state_TELL:{
    if (TELL_timer)
    {
        TELL_timer--;
        break;//case sub_state_TELL
    }
    
    sub_state = sub_state_ATTACK;
    break;}//case sub_state_TELL
    
    
    
    
    // Proposed new solids system that can handle partial solid tiles.
    // *** The system will not make sense in certain scenarios where there are multiple solid obj within 1 tile, 
    //     and at least one obj is taking up a corner of the tile (both its x and y are < 8).
    //     Though the scenario seems unlikely. So maybe it would just need a rule to not create a scene where it's possible.
    //
    // Setting data for XL and YT:
    //              3 bytes:   (the solid type) | (8 bits: which y pixels are solid) | (8 bits: which x pixels are solid)
    //                                 $FF0000      |        $00FF00        |      $0000FF
    // dg_solids[#XL>>3,YT>>3] |= (TID_SOLID1<<$10) | (($FF>>(YT&$7))<<$08) | (($FF>>(XL&$7))<<$00)
    // 11111111 >>(XL&$7) (where XL&$7==$3)
    //=00011111
    //
    // Setting data for XR and YB:
    // dg_solids[#XR>>3,YB>>3] |= (TID_SOLID1<<$10) | ((($FF00>>(YB&$7))&$FF)<<$08) | ((($FF00>>(XR&$7))&$FF)<<$00)
    // 11111111 00000000 >>(XR&$7) (where XR&$7==$3)
    //=00011111 11100000 &$FF
    //=11100000
    
    // Checking for collision:
    // i think this will work
    // val = dg_solids[#px>>3,py>>3]
    //return (((val>>$00)&$FF) & ($80>>(px&$7))) 
    //    && (((val>>$08)&$FF) & ($80>>(py&$7)));
    //
    // i dont think this will work
    //// val = dg_solids[#px>>3,py>>3]
    ////return (((val>>$00)&$FF) & ($1<<(px&$7))) 
    ////    && (((val>>$08)&$FF) & ($1<<(py&$7)));
    case sub_state_ATTACK:{
    var _collided_solid = false;
    
    if (attack_x_time<attack_x_duration 
    ||  attack_y_time<attack_y_duration )
    {
        var _i,_j, _x,_y, _count;
        var _x_change = 0;
        var _y_change = 0;
        
        // x movement -----------------------------------------------------------
        if(!_collided_solid 
        &&  attack_x_time<attack_x_duration )
        {
            var _HEAD_X_PREV = attack_x_head_x;
            attack_x_head_x = floor(ease_in(attack_x_head_start_x, attack_x_distance, attack_x_time, attack_x_duration));
            set_xy(id, attack_x_head_x+(ww_*-attack_x_direction), y);
            attack_x_time++;
            
            if (attack_x_time>=attack_x_duration)
            {   // in case it doesn't make it to destination due to fractions
                set_xy(id, attack_x_head_end_x+(ww_*-attack_x_direction), y);
                attack_x_head_x = x + (ww_*attack_x_direction);
                //show_debug_message("x=$"+hex_str(x)+" y=$"+hex_str(y)+", attack_x_head_x=$"+hex_str(attack_x_head_x)+" attack_x_head_start_x=$"+hex_str(attack_x_head_start_x)+" attack_x_head_end_x=$"+hex_str(attack_x_head_end_x));
            }
            
            _x_change = attack_x_head_x - _HEAD_X_PREV;
            if (abs(_x_change)<ww) _count = 1;
            else                   _count = max(1,abs(_x_change)>>3);
            for(_i=0; _i<_count; _i++)
            {
                _x = min(_HEAD_X_PREV,attack_x_head_x) + (_i<<3);
                for(_j=0; _j<hh>>3; _j++)
                {
                    if (collide_solid_grid(_x+attack_x_direction, yt+(_j<<3)))
                    {
                        _collided_solid = true;
                        set_xy(id, _x+(ww_*-attack_x_direction), y);
                        _i = _count;
                        break;//_j
                    }
                }
            }
            
            if(!_collided_solid)
            {
                with(SmasherTrap01)
                {
                    if (id!=other 
                    &&  rectInRect(xl,yt,ww,hh, min(_HEAD_X_PREV,other.attack_x_head_x)+other.attack_x_direction,other.yt,max(1,abs(_x_change)),other.hh) )
                    {
                        _collided_solid = true;
                        _x  = x +  (ww_*-other.attack_x_direction);
                        _x += other.ww_*-other.attack_x_direction;
                        set_xy(other, _x, other.y);
                        break;//with(SmasherTrap01)
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
            }
            
            _y_change = attack_y_head_y - _HEAD_Y_PREV;
            if (abs(_y_change)<hh) _count = 1;
            else                   _count = max(1,abs(_y_change)>>3);
            for(_i=0; _i<_count; _i++)
            {
                _y = min(_HEAD_Y_PREV,attack_y_head_y) + (_i<<3);
                for(_j=0; _j<ww>>3; _j++)
                {
                    if (collide_solid_grid(xl+(_j<<3), _y+attack_y_direction))
                    {
                        _collided_solid = true;
                        set_xy(id, x, _y+(hh_*-attack_y_direction));
                        _i = _count;
                        break;//_j
                    }
                }
            }
            
            if(!_collided_solid)
            {
                with(SmasherTrap01)
                {
                    if (id!=other 
                    &&  rectInRect(xl,yt,ww,hh, other.xl,min(_HEAD_Y_PREV,other.attack_y_head_y)+other.attack_y_direction,other.ww,max(1,abs(_y_change))) )
                    {
                        _collided_solid = true;
                        _y  = y +  (hh_*-other.attack_y_direction);
                        _y += other.hh_*-other.attack_y_direction;
                        set_xy(other, other.x, _y);
                        break;//with(SmasherTrap01)
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
            g.ScreenShake_strength_x = 1;
        }
        else
        {
            if (attack_x_duration) set_xy(id, attack_x_head_end_x+(ww_*-attack_x_direction), y);
            else                   set_xy(id, x, attack_y_head_end_y+(hh_*-attack_y_direction));
        }
        
        sub_state = sub_state_DONE;
    }
    break;}//case sub_state_ATTACK
    
    
    
    
    case sub_state_DONE:{
    break;}//case sub_state_DONE
}//switch(sub_state)




BodyHB_can_draw = true;
update_body_hb();


// updates all GameObject instances on top of trap
update_go_xy_on_moving_platform(x-_X_PREV, y-_Y_PREV);




update_EF11();




