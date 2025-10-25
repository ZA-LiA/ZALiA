/// FileSelect_Draw()


FileSelect_build_surfaces();


if (room!=rmB_FileSelect) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




var _i,_j;
var _pi;
var _text;
var _x = 0;
var _y = 0;
//var _yoff = 0;

//var _PI_CRYSTAL = get_pi(p.dg_PI_SEQ[#0, (g.counter0>>1)&$3]); // Placed crystals will flash.


set_background_color(p.C_BLK1);



// ---------------------------------------------------------------------------------------------
//FileSelect_build_surfaces();

pal_swap_set(global.palette_image, global.PI_GUI1);
switch(state){
case State_MAIN:     {if (surface_exists(MAIN_surf))      draw_surface(MAIN_surf,      MAIN_surf_XL,     MAIN_surf_YT);      break;}//case State_MAIN
case State_REGISTER: {if (surface_exists(REGISTER_surf))  draw_surface(REGISTER_surf,  REGISTER_surf_XL, REGISTER_surf_YT);  break;}//case State_REGISTER
case State_ELIMINATE:{if (surface_exists(ELIMINATE_surf)) draw_surface(ELIMINATE_surf, ELIMINATE_surf_XL,ELIMINATE_surf_YT); break;}//case State_ELIMINATE
}//switch(state)
pal_swap_reset();





// ---------------------------------------------------------------------------------------------
for(_i=0; _i<SAVE_FILE_MAX; _i++) // Each save file
{
    if (dl_can_color_file[|_i]) _pi = PI_MENU1;
    else                        _pi = global.PI_GUI2;
    _text = f.dl_save_names[|_i];
    _x = saveNameX;
    _y = saveNameY + (SAVE_FILE_PAD*_i);
    draw_text_(_x,_y, _text, -1,_pi);
    
    if (state==State_MAIN 
    &&  dg_stats[#_i,0] ) // dg_stats[#_i,0] = _saveData[?f.SDNAME_saveCreated]
    {   // Quest icon
        if (dg_stats[#_i,1]==2)
        {
            _x = QUEST_X;
            _y = QUEST_Y + (SAVE_FILE_PAD*_i);
            draw_sprite_(SPR_QUEST,0, _x,_y, _pi);
        }
        
        
        // Death count
        _text = string(dg_stats[#_i,2]);
        repeat(3-string_length(_text)) _text = '0'+_text;
        _x  = DEATHS_X;
        _y  = DEATHS_Y + (SAVE_FILE_PAD*_i);
        _y += 1; // save file name pad
        draw_text_(_x,_y, _text, -1,_pi);
        
        
        // Levels
        _y = LEVELS_Y + (SAVE_FILE_PAD*_i);
        for(_j=0; _j<=2; _j++) // Each stat (Atk,Mag,Lif)
        {
            _text = string(dg_stats[#_i, 3+_j]);
            _x  = LEVELS_X;
            _x += LEVELS_X_OFF*_j;
            _x += $10;
            draw_text_(_x,_y, _text, -1,_pi);
        }
    }
}






switch(state)
{   // ==================================================
    case State_MAIN:{
    if (Main_cursor<SAVE_FILE_MAX) FileSelect_draw_savefile_rando_info(Main_cursor+1);
    break;}//case State_MAIN
    
    
    
    // ==================================================
    case State_REGISTER:{
    // "OFF"/"ON" text after "RANDO" text
    _x  = saveNameX;
    _x += (string_length("RANDO")+1)<<3;
    _y  = REGISTER_RANDO_TEXT_YT;
    //_y  = RandoOptions_Y;
    //_y += $2; // micro adj
    if (REGISTER_rando_is_on) _text = Text_ON;
    else                      _text = Text_OFF;
    draw_text_(_x,_y, _text, -1,PI_MENU1);
    
    // Rando seed
    if (REGISTER_rando_is_on)
    {
        _x += (string_length(Text_ON)+1)<<3;
        _y += RandoSeedY_ADJ1;
        Rando_draw_seed(_x,_y, REGISTER_file_seed);
    }
    break;}//case State_REGISTER
    
    
    
    // ==================================================
    case State_ELIMINATE:{
    break;}//case State_ELIMINATE
    
    
    
    // ==================================================
    case State_RANDO:{
    FileSelect_Draw_Rando();
    break;}//case State_RANDO
}//switch(state)













// ---------------------------------------------------------------------------------------------
if (state)
{
    // Fairy - menu cursor
    draw_sprite_(MenuCursor_sprite,0, MenuCursor_x,MenuCursor_y, global.PI_MOB_ORG);
    
    
    // Lonk doll icons
    for(_i=0; _i<SAVE_FILE_MAX; _i++)
    {
        if (dl_can_color_file[|_i]) _pi = global.PI_PC1;
        else                        _pi = global.PI_GUI2;
        _x = doll_x;
        _y = doll_y + (SAVE_FILE_PAD*_i) + 1;
        draw_sprite_(SPR_DOLL,0, _x,_y, _pi);
    }
}





// ---------------------------------------------------------------------------------------------
// Blinking cursors
if (state==State_REGISTER 
&&  Register_cursor<SAVE_FILE_MAX 
&&  timer&$8 ) // blink
{
    draw_sprite_(spr_1x1_WHT,0, cursor_name_x,cursor_name_y, -1, CURSOR_SIZE,CURSOR_SIZE, p.C_ORG2);
    draw_sprite_(spr_1x1_WHT,0, cursor_char_x,cursor_char_y, -1, CURSOR_SIZE,CURSOR_SIZE, p.C_ORG2);
}





// ---------------------------------------------------------------------------------------------
//if (covered) g.surf.draw_clear_color = p.C_BLK1;




/*
// Debug stuff
_x = surf_MAIN_XL+(surf_MAIN_CLMS<<3);
draw_line_colour(surf_MAIN_XL,viewYT(), surf_MAIN_XL,viewYB(), c_fuchsia,c_fuchsia); // surf xl
draw_line_colour(          _x,viewYT(),           _x,viewYB(), c_fuchsia,c_fuchsia); // surf xr
draw_line_colour(    viewXC(),viewYT(),     viewXC(),viewYB(), c_orange, c_orange);
*/




