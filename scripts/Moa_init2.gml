/// Moa_init2()

// ver 3 for halloween scene


switch(ver){
case 1:{GO_init_palidx(global.PI_MOB_RED); break;}
case 2:{GO_init_palidx(global.PI_MOB_PUR); break;}
}


GO_depth_init(DEPTH_FLYER);


sprL = spr_Moa2;
sprR = spr_Moa1;
sprRXOff = 0;

//DRAW_YOFF = 1; // Does it get +1 in-ground??

hspd_dir       = byte_dir(hspd);
hspd_impel_dir = hspd_dir;
hDir           = 0; // 0401,X. horizontal Direction. 1 or -1

timer = 0;


NEED_CROSS = ver==2;



if (ver==2 
&&  g.area_name==Area_TownA )
{
    GO_init_palidx(global.PI_MOB_PUR);
    
    XP_IDX = $0E;
    xp     = g.dl_XP[|XP_IDX];
    
    DROP_BITS = $00;
    drop_bits = DROP_BITS;
}


if (ver==3)
{
    DEPTH1 = DEPTH_BG8+3;
    DEPTH2 = DEPTH_FG8-3;
    GO_depth_init(DEPTH1);
    var _PI = global.PI_MOB_BLU;
    GO_init_palidx(_PI);
    var _PAL = build_pal(p.C_WHT1,p.C_WHT1,p.C_BLU2);
    change_pal(strReplaceAt(p.pal_rm_curr, get_pal_pos(_PI), string_length(_PAL), _PAL));
    
    HSPD1 = $14;
    hspd_dir = -sign_(x>g.rm_w_);
    hspd = (HSPD1*hspd_dir) &$FF;
    hspd_impel_dir = hspd_dir;
    counter = 0;
}




