/// PC_cucco_fury_update()


if(!g.mod_PC_CUCCO_3) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


// TODO: Finish Cucco-Fury attack.



if(!Cucco_rage_state 
&& !Cucco_rage_timer 
&&  Cucco_rage_tokens )
{
    Cucco_rage_tokens--;
    Cucco_rage_timer   = 0;
    Cucco_rage_state = Cucco_RAGE_STATE_STRT1;
}


if (Cucco_rage_timer)
{   Cucco_rage_timer--;  }




if(!Cucco_rage_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!






// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
var _i, _x,_y, _val, _w,_h;
var _inst;
var _complete = false;

var _dist   = -1;

var _timing = 1<<3; // 1<<3 == every 8
var _dur    = 0;
switch(Cucco_rage_state){
// -------------------------------------------------------
    case Cucco_RAGE_STATE_STRT1:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR1; // $100
    _timing = 1<<6; // 1<<6 == $40(spawn every 64)
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_STRT2:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR1; // $100
    _timing = 1<<6; // 1<<6 == $40(spawn every 64)
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_ATK1:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR1; // $100
    _timing = 1<<6; // 1<<6 == $40(spawn every 64)
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_ATK2:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR3; // $20
    _timing = 1<<5; // 1<<5 == $20(spawn every 32)
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_ATK3:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR3; // $20
    _timing = 0; // 0: don't spawn
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_ATK4:{ // -------------------------------------------------------
    _dur    = Cucco_RAGE_DUR1; // $100
    _timing = 1<<4; // 1<<4 == $10(spawn every 16)
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_END1:{ // -------------------------------------------------------
    Cucco_rage_timer = 2; // Keep it going until all cucco are off screen.
    
    break;}
// -------------------------------------------------------
    case Cucco_RAGE_STATE_END2:{ // -------------------------------------------------------
    
    break;}
} // switch(Cucco_rage_state)





if (Cucco_rage_timer <= 0)  // 0: cue set timer, first frame of this case/state.
{   Cucco_rage_timer  = _dur;  }

if (Cucco_rage_timer == 1){ // 1: cue change state
    Cucco_rage_timer  = 0;  // 0: cue set timer, 
    Cucco_rage_state = (Cucco_rage_state+1) mod Cucco_RAGE_STATE_CNT;
}



if(!Cucco_rage_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!






/*  ABOUT FINDING AN ANGLE VALUE. --------
From  udp_Magnot():
// 8 diff dir pupil can point.
// a circle w/ 8 equal sections gives each section's angle 45* (360/8)
// 0*, 45*, 90*, 135*, 180*, 225*, 270*, 315*
var _val  = point_direction(x,y, global.pc.x,global.pc.y);
    _val += 22.5; // offset by 1/16th. 45/2 = 22.5 = 360/16
    _val  = _val mod 360; // in case adding offset went past 359
    _val  = _val div 45;   // Determine the section index(0-7) of the angle
//
*/


var _DIST   = viewW_();
_complete   = true;
_timing     = Cucco_rage_timer & (_timing-1);


// ** dg_Cucco_rage[# 0,_i]: 1st clm for general rage atk info.
for(_i=ds_grid_width(dg_Cucco_rage)-1; _i>=1; _i--)
{
    if (dg_Cucco_rage[#_i,0]) // if is spawned
    {
              dg_Cucco_rage[#_i,1] = round(dg_Cucco_rage[#_i,1] + hspd); // update x
        _x  = dg_Cucco_rage[#_i,1] - (Cucco_W>>1);
        
              dg_Cucco_rage[#_i,2] = round(dg_Cucco_rage[#_i,2] + vspd); // update y
        _y  = dg_Cucco_rage[#_i,2] - (Cucco_H>>1);
        
        if (rectInView(_x,_y, Cucco_W,Cucco_H))
        {
                _inst = dg_Cucco_rage[#_i,6];
            if (is_undefined(   _inst) 
            || !instance_exists(_inst) 
            ||                 !_inst.state )
            {   // pick a new target
                _dist = _DIST;
                _inst = noone;
                
                // Determine the nearest enemy inst and set as the target(dg_Cucco_rage[#_i,6]).
                with(Enemy)
                {
                    if (state == state_NORMAL 
                    &&  _dist > point_distance(_x,_y, x,y) ){
                        _dist = point_distance(_x,_y, x,y);
                        _inst = id;
                    }
                }
                
                dg_Cucco_rage[#_i,6] = _inst;
            }
            
            
            if (_inst 
            &&  _inst.hp 
            && !_inst.stun_timer )
            {
                _w = $C;
                _h = $A;
                _x = dg_Cucco_rage[#_i,1] - (_w>>1);
                _y = dg_Cucco_rage[#_i,2] - (_h>>1);
                if (rectInRect(_x,_y, _w,_h, _inst.BodyHB_xl,_inst.BodyHB_yt, _inst.BodyHB_w,_inst.BodyHB_h))
                {
                    damage_gob(id, global.pc.dl_ATTACK_DAMAGE[| f.level_atk], false);
                    // update_E726(global.pc.dl_ATTACK_DAMAGE[| f.level_atk], false);
                }
            }
        }
        else
        {
            dg_Cucco_rage[#_i,0] = 0; // Despawn
        }
    }
    
    
    
    
    
    if (dg_Cucco_rage[#_i,0]) // if is spawned
    {
        _complete = false;
    }
    
    
    
    
    
    
    
    if(!dg_Cucco_rage[#_i,0]  // NOT spawned
    && !_timing )             // !_timing: is spawn frame.
    {
        dg_Cucco_rage[#_i,0] = 1;
        
            _val = irandom(3); // 0:RGT, 1:LFT, 2:BTM, 3:TOP
        if (_val<2)
        {
            _x  =  viewXC();
            _x += (viewW_()+(Cucco_W>>1)) * -sign_(_val&1);
            
            _y  =  viewYT()-(Cucco_H>>1);
            _y += irandom(viewH()+Cucco_H)
        }else
        {
            _y  =  viewYC();
            _y += (viewH_()+(Cucco_H>>1)) * -sign_(_val&1);
            
            _x  =  viewXL()-(Cucco_W>>1);
            _x += irandom(viewW()+Cucco_W);
        }
        
        dg_Cucco_rage[#_i,1] = _x;
        dg_Cucco_rage[#_i,2] = _y;
    }
}




if (_complete)
{   // END CUCCO FURY ATTACK
    Cucco_rage_state = 0;
}




