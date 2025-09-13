/// Overworld_init_data_1a(overworld row clm)


var _OWRC   = argument[0];
var _OW_CLM = (_OWRC>>0)&$FF;
var _OW_ROW = (_OWRC>>8)&$FF;
var _OWRC_  = hex_str(_OWRC);
    _OWRC_  = string_repeat("0", 4-string_length(_OWRC_)) + _OWRC_;
//


show_debug_message("_owrc=$"+_OWRC_+";"+" _owrc_=hex_str(_owrc,4);");
//show_debug_message("_owrc=($"+hex_str(_OW_ROW)+"<<8)|$"+hex_str(_OW_CLM)+";"+" _owrc_=hex_str(_owrc);");

//show_debug_message("_owrc=($"+_OW_ROW_+"<<8)|$"+_OW_CLM_+";"+" _owrc_='"+_OW_ROW_+_OW_CLM_"';");

//show_debug_message("_owrc  = ($"+_OW_ROW_+"<<8) | $"+_OW_CLM_+";");
//show_debug_message("_owrc_ = hex_str(_owrc);");




