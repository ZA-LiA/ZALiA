/// dir_to_pc(inst id)


// DC91
if (argument0.xl<global.pc.xl) return  1;
                               return -1;
//


/*
// DC91
// Note: byte(-1 >> 8) = $FF
var _carry, _lmp, _lx, _emp, _ex, _val;
_val    = global.pc.x - $10; // og global.pc.xl

_lx     = byte(_val) + 8;
_carry  = _lx > $FF;

_lmp    = byte(_val >> 8) + _carry;
_carry  = _lmp > $FF;

_lx     = byte(_lx);
_ex     = byte(xl) ^ $FF;
_carry  = ((_lx + _ex) + _carry) > $FF;

_lmp    = byte(_lmp); // same as mp of (global.pc.x - 8)
_emp    = byte(xl >> 8) ^ $FF;
_val    = (_lmp + _emp) + _carry;
_carry  = _val > $FF;


if (_val & $80) facingDir = -1;
else            facingDir =  1;

return _carry;
*/

/*  DC91 can leave the carry set, so return is that carry (0 or 1).
    
    I set up a test in db_test_various_1a() to find out what 
    exactly leaves the carry set and if there were any scenarios 
    where this left the GOB caller facing away from PC.
    Only scenario, I think, it sets the wrong facingDir is when 
    the mp & xl are 0 for both _lx & _ex.
    What scenarios leave the carry set was confusing so 
    I'm leaving this script to simulate the OG step by step. */


/*
// DC91
// Note: byte(-1 >> 8) = $FF
var _carry, _lmp, _lx, _emp, _ex, _val;
_lx     = global.pc.x - 8;
_carry  = _lx < 8;

_ex     = byte(xl) ^ $FF;
_carry  = ((byte(_lx) + _ex) + _carry) > $FF;

_lmp    = byte(_lx >> 8);
_emp    = byte( xl >> 8) ^ $FF;
_val    = (_lmp  + _emp) + _carry;
_carry  = _val > $FF;

if (_val & $80) facingDir = -1;
else            facingDir =  1;

return _carry;
*/


/*
// DC91
var _carry, _lmp, _lx, _emp, _ex, _val;
_val    = global.pc.x - $10; // og global.pc.xl

_lx     = byte(_val) + 8;
_carry  = _lx > $FF;
_lx    &= $FF;

_lmp    = byte(_val >> 8) + _carry;
_carry  = _lmp > $FF;
_lmp   &= $FF;

_ex     = byte(xl);
_carry  = ((_lx    + (_ex ^ $FF)) + _carry) > $FF;

_emp    = byte(xl >> 8);
_val    = (_lmp  + (_emp ^ $FF))  + _carry;
_carry  = _val > $FF;
_val   &= $FF;

if (_val & $80) facingDir = -1;
else            facingDir =  1;

return _carry;
*/


/*
// DC91
var _lx = global.pc.xl + 8;
facingDir = signBin(xl < _lx);

return (byte(xl>>8) <= byte(_lx>>8)) && (xl < _lx);
*/

// Note: byte(-1 >> 8) = $FF
/*  DC91 can leave the carry set, so return is that carry (0 or 1).
    The return is 1 if: 
        (_ex map page <= _lx map page) && (_ex is left of _lx). 
    I could just write this as 'return _ex < _lx;'
    However, in OG code, if _ex is left of _lx but also happens to 
    be left of mp 0 (carrying its mp to $FF), with _lx in mp 0-3, 
    the return will be 0 because _ex mp > _lx mp.  */





