/// GO_update_cs()


var _IS_PC = id==global.pc;

var         _HSPD_DIR = -sign_(hspd&$80);
if (_IS_PC) _HSPD_DIR = hspd_dir;


updateCSPoints();
                                     cs &= $F0;
if (_IS_PC)                          cs  = $00;

    if (csTopColliding()&TID_SOLID1) cs |= CS_TOP;    // Include Top
    if (csBtmColliding_1a())         cs |= CS_BTM;    // Include Bottom
if (_HSPD_DIR)
{   if (csRgtColliding()&TID_SOLID1) cs |= CS_RGT;  } // Include Right
else
{   if (csLftColliding()&TID_SOLID1) cs |= CS_LFT;  } // Include Left






if (_IS_PC 
&& !(cs&$3) 
&& !pc_is_cucco() )
{   // TODO: Do this for all GO?
    if (_HSPD_DIR)
    {
        var _VAL = inst_collide_solid_type(id,csRgt1X,csRgt1Y+$08) | inst_collide_solid_type(id,csRgt2X,csRgt1Y+$10);
        if (_VAL&TID_SOLID1) cs |= CS_RGT;
    }
    else
    {
        var _VAL = inst_collide_solid_type(id,csLft1X,csLft1Y+$08) | inst_collide_solid_type(id,csLft2X,csLft1Y+$10);
        if (_VAL&TID_SOLID1) cs |= CS_LFT;
    }
}


if (_IS_PC 
&&  g.view_lock_boss 
&& !g.EnterRoom_control_timer )
{
    var                      _cs  = 0;
    if (csRgt1X >= viewXR()) _cs |= CS_RGT;
    if (csLft1X <  viewXL()) _cs |= CS_LFT;
    if (csBtm1Y >= viewYB()) _cs |= CS_BTM;
    if (csTop1Y <  viewYT()) _cs |= CS_TOP;
    
        _cs &= g.view_lock_boss; // cam_lock: 0, bits 1,2,4,8
    if (_cs)
    {
        // When cam is locked, cs treats the edges of screen as solid
        if (_cs&(CS_RGT|CS_LFT)==dir8b(hspd_dir)) cs |= _cs&(CS_RGT|CS_LFT);
        if (_cs&CS_TOP && vspd&$80)               cs |= CS_TOP;
        // if (_cs&CS_BTM) // Don't know what should happen for bottom
    }
}


// So that player cannot get on top or under a rm by elevator.
if (_IS_PC 
&&  (yt<0 || yb>g.rm_h) 
&& !is_undefined(   colliding_elevator) 
&&  instance_exists(colliding_elevator) )
{
    var _Y1 = g.rm_h-1;
    if (_HSPD_DIR)
    {
        csRgt1Y = clamp(csRgt1Y, 0,_Y1);
        csRgt2Y = clamp(csRgt2Y, 0,_Y1);
        if (csRgtColliding()&TID_SOLID1) cs |= CS_RGT; // Include Right
    }
    else
    {
        csLft1Y = clamp(csLft1Y, 0,_Y1);
        csLft2Y = clamp(csLft2Y, 0,_Y1);
        if (csLftColliding()&TID_SOLID1) cs |= CS_LFT; // Include Left
    }
    
    updateCSPoints();
}


if (_IS_PC 
&&  instance_exists(Ganon1) 
&& !Ganon1.pc_is_inside )
{
    var _G_XL = Ganon1.xl;
    var _G_YT = Ganon1.yt;
    var _G_W  = Ganon1.ww;
    var _G_H  = Ganon1.hh;
    if (_HSPD_DIR){if (point_in_rect(csRgt1X,csRgt1Y, _G_XL,_G_YT,_G_W,_G_H) || point_in_rect(csRgt2X,csRgt2Y, _G_XL,_G_YT,_G_W,_G_H)) cs |= CS_RGT;}
    else           if (point_in_rect(csLft1X,csLft1Y, _G_XL,_G_YT,_G_W,_G_H) || point_in_rect(csLft2X,csLft2Y, _G_XL,_G_YT,_G_W,_G_H)) cs |= CS_LFT;
    
    if (point_in_rect(csTop1X,csTop1Y, _G_XL,_G_YT,_G_W,_G_H) || point_in_rect(csTop2X,csTop2Y, _G_XL,_G_YT,_G_W,_G_H)) cs |= CS_TOP;
    
    if (csBtm1Y<=_G_YT+2)
    {
        if (point_in_rect(csBtm1X,csBtm1Y, _G_XL,_G_YT,_G_W,_G_H) || point_in_rect(csBtm2X,csBtm2Y, _G_XL,_G_YT,_G_W,_G_H)) cs |= CS_BTM;
    }
}




