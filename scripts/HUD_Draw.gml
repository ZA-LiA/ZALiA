/// HUD_Draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ----------------------------------------------------------------------------------
var _i, _x,_y, _w,_h;
var _xscale = 1;
var _text;

var _X_BASE = viewXL();
//var _X_BASE = viewXL() + X_BASE;
var _Y1     = viewYT() + Y_LINE1;
var _Y2     = viewYT() + Y_LINE2;




pal_swap_set(p.palette_image, PI_MENU);



// ----------------------------------------------------------------------------------
// MAGIC & LIFE METERS  -----------------------------------------------------

// MAGIC METER -----------------------------
_x = _X_BASE + MP_X + 8;
_y = _Y2;

// Magic Amount
if (MeterFill_can_draw_MP)
{
    draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, MeterFill_w_MP,METER_H, MeterFill_COLOR_MP);
}

// Meter Head && Container Boxes
for(_i=MeterContainer_count_MP-1; _i>=0; _i--)
{   draw_sprite_(METER_CONT_SPR_MP,0, _x+(_i<<3),_y);  } // Container Boxes
    draw_sprite_(METER_HEAD_SPR_MP,0, _x-8,      _y);    // Meter Head
//


// LIFE METER ------------------------------
_x = _X_BASE + HP_X + 8;
_y = _Y2;

// Life Amount
if (MeterFill_can_draw_HP)
{
    draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, MeterFill_w_HP,METER_H, MeterFill_COLOR_HP);
}

// Meter Head && Container Boxes
for(_i=MeterContainer_count_HP-1; _i>=0; _i--)
{   draw_sprite_(METER_CONT_SPR_HP,0, _x+(_i<<3),_y);  } // Container Boxes
    draw_sprite_(METER_HEAD_SPR_HP,0, _x-8,      _y);    // Meter Head
//







// ----------------------------------------------------------------------------------
// LEVELS  ---------------------------------------------------------------
_y = _Y1;

// Attack level
_x = _X_BASE + Level_ATK_X;
draw_spr_aligned(global.SPR_ICON_ATK, _x,_y,  -1,-1);
draw_text_(_x+8,_y, string(f.level_atk), -1,-1);

// Magic level
_x = _X_BASE + Level_MAG_X;
draw_spr_aligned(global.SPR_ICON_MAG, _x,_y,  -1,-1);
draw_text_(_x+8,_y, string(f.level_mag), -1,-1);

// Life level
_x = _X_BASE + Level_LIF_X;
draw_spr_aligned(global.SPR_ICON_LIF, _x,_y,  -1,-1);
draw_text_(_x+8,_y, string(f.level_lif), -1,-1);








// ----------------------------------------------------------------------------------
// XP  -------------------------------------------------------------------
_x = _X_BASE + XP_X;
_y = _Y2;
draw_text_(_x,_y, XP_text, -1,-1);


// Next level-up stat icon
if (NextLevel_sprite)
{
    _x = _X_BASE + XPNextIcon_X;
    draw_spr_aligned(NextLevel_sprite, _x,_y, -1,-1, -1, NextLevel_sprite_xscale);
}




// -------------------------------------------------------------------
//  LIVES  ---------------------------------------------------
var _x1 = _X_BASE + HP_X;
if (g.HUD_state)
{   // This will show lives, then keys after
    _x = _x1;
    _y = _Y1;
    draw_spr_aligned(spr_Lives_icon, _x,_y, -1,-1, -1, -1);
    _x += 8;
    
    draw_text_(_x,_y, Lives_text, -1,-1);
    
    _x1 += $05<<3; // for keys position
    //_x1 += 4;
}
// -------------------------------------------------------------------
//  KEYS  ---------------------------------------------------
if (g.dungeon_num) // if in a dungeon
{
    _x = _x1;
    _y = _Y1;
    draw_spr_aligned(spr_Key_icon, _x,_y, -1,-1);
    _x += 8;
    
    draw_text_(_x,_y, Keys_text, -1,-1);
}



pal_swap_reset();








// -------------------------------------------------------------------
if (g.mod_HUD_SPELL_READY)
{
    _x = _X_BASE  + SpellReady_ICON_X;
    _y = _Y1;
    draw_spr_aligned(SpellReady_ICON_SPR, _x,_y, -1,-1, PI_MENU);
    
    
    _x = _X_BASE + SpellReady_TEXT_X;
    draw_text_(_x,_y, SpellReady_text, -1, SpellReady_palidx);
}









/*
if (g.DoubleJump_state 
&&  f.items&ITM_FTHR )
{
    if (g.pc.jump_tokens)
    {
        _x = (viewXL()+X_BASE)-($4<<3);
        _y = _Y1+8;
        draw_sprite_(spr_Item_Feather_1a,0, _x,_y, PI_MOB_ORG);
    }
}
*/




