/// FileSelect_Draw()


var _i,_j, _idx, _val, _count;
var _pi,_pi1;
var _text;
var _spr = 0;
var _str = 0;
var _X,_Y;
var _x = 0;
var _y = 0;
var _datakey1;

//var _PI_CRYSTAL = get_pi(p.dg_PI_SEQ[#0, (g.counter0>>1)&$3]); // Placed crystals will flash.


var _dl_CAN_COLOR_FILE=ds_list_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    if (state==State_MAIN 
    ||  state==State_ELIMINATE 
    ||  save_num_selected )
    {    ds_list_add(_dl_CAN_COLOR_FILE, dl_save_file_registered[|_i]);  }
    else ds_list_add(_dl_CAN_COLOR_FILE, _i+1==Register_file_num);
}


set_background_color(p.C_BLK1);



// ---------------------------------------------------------------------------------------------
FileSelect_build_surfaces();

pal_swap_set(p.palette_image, PI_GUI_1);
switch(state){
case State_MAIN:     {if (surface_exists(surf_MAIN))      draw_surface(surf_MAIN,      viewXC()-(surface_get_width(surf_MAIN)>>1),surf_MAIN_YT); break;}//case State_MAIN
//case State_MAIN:     {if (surface_exists(surf_MAIN))      draw_surface(surf_MAIN,      surf_MAIN_XL,surf_MAIN_YT); break;}//case State_MAIN
case State_REGISTER: {if (surface_exists(surf_REGISTER))  draw_surface(surf_REGISTER,  viewXC()-(surface_get_width(surf_REGISTER)>>1),surf_MAIN_YT); break;}//case State_REGISTER
//case State_RANDO:    {if (surface_exists(surf_RANDO))     draw_surface(surf_RANDO,     surf_MAIN_XL,surf_MAIN_YT); break;}//case State_RANDO
case State_ELIMINATE:{if (surface_exists(surf_ELIMINATE)) draw_surface(surf_ELIMINATE, viewXC()-(surface_get_width(surf_ELIMINATE)>>1),surf_MAIN_YT); break;}//case State_ELIMINATE
}//switch(state)
pal_swap_reset();





// ---------------------------------------------------------------------------------------------
for(_i=0; _i<SAVE_FILE_MAX; _i++) // Each save file
{
    if (_dl_CAN_COLOR_FILE[|_i]) _pi = PI_MENU;
    else                         _pi = PI_DARKLONK;
    _text = f.ar_save_names[_i];
    _x = saveNameX;
    _y = saveNameY + (SAVE_FILE_PAD*_i);
    draw_text_(_x,_y, _text, -1,_pi);
    
    if (state==State_MAIN 
    &&  stats[_i,0] ) // stats[_i,0] = _saveData[?f.SDNAME_saveCreated]
    {   // Quest icon
        if (stats[_i,1]==2)
        {
            _spr = SPR_QUEST;
            _x = QUEST_X;
            _y = QUEST_Y + (SAVE_FILE_PAD*_i);
            draw_sprite_(_spr,0, _x,_y, _pi);
        }
        
        
        // Death count
            _text = string(stats[_i,2]);
        repeat(3-string_length(_text))
        {   _text = '0'+_text;  }
        
        _x = DEATHS_X;
        _y = DEATHS_Y + (SAVE_FILE_PAD*_i);
        draw_text_(_x, _y, _text, -1,_pi);
        
        
        // Levels
        _y = LEVELS_Y + (SAVE_FILE_PAD*_i);
        for(_j=0; _j<=2; _j++) // Each stat (Atk,Mag,Lif)
        {
            _text = string(stats[_i, 3+_j]);
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
    var _STATE = FileSelect_Rando_is_on(-1);
    
    // "OFF"/"ON" text after "RANDO" text
    _x  = saveNameX;
    _x += (string_length("RANDO")+1)<<3;
    _y  = RandoOptions_Y;
    _y += $2; // micro adj
    if (_STATE) _text = Text_ON;
    else        _text = Text_OFF;
    var _len = string_length(_text);
    draw_text_(_x,_y, _text, -1,PI_MENU);
    
    // Rando seed
    if (_STATE)
    {
        _count  = string_length(Text_ON);
        _count += $01; // pad
        _x += _count<<3;
        _y += RandoSeedY_ADJ1;
        Rando_draw_seed(_x,_y, FileSelect_get_file_seed(Register_file_num,1));
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
{   // Fairy - menu cursor
    _spr = sprites_fairy[sprites_fairy_idx];
    _x = fairy_x;
    _y = fairy_y;
    switch(state)
    {
        // ---------------------------------------------------------
        case State_MAIN:{
        if (Main_cursor==MainOption_REGISTER    // "REGISTER YOUR NAME"
        ||  Main_cursor==MainOption_ELIMINATE ) // "ELIMINATION MODE"
        {
            _y -= $04; // micro adj
        }
        break;}//case State_MAIN
        
        
        // ---------------------------------------------------------
        case State_REGISTER:{
        _y = FAIRY_Y2;
        switch(Register_cursor){
        default:{                  _y+=Register_cursor*SAVE_FILE_PAD; break;}
        case RegisterOption_RANDO:{_y+=(SAVE_FILE_MAX*SAVE_FILE_PAD)+8; break;}
        case RegisterOption_END:  {_y+=(SAVE_FILE_MAX*SAVE_FILE_PAD)+8; _y+=$02<<3; break;}
        }//switch(Register_cursor)
        break;}//case State_REGISTER
        
        
        // ---------------------------------------------------------
        case State_RANDO:{
        _val = $01<<3;
        switch(RandoState)
        {
            case RandoState_MAIN:{
            _x = dg_RandoMAIN_Options[#0,0] - _val;
            _y = dg_RandoMAIN_Options[#RandoMAIN_cursor,1] + 1;
            break;}//case RandoState_MAIN
            
            case RandoState_ITEM:{
            _x = dg_RandoITEM_Options[#0,0] - _val;
            _y = dg_RandoITEM_Options[#RandoITEM_cursor,1] + 1;
            break;}//case RandoState_ITEM
            
            case RandoState_SPELL:{
            _x = dg_RandoSPELL_Options[#0,0] - _val;
            _y = dg_RandoSPELL_Options[#RandoSPELL_cursor,1] + 1;
            break;}//case RandoState_SPELL
            
            case RandoState_DUNGEON:{
            _x = dg_RandoDUNGEON_Options[#0,0] - _val;
            _y = dg_RandoDUNGEON_Options[#RandoDUNGEON_cursor,1] + 1;
            break;}//case RandoState_DUNGEON
            
            case RandoState_ENEMY:{
            _x = dg_RandoENEMY_Options[#0,0] - _val;
            _y = dg_RandoENEMY_Options[#RandoENEMY_cursor,1] + 1;
            break;}//case RandoState_ENEMY
            
            case RandoState_OTHER:{
            switch(RandoOTHER_state)
            {   // ---------------------------------------------
                case RandoOTHER_state_MAIN:{
                _x = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,0] - _val;
                _y = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,1] + 1;
                break;}//case RandoOTHER_state_MAIN
                
                // ---------------------------------------------
                case RandoOTHER_state_ITEMS:{
                _x  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_cursor_ITEM,0] - _val;
                _y  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_cursor_ITEM,1] + 1;
                switch(RandoOTHER_ITEMS_cursor){
                case RandoOTHER_ITEMS_cursor_ITEM:{_x+=0; _y+=0; break;}
                case RandoOTHER_ITEMS_cursor_BACK:{_x+=0; _y+=RandoOTHER_ITEMS_cursor_BACK_YOFF; break;}
                }//switch(RandoOTHER_ITEMS_cursor)
                break;}//case RandoOTHER_state_ITEMS
                
                // ---------------------------------------------
                case RandoOTHER_state_SPELLS:{
                _x = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor,0] - _val;
                _y = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor,1] + 1;
                break;}//case RandoOTHER_state_SPELLS
                
                // ---------------------------------------------
                case RandoOTHER_state_REQUIRE:{
                _x = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor,0] - _val;
                _y = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor,1] + 1;
                break;}//case RandoOTHER_state_REQUIRE
            }//switch(RandoOTHER_state)
            break;}//case RandoState_OTHER
            
            case RandoState_SEED:{
            _x = dg_RandoSEED_Options[#0,0] - _val;
            _y = dg_RandoSEED_Options[#RandoSEED_cursor,1] + 1;
            break;}//case RandoState_SEED
        }//switch(RandoState)
        
        _y += $02; // micro adj
        break;}//case State_RANDO
    }
    draw_sprite_(_spr,0, _x,_y, PI_MOB_ORG);
    
    
    // Lonk doll icons
    for(_i=0; _i<SAVE_FILE_MAX; _i++)
    {
        if (_dl_CAN_COLOR_FILE[|_i]) _pi = PI_PC_1;
        else                         _pi = PI_DARKLONK;
        _x = doll_x;
        _y = doll_y + (SAVE_FILE_PAD*_i) + 1;
        draw_sprite_(SPR_DOLL,0, _x,_y, _pi);
    }
}





// ---------------------------------------------------------------------------------------------
// Blinking cursors
if (state==State_REGISTER 
&&  timer&$8 ) // blink
{
    if (Register_cursor<SAVE_FILE_MAX)
    {
        draw_sprite_(spr_1x1_WHT,0, cursor_name_x,cursor_name_y, -1, CURSOR_SIZE,CURSOR_SIZE, p.C_ORG2);
        draw_sprite_(spr_1x1_WHT,0, cursor_char_x,cursor_char_y, -1, CURSOR_SIZE,CURSOR_SIZE, p.C_ORG2);
    }
}





// ---------------------------------------------------------------------------------------------
if (covered) g.surf.draw_clear_color = p.C_BLK1;






ds_list_destroy(_dl_CAN_COLOR_FILE); _dl_CAN_COLOR_FILE=undefined;




/*
if (0)
{   // Debug stuff
    _x = surf_MAIN_XL+(surf_MAIN_CLMS<<3);
    draw_line_colour(surf_MAIN_XL,viewYT(), surf_MAIN_XL,viewYB(), c_fuchsia,c_fuchsia); // surf xl
    draw_line_colour(          _x,viewYT(),           _x,viewYB(), c_fuchsia,c_fuchsia); // surf xr
    draw_line_colour(    viewXC(),viewYT(),     viewXC(),viewYB(), c_orange, c_orange);
}
*/




