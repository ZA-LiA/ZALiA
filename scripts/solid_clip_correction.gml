/// solid_clip_correction(is landing)


var _y_PREV = y;



if(!is_undefined(   cs_btm_inst) 
&&  instance_exists(cs_btm_inst) )
//&&  csBtm1Y < cs_btm_inst.bodyY+8 )
//&&  vspd<$80 )
//&& (vspd || argument0) )
{
    var _y  = y;
    switch(3) // Not sure yet the right way to do this
    //switch(1) // Not sure yet the right way to do this
    {
        case 1:{
        _y  = cs_btm_inst.BodyHB_yt-hh_; 
        break;}
        
        case 2:{
        _y  = csBtm1Y-cs_btm_inst.yt;
        _y  = (_y>>3)<<3;
        _y  = cs_btm_inst.yt+_y;
        _y  = max(_y, cs_btm_inst.BodyHB_yt);
        _y -= hh_;
        break;}
        
        case 3:{
        if (csBtm1Y < cs_btm_inst.BodyHB_yt+8)
        {   _y = cs_btm_inst.BodyHB_yt-hh_;  }
        break;}
    }
    
    set_xy(id, x,_y);
    updateCSPoints();
    
    return y-_y_PREV;
}




updateCSPoints();




var _CS_Y = csBtm1Y;
var _Y1   = _CS_Y-1;

if!(_Y1+1) // Not in solids grid.
{
    return y-_y_PREV;
}




var _X0 = (global.dg_solid_w<<3)-1;         // last x pixel of solid grid area
var _X1 = clamp(csBtm1X,0,_X0); // clamp in case csBtm1X outside of solid grid
var _X2 = clamp(csBtm2X,0,_X0); // clamp in case csBtm2X outside of solid grid

//var _Y1 = csBtm1Y-1;

if(!(global.dg_solid[#_X1>>3,_Y1>>3]&$FF) 
&& !(global.dg_solid[#_X2>>3,_Y1>>3]&$FF) )
{
    return y-_y_PREV;
}




// --------------------------------------------------------------------------------------------------
if (csBtm1Y>>3 >= 0 
&&  csBtm1Y>>3 < global.dg_solid_h )
{
    var _C1 = csBtm1Y&$7; // amount UNaligned w/ grid
    
    if (_C1       // is NOT aligned w/ grid
    ||  csBtm1Y ) // Must be at least 1 to avoid 'out of bounds' ds grid warning.
    {
        
        if(!_C1         // if aligned w/ grid
        && !argument0 ) // if NOT landing
        {   // Added 2022/05/18. Prevent GO from zooming upward with clip adj when pushed back into wall.
            return y-_y_PREV;
        }
        
        
        
        
        // -------------------------------------------------
        // ------------------------------------------------------------------------
        // For certain objects, adj shoult NOT be made if colliding w/ break blocks.
        // This prevents the objects from teleporting to the top of blocks 
        // bc the challenge is to dig through the pile of blocks to get the item.
        var _C2 = is_ancestor_(object_index,ItmD0,ItmE0,ItmF0); // Key, Magic Jar, pBag
        var _c3 = 0;
        
        if (_C2){ // Key, Magic Jar, pBag
            _c3 = isVal(g.dg_RmTile_Break[#_X1>>3,_Y1>>3]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4) 
               || isVal(g.dg_RmTile_Break[#_X2>>3,_Y1>>3]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4);
        }
        
        if (_c3   // Is certain object && the pixel above csBtm1Y is colliding w/ TID_BREAK1,TID_BREAK3
        && !_C1 ) // Is already aligned w/ grid
        {
            return y-_y_PREV;
        }
        
        
        
        
        // ------------------------------------------------------------------------
        // -------------------------------------------------
        var _yt  =  (csBtm1Y>>3)<<3;
            _yt -= !(csBtm1Y&$7)<<3;
            _yt -=   csBtm1Y-yt; // This is important if sprite_index height is shorter than cs height, like w/ Tektites
        set_xlyt(id, xl,_yt);
        
        updateCSPoints();
        
        
        
        
        if (argument0) // is landing
        {
                _c3 = 0;
            if (_C2) // Key, Magic Jar, pBag
            {
                _c3 = isVal(g.dg_RmTile_Break[#_X1>>3,(csBtm1Y-1)>>3]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4) 
                   || isVal(g.dg_RmTile_Break[#_X2>>3,(csBtm2Y-1)>>3]&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4);
            }
            
            if(!_c3)
            {
                csBtm1Y--;
                csBtm2Y--;
                if (csBtmColliding_1a()) 
                {
                    set_xy(id, x,y-8);
                }
                
                updateCSPoints();
            }
        }
    }
}




return y-_y_PREV;




