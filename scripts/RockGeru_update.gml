/// RockGeru_update()


var _RAND = rand();



// 9730: JSR DC91
facing_dir = dir_to_pc(id);

// 9733
if (behavior)
{
    var _behaviorCopy = behavior;
    
    if(!control) behavior=(behavior+1)&$FF;
    
    if(!control 
    &&  _behaviorCopy != 2 )
    {
        control = $10;
        
        // 9748: JSR 9A11: JSR DBCE
        if (avail_uidx_goc(MAX_GOC1) != UIDX_NULL)
        {
            var _p = GOC1_create(xl, yt, facing_dir, projectile,projectile_ver);
            
            var _diff, _carry;
            
            // 974D
                             _diff  = goDist1();
            if (_diff & $80) _diff ^= $FF;
            if (_diff & 3)   _carry = 1;
            else             _carry = 0;
            
                             _diff  = _diff >>2;
            if (!facing_dir)  _diff ^= $FF;
            
            _p.hspd = byte(_diff + global.pc.hspd + _carry);
            
            var _data = "DC"+"E4"+"EC"+"F4"  +  "F8"+"00"+"00"+"00";
            var _idx  = (global.pc.yt >>5) & 7;
            _p.vspd = str_hex(_data, _idx);
        }
    }
    else
    {
        if (control)
        {
            // 9773
            control--;
        }
        else
        {
            // 9778
            behavior = 0;
        }
    }
}



// --------------------------------------------------------------------------
// 977C: JSR EF11
update_EF11();



// --------------------------------------------------------------------------
// 977F
switch(counter & 3)
{
    case 0:
    {
        // 978E
        if(!timer)
        {
            var _x;
            switch(ver)
            {
                case 1:{
                var _carry;
                _x     = _RAND >>1;
                _carry = _RAND & 1;
                
                _x += $40       + _carry;
                _carry = _x > $FF;
                _x &= $FF;
                
                _x += global.pc.hspd + _carry;
                _carry = _x > $FF;
                _x &= $FF;
                
                _x += global.pc.hspd + _carry;
                _carry = _x > $FF;
                _x &= $FF;
                
                _x += global.pc.hspd + _carry;
                _carry = _x > $FF;
                _x &= $FF;
                
                
                _x += g.view_xl_og   + _carry;
                set_xlyt(id, _x, yt);
                
                timer = (_x&$1F) + $24;
                break;}
                
                
                
                case 2:{ // wall is house
                if(!wINw(Wall_XL+8,Wall_W-$10, viewXL(),viewW())) break;
                
                var _W = min(viewXR(),Wall_XR) - max(viewXL(),Wall_XL);
                _x = max(viewXL(),Wall_XL) + irandom(_W);
                if (global.pc.hspd) _x += 8 * sign_(global.pc.hspd<$80);
                _x = clamp(_x, Wall_XL,Wall_XR);
                set_xy(id, _x,y);
                
                timer = (irandom($FF)&$1F) + $24;
                break;}
            }
            
            
            
            
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    
    // -------------------------------------------------------
    case 1:
    {
        // 97B7
        if (timer)
        {
            if (yt >= Wall_Y-4)
            // if ((yt - (g.camYT-8)) >= $4C)
            {
                set_xy(id, x,y-1);
            }
        }
        else
        {
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------
    
    case 2:
    {
        // 97C8
        if (yt >= Wall_Y-$B)
        // if ((yt - (g.camYT-8)) >= $45)
        {
            set_xy(id, x,y-1);
        }
        else
        {
            timer = (_RAND >>1) | $40;
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------
    
    case 3:
    {
        // 97DA
        if (timer)
        {
            if (timer >= $11)
            {
                if(!behavior)
                {
                    behavior = 1;
                    control  = $10;
                }
            }
            else
            {
                set_xy(id, x,y+1);
            }
        }
        else
        {
            timer |= $40;
            counter=(counter+1)&$FF;
        }
        
        break;
    }
}




