/// Projectile_collision_1a()


if (collided_shield)                 exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!react_body && !(react_shield&$FF)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!GO_can_collide_this_frame(update_idx)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





// ---------------------------------------------------------------------------------------
// E3CC ----------------------------------------------------------------------------------
update_body_hb_1a();


if (react_shield&$FF 
&&  collide_pc_shield(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h) )
{
    var _REFLECT_ACTIVE = g.spells_active & SPL_RFLC;
    var _LV2_SHIELD = f.items & ITM_SHLD;
    
    var _RVS = $04; // Reverse
    var _BNC = $02; // Bounce
    var _DSN = $01; // DSN: Disintegrate
    
    
    var _S1  =  react_shield    &$FF;     // reaction types
    var _S2  = (react_shield>>8)&$FF;     // REFLECT  types
        _S2 &= _S1;                     // types that DO   require REFLECT to block
        _S1 ^= _S2;                     // types that DONT require REFLECT to block
    //
    
    // can reverse
    var _C1 = (_S1&_RVS)                                     // DONT require REFLECT
         ||  ((_S2&_RVS) && (_REFLECT_ACTIVE));              // DO   require REFLECT
    // can bounce
    var _C2 = (_S1&_BNC)                                     // DONT require REFLECT
         ||  ((_S2&_BNC) && (_REFLECT_ACTIVE||_LV2_SHIELD)); // DO   require REFLECT
    // can disintegrate
    var _C3 = (_S1&_DSN)                                     // DONT require REFLECT
         ||  ((_S2&_DSN) && (_REFLECT_ACTIVE||_LV2_SHIELD)); // DO   require REFLECT
    //
    //sdm(obj_name(oi)+", _S1 $"+hex_str(react_shield&$FF)+" $"+hex_str(_S1)+", _S2 $"+hex_str((react_shield>>8)&$FF)+" $"+hex_str(_S2)+", _C123 "+string(_C1)+string(_C2)+string(_C3));
    
    if (_C1 || _C2 || _C3)
    {
        collided_shield = true;
        
        if (_C1) // Reverse: SoundWave
        {
            reflected = true;
            if (g.mod_REFLECT_more_obj)
            {
                facing_dir = -facing_dir;
                vspd      = 0;
                vspd_adj  = 0;
            }
            //vspd        = 0;
            //vspd_adj    = 0;
            hspd        = max(abs8b(hspd),$20);
            hspd        = byte(hspd*sign_(x>=global.pc.x));
            //hspd        = byte(max(abs8b(hspd),$20) * -sign_(sign8b(hspd)));
            //hspd        = byte(max(abs8b(hspd),$18) * -sign_(sign8b(hspd)));
            if (is_ancestor(object_index, SoundWave))
            {
                vspd        = 0;
                vspd_adj    = 0;
                counter     = 0;
            }
        }
        else if (_C2) // Bounce
        {   // E431
            hspd = (8*-facing_dir) &$FF;
            vspd = $F8;
        }
        else // _C3 Disintegrate
        {   // E413
            set_xy(id, x, y-2);
            disintegrate_counter = $F2; // start disintegrate
            state      = state_EXPLODE;
        }
        
        
        if ((react_shield>>$10)&$FF == $2) 
        {   // Axe, Bolo, Mace. Need REFLECT active.
            aud_play_sound(get_audio_theme_track(dk_StrikeSolid));
        }
        else
        {
            aud_play_sound(get_audio_theme_track(dk_HitShield));
        }
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}



if (react_body 
&& !collided_shield 
&&  collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r) )
{   // E442
    enemy_collide_pc_body();
    
    // Only Flame1&2 are $01
    if ((react_body&$FF) != $01) state = 0;
}




/*
    // can reverse
    var _C1  =  _S1 & _RVS;                                      // DONT require REFLECT
        _C1 |= (_S2 & _RVS) && (_REFLECT_ACTIVE);                // DO   require REFLECT
    // can bounce
    var _C2  =  _S1 & _BNC;                                      // DONT require REFLECT
        _C2 |= (_S2 & _BNC) && (_REFLECT_ACTIVE || _LV2_SHIELD); // DO   require REFLECT
    // can disintegrate
    var _C3  =  _S1 & _DSN;                                      // DONT require REFLECT
        _C3 |= (_S2 & _DSN) && (_REFLECT_ACTIVE || _LV2_SHIELD); // DO   require REFLECT
    //
*/




