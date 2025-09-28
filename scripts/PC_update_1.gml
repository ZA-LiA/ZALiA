/// PC_update_1()


x_prev = x;
y_prev = y;
x_scale_prev = xScale;


SwordHB2_colliding  = noone;
SwordHB2_collidable = false;
SwordHB2_can_draw   = false;

is_fairy = pc_is_fairy();
is_cucco = pc_is_cucco();


// this is set when transforming back to human 
// in a space not tall enough to fit
if (    TransformHumanClipCorrect_timer)
{
        TransformHumanClipCorrect_timer--;
    if(!TransformHumanClipCorrect_timer 
    && !is_cucco )
    {
        cast_spell(SPL_FARY);
    }
}




PC_update_1a(); // set properties specific to PC form(cucco, fairy, Lonk)
hspd_impel = 0;

if (RescueFairy_sprite) aud_play_fairy1();








// ==========================================================================
// =========================  SPAWN  ===============================
// 903A
if (state==state_SPAWN) // 0: ST_SPWN. first frame of spawnning when entering a scene
{
    PC_spawn();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ==========================================================================
// =========================  DROWN  ===============================
if (state==state_DROWN) // OG state 2. Drowning
{
    var _VIEW_CATCH_UP_TESTING = true;
    var _x = x;
    var _y = y+1;
    
    // 93AC
    PC_set_behavior(behavior_DAMAGE);
    
    // 918E
    if (yt >= DrownLiquid_y+($2<<3) 
    ||  yt >= viewYB()-($3<<3) )
    {
        if (f.items&ITM_FRY1 
        &&  f.hp )
        {
            var _PREV_X = x;
            var _PREV_Y = y;
            var _INV_DUR = 2;
            
            /*
            if (instance_exists(Boss) 
            &&  g.view_lock_boss     // if in boss battle
            &&  RescueDropOff_rc<0 ) // Prevent teleporting to spawn during fight. Just in case player has not yet established safe ground after fight start.
            {
                with(Boss) _x = arena_x;
                _y = find_row_solid(TID_SOLID1|TID_ONEWY1, _x>>3,viewYC()>>3, 1,0, viewYC()>>3);
                _y = (_y<<3) - hh_;
                
                iframes_timer = _INV_DUR;
                state = state_NORMAL;
            }
            */
            if (RescueDropOff_solid_inst!=noone)
            {
                if (instance_exists(RescueDropOff_solid_inst))
                {
                    _x  = RescueDropOff_solid_inst.xl + (((RescueDropOff_rc>>0)&$FF)<<3);
                    _x  = clamp(_x, RescueDropOff_solid_inst.xl+8, RescueDropOff_solid_inst.xr-8);
                    _y  = RescueDropOff_solid_inst.yt - hh_;
                    //_y -= 4; // 2025/09/27. Don't remember the reason for this line, but on a narrow moving platform, like in MazIs_8E, the platform will move away before PC lands on it.
                    
                    RescueDropOff_x = _x;
                    RescueDropOff_y = _y;
                    
                    hspd = 0;
                    vspd = 0;
                    iframes_timer = _INV_DUR;
                    
                    if (_VIEW_CATCH_UP_TESTING)
                    {
                        set_xy(id, _PREV_X,_PREV_Y);
                        state = state_RESCUE;
                        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    }
                    else
                    {
                        PC_set_behavior(behavior_IDLE);
                        set_xy(id, _x,_y);
                        set_view_xy_on_pc();
                        state = state_NORMAL;
                    }
                }
            }
            else if (RescueDropOff_rc+1)
            {
                _x  = ((RescueDropOff_rc>>0)&$FF)<<3;
                _x  = (_x>>3)<<3;
                _y  =(((RescueDropOff_rc>>8)&$FF)<<3) - hh_;
                _y  = (_y>>3)<<3;
                set_xy(id, _x,_y);
                
                if(!is_undefined(   RescueDropOff_elevator) 
                &&  instance_exists(RescueDropOff_elevator) )
                {
                    set_xy(RescueDropOff_elevator, RescueDropOff_elevator.x, y);
                    set_xy(id,                     RescueDropOff_elevator.x, y);
                }
                else
                {
                    if(!collide_solid_grid(x-7,yb))              set_xy(id, x+8,y);
                    if(!collide_solid_grid(x+7,yb))              set_xy(id, x-8,y);
                    if (collide_solid_grid(x-7, yt+csLft2_yoff)) set_xy(id, x+8,y);
                    if (collide_solid_grid(x+7, yt+csRgt2_yoff)) set_xy(id, x-8,y);
                }
                
                RescueDropOff_rc = ((yb>>3)<<8) | (x>>3);
                
                RescueDropOff_x = x;
                RescueDropOff_y = y;
                
                hspd = 0;
                vspd = 0;
                iframes_timer = _INV_DUR;
                
                if (_VIEW_CATCH_UP_TESTING)
                {
                    set_xy(id, _PREV_X,_PREV_Y);
                    state = state_RESCUE;
                }
                else
                {
                    PC_set_behavior(behavior_IDLE);
                    set_view_xy_on_pc();
                    state = state_NORMAL;
                }
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            else
            {   // go to spawn
                if (g.view_lock&$3)
                {    _x  = clamp(spawn_x, viewXL(),viewXR()-ww);  }
                else _x  =       spawn_x;
                     _x  = (_x>>3)<<3;
                     _x += sprite_index_xoff;
                //
                if (g.view_lock&$C)
                {    _y  = clamp(spawn_y, viewYT(),viewYB()-hh-($01<<3));  }
                else _y  =       spawn_y;
                     _y  = (_y>>3)<<3;
                     _y += sprite_index_yoff;
                //
                RescueDropOff_x = _x;
                RescueDropOff_y = _y;
                
                hspd = 0;
                vspd = 0;
                iframes_timer = _INV_DUR;
                
                if (_VIEW_CATCH_UP_TESTING)
                {
                    set_xy(id, _PREV_X,_PREV_Y);
                    state = state_RESCUE;
                }
                else
                {
                    PC_set_behavior(behavior_IDLE);
                    set_xy(id, _x,_y);
                    set_view_xy_on_pc();
                    state = state_NORMAL;
                }
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
        else
        {
            is_dead = true;
        }
    }
    
    // 91A1: JMP EBF0
    PC_update_2a(); // GO_update_cam_vars(), usd_pc_1a(), update_swrdXY()
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    set_xy(id, _x,_y);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}























// ==========================================================================
if (state==state_RESCUE)
{
    iframes_timer = 2;
    
    var _diff = 0;
    
    if (RescueDropOff_solid_inst!=noone 
    &&  instance_exists(RescueDropOff_solid_inst) )
    {   // coords are followed here because this could be a moving object/platform
        RescueDropOff_x = RescueDropOff_solid_inst.xl + (((RescueDropOff_rc>>0)&$FF)<<3);
        RescueDropOff_x = clamp(RescueDropOff_x, RescueDropOff_solid_inst.xl+8, RescueDropOff_solid_inst.xr-8);
        RescueDropOff_y = RescueDropOff_solid_inst.yt - hh_;
        //RescueDropOff_solid_inst.x_change
    }
    
    var _DIST_X = abs(x-RescueDropOff_x);
    if (_DIST_X)
    {
        Rescue_move_x += Rescue_SPEED_X * min((_DIST_X/Rescue_DIST1),1.00);
        _diff  = min(floor(Rescue_move_x), _DIST_X);
        _diff *= sign_(x<RescueDropOff_x);
        set_xy(id, x+_diff, y);
        x_change += _diff;
        Rescue_move_x = frac(Rescue_move_x);
    }
    
    var _DIST_Y = abs(y-RescueDropOff_y);
    if (_DIST_Y)
    {
        Rescue_move_y += Rescue_SPEED_Y * min((_DIST_Y/Rescue_DIST1),1.00);
        _diff  = min(floor(Rescue_move_y), _DIST_Y);
        _diff *= sign_(y<RescueDropOff_y);
        set_xy(id, x, y+_diff);
        y_change += _diff;
        Rescue_move_y = frac(Rescue_move_y);
    }
    
    if (x==RescueDropOff_x 
    &&  y==RescueDropOff_y )
    {
        Rescue_move_x = 0;
        Rescue_move_y = 0;
        PC_set_behavior(behavior_IDLE);
        state = state_NORMAL;
    }
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}























// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------


if (state!=state_NORMAL)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ***************************************************************************
// --------------------------  state_NORMAL  -----------------------------------












// ==========================================================================
// =========================  PIPE SINK  ===========================
if (pipe_sink_timer)
{
        pipe_sink_timer--;
    if (pipe_sink_timer)
    {
        set_xy(id, x, y+1);
        PC_set_behavior(behavior_CROUCH);
        depth = g.TILE_DEPTH_MAX_BACK + (TILE_DEPTHS_PAD>>1);
        
        // 92DE: JMP EBF0
        PC_update_2a(); // GO_update_cam_vars(), usd_pc_1a()
    }
    
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}














// ==========================================================================
// =========================  LOCKED  ===========================
if (g.pc_lock==PC_LOCK_ALL)
{
    if (WalkTo_active) walk_pc_to_x(WalkTo_x, WalkTo_hspd_max);
    
    // update hspd_dir, PC_update_cs(), if (cs3()) hspd=0, 
    // update cs, swamp walk, crumble bridge, drown, pushable, exiting
    PC_update_1d();
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // g.lastX, g.lastY, g.lastXScale
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
else
{
    WalkTo_active=false;
}







// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------







if (f.items&ITM_FRY1)
{
    var _clm,_row;
    
    if(!is_undefined(   colliding_elevator) 
    &&  instance_exists(colliding_elevator) )
    {
        if(  RescueDropOff_elevator != colliding_elevator 
        || !(RescueDropOff_rc+1) 
        ||  (RescueDropOff_rc&$FF)  != colliding_elevator.x>>3 )
        {
            _clm = clamp(colliding_elevator.x>>3, ((cam_xl_min()+ww_)>>3)+1, ((cam_xr_max()-ww_)>>3)-1);
            _row = clamp(yb>>3,              ((cam_yt_min()+hh) >>3)+2,  (cam_yb_max()     >>3)-2);
            RescueDropOff_rc = (_row<<8) | _clm;
        }
        
        RescueDropOff_elevator = colliding_elevator;
    }
    else
    {
        RescueDropOff_elevator = noone;
        
        if(!ogr)
        {
            var _C1 = collide_solid_grid(csBtm1X,csBtm1Y);
            var _C2 = collide_solid_grid(csBtm2X,csBtm2Y);
            
            if (_C1 
            ||  _C2 )
            {
                var _CLMS1 = ds_grid_width( g.dg_RmTile_Break_def);
                var _ROWS1 = ds_grid_height(g.dg_RmTile_Break_def);
                var _CLMS2 = ds_grid_width( g.dg_RmTile_TempSolid);
                var _ROWS2 = ds_grid_height(g.dg_RmTile_TempSolid);
                    _clm  = csBtm1X>>3;
                    _row  = csBtm1Y>>3;
                var _clm2 = csBtm2X>>3;
                var _row2 = csBtm2Y>>3;
                if(!isVal(g.dg_RmTile_Break_def[#clamp(_clm, 0,_CLMS1) ,clamp(_row, 0,_ROWS1)]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4) 
                && !isVal(g.dg_RmTile_Break_def[#clamp(_clm2,0,_CLMS1) ,clamp(_row2,0,_ROWS1)]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4) 
                &&       !g.dg_RmTile_TempSolid[#clamp(_clm, 0,_CLMS2) ,clamp(_row, 0,_ROWS2)]&$FF 
                &&       !g.dg_RmTile_TempSolid[#clamp(_clm2,0,_CLMS2) ,clamp(_row2,0,_ROWS2)]&$FF )
                {
                         if (_C1 && _C2) _clm =       x>>3;
                    else if (_C1)        _clm = csBtm1X>>3;
                    else                 _clm = csBtm2X>>3;
                    _clm = clamp(_clm,    ((cam_xl_min()+ww_)>>3)+1,   ((cam_xr_max()-ww_)>>3)-1);
                    _row = clamp(yb>>3,   ((cam_yt_min()+hh) >>3)+0,    (cam_yb_max()     >>3)-1);
                    RescueDropOff_rc = (_row<<8) | _clm;
                }
                
                RescueDropOff_solid_inst = noone;
            }
            else
            {
                if(!is_undefined(   cs_btm_inst) 
                &&  instance_exists(cs_btm_inst) 
                &&                  cs_btm_inst.solid_type )
                {
                    RescueDropOff_solid_inst = cs_btm_inst;
                    _clm  = clamp(x>>3, (cs_btm_inst.xl>>3)+1, (cs_btm_inst.xr>>3)-1);
                    _clm -= cs_btm_inst.xl>>3
                    _row  = csBtm1Y>>3;
                    RescueDropOff_rc = (_row<<8) | _clm;
                }
            }
        }
    }
    
    
    if (g.view_lock_boss) // if in boss battle
    {
        if (RescueDropOff_rc<0)
        {
            _clm = g.rm_w_ >>3;
            _row = viewYC()>>3;
            with(Boss) _clm = arena_x>>3;
        }
        else
        {
            _clm = (RescueDropOff_rc>>0)&$FF;
            _row = (RescueDropOff_rc>>8)&$FF;
        }
        
        with(Boss) _clm = clamp(_clm,   ((arena_xl+other.ww_)>>3)+1,   ((arena_xr-other.ww_)>>3)-1);
        _clm = clamp(_clm,   ((cam_xl_min()+ww_)>>3)+1,   ((cam_xr_max()-ww_)>>3)-1);
        _row = clamp(_row,   ((cam_yt_min()+hh) >>3)+0,    (cam_yb_max()     >>3)-1);
        RescueDropOff_rc = (_row<<8) | _clm;
    }
}
else
{
    RescueDropOff_rc = -1;
    RescueDropOff_elevator   = noone;
    RescueDropOff_solid_inst = noone;
}











/*
// ==========================================================================
// =======================  ENTER ROOM WALK  =========================
// *** Tried moving this here, but was unable to move horizontally for some reason..
// 9381: JSR 93BC
if (g.tmr_enter_rm_control) // Entering room
{
    if(!colliding_elevator) // MOD
    {
        // 93C1
        hspd = ($10 * -sign_(x>g.rm_w_)) &$FF;
        
        hspd_impel = byte_dir(hspd);
        
        // 93CA: JMP 943A, 943A: JSR 9610
        if(!cs3() 
        || !ocsH3(id) ) // if ALL width is w/in ocs area width
        {
            update_pc_1b(); // updateX(). MOD
        }
        // update_pc_1b(); // updateX(). og
        
        // 943D
        PC_update_walk();
    }
    
    
    // 9384 JSR: 94C5
    PC_update_vertical();
    
    // 938A
    update_pc_1d(); // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
    
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/
















// ==========================================================================
// =========================  HOLD ITEM  ===========================
// MOD. This has been moved from its OG spot between FAIRY & STUNNED update.
if (HoldItem_timer 
&& !is_fairy )
//if (HoldItem_timer && Sound.songPlaying) // OG
{
    if (g.mod_SKIP_HOLD_ITEM)
    {
        HoldItem_timer = 0;
    }
    else
    {
        PC_update_hold_item();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}













// ==========================================================================
// ===========================  CUCCO  =============================
if (is_cucco 
&& !g.EnterRoom_control_timer )
{
    var _i, _x,_y, _val;
    var _inst;
    
    // 9379, 95B5
    Input.hHeld = Input.heldH;        // held right $1 or left $2
    Input.vHeld = Input.heldV;        // held down  $4 or up   $8
    Input.cPres = Input.pressedC;     // pressed b $40 and/or a $80
    Input.dHeld = Input.Down_held!=0; // 0: down NOT held, 1: down held
    
         if (Input.hHeld==Input.R) xScale =  1;
    else if (Input.hHeld==Input.L) xScale = -1;
    
    
    PC_update_stab_frenzy_1();
    
    
    Cucco_crouching_state = 0;
    var _C1 = Input.dHeld  // down is held
           && !ogr         // is on ground
           &&  cs&$4       // CS_BTM colliding w/ solid
           && (!Disguise_enabled || global.Halloween1_enabled);
    var _C2 =  cs&$4 
           &&  cs&$8       // Both CS_BTM && CS_TOP colliding w/ solid (Cucco is in 1 tile high space)
           && (!Disguise_enabled || global.Halloween1_enabled);
    //
    if (_C1 
    ||  _C2 )
    {
        if (g.DevDash_state==2) hspd_max = Cucco_HSPD_MAX2_DASH;
        else                    hspd_max = Cucco_HSPD_MAX2;
    }
    else
    {
        if (g.DevDash_state==2) hspd_max = Cucco_HSPD_MAX1_DASH;
        else                    hspd_max = Cucco_HSPD_MAX1;
    }
    
    if (_C1 
    ||  _C2 )
    {
        cs_off_idx = Cucco_CS_OFF_IDX2;
    }
    
    
    if (_C1 
    ||  _C2 )
    {
        Cucco_crouching_state = 1 + ((_C1 && hspd) || _C2); // 1,2
    }
    else
    {
        Cucco_crouching_state = 0;
    }
    
    
    if (stun_timer)
    {   // 9370
        PC_update_vertical();
        
        // 9373: JSR 93A3
        if!(cs&$3)
        {   // 93A9: JSR 943A, 943A: JSR 9610
            PC_update_1b(); // updateX()
            PC_update_walk();
        }
        
        // 93AC
        PC_set_behavior(behavior_DAMAGE);
        
        // 938A
        PC_update_1d(); // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
        
        PC_update_hitboxes_1a(); // body, shield, sword
        PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
        
        StabFrenzy_charge_counter = 0;
    }
    else
    {
        // 95DC. Start attack.
        PC_update_attack_1();
        
        // 93CD
        PC_update_horizontal();
        
        if (_C1 
        ||  _C2 )
        {
            PC_set_behavior(behavior_CROUCH);
        }
        
        // 9384 JSR: 94C5
        PC_update_vertical();
        
        // 9387 JSR: 9483
        PC_update_attack_2();
        
        
        if (attack_phase>2) attack_phase = 0;
        
        
        
        // ----------------------------------------------------------------
        // 938A
        // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
        // update cs, swamp walk, crumble bridge, drown, pushable, exiting
        PC_update_1d();
        
        // ----------------------------------------------------------------
        PC_update_hitboxes_1a(); // body, shield, sword
        
        // ----------------------------------------------------------------
        PC_cucco_fury_update();
        
        // ----------------------------------------------------------------
        PC_update_1e();          // update g.lastX, g.lastY, g.lastXScale
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

/*
if (stun_timer) // Stunned
{   // 9370
    PC_update_vertical();
    
    // 9373: JSR 93A3
    if(!cs3())
    {   // 93A9: JSR 943A, 943A: JSR 9610
        PC_update_1b(); // updateX()
        PC_update_walk();
    }
    
    // 93AC
    //PC_set_behavior(behavior_DAMAGE);
    if(!is_cucco) PC_set_behavior(behavior_DAMAGE);
    
    // 938A
    PC_update_1d(); // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    
    StabFrenzy_charge_counter = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/










// ==========================================================================
// ===========================  FAIRY  =============================
// 92F6 
if (is_fairy) // 0013
{   // 92FB
    aud_play_fairy1();
    
    Input.vHeld        = Input.heldV;
    hspd               = 0;
    xScale             = 1;
    SwordHB_collidable = false;
    HoldItem_timer     = 0;
    
    // 930A
    if ( Input.heldHV 
    && !(Input.heldHV & colliding_locked_door) ) // Stops fairy from moving through lock
    {   // 931E
        hspd_impel = bit_dir(Input.heldH);
        vspd_impel = bit_dir(Input.heldV);
        
        if (Input.heldH) hspd_dir = hspd_impel;
        if (Input.heldV) vspd_dir = vspd_impel;
        
        hspd = (HSPD_FAIRY*hspd_impel) &$FF;
        vspd = (VSPD_FAIRY*vspd_impel) &$FF;
        
        
        PC_update_1c(); // update cs, swamp walk, crumble bridge, drown, pushable, exiting
        
        
        // 932C
        var _cs  = cs;
        if (y-8 <= viewYT() 
        && !is_undefined(   colliding_elevator) 
        &&  instance_exists(colliding_elevator) )
        {   _cs |= CS_TOP;  }
        
        if!(_cs & Input.held)
        {   // 933A: JSR 9610
            PC_update_1b(); // updateX()
            if (is_undefined(   colliding_elevator) 
            || !instance_exists(colliding_elevator) )
            {
                updateY();
            }
        }
    }
    
    
    updateCSPoints(); // MOD. So cs will be acurate and draw even when not moving
    
    BodyHB_can_draw = true;
    PC_update_body_offsets();
    update_body_hb();
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}











// ==========================================================================
// ===========================  STUNNED  =============================
// 936B
if (stun_timer) // Stunned
{   // 9370
    PC_update_vertical();
    
    // 9373: JSR 93A3
    if!(cs&$3)
    {   // 93A9: JSR 943A, 943A: JSR 9610
        PC_update_1b(); // updateX()
        PC_update_walk();
    }
    
    // 93AC
    PC_set_behavior(behavior_DAMAGE);
    
    // 938A
    PC_update_1d(); // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    
    StabFrenzy_charge_counter = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}











// ==========================================================================
// ========================  ENTER ROOM WALK  ========================
// 9381: JSR 93BC
if (g.EnterRoom_control_timer) // Entering room
{
    if (is_undefined(   colliding_elevator) 
    || !instance_exists(colliding_elevator) )
    {   // 93C1
        hspd = ($10 * -sign_(x>g.rm_w_)) &$FF;
        
        hspd_impel = byte_dir(hspd);
        
        // 93CA: JMP 943A, 943A: JSR 9610
        if(!(cs&$3) 
        || !ocsH3(id) ) // if ALL width is w/in ocs area width
        {
            PC_update_1b(); // updateX(). MOD
        }
        //update_pc_1b(); // updateX(). OG
        
        // 943D
        PC_update_walk();
    }
    
    
    // 9384 JSR: 94C5
    PC_update_vertical();
    
    // 938A
    PC_update_1d(); // update hspd_dir, PC_update_cs(), if (cs3()) hspd = 0;
    
    PC_update_hitboxes_1a(); // body, shield, sword
    PC_update_1e(); // update g.lastX, g.lastY, g.lastXScale
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


























// ==========================================================================
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// 9379, 95B5
Input.hHeld = Input.heldH;        // held right $1 or left $2
Input.vHeld = Input.heldV;        // held down  $4 or up   $8
Input.cPres = Input.pressedC;     // pressed b $40 and/or a $80
Input.dHeld = Input.Down_held!=0; // 0: down NOT held, 1: down held

     if (Input.hHeld==Input.R) xScale =  1;
else if (Input.hHeld==Input.L) xScale = -1;


// ----------------------------------------------------------------
// 937E: JSR 959C
if (attack_phase==4) // 4: drawback after stab
{
    if (g.mod_StabFrenzy 
    &&  StabFrenzy_charge_counter>$80 
    &&  Input.Attack_held )
    {    var _INPUTS = Input.A|Input.D;  }
    else var _INPUTS = Input.A|Input.R|Input.L|Input.D;
    
    if (Input.held & _INPUTS)
    {   // 95A9
        attack_phase = 0;
        if(!ogr) hspd = 0;
    }
}


PC_update_stab_frenzy_1();
// 95DC. Start attack.
PC_update_attack_1();





// ----------------------------------------------------------------
// 93CD
PC_update_horizontal();
// 9384 JSR: 94C5
PC_update_vertical();



// ----------------------------------------------------------------
// 9387 JSR: 9483
PC_update_attack_2();


// ----------------------------------------------------------------
// 938A
// update hspd_dir, PC_update_cs(), if (cs3()) hspd=0, 
// update cs, swamp walk, crumble bridge, drown, pushable, exiting
PC_update_1d();


PC_update_hitboxes_1a(); // body, shield, sword
PC_update_1e();          // update g.lastX, g.lastY, g.lastXScale




