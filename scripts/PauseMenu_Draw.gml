/// PauseMenu_Draw()


if(!canDrawSections)
{
    canDrawSections = 0;
    canDrawItems    = 0;
    canDrawSpells   = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------------------
// Draw bg color of menu
if (WindowBackground_can_draw)
{
    draw_sprite_(spr_1x1_WHT,0, WindowBackground_xl,WindowBackground_yt, -1, WindowBackground_w,WindowBackground_h, WindowBackground_color,WindowBackground_alpha);
}




// ----------------------------------------------------------------------------------
// Draw GUI Window Frame
PauseMenu_Draw_1(); // create surfaces

pal_swap_set(global.palette_image, PI_MENU1);
switch(Window_draw_data_state){
case state_SPELL:{draw_surface_part(MenuFrame_srf_SPELL, MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
case state_ITEM: {draw_surface_part(MenuFrame_srf_ITEM,  MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
case state_MAP:  {draw_surface_part(MenuFrame_srf_MAP,   MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
}
// For clms extending left beyond spell/item window
if (Window_extra_draw_clms)       draw_surface_part(MenuFrame_srf_MAP, 0,0, Window_extra_draw_clms_w,Window_h, drawX,MenuFrameMain_yt);
// draw map area-name/menu-nav separator
if (MenuFrameSeparator1_can_draw) draw_surface_part(MenuFrame_srf_MAP, MenuFrameSeparator1_SURF_XL,0, MenuFrameSeparator1_W,Window_h, Window_xl0,MenuFrameMain_yt);
pal_swap_reset();




// SPELL MENU  ----------------------------------------------------------------------
if (canDrawSpells) PauseMenu_draw_spell_menu();
// INVENTORY  -----------------------------------------------------------------------
if (canDrawItems)  PauseMenu_draw_inventory();
// MAP  -----------------------------------------------------------------------------
PauseMenu_draw_map();




// ----------------------------------------------------------------------------------
//  MENU NAVIGATION  -------------------------------------------------------------  
pal_swap_set(global.palette_image, PI_MENU1);
if (MenuNav_can_draw)
{
    if (MenuNavL_text_can_draw) draw_text_(MenuNavL_text_xl, MenuNavL_text_yt, MenuNavL_text); // left   $20
    if (MenuNavR_text_can_draw) draw_text_(MenuNavR_text_xl, MenuNavR_text_yt, MenuNavR_text); // right  $50
    draw_sprite_(MenuNavL_sprite,0, MenuNavL_sprite_x, MenuNavL_sprite_y);
    draw_sprite_(MenuNavR_sprite,0, MenuNavR_sprite_x, MenuNavR_sprite_y);
}




// ----------------------------------------------------------------------------------
//  AREA NAME  -------------------------------------------------------------------
if (AreaName_can_draw) draw_text_(AreaName_xl,AreaName_yt, AreaName_text);
pal_swap_reset();




// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
canDrawSections = 0;
canDrawItems    = 0;
canDrawSpells   = 0;




