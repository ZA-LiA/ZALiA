/// PauseMenu_update()


//if (timer)  timer--;
if (timer0) timer0--;

// 9DD0, 9DDB: JSR 9B19

state_dir += -sign(state_dir);

state &= $33;




// 9DDE, 9DE1: JSR D385
switch(g.menu_state)
{
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 1:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    // A31C
    g._074F = $C0;
    LifeDolls_count         = get_life_doll_count();
    ContainerPiece_count_hp = cont_piece_cnt_hp();
    ContainerPiece_count_mp = cont_piece_cnt_mp();
    
    
    if (f.quest_num==1)
    {
        dg_items[#ITM_NOTE_IDX,$01] = $14;
        dg_items[#ITM_MIRR_IDX,$01] = $24;
        dg_items[#ITM_TRPH_IDX,$01] = $38;
        dg_items[#ITM_MEDI_IDX,$01] = $4C;
        dg_items[#ITM_CHLD_IDX,$01] = $5D;
    }
    else
    {
        dg_items[#ITM_NOTE_IDX,$01] = $11;
        dg_items[#ITM_MIRR_IDX,$01] = $1F;
        dg_items[#ITM_TRPH_IDX,$01] = $30;
        dg_items[#ITM_MEDI_IDX,$01] = $41;
        dg_items[#ITM_CHLD_IDX,$01] = $51;
        dg_items[#ITM_BTL1_IDX,$01] = $60;
        
        if (val(f.dm_quests[?STR_Bottle+"01"+STR_State]))
        {    dg_items[#ITM_BTL1_IDX,$03] = ITM_BTL1_SPR2;  } // Bottle full
        else dg_items[#ITM_BTL1_IDX,$03] = ITM_BTL1_SPR1;   //  Bottle empty
        
    }
    
    
    dg_icons1[#0,1] = g.CHAR_TIMES + string(lives);
    dg_icons1[#2,1] = g.CHAR_TIMES + string(f.kakusu_count);
    var _text = g.CHAR_TIMES;
    if (f.items&ITM_SKEY)
    {
        _text += "A";
    }
    else
    {
        var _DUNGEON_NUM = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], g.dungeon_num);
        _text += string(get_key_count(_DUNGEON_NUM));
        //_text = string(f.key_count);
    }
    dg_icons1[#1,1] = _text;
    
    
    
    if (g.town_name==STR_Bulblin 
    //if (g.area_name==Area_TownB 
    && !g.pc.Disguise_enabled )
    //&& !(f.items&ITM_MASK) )
    {
        MapAreaName = MapAreaName_DEF;
    }
    else if (g.encounter_type)
    {
        MapAreaName = global.OVERWORLD.dg_AreaNames[#(global.OVERWORLD.pcrc>>0)&$FF,(global.OVERWORLD.pcrc>>8)&$FF];
    }
    else
    {
        MapAreaName = val(g.dm_rm[?   g.rm_name+MapAreaName_DATAKEY], MapAreaName_DEF);
        MapAreaName = val(f.dm_rando[?g.rm_name+MapAreaName_DATAKEY], MapAreaName);
    }
    
    aud_play_sound(get_audio_theme_track(dk_OpenGUI));
    timer0 = 0;
    g.menu_state++;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 2:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    // A148, A267
    // g.spell_ready = SPL_NONE;
    // g.spell_cast = SPL_NONE;
    timer0 = 0;
    g.menu_state++;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 3:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
               state &= $3;
    if(!state) state  = state_SPELL;
    
    rm_pal_on_open = p.pal_rm_curr;
    change_pal(strReplaceAt(rm_pal_on_open, p.PAL_POS_MOB1, PAL_MOBS_LEN, PAL_MOBS));
    
    timer0 = 0;
    g.menu_state++;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 4:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    PauseMenu_update_1a(); // sets: g.spell_selected, map_clm_off,map_row_off
    
    var                      _count = ANIM_FRAMES_DEF; // Going to spell or item
    if (state&$3==state_MAP) _count = ANIM_FRAMES_MAP; // Going to Map
    
    var _C1 = true;
        //_C1 = Input.GP_Other6_pressed; // for testing. animation advances only 1 frame with button press
    if (_C1)
    {
        g.menu_built_count += g.menu_built_count<_count;
        g.menu_built_count -= g.menu_built_count>_count;
    }
    
    PauseMenu_udp();
    
    
    //timer0 = $10; // testing. slow down animation
    if (_C1 
    &&  g.menu_built_count==_count)
    {
        timer0 = 0;
        g.menu_state++;
    }
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 5:{ // PAUSEMENU INTERACTIVITY -------------------------------------------
    if (timer0) break;
    
    PauseMenu_update_2a();
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 6:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    // Start was pressed. Closing menu.
    
    if (g.menu_built_count>ANIM_FRAMES_DEF 
    ||  state&$03==state_MAP )
    {
        state = (state<<4) | (state>>4); // draws SPL or ITM as MAP closes
        g.menu_built_count--;
    }
    
    
    // A26B
    PauseMenu_udp();
    
    // A267
    timer0 = 0;
    g.menu_state++;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 7:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    // A3D7
        g.menu_built_count--;
    if (g.menu_built_count<0)
    {
        timer0 = 0;
        g.menu_state++; // menu_built_count below 0
    }
    else
    {
        PauseMenu_udp();
    }
    break;}
    
    
    
    
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    case 8:{ // ---------------------------------------------------------------------------------------------
    if (timer0) break;
    
    change_pal(rm_pal_on_open);
    
    // A338
    timer0 = 0;
    g.gui_state        = g.gui_state_NONE;
    g.menu_state       = 0;
    g.menu_built_count = 0;
    break;}
}


state &= $33;




