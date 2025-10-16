/// TorchA_update()


if(!is_lit)
{
    GOB_update_2();
    
    var _HB_X = BodyHB_xl;
    var _HB_Y = BodyHB_yt;
    var _HB_W = BodyHB_w;
    var _HB_H = BodyHB_h;
    
    
    var _C1 =  cs&CS_PR1     // Only happens when FIRE proj collides
           || (cs&CS_SW1 && f.items&ITM_CAND);
    if(!_C1 
    &&  f.items&ITM_CAND 
    &&  g.torch_lighting_method==1 )
    {   var _W=6;
        var _H=_W;
        if (rectInRect(_HB_X,_HB_Y,_HB_W,_HB_H, global.pc.x-(_W>>1),global.pc.y-4,_W,_H))
        {
            _C1=true;
        }
    }
    
    
    if(!_C1)
    {
        with(ProjectileHostile)
        {
            if (state==state_NORMAL 
            &&  is_ancestor_(object_index,Fireball1,Fireball2,Flame1,Flame2) 
            &&  rectInRect(_HB_X,_HB_Y,_HB_W,_HB_H, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
            {
                other.cs |= CS_PR1;
                _C1=true;
                break;
            }
        }
    }
    
    
    if(!_C1)
    {
        with(FiRoA)
        {
            if (state==state_NORMAL 
            &&  colliding_FireRope(id, _HB_X,_HB_Y,_HB_W,_HB_H) )
            {
                _C1=true;
                break;
            }
        }
    }
    
    
    if(!_C1)
    {
        with(GameObjectB)
        {
            if (state==state_NORMAL 
            &&  is_ancestor(object_index,Blaze01) 
            &&  rectInRect(_HB_X,_HB_Y,_HB_W,_HB_H, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h) )
            {
                _C1=true;
                break;
            }
        }
    }
    
    
    
    
    if (_C1)
    {
        Torch_ignite(); // set is_lit=true and prevent any further collision
        
        aud_play_fire(true);
        FireSound_tmr = FireSound_DUR;
    }
}
else
{
    if (FireSound_tmr)
    {
        FireSound_tmr--;
        aud_play_fire(sign(FireSound_tmr));
    }
    
    GO_update_cam_vars();
    update_EF11();
}




