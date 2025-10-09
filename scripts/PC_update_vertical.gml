/// PC_update_vertical()


// 94C5
if(!is_undefined(   colliding_elevator) 
&&  instance_exists(colliding_elevator) )
{
    with(colliding_elevator) Elevator_update_1();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ----------------------------------------------------------------
// ----------------------------------------------------------------
// keep backups
var _cs4_COPY  = cs&$4;
var _vspd_COPY = vspd;
var _ogr_COPY  = ogr; // ogr: Off Ground Reason

var _C1 = !HoldItem_timer && !g.EnterRoom_control_timer;

//if (Input.Jump_pressed) sdm("Input.Jump_pressed. cs $"+hex_str(cs)+", vspd $"+hex_str(vspd)+", ogr "+string(ogr)+", _C1 "+string(_C1)+", g.pc_lock $"+hex_str(g.pc_lock));

// 94CA
if (cs&$4)
{
    var _is_landing = false;
    
    // 94DA
    if (ogr 
    &&  vspd<$80 ) // if NOT moving upwards
    {   // 94E4.  LANDING
        _is_landing   = true;
        landing_timer = LANDING_DURATION * (vspd>=TERMINAL_VELOCITY); // LANDING_DUR = 8
        //aud_play_sound(snd_Castlevania2_PCLand);
        
        ogr          = 0;
        vspd         = 0;
        attack_phase = 0;
        
        if(!is_undefined(   cs_btm_inst) 
        &&  instance_exists(cs_btm_inst) 
        &&                  cs_btm_inst.solid_type 
        &&                  cs_btm_inst.hspd )
        {   // Attempt to prevent landing-slide when PC 
            // and cs_btm_inst both have momentum..
            var _HSPD = cs_btm_inst.hspd;
                _HSPD = max(abs8b(_HSPD)-4, min(_HSPD,4));
                _HSPD = (_HSPD*byte_dir(cs_btm_inst.hspd)) &$FF;
            //
            hspd += byte_negate(_HSPD);
            hspd &= $FF;
            hspd  = byte_to_int(hspd);
            hspd  = clamp(hspd, -hspd_max,hspd_max);
            hspd &= $FF;
            hspd_dir = byte_dir(hspd);
        }
    }
    
    
    if (_vspd_COPY<$80) // if NOT moving upwards
    {
        jump_tokens = 1;
        if (g.DoubleJump_state 
        &&  f.items&ITM_FTHR )
        {
            jump_tokens++;
        }
        
        // 94F8
        solid_clip_correction(_is_landing);
        
        // 94FE.  JUMP! ---------------------------
        if (_C1) PC_set_jump(_is_landing);
    }
}
else if(!ogr)
{   // PC is not on solid but has not jumped
    ogr = OGR_OTHR;
    
    jump_tokens = 0;
    if (g.DoubleJump_state 
    &&  f.items&ITM_FTHR )
    {
        jump_tokens++;
    }
}
else if (_C1) // !HoldItem_timer && !g.EnterRoom_control_timer
{
    if (ogr==OGR_OTHR 
    ||  ogr==OGR_JUMP )
    {   // Can jump again if have double jump
        PC_set_jump(0);
    }
}










// ------------------------------------------------------------

// I think the only scenario that's excluded here is 
// the frame ogr is set to OGR_OTHR.
// It is possible for cs4()==true while moving upward
var _C2 = (_ogr_COPY && _vspd_COPY&$80)  // is off ground && moving up
       ||   ogr==OGR_JUMP                // is off ground bc of jumping
       || !_cs4_COPY;                    // btm NOT colliding with solid
//
var _QUAL_DOWNTHRUST =  Input.dHeld 
                    &&  f.skills&SKILL_THD 
                    && !(g.pc_lock&PC_LOCK_ATK3) 
                    && !Disguise_enabled 
                    && (!is_cucco || f.Cucco_skills&f.CuccoSkill_THRUST_D);
//
if (_C2)
{   // 952D.  *** NOTE: Don't use _vspd_COPY beyond here
    var                                     _grav_add = GRAVITY2; // $48
    if (Input.Jump_held && vspd&$80 && _C1) _grav_add = GRAVITY1; // $30
    
    // 9544
    // In OG, it is possible to get csTop to collide w/ solid 
    // tiles above the screen if (yy <= -$11). The cs check sees yy as $EF
    // and thinks csTop is colliding w/ solid tiles at the screen bottom.
    // It does not bother checking what the vertical map page is.
    if (vspd&$80 
    &&  cs&$8 )
    {   // 954F
        if (vspd != $FF) // if vspd < $FF (if moving up faster than -1)
        {
            vspd  = $FF;
            vspd_grav = 0;
        }
        
        // This is just to update vspd_grav and vspd to get vspd from $FF to $00
        vspd_grav += _grav_add;
        vspd      += (vspd_grav>$FF);
        
        vspd_grav &= $FF;
        vspd      &= $FF;
    }
    else
    {
        var           _term_vel = TERMINAL_VELOCITY;
        if (is_cucco) _term_vel = 3;
        
        if (is_cucco 
        &&  vspd<$80 )
        {
            //if (Input.GP_Shoulder2L_held) _term_vel = TERMINAL_VELOCITY-1; // Testing faster cucco fall
            _grav_add = GRAVITY1; // GRAVITY1=$30
            
            if (stun_timer)
            {
                //_grav_add = GRAVITY2; // GRAVITY2=$48
            }
            
            if (Input.Jump_held 
            && !stun_timer 
            //&& (!Cucco_STUNNED_BEHAVIOR || !stun_timer) 
            && !_QUAL_DOWNTHRUST 
            && (!Disguise_enabled || global.Halloween1_enabled) 
            &&  _C1   // !HoldItem_timer && !g.EnterRoom_control_timer
            && !(g.pc_lock&PC_LOCK_FLOT) )
            {
                Cucco_is_slowfalling = 1;
                
                if ( vspd>1 
                &&   vspd_prev>1    // vspd_prev is the amount vspd changed y last frame
                &&   vspd_prev<$80 )
                {    vspd =  vspd_prev-1;  } // slow down
                else vspd = !vspd_prev;      // 0 or 1 (1 pixel every other frame)
            }
            else
            {
                Cucco_counter2 = $11; // set at $11 to make first flap of slowfall and jump quick
            }
        }
        
        
        if (is_cucco 
        && !stun_timer 
        //&& (!Cucco_STUNNED_BEHAVIOR || !stun_timer) 
        &&  Input.Jump_released    // jump button released this frame
        &&  Cucco_is_slowfalling_prev )
        {   // Prevent a sudden drop motion after releasing jump button
            if (vspd_prev)
            {
                vspd = 0;
                vspd_grav = $100-_grav_add;
            }
            else
            {
                vspd = 1;
                vspd_grav = 0;
            }
        }
        
        
        vspd_prev = vspd;
        
        // 9569: JSR D19B
        if!(g.pc_lock&PC_LOCK_VSPD) // $4: vspd
        {
            updateY2(_grav_add, _term_vel);
        }
        
        
        
        // TODO: Anticipate solid pixels that could change. ------------------------
        
        // Prevent view from moving too much or stuttering.
        // If yt is changed in solid_clip_adj() next frame, 
        // view position will have issues.
        // This tries to anticipate if solid_clip_adj() will be 
        // ran next frame and adjusts y_change for the diff.
        
        // *** It's impossible to know for sure if solid_clip_adj() 
        // will be run next frame because you can't predict the 
        // player's input. It's unlikely, but possible what 
        // pixels are solid next frame will be different from 
        // what is checked here.
        
        // TODO: Anticipate solid pixels that could change.
        //      1. A tile animating to become solid later this frame.
        //          1. Check Challenge_IntermittentPlatformSequence
        //      2. A solid obj moving vertically
        //      3. A solid obj moving horizontally moves away or under pc
        //      4. 
        if (y_change!=0 
        &&  vspd<$80 )
        {
            if(!(g.view_lock&$C) 
            &&  cam_yt_range() )
            {
                updateCSPoints();
                if (csBtmColliding_1a())
                {
                    var          _Y=y;
                    y_change += solid_clip_correction(true); // This is just to get diff, yy put back after
                    set_xy(id, x,_Y);
                }
            }
        }
    }
}








if(!ogr)        // is on ground
//||  vspd&$80 )  // if moving upwards
{
    drop_y = y;
}







// ------------------------------------------------------------
/*
var _C1 = !HoldItem_timer && !g.EnterRoom_control_timer;
var _C2 = (_ogr_COPY && _vspd_COPY&$80)  // is off ground && moving up
       ||   ogr==OGR_JUMP                // is off ground bc of jumping
       || !_cs4_COPY;                    // btm NOT colliding with solid
*/
if (_C1 
&&  _C2 )
{   // 956C
    if (ogr!=OGR_OTHR)
    {
        if (vspd&$80)
        {
            if (Input.Up_held 
            &&  f.skills&SKILL_THU 
            && !(g.pc_lock&PC_LOCK_ATK4) 
            && !Disguise_enabled 
            && (!is_cucco || f.Cucco_skills&f.CuccoSkill_THRUST_U) )
            {   // Tested it. Can't upthrust if ogr==OGR_OTHR, even when vspd<0
                 PC_set_behavior(behavior_STAB_UP);
            }
            else PC_set_behavior(behavior_CROUCH);
        }
        else     PC_set_behavior(behavior_WALK3);
    }
    
    // 958C
    if (_QUAL_DOWNTHRUST)
    {            PC_set_behavior(behavior_STAB_DOWN);  }
}




