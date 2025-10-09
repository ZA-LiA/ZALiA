/// Ganon1_update_battle_2a()


update_body_hb_1a();
if(!pc_is_inside 
&&  global.pc.csRgt2Y>yt )
{
    if (rectInRect(xl,yt,ww,hh, PC_HB1_xl,PC_HB1_yt,PC_HB1_W,PC_HB1_H) )
    {
        var _qual = false;
        if (((arena_w>>1)-abs(x-arena_x))-ww_ < PC_HB1_W  // distance between ganon edge and arena edge < pc hb w
        &&  hINh(yt,hh, global.pc.csLft1Y,global.pc.csLft2Y-global.pc.csLft1Y) 
        &&  (PC_HB1_xl<arena_xl || PC_HB1_xl+PC_HB1_W>arena_xr) )
        {   // crush pc against arena wall
            _qual = true;
        }
        else
        {
            if (vspd 
            &&  vspd<$80  // if moving downward
            &&  y>y_prev )
            //&& !global.pc.ogr 
            //&&  yb+(y_prev-y)<=PC_HB1_yt+(global.pc.y_prev-global.pc.y) ) // if ganon prev yb <= pc prev hb yt
            {   // fall onto pc
                _qual = true;
            }
        }
        
        if (_qual)
        {
            PC_take_damage(id);
            pc_is_inside = true;
        }
    }
}




/*
/// Ganon1_update_battle_2a()


update_body_hb_1a();
if(!pc_is_inside 
&&  GO_can_collide_this_frame(update_idx) 
//&& !stun_timer 
//&& !global.pc.iframes_timer 
&&  global.pc.csRgt2Y>yt )
{
    var _Y = global.pc.csTop1Y;
    //var _Y=global.pc.csLft1Y;
    //var _Y=global.pc.yt+6;
    if (rectInRect(xl,yt,ww,hh, global.pc.csLft1X,_Y,global.pc.csRgt1X-global.pc.csLft1X,global.pc.csBtm1Y-_Y))
    //if (hINh(_Y,global.pc.csBtm1Y-_Y, yt,hh) 
    {
        var _qual = false;
        if (((arena_w>>1)-abs(x-arena_x))-ww_ < global.pc.csRgt1X-global.pc.csLft1X 
        &&  hINh(yt,hh, global.pc.csLft1Y,global.pc.csLft2Y-global.pc.csLft1Y) )
        {
            if (global.pc.csLft1X<arena_xl 
            ||  global.pc.csRgt1X>arena_xr )
            {
                _qual = true;
            }
            //if (rectInRect(xl,ww,yt,hh, global.pc.csLft1X,global.pc.csRgt1X-global.pc.csLft1X,global.pc.csLft1Y,global.pc.csLft2Y-global.pc.csLft1Y))
        }
        else
        {
            if (vspd<$80 
            &&  vspd 
            //if (sign(vspd&$7F) 
            &&  yb>_Y 
            &&  global.pc.csBtm1Y>=Ground_y 
            && !global.pc.ogr )
            //if (Ground_y-yb < global.pc.csBtm1Y-_Y 
            //&&  global.pc.csBtm1Y>=Ground_y )
            {
                _qual = true;
            }
        }
        
        if (_qual)
        {
            PC_take_damage(id);
            
            if (rectInRect(xl,yt,ww,hh, global.pc.csLft1X,_Y,global.pc.csRgt1X-global.pc.csLft1X,global.pc.csBtm1Y-_Y))
            {
                pc_is_inside = true;
            }
        }
    }
}
*/




