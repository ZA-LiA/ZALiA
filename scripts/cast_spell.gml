/// cast_spell(spell)


with(g)
{
    var _SPELL_CAST = argument0;
    
    
    spell_cast_this_frame      = _SPELL_CAST;
    spell_selected             = _SPELL_CAST;
    spells_active             |= _SPELL_CAST;
    ds_list_add(dl_spell_history,_SPELL_CAST);
    
    spell_ready = 0;
    
    var _DURATION = p.SpellFlash_DURATION1; // SpellFlash_DURATION1=$20
    p.Flash_Pal_timer = _DURATION;
    if (_SPELL_CAST & (SPL_RFLC|SPL_SPEL|SPL_THUN|SPL_SUMM))
    {
        p.Flash_Bgr_timer = _DURATION;
    }
    p.SpellReady_flash_timer = _DURATION;
    p.SpellFlash_PC_timer    = _DURATION;
    
    
    if (_SPELL_CAST&SPL_FARY)
    {
        var _TO_HUMAN = false;
        
        if (CuccoSpell2_Acquired 
        &&  CuccoSpell2_Option )
        {
                CuccoSpell2_Active = !CuccoSpell2_Active;
            if(!CuccoSpell2_Active)
            {
                _TO_HUMAN = true;
                with(global.pc)
                {
                    var _ROW_UNDER = yb>>3;
                        _ROW_UNDER = find_row_solid(TID_SOLID1|TID_ONEWY1, x>>3,_ROW_UNDER,     1,0,  _ROW_UNDER);
                    var _ROW_ABOVE = find_row_solid(TID_SOLID1,            x>>3,_ROW_UNDER-1,  -1,0,  0);
                    //sdm("_ROW_UNDER $"+hex_str(_ROW_UNDER)+", _ROW_ABOVE $"+hex_str(_ROW_ABOVE)+", _ROW_UNDER-_ROW_ABOVE $"+hex_str(_ROW_UNDER-_ROW_ABOVE));
                    if (_ROW_UNDER-_ROW_ABOVE<=4)
                    {
                        //sdm("yb>>3 $"+hex_str(yb>>3)+", _ROW_UNDER $"+hex_str(_ROW_UNDER)+", _ROW_ABOVE $"+hex_str(_ROW_ABOVE));
                        TransformHumanClipCorrect_timer=$18;
                    }
                    
                    set_xy(id, x, y-8);
                }
                
                spells_active &= ~SPL_FARY;
            }
        }
        
        
        with(global.pc)
        {   // set properties specific to PC's form(cucco, fairy, Lonk)
            is_cucco = true;
            PC_update_1a();
            
            Cucco_damage_taken  = 0;
            Cucco_damaged_count = 0;
            
            Cucco_rage_timer    = 0;
            Cucco_rage_state    = 0;
            
            if(!g.CuccoSpell2_SolidClip_exploit 
            &&  _TO_HUMAN 
            && !TransformHumanClipCorrect_timer )
            {
                GO_update_cs();
                if (collide_solid_grid(csRgt1X,csRgt1Y) 
                ||  collide_solid_grid(csRgt2X,csRgt2Y) )
                {
                    if (collide_solid_grid(csBtm2X,csBtm2Y) 
                    &&  collide_solid_grid(csBtm2X,csBtm2Y-8) )
                    {
                        set_xy(id, x-((csBtm2X&$7)+1), y);
                        GO_update_cs();
                    }
                }
                else
                {
                    if (collide_solid_grid(csLft1X,csLft1Y) 
                    ||  collide_solid_grid(csLft2X,csLft2Y) )
                    {
                        if (collide_solid_grid(csBtm1X,csBtm1Y) 
                        &&  collide_solid_grid(csBtm1X,csBtm1Y-8) )
                        {
                            set_xy(id, x+(8-(csBtm1X&$7)), y);
                            GO_update_cs();
                        }
                    }
                }
            }
        }
    }
    
    
    // NOTE: This snd should be interrupted when casting a spell.
    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
    
    // MOD. Give THUNDER a sound
    if (_SPELL_CAST&SPL_THUN) aud_play_combo1($10);
}




