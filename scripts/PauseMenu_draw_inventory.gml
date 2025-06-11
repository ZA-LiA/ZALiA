/// PauseMenu_draw_inventory()


var _i;
var _x,_y;
var _sprite, _pi;
//var _ITEMX = Window_xl0;
//var _x_scale = 1;


// ----------------------------------------------------------------
// MAIN & QUEST ITEMS  ------------------------------------
//if!(g.counter0&$FF) sdm("ds_grid_width(dg_items) $"+hex_str(ds_grid_width(dg_items))+", f.quest_num "+string(f.quest_num));
if (MainItems_can_draw)
{
    for(_i=ds_grid_width(dg_items)-1; _i>=0; _i--)
    {
        if (dg_items[#_i,$5]) // $5: can draw
        {
            _x = Window_xl0 + dg_items[#_i,$1]; // x center (draw x)
            _y = drawY      + dg_items[#_i,$2]; // y center (draw y)
            _sprite =         dg_items[#_i,$3];
            _pi     =         dg_items[#_i,$4];
            draw_sprite_(_sprite,0, _x,_y, _pi);
        }
    }
}


if (Feather_can_draw)
{
    draw_sprite_(Feather_SPRITE,0, Feather_x,Feather_y, Feather_pi, -1,-1, c_white,1, 90);
}




// ----------------------------------------------------------------
// CRYSTALS  --------------------------------------------
if (Crystals_can_draw)
{
    pal_swap_set(global.palette_image, PI_MENU1);
    for(_i=0; _i<f.CRYSTAL_MAX; _i++)
    {
        if (f.crystals&($1<<_i)) _sprite = SPR_CRYSTAL2; // Crystal     placed
        else                     _sprite = SPR_CRYSTAL1; // Crystal NOT placed
        
        _x = Crystals_x + (Crystals_PAD1*_i);
        draw_sprite_(_sprite,0, _x,Crystals_y);
    }
    pal_swap_reset();
}





// ----------------------------------------------------------------
if (Icons_can_draw)
{
    var _x_scale = 1;
    for(_i=0; _i<Icons_COUNT; _i++)
    {
        if (dg_icons1[#_i,$5]) // $5: can draw
        {
            _text = dg_icons1[#_i,$1]; // $1: text
            _x = Icons_x + 8;
            _y = Icons_y + (Icons_PAD*_i);
            draw_text_(_x,_y, _text);
            
            _x  = Icons_x + dg_icons1[#_i,$2]; // $2: xoff
            _y +=           dg_icons1[#_i,$3]; // $3: yoff
            _sprite  = dg_icons1[#_i,$0]; // $0: sprite
            _pi      = dg_icons1[#_i,$4]; // $4: palette index
            _x_scale = dg_icons1[#_i,$6]; // $6: xscale
            draw_spr_aligned(_sprite, _x,_y, -1,-1, _pi, _x_scale);
        }
    }
}




// Extra life dolls  -----------------------------
if (LifeDolls_can_draw)
{
    pal_swap_set(global.palette_image, LifeDolls_pi);
    for(_i=0; _i<LifeDolls_count; _i++)
    {
        _x = LifeDolls_x + (Dolls_PAD*_i);
        draw_sprite_(LifeDolls_SPRITE,0, _x,LifeDolls_y);
    }
    pal_swap_reset();
}




// SKELETON KEY ------------------------------------------------
if (AllKey_can_draw) draw_sprite_(AllKey_SPRITE,0, AllKey_x,AllKey_y, global.PI_MOB_ORG);




// TREASURE MAPS ----------------------------------------------
if (TreasureMap1_can_draw 
||  TreasureMap2_can_draw )
{
    pal_swap_set(global.palette_image, global.PI_MOB_ORG);
    if (TreasureMap1_can_draw) draw_sprite_(TreasureMap1_SPRITE,0, TreasureMap1_x,TreasureMap1_y);
    if (TreasureMap2_can_draw) draw_sprite_(TreasureMap2_SPRITE,0, TreasureMap2_x,TreasureMap2_y);
    pal_swap_reset();
}




// HEART & MAGIC CONTAINERS  -----------------------------------
if (ContainerHP_can_draw) draw_sprite_(ContainerHP_sprite,0, ContainerHP_x,ContainerHP_y, global.PI_MOB_RED);
if (ContainerMP_can_draw) draw_sprite_(ContainerMP_sprite,0, ContainerMP_x,ContainerMP_y, global.PI_MOB_ORG);




