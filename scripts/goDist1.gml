/// goDist1()

// Distance between global.pc.xl and this.xl mimicing the 
// value stored in 000F at DCA1 

// !!! This is meant to be used as the value in 000F that DC91 produces

// DC91

// DCA1.  return value of 000F
var    _return  =   global.pc.xl&$FF;
       _return += byte(~(xl&$FF));
       _return +=  (global.pc.xl>=0 && global.pc.xl<=7); // carry
       _return &= $FF;
//
return _return;


/*
/// goDist1()
// Distance between PC.xx and GOB.xx mimicing the 
// value stored in 000F at DCA1 

// DC91
var _carry, _lx, _ex;
_lx     = global.pc.x - 8;
_carry  = (byte(_lx) + 8) > $FF;
_carry  = (byte(_lx >> 8) + _carry) > $FF;

_lx     = byte(_lx + 8);
_ex     = byte(xx) ^ $FF;

// DCA1
return  byte((_lx + _ex) + _carry);
*/




