/// FileSelect_draw_savefile_rando_info(file num)


var _FILE_NUM = argument[0];


var _DATAKEY1 = STR_Save+STR_File+hex_str(_FILE_NUM);
if (surface_exists(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]))
{
    var _x = viewW_() - (surface_get_width( SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface])>>1);
    var _y = viewH_() - (surface_get_height(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface])>>1);
    draw_surface(  SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface], _x,_y);
    
    //draw_rect_(c_red, 0,0, g.rm_w,g.rm_h, 1, true);
    //draw_rect_(c_aqua, viewXL(),viewYT(), viewW(),viewH(), 1, true);
    //draw_rect_(c_lime, _x,_y, surface_get_width(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]),surface_get_height(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface]), 1, true);
    
    _x = val(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_X"]);
    _y = val(SaveFileRandoInfo_dm[?_DATAKEY1+STR_Crystal+"_Y"]);
    var _PI = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
    draw_sprite_(spr_Crystal_1a,0, _x,_y, _PI);
}




