/// Item_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (object_index==CONT_PIECE_OBJ_MP 
|| (object_index==val(g.dm_ITEM[?hex_str(ITM_MEDI)+STR_Object]) && !g.mod_MedicinePlantItem) )
{   // Bubbling Liquid in Bottles
        var     _SPR=0;
    if (object_index!=CONT_PIECE_OBJ_MP){
        switch(get_bottle_bubbling_frame()){
        case 0:{_SPR=spr_Bottle_7a_Liquid_1a; break;}
        case 1:{_SPR=spr_Bottle_7a_Liquid_1b; break;}
        case 2:{_SPR=spr_Bottle_7a_Liquid_1c; break;}
        }
    }else if (sub_state!=sub_state_HELD){
        switch(get_bottle_bubbling_frame()){
        case 0:{_SPR=spr_Bottle_6a_Liquid_1a; break;}
        case 1:{_SPR=spr_Bottle_6a_Liquid_1b; break;}
        case 2:{_SPR=spr_Bottle_6a_Liquid_1c; break;}
        }
    }
    if (_SPR) draw_sprite_(_SPR,0, drawX,drawY, palidx, xScale,yScale);
}
else
{
    if (object_index==ItmD0   // Key
    && !is_undefined(ITEM_ID) 
    &&  val(global.dm_save_file_settings[?STR_Randomize+STR_Key+STR_Locations]) )
    {   // Example: _KEY0402. This would take just the 4 _KEY0(4)02, which is the dungeon num
        var _TEXT = string_copy(ITEM_ID, string_length(ITEM_ID)-2, 1);
        var _XL  = drawX - ((string_length(_TEXT)<<3)>>1);
        var _YT  = drawY - hh_ - 8;
        draw_text_(_XL,_YT, _TEXT, -1,global.PI_GUI1);
    }
}



GameObject_draw_1a(sprite, palidx); // draw self




