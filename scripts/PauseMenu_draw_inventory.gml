/// PauseMenu_draw_inventory()


var _i, _count;
var _x,_y, _base_x,_base_y;
var _bit, _spr;
var _ITEMX = Window_spell_menu_window_xl;
var _x_scale = 1;


// ----------------------------------------------------------------
//  MAIN & QUEST ITEMS  ------------------------------------
_base_x = _ITEMX;
_base_y = drawY;
//if!(g.counter0&$FF) sdm("ds_grid_width(dg_items) $"+hex_str(ds_grid_width(dg_items))+", f.quest_num "+string(f.quest_num));

             _count = ds_grid_width(dg_items) - (f.quest_num==1);
for(_i=0; _i<_count; _i++) // Each main/quest item
{
    _bit =         dg_items[#_i,$00];
    _x = _base_x + dg_items[#_i,$01]; // x center (draw x)
    _y = _base_y + dg_items[#_i,$02]; // y center (draw y)
    //if!(g.counter0&$FF) sdm("item $"+str_hex(_bit)+", _base_x $"+str_hex(_base_x)+" _x $"+str_hex(dg_items[#_i,$01])+", _base_y $"+str_hex(_base_y)+" _y $"+str_hex(dg_items[#_i,$02]));
    
    if!(f.items&_bit)                     continue;//_i
    if (f.quest_num==1 && _bit==ITM_MASK) continue;//_i
    if (_y+8>=Window_yb)                  continue;//_i
    
    
    _pi = dg_items[#_i,$04];
    
    switch(_bit){
    default:{      _spr=dg_items[#_i,$03];                     break;}
    case ITM_MEDI:{_spr=g.FlowerItemAnim_SPR1;                 break;}
    case ITM_BTL1:{_spr=dg_items[#ITM_BTL1_IDX,$03];           break;}
    case ITM_FRY1:{_spr=g.dl_Fairy_SPRITES[|!(g.counter0&$8)]; break;}
    }
    draw_sprite_(_spr,0, _x,_y, _pi);
}

if (f.items&ITM_FTHR)
{
    _spr = spr_Item_Feather_1a;
    _x = Window_xr - ((CLMS_WIN_DEF<<3)>>1);
    //_x = Window_spell_menu_window_xl + (Window_w>>1);
    _y = Window_yb - $C;
    
    if(!g.DoubleJump_state) _pi = PI_DARKLONK;
    else                    _pi = PI_MOB_ORG;
    draw_sprite_(_spr,0, _x,_y, _pi, -1,-1, c_white,1, 90);
}




// ----------------------------------------------------------------
//  CRYSTALS  --------------------------------------------
    _base_y = drawY + Crystals_Y; // y center of sprite
if (_base_y+8<Window_yb)
{
    _base_x = _ITEMX + Crystals_PAD1;
    
    pal_swap_set(p.palette_image, PI_MENU);
    for(_i=0; _i<f.CRYSTAL_MAX; _i++)
    {
        if (f.crystals&($1<<_i)) _spr = SPR_CRYSTAL2; // Crystal     placed
        else                     _spr = SPR_CRYSTAL1; // Crystal NOT placed
        
        _x = _base_x + (Crystals_PAD1*_i);
        _y = _base_y;
        draw_sprite_(_spr,0, _x,_y);
    }
    pal_swap_reset();
}





// ----------------------------------------------------------------
_base_x = _ITEMX + $08 + 3;
_base_y = drawY + Icons_Y;


             _count = ds_grid_width(dg_icons1);
for(_i=0; _i<_count; _i++)
{
    _x = _base_x;
    _y = _base_y + (Icons_PAD*_i);
    
    _spr = dg_icons1[#_i,0];
    
    if (_y+sprite_get_height(_spr)>=Window_yb) continue;//_i
    
    
    // ------------------------------------------------
    if (_spr==SPR_ICON_PC1) _x_scale = -1;
    else                    _x_scale =  1;
    
    
    _text = dg_icons1[#_i,1];
    _pi   = dg_icons1[#_i,4];
    
    draw_spr_aligned(_spr, _x+dg_icons1[#_i,2], _y+dg_icons1[#_i,3], -1,-1, _pi, _x_scale);
    draw_text_(_x+8,_y, _text);
}




//  Extra life dolls  -----------------------------
if (LifeDoll_count)
{
        _base_y = drawY + Dolls_Y; // spr y center (draw y)
    if (_base_y+8<Window_yb)
    {
        _base_x = _ITEMX + Dolls_X;
        _y = _base_y;
        
        _pi = PI_PC_1; // Green PC pal
        //_pi = p.dg_PI_SEQ[#$00,0]; // Current PC pal
        pal_swap_set(p.palette_image, _pi);
        for(_i=0; _i<LifeDoll_count; _i++)
        {
            _x = _base_x + (Dolls_PAD*_i);
            draw_sprite_(SPR_LIFE_DOLL,0, _x,_y);
        }
        pal_swap_reset();
    }
}




//  SKELETON KEY ------------------------------------------------
if (f.items&ITM_SKEY)
{
    if (f.quest_num==1)
    {
        _x = _ITEMX + $1A;
        _y =  drawY + dg_items[#$09,$02];
    }
    else
    {
        _x = _ITEMX + SkeletonKey_X;
        _y =  drawY + SkeletonKey_Y;
    }
    
    if (_y+8<Window_yb)
    {
        draw_sprite_(SkeletonKey_SPR,0, _x,_y, PI_MOB_ORG);
    }
}




//  ITEM MAPS, HEART & MAGIC CONTAINERS  -----------------------------------
    _base_y = drawY + Containers_Y;
if (_base_y+8<Window_yb)
{
    _base_x = _ITEMX + Maps_X;
    _y = _base_y;
    
    if (f.items&ITM_MAP1)
    {
        _x = _base_x;
        draw_sprite_(ItemMap1_SPR,0, _x,_y, PI_MOB_ORG);
    }
    
    if (f.items&ITM_MAP2)
    {
        _x = _base_x + 8 + Maps_PAD;
        draw_sprite_(ItemMap2_SPR,0, _x,_y, PI_MOB_ORG);
    }
    
    
    _base_x = _ITEMX + Containers_X;
    
    if (ContainerPiece_count_hp==f.CONT_PIECE_MAX_HP) _spr = g.SPR_CONT_HP;
    else                                              _spr = g.dl_cont_spr_hp[|ContainerPiece_count_hp mod f.CONT_PIECE_PER_HP];
    _x = _base_x;
    draw_sprite_(_spr,0, _x,_y, PI_MOB_RED);
    
    if (ContainerPiece_count_mp==f.CONT_PIECE_MAX_MP) _spr = g.SPR_CONT_MP;
    else                                              _spr = g.dl_cont_spr_mp[|ContainerPiece_count_mp mod f.CONT_PIECE_PER_MP];
    _x = _base_x + $10 + Containers_PAD;
    draw_sprite_(_spr,0, _x,_y, PI_MOB_ORG);
}




