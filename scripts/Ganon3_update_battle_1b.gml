/// Ganon3_update_battle_1b()


if (stun_timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// ---------------------------------------------------------------------------------------------
update_body_hb_1a();


var _p = collide_pc_proj(BodyHB_x,BodyHB_y, BodyHB_w,BodyHB_h, BodyHB_r);
if(!_p)
{
    cs &= ~CS_PR1; // remove CS_PR1(PC Proj) from cs(Colliding Sides)
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _can_push_back = false;


if (_p.type_bits & _p.BIT_BEM1)
{
    _can_push_back = true;
    
    _p.hspd  = 0;
    _p.disintegrate_counter = $F2; // 008D,Y = $F2. Start disintegrate
    _p.state = _p.state_EXPLODE;
}


if (_p.type_bits & (_p.BIT_BEM1 | _p.BIT_FIR1))
{
    // I'm not sure why PC's behavior would dictate anything regarding pushback on 
    // a projectile collision, but it's definitely in the OG code...
    // E6F3-E6F7 could set carry and then E70C goes to an RTS ending up at E4AB.
    // BVR_DWTH/DAMG/ITM1-4  all have a higher value thn  BVR_UPTH = 8
    _can_push_back = !(cs&(CS_PR1|CS_SW1)) || isVal(g.pc.behavior,g.pc.behavior_STAB_UP,g.pc.behavior_STAB_DOWN,g.pc.behavior_DAMAGE,g.pc.behavior_HOLD_ITEM1,g.pc.behavior_HOLD_ITEM2,g.pc.behavior_HOLD_ITEM3,g.pc.behavior_HOLD_ITEM4);
    
    // Proj can only collide when stunTimer is clear, CS_PR1 is clear, CS_SW1 is clear
    if!(cs & (CS_PR1|CS_SW1))
    {
        cs |= CS_PR1;
    }
    
    
    if (_p.type_bits & _p.BIT_FIR1)
    {
        var _clm  = clamp(_p.x, xl,xr-1) - xl;
            _clm  = _clm>>3;
        var _row  = clamp(_p.y, yt,yb-1) - yt;
            _row  = _row>>3;
        //
        var _clm0 = (_row*Slime_CLMS) + _clm;
        if (dg_fire[#_clm0,2]==1) // if tile is flammable
        {
            Ganon3_Fire_update_1a(_clm0,_row);
        }
        
        //aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
        
        _p.hspd  = 0;
        _p.disintegrate_counter = $F2; // 008D,Y = $F2. Start disintegrate
        _p.state = _p.state_EXPLODE;
    }
}


if (_can_push_back)
{
    set_go_hspd_pushbback(id, ($C*_p.facing_dir)&$FF);
}




