/// csBtmColliding_1a()


var     _VAL = 0;

update_cs_btm_inst();
if(!is_undefined(   cs_btm_inst) 
&&  instance_exists(cs_btm_inst) 
&&                  cs_btm_inst.solid_type )
{
        _VAL =      cs_btm_inst.solid_type;
    
    if (_VAL&TID_SOLID1)
    {
        return _VAL; // Full Solid trumps One-way
    }
    
    if (_VAL&TID_ONEWY1 
    &&  csBtm_qual_oneway(id, (csBtm1Y - (cs_btm_inst.yt&$7)) &$7) )
    {
        return _VAL;
    }
}

// ------------------------------------------------------------------------------
if (_VAL==0)
{
    _VAL = csBtmColliding();
}

if (_VAL==0)
{
    return 0;
}

if (_VAL&TID_SOLID1)
{
    return _VAL; // Full Solid trumps One-way
}

// ------------------------------------------------------------------------------
if (_VAL&TID_ONEWY1 
&&  csBtm_qual_oneway(id, csBtm1Y&$7) )
{
    return _VAL;
}


return 0;






/*
/// csBtmColliding_1a()

var _VAL = csBtmColliding();

if (_VAL == 0)                      return 0;

if (_VAL & TID_SOLID1)              return _VAL; // Full Solid trumps One-way

// ------------------------------------------------------------------------------
if (_VAL & TID_ONEWY1 
&&  vspd < $80 )
{   // if in 2nd half of tile && moving fast enough, then is colliding
    var      _DIST = csBtm1Y & 7;            // 0-7. How far into tile.
         if (_DIST < 4)             return _VAL;
    else if (uses_vspd_sub)
    {    if (_DIST-1 <= (vspd >>4)) return _VAL;  } // this should be enough since faster than 8 would mean vspd > $7F
    else         
    {    if (_DIST-1 <=  vspd)      return _VAL;  } // obj uses vspd as 'pixels per frame'
}

return 0;
*/






/*
/// csBtmColliding_1a()

var _VAL = csBtmColliding();

if (_VAL == 0)                         return 0;

if (_VAL & TID_SOLID1)                 return _VAL; // Full Solid trumps One-way

// ------------------------------------------------------------------------------
if (_VAL & TID_ONEWY1 
&&  vspd < $80 )
{
    var _DIST = csBtm1Y & 7;            // 0-7. How far into tile.
    if (_DIST < 4)                     return _VAL;
    else
    {   // if in 2nd half of tile && moving fast enough, then is colliding
        if (vspdInc) 
        {   if (_DIST-1 <= (vspd >>4)) return _VAL;  } // this should be enough since faster than 8 would mean vspd > $7F
        else         
        {   if (_DIST-1 <=  vspd)      return _VAL;  } // obj uses vspd as 'pixels per frame'
    }
}

return 0;
*/






/*
/// csBtmColliding_1a()

var   _VAL = csBtmColliding();

if (  _VAL == 0)                return 0;

if (  _VAL & TID_SOLID1)        return _VAL; // Full Solid trumps One-way

// ------------------------------------------------------------------------------
if (!(_VAL & TID_ONEWY1) 
||    vspd & $80 )
{
                                return 0;
}


var _DIST = csBtm1Y & 7;            // 0-7. How far into tile.
if (_DIST < 4)                  return _VAL;
// if in 2nd half of tile && moving fast enough, then is colliding
else if (vspdInc) 
{   if (_DIST-1 <= (vspd >>4))  return _VAL;  } // this should be enough since faster than 8 would mean vspd > $7F
else         
{   if (_DIST-1 <=  vspd)       return _VAL;  } // obj uses vspd as 'pixels per frame'

*/







/*
/// csBotColliding_1a()

var      _VAL = csBotColliding();

     if (_VAL & TID_SOLID1)     return _VAL; // Full Solid trumps One-way
else if (_VAL & TID_ONEWY1 && vspd < $80)
{
    var _dist = csBot1Y & 7;
    if (_dist < 4)              return _VAL;
    else
    {
        var          _vspd = vspd; // obj uses vspd as 'pixels per frame'
        if (vspdInc) _vspd = vspd >> 4; // this should be enough since faster than 8 would mean vspd > $7F
        
        // if in 2nd half of tile && moving fast enough, then is colliding
        if (_dist - 1 <= _vspd) return _VAL;
    }
}

return 0;
*/

