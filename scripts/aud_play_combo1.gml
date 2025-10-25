/// aud_play_combo1(combo num)


with(Audio)
{
    switch(argument0){
    case $00:{aud_play_sound(get_audio_theme_track(STR_Stab)); aud_play_sound(get_audio_theme_track(dk_StrikeEnemy)); break;} // 
    case $01:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_TypeChar)); break;} // 
    case $02:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu)); break;} // ****
    case $03:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_ElevatorMove)); break;} // 
    case $04:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_ItemDrop)); break;} // 
    case $05:{aud_play_sound(get_audio_theme_track(STR_Stab));   aud_play_sound(get_audio_theme_track(dk_TypeChar)); break;} // **
    case $06:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu)); aud_play_sound(get_audio_theme_track(dk_ElevatorMove)); break;} // *
    case $07:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_BlockBreak)); break;} // 
    case $08:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_ElevatorMove)); aud_play_sound(get_audio_theme_track(dk_WalkWater+"02")); aud_play_sound(get_audio_theme_track(dk_ChooseChar), 0,false, .2); break;} // 
    case $09:{aud_play_sound(get_audio_theme_track(dk_ElevatorMove)); aud_play_sound(get_audio_theme_track(dk_WalkWater+"02")); break;} // 
    //case $0A:{aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell)); aud_play_sound(SND_SPWN_ITM1); break;} // 
    case $0A:{aud_play_sound(snd_Cast_Spell_1a); aud_play_sound(get_audio_theme_track(dk_ItemDrop)); break;} // 
    case $0B:{aud_play_sound(get_audio_theme_track(dk_StrikeEnemy)); aud_play_sound(get_audio_theme_track(dk_EnemyDeath)); break;} // 
    case $0C:{aud_play_sound(get_audio_theme_track(dk_StrikeEnemy)); aud_play_sound(get_audio_theme_track(dk_EnemyDeath)); aud_play_sound(get_audio_theme_track(STR_Open+STR_LockedDoor)); break;} // 
    case $0D:{aud_play_sound(get_audio_theme_track(dk_BlockBreak)); aud_play_sound(get_audio_theme_track(dk_StrikeEnemy),0,false,.5); break;} // 
    case $0E:{aud_play_sound(get_audio_theme_track(dk_ItemDrop)); aud_play_sound(get_audio_theme_track(STR_Sword+STR_Beam)); break;} // 
    case $0F:{aud_play_sound(snd_ZeldaII_BassNote01); aud_play_sound(snd_SuperMarioBros3_CanonFiring_2ndPart, $FF,false, .7); aud_play_sound(get_audio_theme_track(dk_BlockBreak),$FF,false,.4); aud_play_sound(snd_Z1_Step_1a); break;} // 
    case $10:{aud_play_sound(snd_Boomerang_1a); aud_play_sound(snd_Strike_Enemy_1a); break;} // 
    case $11:{aud_play_sound(max(0,asset_get_index("snd_ZeldaII_FDS_EncounterEnter")),$FF,false,.6); aud_play_sound(snd_Z1_Secret); break;}
    case $12:{aud_play_sound(max(0,asset_get_index("snd_ZeldaII_FDS_Flute")),$FF,false,.6); aud_play_sound(snd_Flute_Item_1a); break;}
    //case $11:{aud_play_sound(snd_ZeldaII_FDS_EncounterEnter,$FF,false,.6); aud_play_sound(snd_Z1_Secret); break;}
    //case $12:{aud_play_sound(snd_ZeldaII_FDS_Flute,$FF,false,.6); aud_play_sound(snd_Flute_Item_1a); break;}
    case $13:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_Boomerang)); break;} // 
    case $14:{aud_play_sound(snd_Z1_Step_1a); aud_play_sound(get_audio_theme_track(STR_Stab)); break;} // 
    case $15:{aud_play_sound(snd_Z1_Step_1a); aud_play_sound(get_audio_theme_track(dk_StrikeEnemy)); break;} // 
    case $16:{aud_play_sound(get_audio_theme_track(dk_BridgeCrumble)); aud_play_sound(get_audio_theme_track(dk_Boomerang)); aud_play_sound(get_audio_theme_track(STR_Stab)); break;} // 
    }
}
/*
SND_LAUGH_GNN   = data_sound(snd_Laugh_Ganon_1a);
SND_PC_GRUNT1   = data_sound(snd_Grunt_PC_1a);

SND_STAB_1A     = data_sound(snd_Sword_Stab_1a);
SND_SWRD_BEAM   = data_sound(snd_Sword_Beam_1a, .6);
SND_STRK_ENM1   = data_sound(snd_Strike_Enemy_1a);
SND_SHLD_HIT1   = data_sound(snd_Ding_Shield_1a);
SND_STRK_SLD1   = data_sound(snd_Strike_Solid_1a, .6);
SND_BOOMERANG   = data_sound(snd_Boomerang_1a);

SND_DETH_PC_1   = data_sound(snd_Death_PC_1a);
SND_ENMY_DTH1   = data_sound(snd_Death_Enemy_1a);
SND_BOSS_EXPL   = data_sound(snd_Boss_Explode_1a);

SND_WLK_WTR1A   = data_sound(snd_Walk_Water_1a);
SND_WLK_WTR1B   = data_sound(snd_Walk_Water_1b);


SND_BLOK_BRK1   = data_sound(snd_Break_Block_1a);
SND_BRDG_CRBL   = data_sound(snd_Crumble_Bridge_1a);

SND_SPWN_ITM1   = data_sound(snd_Item_Drop_1a);             // Also pc-fairy sound
SND_ELEV_MVE1   = data_sound(snd_Elevator_Move_1a);
SND_LOCK_OPN1   = data_sound(snd_Lock_Open_1a);           // A shortened ver of 'boss explosion'
SND_RAIS_BARI   = data_sound(snd_Raise_Barrier_1a);

SND_CAST_SPEL   = data_sound(snd_Cast_Spell_1a);
SND_FLUTE_1A    = data_sound(snd_Flute_Item_1a);
SND_BEEP_HP_1   = data_sound(snd_Beep_Low_HP_1a_1, .8);

SND_GUI_OPEN    = data_sound(snd_GUI_Open_1a);
SND_CRSR_MVE1   = data_sound(snd_Cursor_Move_1a);         // Spell menu cursor move
SND_CRSR_MVE2   = data_sound(snd_Cursor_Move_2a);         // File Select cursor move
SND_CRSR_MVE3   = data_sound(snd_Cursor_Move_3a);         // In REGISTER NAME, moving cursor to diff char
SND_TYPE_CHR1   = data_sound(snd_Type_Char_1a);           // TODO: Fix type sound.
SND_CHOS_CHR1   = data_sound(snd_Choose_Char_1a);         // Choose a char in FileSelect 'REGISTER YOUR NAME'
SND_ELIM_SAVE   = data_sound(snd_Eliminate_file_1a);

SND_ENC_ENTER   = data_sound(snd_Encounter_Enter_1a);
SND_ENC_LEAVE   = data_sound(snd_Encounter_Leave_1a);

SND_ANCE_FARY   = data_sound(snd_Anounce_Fairy_1a);

SND_SECRET_1A   = data_sound(snd_Secret_1a_test1);          // Z1 'Secret Found' music
SND_BOSS_ROAR   = data_sound(snd_Z1_Boss_Roar_1a);          // Z1 Boss roar
SND_STEP_1A     = data_sound(snd_Z1_Step_1a);               // Z1 walk into dungeon, but just 1 step 
SND_STEPS_1A    = data_sound(snd_Z1_Steps_1a);              // Z1 walk into dungeon
SND_REVL_ITEM   = data_sound(snd_Z1_Reveal_Item_1a);        // Z1 reveal item
SND_TYPE_CHR2   = data_sound(snd_Z1_Type_Char_1a);          // Z1 type text char

SND_Z1_DNGN1_TRIANGLE_PART  = data_sound(snd_Z1_Dungeon_Part1_Triangle_1a);
*/




