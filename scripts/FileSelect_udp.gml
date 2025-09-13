/// FileSelect_udp()


var _i, _val;


for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    if (state==State_MAIN 
    ||  state==State_ELIMINATE 
    ||  save_num_selected )
    {    dl_can_color_file[|_i] = dl_save_file_registered[|_i];  }
    else dl_can_color_file[|_i] = _i+1==Register_file_num;
}




// Fairy - menu cursor -------------------------------------------------
MenuCursor_sprite = dl_sprites_fairy[|sprites_fairy_idx];;
MenuCursor_x = fairy_x;
MenuCursor_y = fairy_y;
switch(state)
{
    // ---------------------------------------------------------
    case State_MAIN:{
    if (Main_cursor==MainOption_REGISTER    // "REGISTER YOUR NAME"
    ||  Main_cursor==MainOption_ELIMINATE ) // "ELIMINATION MODE"
    {
        MenuCursor_y -= $04; // micro adj
    }
    break;}//case State_MAIN
    
    
    // ---------------------------------------------------------
    case State_REGISTER:{
    MenuCursor_y = FAIRY_Y2;
    switch(Register_cursor)
    {
        default:{
        MenuCursor_y += Register_cursor*SAVE_FILE_PAD;
        break;}
        
        case RegisterOption_RANDO:{
        MenuCursor_y += (SAVE_FILE_MAX*SAVE_FILE_PAD)+8;
        MenuCursor_y += RandoOptions_YOFF1;
        break;}
        
        case RegisterOption_END:{
        MenuCursor_y += (SAVE_FILE_MAX*SAVE_FILE_PAD)+8;
        MenuCursor_y += RandoOptions_YOFF1;
        MenuCursor_y += $02<<3;
        break;}
    }//switch(Register_cursor)
    break;}//case State_REGISTER
    
    
    // ---------------------------------------------------------
    case State_RANDO:{
    _val = $01<<3;
    switch(RandoState)
    {
        case RandoState_MAIN:{
        MenuCursor_x = dg_RandoMAIN_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoMAIN_Options[#RandoMAIN_cursor,1] + 1;
        break;}//case RandoState_MAIN
        
        case RandoState_ITEM:{
        MenuCursor_x = dg_RandoITEM_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoITEM_Options[#RandoITEM_cursor,1] + 1;
        break;}//case RandoState_ITEM
        
        case RandoState_SPELL:{
        MenuCursor_x = dg_RandoSPELL_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoSPELL_Options[#RandoSPELL_cursor,1] + 1;
        break;}//case RandoState_SPELL
        
        case RandoState_DUNGEON:{
        MenuCursor_x = dg_RandoDUNGEON_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoDUNGEON_Options[#RandoDUNGEON_cursor,1] + 1;
        break;}//case RandoState_DUNGEON
        
        case RandoState_ENEMY:{
        MenuCursor_x = dg_RandoENEMY_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoENEMY_Options[#RandoENEMY_cursor,1] + 1;
        break;}//case RandoState_ENEMY
        
        case RandoState_OTHER:{
        switch(RandoOTHER_state)
        {   // ---------------------------------------------
            case RandoOTHER_state_MAIN:{
            MenuCursor_x = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,0] - _val;
            MenuCursor_y = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,1] + 1;
            break;}//case RandoOTHER_state_MAIN
            
            // ---------------------------------------------
            case RandoOTHER_state_ITEMS:{
            MenuCursor_x  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_cursor_ITEM,0] - _val;
            MenuCursor_x -= $3; // micro adj
            MenuCursor_y  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_cursor_ITEM,1] + 1;
            switch(RandoOTHER_ITEMS_cursor){
            case RandoOTHER_ITEMS_cursor_ITEM:{MenuCursor_x+=0; MenuCursor_y+=0; break;}
            case RandoOTHER_ITEMS_cursor_BACK:{MenuCursor_x+=0; MenuCursor_y+=RandoOTHER_ITEMS_cursor_BACK_YOFF; break;}
            }//switch(RandoOTHER_ITEMS_cursor)
            break;}//case RandoOTHER_state_ITEMS
            
            // ---------------------------------------------
            case RandoOTHER_state_SPELLS:{
            MenuCursor_x = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor,0] - _val;
            MenuCursor_y = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor,1] + 1;
            break;}//case RandoOTHER_state_SPELLS
            
            // ---------------------------------------------
            case RandoOTHER_state_REQUIRE:{
            MenuCursor_x  = dg_RandoOTHER_REQUIRE[#0,0] - _val;
            MenuCursor_x -= $3; // micro adj
            MenuCursor_y  = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor,1] + 1;
            break;}//case RandoOTHER_state_REQUIRE
        }//switch(RandoOTHER_state)
        break;}//case RandoState_OTHER
        
        case RandoState_SEED:{
        MenuCursor_x = dg_RandoSEED_Options[#0,0] - _val;
        MenuCursor_y = dg_RandoSEED_Options[#RandoSEED_cursor,1] + 1;
        break;}//case RandoState_SEED
    }//switch(RandoState)
    
    MenuCursor_y += $02; // micro adj
    break;}//case State_RANDO
}




switch(state)
{
    case State_MAIN:{
    
    break;}
    
    
    case State_REGISTER:{
    
    break;}
    
    
    case State_RANDO:{
    
    break;}
    
    
    case State_ELIMINATE:{
    
    break;}
}//switch(state)




