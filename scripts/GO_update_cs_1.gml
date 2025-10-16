/// GO_update_cs_1()


var _IS_PC = id==global.pc;

var         _HSPD_DIR = -sign_(hspd&$80);
if (_IS_PC) _HSPD_DIR = hspd_dir;


                                     cs &= $F0;
if (_IS_PC)                          cs  = $00;

    if (csTopColliding()&TID_SOLID1) cs |= CS_TOP;    // Include Top
    if (csBtmColliding_1a())         cs |= CS_BTM;    // Include Bottom
if (_HSPD_DIR)
{   if (csRgtColliding()&TID_SOLID1) cs |= CS_RGT;  } // Include Right
else
{   if (csLftColliding()&TID_SOLID1) cs |= CS_LFT;  } // Include Left




