/// NPC_7_update()

// NPC_6: Skill Knight
// NPC_7: Wise Man


// ----------------------------------------------------------------------------------
// 97A9: JSR 9A9B
if (NPC_update_1()) // if in dialogue with this instance
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ----------------------------------------------------------------------------------
// 97AC: JSR 9A8D,   9A8D: JSR EF11
update_EF11();

// 97AF,   97B3: DC91
facingDir = dir_to_pc(id);

// 97B6, 97CA, 97CD: JMP 9A33
// --- Auto dialogue Spell Giver, Skill Knight ---
// Activate dialogue when PC is close enough
// Code source is Spell Giver logic
if (talked_to_count)
{   // This is so player doesn't have to re-enter 
    // rm to talk again, like for Boulder Circle dialogue
    if (object_index!=NPC_7    // if not a wise man
    ||  give_spell!=SPL_FARY ) // Any wise man except the FAIRY/CUCCO ones
    {
        NPC_update_2();
    }
}
else
{
    var _EXTRA = $10;
    var _Y = yt-_EXTRA;
    if(!g.pc.ogr              // if PC on ground
    &&  hINh(_Y,abs((GROUND_Y+_EXTRA)-_Y), g.pc.yt,g.pc.hh)  // 
    //&&  hINh(_Y,abs(GROUND_Y-_Y), g.pc.yt,g.pc.hh)  // 
    //&&  hINh(yt-_EXTRA,hh+(_EXTRA<<1), g.pc.yt,g.pc.hh)  // 
    //&&  abs(y-g.pc.y) <= hh_  // mod 2022/05/07
    &&  abs(x-g.pc.x) < $20 )
    {
        NPC_activate_dialogue(); // activate dialogue
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}







// ----------------------------------------------------------------------------------
// For FAIRY and CUCCO wise men
if (g.mod_PC_CUCCO_1 
&&  g.mod_WISEMEN_CAST_SPELL 
&&  object_index==NPC_7 
&&  use_cucco_dlg 
&&  g.gui_state==g.gui_state_NONE )
{
    switch(use_cucco_dlg)
    {
        // -------------------------------------------------------
        case 1:{ // Special "whoops" dlg for turning PC into a cucco.
        NPC_activate_dialogue();   // activate dlg
        talked_to_count--; // because talkedToCount++ in NPC_update_2b()
        timer_a1 = $18;      // Delay Audio.SND_CAST_SPEL so it doesn't conflict w/ dlg closing sound.
        use_cucco_dlg = 2;
        break;}
        
        
        // -------------------------------------------------------
        case 2:{ // NPC teleports away in embarassment
        if (timer_a1) {timer_a1--; break;}
        
        CastSpellSprite_timer = CastSpellSprite_DURATION;
        aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell))
        //aud_play_sound(Audio.SND_CAST_SPEL);
        use_cucco_dlg = 3;
        break;}
        
        
        // -------------------------------------------------------
        case 3:{ // Fade out
        if (timer_a1) {timer_a1--; break;}
        
        if (CastSpellSprite_timer)
        {   // Fade effect.
            can_draw_self = CastSpellSprite_timer&$1;
            break;
        }
        
        GOB_despawn(id);
        // Set the spawn permission to -1 so NPC cannot spawn again, 
        // otherwise, NPC will respawn if area is refreshed.
        g.dm_spawn[?dk_spawn+STR_Spawn_Permission] = -1;
        break;}
    }
}




