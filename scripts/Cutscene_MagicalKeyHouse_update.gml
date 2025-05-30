/// Cutscene_MagicalKeyHouse_update()


if (spell_last_used()!=SPL_SPEL 
&&  g.cutscene!=g.CUTSCENE_BUILD_HOUSE1 )
// if (g.spell_cast != SPL_SPEL)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _cutscene_COPY = g.cutscene;

cutscene_build_house_1(-1,$04, CLM,ROW, depth);
//cutscene_build_house_1(-1,$04, CLM,ROW);

if(!_cutscene_COPY 
&&  g.cutscene )
{   // The frame the cutscene started.
    aud_play_sound(get_audio_theme_track(dk_MagicalKeyHouse));
}

if (_cutscene_COPY 
&& !g.cutscene )
{   // The frame the cutscene fininshed
    with(Exit)
    {
        if (exitName==val(g.dm_rm[?dk_MagicalKeyHouse+dk_ExitName]))
        {
            open = 1;
            break;//with(Exit)
        }
    }
    //with(Exit) if (exitName==g.MKH_EXIT_NAME){open = 1; break;}
}


if (g.cutscene) g.pc_lock = PC_LOCK_ALL;




