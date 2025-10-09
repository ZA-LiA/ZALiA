/// Dev_StabToCheat_Step()



if(!g.use_StabToCheat)
{
    is_active = false;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// Key  "Y"  to toggle
if(!is_active)
{
    if (g.use_StabToCheat)
    {
        is_active = true;
        Dev_StabToCheat_update_1a(); // Populate dg_hb[#]
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

if (is_active 
&&  g.use_StabToCheat )
{
    if(!global.pc.SwordHB_collidable) 
    {
        collided_cheat = false;
        exit; // !!!!!!!!!!!!!!!!!
    }
    if (collided_cheat) exit; // !!!!!!!!!!!!!!!!!
    
    // ------------------------------------------------------------
    var _num = 0;
    PC_update_sword_hb();
    for(var _i=0; _i<OPTION_CNT; _i++)
    {
        if (rectInRect(dg_hb[#_i,0],dg_hb[#_i,1],dg_hb[#_i,2],dg_hb[#_i,3], global.pc.SwordHB_x,global.pc.SwordHB_y,global.pc.SwordHB_w,global.pc.SwordHB_h))
        {
            collided_cheat = true;
            _num = _i+1;
            break;
        }
    }
    
    if(!collided_cheat) exit; // !!!!!!!!!!!!!!!!!
    
    
    // ---------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------
    
    
    if (inRange(_num,1,8))
    {
        // Major items -----------------------------------------------------
        var             _bit = $1 <<(_num-1);
        if!(f.items &   _bit)
        {   f.items |=  _bit;  }
        else
        {
            f.items &= ~_bit;
            aud_play_sound(SND_REMOVE);
            exit; // !!!!!!!!!!!!!!!!!
        }
        
        global.pc.HoldItem_timer  = $20; // $70
        global.pc.HoldItem_palidx = global.PI_MOB_ORG;
        global.pc.HoldItem_ver    = 1;
        
                       global.pc.HoldItem_object = ItmA0;
        if (_num == 2) global.pc.HoldItem_object = ItmA1;
        if (_num == 3) global.pc.HoldItem_object = ItmA2;
        if (_num == 4) global.pc.HoldItem_object = ItmA3;
        if (_num == 5) global.pc.HoldItem_object = ItmA4;
        if (_num == 6) global.pc.HoldItem_object = ItmA5;
        if (_num == 7) global.pc.HoldItem_object = ItmA6;
        if (_num == 8) global.pc.HoldItem_object = ItmA7;
        
        aud_play_sound(get_audio_theme_track(dk_GetItem+"01"), -1,false,-1, dk_GetItem+"01");
    }
    else if (inRange(_num,9,10))
    {
        // Skills -----------------------------------------------------
        var              _bit = SKILL_THD;
        if (_num == 10)  _bit = SKILL_THU;
        if (f.skills &   _bit){
            f.skills &= ~_bit;
            aud_play_sound(SND_REMOVE);
            exit;
        }
            f.skills |=  _bit;
            aud_play_sound(get_audio_theme_track(dk_GetSpell), -1,false,-1, dk_GetSpell);
            
    }
    else if (inRange(_num,11,18))
    {
        // Spells -----------------------------------------------------
        var              _bit = 1 <<(_num-11);
        if (f.spells &   _bit) {
            f.spells &= ~_bit;
            aud_play_sound(SND_REMOVE);
            exit; // !!!!!!!!!!!!!!!!!!
        }
            f.spells |=  _bit;
            aud_play_sound(get_audio_theme_track(dk_GetSpell), -1,false,-1, dk_GetSpell);
            
    }
    else if (inRange(_num,19,20))
    {
        // Containers -----------------------------------------------------
        var _added="";
        
        if (_num==19)
        {
            if (cont_cnt_hp()==f.CONT_MAX_HP) exit;
            
            var _i,_j,_k, _count, _str,_str1, _can_add;
            var _COUNT = f.CONT_PIECE_PER_HP - (cont_piece_cnt_hp() mod f.CONT_PIECE_PER_HP);
            for (_i=0; _i<_COUNT; _i++)
            {
                for (_j=0; _j<f.CONT_PIECE_MAX_HP; _j++)
                {
                    _can_add=true;
                    _str  = hex_str((_j div f.CONT_PIECE_PER_HP) + 1);
                    _str += hex_str((_j mod f.CONT_PIECE_PER_HP) + 1);
                    
                    _count = cont_piece_cnt_hp();
                    for (_k=0; _k<_count; _k++)
                    {
                            _str1 = string_copy(f.cont_pieces_hp,(_k<<2)+1,4);
                        if (_str1==_str)
                        {
                            _can_add=false;
                            break;//_k
                        }
                    }
                    
                    if (_can_add)
                    {
                        _added+=_str;
                        f.cont_pieces_hp += _str;
                        break;//_j
                    }
                }
            }
            
            if (string_length(_added)) g.StatRestore_timer_hp = $FF;
        }
        else
        {
            if (cont_cnt_mp()==f.CONT_MAX_MP) exit;
            
            var _i,_j,_k, _count, _str,_str1, _can_add;
            var _COUNT = f.CONT_PIECE_PER_MP - (cont_piece_cnt_mp() mod f.CONT_PIECE_PER_MP);
            for (_i=0; _i<_COUNT; _i++)
            {
                for (_j=0; _j<f.CONT_PIECE_MAX_MP; _j++)
                {
                    _can_add=true;
                    _str  = hex_str((_j div f.CONT_PIECE_PER_MP) + 1);
                    _str += hex_str((_j mod f.CONT_PIECE_PER_MP) + 1);
                    
                    _count = cont_piece_cnt_mp();
                    for (_k=0; _k<_count; _k++)
                    {
                            _str1 = string_copy(f.cont_pieces_mp,(_k<<2)+1,4);
                        if (_str1==_str)
                        {
                            _can_add=false;
                            break;//_k
                        }
                    }
                    
                    if (_can_add)
                    {
                        _added+=_str;
                        f.cont_pieces_mp += _str;
                        break;//_j
                    }
                }
            }
            
            if (string_length(_added)) g.StatRestore_timer_mp = $FF;
        }
        
        if (string_length(_added))
        {
            //sdm("_added: "+_added);
                          global.pc.HoldItem_object = CONT_PIECE_OBJ_HP;
            if (_num==20) global.pc.HoldItem_object = CONT_PIECE_OBJ_MP;
            global.pc.HoldItem_timer  = $20; // OG: $70
            global.pc.HoldItem_palidx = global.PI_MOB_RED;
            aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
        }
        
    }
    else if (inRange(_num,21,23))
    {
        // Levels -----------------------------------------------------
        if (_num == 21){
            if (f.level_atk >= 8) exit;
                f.level_atk++;
        }
        else if (_num == 22){
            if (f.level_mag >= 8) exit;
                f.level_mag++;
        }
        else if (_num == 22){
            if (f.level_lif >= 8) exit;
                f.level_lif++;
        }
        
        aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
    }
    else if (inRange(_num,24,26))
    {
        // Levels -----------------------------------------------------
        if (_num == 24){
            if (f.level_atk < 1) exit;
                f.level_atk--;
        }
        else if (_num == 25){
            if (f.level_mag < 1) exit;
                f.level_mag--;
        }
        else if (_num == 26){
            if (f.level_lif < 1) exit;
                f.level_lif--;
        }
        
        aud_play_sound(SND_REMOVE);
    }
    else if (inRange(_num,27,31))
    {
        var     _NUM = _num-27;
        switch (_NUM)
        {
            // -----------------------------------
            case 0: {
            g.StatRestore_timer_mp += get_jar_restore_dur(1);
            break;  }
            
            
            // -----------------------------------
            case 1: {
            f.xpPending += 50;
            f.xpPending &= $FFFF;
            break;  }
            
            
            // -----------------------------------
            case 2: {
            f.xpPending += 100;
            f.xpPending &= $FFFF;
            break;  }
            
            
            // -----------------------------------
            case 3: {
            f.xpPending += 250;
            f.xpPending &= $FFFF;
            break;  }
            
            
            // -----------------------------------
            case 4: {
            f.xpPending += 500;
            f.xpPending &= $FFFF;
            break;  }
        }
    }
    else if (_num==32)
    {
        f.hp = 0;
        global.pc.is_dead = true;
        // pc_take_dmg();
    }
    
    
    
    
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
}




