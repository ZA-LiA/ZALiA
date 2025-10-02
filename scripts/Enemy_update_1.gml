/// Enemy_update_1()

/// Used by: 
//  Moblin v1(orange),  Moblin v2(red),  Moblin v3(blue)
//  Goriya v1(orange),  Goriya v2(red),  Goriya v3(blue)
//  Daira  v1(orange),  Daira  v2(red)



// 9A2C
if (cs&CS_BD1) enemy_collide_pc_body();


updateY();

if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}


// 9A3B
var _hspdPB_COPY = hspd_pushback;
GOB_update_1(true); // update hspd_pushback

GO_update_cs();

if!(cs&$3) updateX();

if (_hspdPB_COPY) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// 9A3E
facing_dir = dir_to_pc(id);


// ------------------------------------------------------------------------------------
var _D1 = 0; // Daira  v1(orange)
var _D2 = 0; // Daira  v2(red)

var _G1 = 0; // Goriya v1(orange)
var _G2 = 0; // Goriya v2(red)
var _G3 = 0; // Goriya v3(blue)

var _M1 = 0; // Moblin v1(orange)
var _M2 = 0; // Moblin v2(red)
var _M3 = 0; // Moblin v3(blue)
switch(object_index)
{
    case DairA:{
    _D1 = ver==1; // Daira v1(orange)
    _D2 = ver==2; // Daira v2(red)
    break;}
    
    case GoriA:{
    _G1 = ver==1; // Goriya v1(orange)
    _G2 = ver==2; // Goriya v2(red)
    _G3 = ver==3; // Goriya v3(blue)
    break;}
    
    case MoblA:{
    _M1 = ver==1; // Moblin v1(orange)
    _M2 = ver==2; // Moblin v2(red)
    _M3 = ver==3; // Moblin v3(blue)
    break;}
}


var _InAttackDist_ORIG = (goDist1()+attack_dist)&$FF < (attack_dist<<1)&$FF;
var _InAttackDist_WIDE =  abs(x-g.pc.x)              <  attack_dist;

var _InAggroDist_ORIG  = (goDist1()+$50)&$FF < $A0;
var _InAggroDist_WIDE  = ocsH1(id);

var _CAN_AGGRO = (_D1 || _M1 || _M2 || _M3) && _InAggroDist_WIDE && !behavior;


var _RAND = rand();
var _val  = $1;

if (_InAttackDist_ORIG)
{   // 9A6B
    counter = (counter+1)&$FF;
    
    // $1F: on $00,20,40,60,80,A0,C0,E0. every  32 frames = 0.533s
    // $3F: on $00,   40,   80,   C0.    every  64 frames = 1.067s
    // $7F: on $00,         80.          every 128 frames = 2.133s
             _val  = $3F; // m1,m2, g2,g3, d1,d2. 1.067s. $00,   40,   80,   C0
    if (_M3) _val  = $1F; // m3.                  0.533s. $00,20,40,60,80,A0,C0,E0
    if (_G1) _val  = $7F; // g1.                  2.133s. $00,         80
             _val &= counter;
    //
    if(!_val)
    {   // This is a chance to time the next atk with the shortest 
        // duration (32 frames) instead of the normal 64/128 frames.
        var                    _num = $1; // m2, m3        50%   1/2  chance
        if (_M1 || _G3 || _D1) _num = $3; // g3, d1, m1    25%   1/4  chance
        if (_G2 || _D2)        _num = $7; // g2, d2        12.5% 1/8  chance
        if (_G1)               _num = $F; // g1            6.25% 1/16 chance
        
        if!(_RAND & _num) counter = $E0; // Next atk in 32 frames (about .5 seconds)
    }
}


if (_InAttackDist_ORIG 
||  _CAN_AGGRO )
{
    if(!_val         // in distance attack && is attack time
    ||  _CAN_AGGRO ) // _CAN_AGGRO = (_D1 || _M1 || _M2 || _M3) && _IN_DIST_AGGRO && !behavior;
    {   // 9982 -------------- START ATTACK --------------------------
        if (_D1 || _D2) // Daira only
        {
            behavior = 1; // 1. atk high for Daira
        }
        else if (_M1) // Moblin v1 orange
        {   // 9AA2
            behavior = 3; // 3. atk high
        }
        else
        {   // m2,m3, g1,g2,g3
            
            // if  dHeld, high: (rand&7) 1,3,4,5,6,7. low: (rand&7) 0,2
            // if  dHeld, atk high has a 75% chance, low a 25% chance
            
            // if !dHeld, high: (rand&7) 4,6. low: (rand&7) 0,1,2,3,5,7
            // if !dHeld, atk high has a 25% chance, low a 75% chance
            
            // if PC crouching, high has a better chance
            // if PC standing,  low  has a better chance
            // I think this is to give projectile a better chance of avoiding PC shld
            
            if (Input.dHeld)
            {   // 9AA2
                if (isVal(_RAND&$7, 0,2)) behavior = 1; // 25%. 1: atk low
                else                      behavior = 3; // 75%. 3: atk high
            }
            else
            {
                if (isVal(_RAND&$7, 4,6)) behavior = 3; // 25%. 3: atk high
                else                      behavior = 1; // 75%. 1: atk low
            }
        }
        
        // 9AA6
        timer = $18; // $18: 0.400s.  Attack delay
    }
}


var _HSPD1 = ($04*sign_(g.counter1&$40)) &$FF; // Attack mode pacing
if(!_InAggroDist_WIDE)
{
    hspd = _HSPD1;
    facing_dir = byte_dir(hspd);
}
else
{
    if (_InAttackDist_WIDE)
    {   // 9AAB. ------------------- SET hspd ---------------------------------
             if (g.pc.cs&(CS_RGT|CS_LFT))  hspd = 0;
        else if (Input.hHeld && g.pc.hspd) hspd = g.pc.hspd;
        else                               hspd = _HSPD1;
        
        hspd = (hspd>>1) | (hspd&$80);
    }
    else
    {
        facing_dir = dir_to_pc_(id);
        hspd = ($10*facing_dir) &$FF;
    }
}




