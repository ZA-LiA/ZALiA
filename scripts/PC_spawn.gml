/// PC_spawn()

// Spawn frame. When state==state_SPAWN


var _i, _a;
var _clm,_row;

var _side      = g.exit_enter.side;
var _exit_type = g.exit_enter.exit_type;

var _ON_ELEVATOR = is_exit_type(_exit_type, g.EXIT_TYPE_ELEVATOR);



     if (_ON_ELEVATOR) g.EnterRoom_control_timer = g.EnterRoom_DURATION_ELEV;
else if (_side&$3)     g.EnterRoom_control_timer = g.EnterRoom_DURATION_SIDE;
else if (_side&$C)     g.EnterRoom_control_timer = 0;
else                   g.EnterRoom_control_timer = g.EnterRoom_DURATION_DOOR;


set_pc_spawn_xy();


// The default spawn_yt for entering a room from a 
// Pit-Up Exit is too low for some rooms that have 
// solid tiles high up, this adjusts for that.
if (_side&$8 
&& !_ON_ELEVATOR )
{   // When coming from a Pit-up exit
    updateCSPoints();
    if (collide_solid_grid(csBtm1X,csBtm1Y) 
    ||  collide_solid_grid(csBtm2X,csBtm2Y) )
    {
        var _ROW = min(find_row_solid(0,csBtm1X>>3,csBtm1Y>>3,-1), find_row_solid(0,csBtm2X>>3,csBtm2Y>>3,-1));
        spawn_yt  = (_ROW+1)<<3;
        spawn_yt -= hh;
    }
}




/*
// 908F
if (_side&$3)
{
    var _xx, _yy, _limit;
    var _x1, _y1, _x2, _y2, _y3, _y4;
    _xx    = _x;
    _yy    = $C0; // start at bottom & work way up until finding solid
    _limit = $10;
    
    // 9094: JSR E030
    // _yy = $AF; // og value
    
    // Make sure first that there's solid ground under your feet!
    while (_yy >= _limit)
    {
        _x1 = _xx + csBot1X_Offset; // 
        _y1 = _yy + csBot1Y_Offset; // 
        _x2 = _xx + csBot3X_Offset; // 
        _y2 = _yy + csBot3Y_Offset; // 
        _y3 = _y1 - 8;
        _y4 = _y2 - 8;
        
        // returns 0 or a combo of the 1st & 2nd bits. 0,1,2,3
        if (    (collideSolidPoint(_x1, _y1) | collideSolidPoint(_x2, _y2)) 
        &&     !(collideSolidPoint(_x1, _y3) | collideSolidPoint(_x2, _y4)) )
        {
            _y  = _yy - hh; // set on top of solid
            break;
        }
        
        _yy -= 8;
    }
}
*/





depth = depth_def;

set_xlyt(id, spawn_xl,spawn_yt); // current sprite_index is spr_Placement_32x32


     if (_side&$3==$1) xScale = -1; // right exit
else if (_side&$3==$2) xScale =  1; // left exit
else if (_ON_ELEVATOR) xScale = g.last_pc_xscale; // MOD
else                   xScale = sign_(x - (g.exit_enter.xl + (g.exit_enter.ww>>1)));
//else                   xScale = signBin(-sign((x-cam_xl_min()) - (cam_x_range()>>1)));



_clm = clamp(x >>3, ((cam_xl_min()+ww_)>>3)+1, ((cam_xr_max()-ww_)>>3)-1);
_row = clamp(yb>>3, ((cam_yt_min()+hh) >>3)+2,  (cam_yb_max()     >>3)-2);
RescueDropOff_rc = (_row<<8) | _clm;
RescueDropOff_elevator   = noone;
RescueDropOff_solid_inst = noone;

RmEnter_elevator         = noone;

if (_ON_ELEVATOR)
{
    with(Elevator)
    {
        if (collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h))
        {
            with(global.pc)
            {
                RmEnter_elevator       = other;
                RescueDropOff_elevator = other;
            }
            break; // with(Elevator)
        }
    }
}





Input.cPres  = 0; // Attack or Jump button pressed
Input.hHeld  = 0;
Input.dHeld  = 0;
Input.held_0 = Input.held;


PC_set_behavior(behavior_IDLE);
attack_phase = 0;
Cucco_crouching_state = 0;


hspd           = 0;
hspd_dir       = xScale; // hspd_dir 005F
hspd_dir_spawn = hspd_dir;

vspd           = 0;
vspd_dir       = 1;
vspd_dir_spawn = vspd_dir;


draw_xoff = 0;
draw_yoff = 0;
update_draw_xy();


ocs = 0;
GO_update_cam_vars(); // 00CC, 00C8
setCSOffsets();
PC_update_hitboxes_1a();


state = state_NORMAL;



if (DEV) sdm(" PC_spawn()  "+"spawn_xl $"+hex_str(spawn_xl)+", spawn_yt $"+hex_str(spawn_yt));




