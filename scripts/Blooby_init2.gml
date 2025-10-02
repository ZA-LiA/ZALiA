/// Blooby_init2()


var _i, _a;


DRAW_YOFF = 0;



hspd     = $00;
hspd_dir = 1;
if(!is_undefined(                dk_spawn)){               _a=1;
hspd_dir = sign_(val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)], hspd_dir));
hspd     =       val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)], hspd);
}
hspd     = clamp(hspd, 0,$20);
hspd     = (hspd*hspd_dir) &$FF;


vspd     = $00;
vspd_dir = -1;
if(!is_undefined(                dk_spawn)){               _a=3;
vspd_dir = sign_(val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)], vspd_dir));
vspd     =       val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)], vspd);
}
vspd     = clamp(vspd, 0,$20);
vspd     = (vspd*vspd_dir) &$FF;


if(    !is_undefined(            dk_spawn)){               _a=5;
    if(!is_undefined(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)]))
    {   XC_MIN =     g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a-1)];  }
    
    if(!is_undefined(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)]))
    {   XC_MAX =     g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a-1)];  }
    
    if(!is_undefined(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)]))
    {   YC_MIN =     g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a-1)];  }
    
    if(!is_undefined(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a++)]))
    {   YC_MAX =     g.dm_spawn[?dk_spawn+STR_Data+hex_str(_a-1)];  }
}



facing_dir = hspd_dir;


set_xy(id, clamp(x,XC_MIN,XC_MAX), clamp(y,YC_MIN,YC_MAX));


switch(ver){
case 1:{GO_init_palidx(global.PI_MOB_PUR); break;}
case 2:{GO_init_palidx(global.PI_MOB_RED); break;}
}
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"W"), global.PAL_CHAR_PER_COLOR, color_str(p.C_WHT1)));
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"Y"), global.PAL_CHAR_PER_COLOR, color_str(p.C_WHT1)));
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"B"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));
change_pal(strReplaceAt(p.pal_rm_new, get_pal_col_pos(palidx,"K"), global.PAL_CHAR_PER_COLOR, color_str(p.C_BLK1)));




