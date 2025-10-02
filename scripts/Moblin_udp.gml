/// Moblin_udp()


// 9C43, 9CA4
can_draw_self = true;


spear_spr1 = 0; // spr_Spear_piece1
spear_spr2 = 0; // spr_Spear_piece2

var                            _bvr = behavior; // _bvr: 05E4
if (_bvr==BVR_ATKL && timer<8) _bvr = 1;

var                        _sprites_idx = 5; // spr_Moblin_Low_Stab
if (hspd && g.counter1&$8) _sprites_idx = 4; // spr_Moblin_Low_Draw

// 9CDF
if(!ocs 
&&  _bvr )
{
    // 9CEC
    if (_bvr > 2) spear_yoff = -8;
    else          spear_yoff =  0;
    
    spear_xscale = facing_dir;
    
    
    
    switch(_bvr)
    {
        case 1:
        {
            _sprites_idx = 4; // spr_Moblin_Low_Draw
            spear_spr1 = SPEAR_SPR1;
            
            
            spear_xscale = -facing_dir;
            spear_xoff1 = -8;
            spear_xoff2 =  0;
            
            if (inRange(timer, 3,12))
            {
                spear_xoff1 = -12;
                spear_xoff2 =   0;
            }
            
            break;
        }
        
        case 2:
        {
            if (timer < 8) _sprites_idx = 4; // spr_Moblin_Low_Draw
            else           _sprites_idx = 5; // spr_Moblin_Low_Stab
            
            if (inRange(timer, 8,12))
            {   spear_spr2 = SPEAR_SPR2;  }
                spear_spr1 = SPEAR_SPR1;
            
            
            
            spear_xoff1 = 12;
            spear_xoff2 =  0;
            
            if (timer < 13)
            {
                spear_xoff1 = 20;
                spear_xoff2 = 12;
            }
            
            if (timer < 8)
            {
                spear_xscale = -facing_dir;
                spear_xoff1 = -12;
                spear_xoff2 =   0;
            }
            
            break;
        }
        
        case 3:
        {
            _sprites_idx = 0; // spr_Moblin_High_DrawA
            spear_spr1 = SPEAR_SPR1;
            spear_spr2 = SPEAR_SPR2;
            
            
            spear_xoff1 = 12;
            spear_xoff2 = -8;
            
            if (inRange(timer, 3,12))
            {
                spear_xoff1 =   8;
                spear_xoff2 = -12;
            }
            
            break;
        }
        
        case 4:
        {
            _sprites_idx = 2; // spr_Moblin_High_StabA
            
            if (inRange(timer, 3,12))
            {   spear_spr2 = SPEAR_SPR2;  }
                spear_spr1 = SPEAR_SPR1;
            
            
            spear_xoff1 = 12;
            spear_xoff2 =  0;
            
            if (inRange(timer, 3,12))
            {
                spear_xoff1 = 20;
                spear_xoff2 = 12;
            }
            
            break;
        }
        
        case 5:
        {
            _sprites_idx = 2; // spr_Moblin_High_StabA
            
            break;
        }
    }
    
    // spear_xscale *= -1;
    spear_xoff1 *= facing_dir;
    spear_xoff2 *= facing_dir;
}


GO_set_sprite(id, dl_sprites[|_sprites_idx]);




