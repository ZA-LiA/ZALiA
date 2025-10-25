/// Audio_update()


// ------------------------------------------------------------------------------------------------------------
with(Audio) // with(Audio) -----------------------------------------------------------------------------------
{
    var _i,_j;
    
    
    // MUTE/UN-MUTE - music("M") / sound("S")
    // update fire sound
    Audio_update_1();
    
    
    // ------------------------------------------------------------------------
    // update boss music and scene music
    Audio_update_2();
    
    
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    if (rm_music_theme==STR_Title 
    &&  g.ChangeRoom_timer<=0 )
    {
        if (audio_get_name(timing_sound_inst)!=audio_get_name(snd_Default_Title_Intro_no_volume) 
        &&  audio_get_name(timing_sound_inst)!=audio_get_name(snd_Default_Title_no_volume) )
        {
            timing_sound_inst = aud_play_sound(snd_Default_Title_Intro_no_volume, 1,false);
            //sdm(audio_get_name(timing_sound_inst)+", start");
        }
        else
        {
            if (audio_get_name(  timing_sound_inst)==audio_get_name(snd_Default_Title_Intro_no_volume) 
            && !audio_is_playing(timing_sound_inst) )
            {
                timing_sound_inst = aud_play_sound(snd_Default_Title_no_volume, 1,true);
                //sdm(audio_get_name(timing_sound_inst)+", start");
            }
        }
    }
    
    // ------------------------------------------------------------------------
    if (mus_rm_inst 
    &&  audio_is_playing(mus_rm_inst) )
    {
        mus_rm_pos_prev = mus_rm_pos_curr;
        mus_rm_pos_curr = audio_sound_get_track_position(mus_rm_inst);
    }
    else
    {
        mus_rm_pos_prev = 0;
        mus_rm_pos_curr = 0;
    }
    
    // ------------------------------------------------------------------------
    // The timing_sound_.. variables are used to loop the title screen scrolling properly
    // The track position of a sound instance on any given frame is a very precise 
    // fraction and does NOT start at 0 on the frame it loops.
    if (timing_sound_inst 
    &&  audio_is_playing(timing_sound_inst) )
    {
        timing_sound_position_prev = timing_sound_position_curr;
        timing_sound_position_curr = audio_sound_get_track_position(timing_sound_inst);
    }
    else
    {
        timing_sound_position_prev = 0;
        timing_sound_position_curr = 0;
    }
    
    
    if (mus_rm_inst 
    &&  audio_is_playing(mus_rm_inst) 
    &&  mus_rm_body 
    &&  audio_get_name(mus_rm_inst)==audio_get_name(mus_rm_body) )
    {
        mus_rm_body_last_pos = audio_sound_get_track_position(mus_rm_inst);
    }
    
    
    
    
    
    
    
    // ------------------------------------------------------------------------
    /*
    if (pitch1_timer2)
    {
        pitch1 = 1;
        pitch1_timer = 0;
        
        pitch1_timer2--;
        if(!pitch1_timer2)
        {
            pitch1_timer = irandom(pitch1_DURATION1-1)+$20;
            pitch1_dir = sign_(irandom(1));
        }
    }
    else if (pitch1_timer)
    {
        pitch1_timer--;
        pitch1 = 1;
        
        if (pitch1_timer)
        {
            var _val = pitch1_timer/pitch1_duration;
            if (pitch1_dir)
            {
                if (pitch1<1)
                {
                    pitch1 = min(1, pitch1_MIN + (abs(1-pitch1_MIN)*_val));
                }
                else
                {
                    pitch1 = min(pitch1_MAX, 1 + (abs(1-pitch1_MAX)*_val));
                }
            }
            else
            {
                if (pitch1<1)
                {
                    pitch1 = max(pitch1_MIN, 1 - (abs(1-pitch1_MIN)*_val));
                }
                else
                {
                    pitch1 = max(1, 1 - (abs(1-pitch1_MAX)*_val));
                }
            }
            
            //pitch1  = clamp(pitch1, pitch1_MIN,pitch1_MAX);
        }
        else
        {
            pitch1 = 1;
        }
    }
    else if(!pitch1_timer2)
    {
        pitch1_timer2 = irandom($1F)+$10;
    }
    
    
    
    if (mus_rm_inst 
    &&  mus_rm_body 
    &&  audio_is_playing(mus_rm_inst) )
    {
        if (audio_get_name(mus_rm_inst)==audio_get_name(mus_Town_Intro_1a) 
        ||  audio_get_name(mus_rm_inst)==audio_get_name(mus_Town_Body_1a) )
        {
            audio_sound_pitch(mus_rm_inst,pitch1);
        }
    }
    */
}//with(Audio)







/* // Test sounds
if(keyboard_check_pressed(vk_f4))
{
    //aud_play_sound(snd_importTest01);
    //aud_play_sound(max(0,asset_get_index("snd_zzzzzzzz")),$FF,false); // testing if this gives error. result: it does not
    //aud_play_sound(max(0,asset_get_index("snd_Lock_Open_1a")),$FF,false);
    //var _IDX = asset_get_index("snd_Lock_Open_1a");
    //if (_IDX!=-1) aud_play_sound(_IDX,$FF,false);
    //aud_play_sound(snd_Boomerang_1a);
    //aud_play_sound(snd_Strike_Enemy_1a);
    //aud_play_sound(snd_Lock_Open_1a,$FF,false, .8);
    //aud_play_sound(snd_ZeldaII_FDS_StabSolid,$FF,false, .4);
    //aud_play_sound(snd_Strike_Solid_1a,$FF,false, .4);
    
    //aud_play_sound(Audio.SND_BRDG_CRBL);
    //aud_play_sound(Audio.SND_BLOK_BRK1, $FF,false, .4);
    //aud_play_sound(Audio.SND_ELEV_MVE1, $FF,false, .7);
    //aud_play_sound(snd_Z1_Step_1a);
    //aud_play_sound(snd_Walk_Water_1a);
    //aud_play_sound(snd_SuperMarioBros3_CanonFiring_2ndPart, $FF,false, .7);
    //aud_play_sound(snd_ZeldaII_BassNote01);
    //Audio.testing_num=(Audio.testing_num+1) mod $F;
    //aud_play_combo1(Audio.testing_num);
    //aud_play_combo1($14);
    var _COUNT1=$17; show_debug_message("Audio_update(). "+"Audio.testing_num=$"+hex_str(Audio.testing_num));
    aud_play_combo1(Audio.testing_num); Audio.testing_num=(Audio.testing_num+1) mod _COUNT1;
}
*/




