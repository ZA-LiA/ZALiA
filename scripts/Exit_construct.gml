/// Exit_construct(exit name)


with(instance_create(0,0,Exit))
{
    var _datakey;
    
    exitName = argument0; // exit name example: "_WestA_0010"
    exitNum  = str_hex(string_copy(exitName, string_length(exitName)-1, 2));
    
    // exit_type: Contains data bits. $00 Standard, $10 Doorway, $20 Elevator, $40 Pipe, ...
    // Can include bits that give info like falling scene type.
    // See g.EXIT_TYPE_  for details
    exit_type = val(g.dm_rm[?exitName+STR_Type]);
    
    
    goToExitName = val(g.dm_rm[?   exitName+STR_goto_reen], REEN_DEFAULT);
    goToExitName = val(f.dm_rando[?exitName+STR_goto_reen], goToExitName);
    
    goToRoom     = get_exit_rm_name(goToExitName);
    goToExitNum  = str_hex(strR(goToExitName, string_length(goToExitName)-1));
    
    
    ww  = val(g.dm_rm[?exitName+STR_Width], 2) <<3;
    ww_ = ww>>1;
    
    hh  = val(g.dm_rm[?exitName+STR_Height],2) <<3;
    hh += sign(exit_type&g.EXIT_TYPE_DOOR); // EXIT_TYPE_DR y scale down 1 extra pixel so GO csMid can detect
    hh_ = hh>>1;
    
    // sprite_index size = 1x1 and is transparent, it just needs 
    // to be scaled so that collideRect() in pc_collide_exit() has 
    // correct sprite_width & sprite_height
    image_xscale = ww;
    image_yscale = hh;
    
    xl  = val(g.dm_rm[?exitName+STR_Exit_x]) <<3;
    xr  = xl + ww;
    xc  = xl + ww_;
    x   = xl;
    
    yt  = val(g.dm_rm[?exitName+STR_Exit_y]) <<3;
    yb  = yt + hh;
    yc  = yt + hh_;
    y   = yt;
    
    
    
    
    update_draw_xy();
    
             side = (exitNum>>4)&$F;
                      page_x = xl>>8;
         if (side&$2) page_x++;
    else if (side&$1) page_x--;
    page_y = yt>>8;
    
    
    BodyHB_w  = ww;
    BodyHB_h  = hh;
    BodyHB_xl = xl;
    BodyHB_xr = BodyHB_xl + BodyHB_w;
    BodyHB_yt = yt;
    BodyHB_yb = BodyHB_yt + BodyHB_h;
    
    
    
    
    open = val(g.dm_rm[?   exitName+STR_Open]);
    open = val(f.dm_rando[?exitName+STR_Open], open);
    
    
    _datakey = dk_MidoChurch;
    if(!open 
    &&  exitName==val(g.dm_rm[?_datakey+STR_Exit+STR_Name]) 
    //&&  exitName==g.ExitName_MIDO_CHURCH 
    && (exitName==f.reen || val(f.dm_quests[?_datakey+STR_Open])) )
    {   open = true;            f.dm_quests[?_datakey+STR_Open] = open;  }
    
    
    _datakey = dk_FastTravel+"02";
    if(!open 
    &&  exitName==val(g.dm_rm[?_datakey+STR_Exit+STR_Name]) 
    //&&  exitName==g.ExitName_FAST_TRAVEL2 
    && (exitName==f.reen || val(f.dm_quests[?_datakey+STR_Open])) )
    {   open = true;            f.dm_quests[?_datakey+STR_Open] = open;  }
    
    
    _datakey = dk_FastTravel+"03";
    if(!open 
    &&  exitName==val(g.dm_rm[?_datakey+STR_Exit+STR_Name]) 
    //&&  exitName==g.ExitName_FAST_TRAVEL3 
    && (exitName==f.reen || val(f.dm_quests[?_datakey+STR_Open])) )
    {   open = true;            f.dm_quests[?_datakey+STR_Open] = open;  }
    
    
    
    
    
    
    
    if (val(g.dm_rm[?exitName+"_Draw"+STR_Open+STR_Exit]))
    //if (exitName==g.ExitName_MIDO_CHURCH 
    //||  exitName==g.ExitName_FAST_TRAVEL2 
    //||  exitName==g.ExitName_FAST_TRAVEL3 )
    {
        is_draw_open_exit = true;
    }
    
    //sdm("Exit_construct() "+exitName+" exitNum $"+" open="+string(open)+hex_str(exitNum)+", xl $"+hex_str(xl)+" yt $"+hex_str(yt)+", ww $"+hex_str(ww)+" hh $"+hex_str(hh)+", BodyHB_xl $"+hex_str(BodyHB_xl)+" BodyHB_yt $"+hex_str(BodyHB_yt)+" BodyHB_w $"+hex_str(BodyHB_w)+" BodyHB_h $"+hex_str(BodyHB_h));
    
    
    
    doorway_spr = 0;
    
    if ((exit_type&g.EXIT_TYPE_DOOR)==g.EXIT_TYPE_DOOR 
    &&  open 
    &&  g.town_name==STR_Bulblin 
    && !global.pc.Disguise_enabled )
    //&& !(f.items&ITM_MASK) )
    {
        open = false;
        doorway_spr      = g.TownDoor1_SPR;
        doorway_spr_yoff = -$08;
    }
    else
    {
        switch(val(g.dm_rm[?exitName+STR_Door+STR_ID],-1)){
        case 0:{doorway_spr=g.Doorway1_SPR;         break;}
        case 1:{doorway_spr=spr_Doorway01_Closed01; break;}
        }//switch(val(g.dm_rm[?exitName+STR_Door+STR_ID],-1))
    }
    
    
    GO_init_palidx(val(g.dm_rm[?exitName+STR_Palette+STR_Idx], palidx));
    
    return id;
}


return noone;




