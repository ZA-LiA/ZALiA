/// FileSelect_draw_savefile_rando_info(file num)


var _FILE_NUM = argument[0];


var _DATAKEY1 = STR_Save+STR_File+hex_str(_FILE_NUM);
if (surface_exists(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]))
{
    draw_surface(  SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface], 0,0);
    
    var _X  =  val(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_X"]);
    var _Y  =  val(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_Y"]);
    var _PI = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
    draw_sprite_(spr_Crystal_1a,0, _X,_Y, _PI);
}


//State_MAIN

