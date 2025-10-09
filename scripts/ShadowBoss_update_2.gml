/// ShadowBoss_update_2()

// Used By: ShadowBoss, 


// 9A5F, 9AF9: JSR E371
pushback_pc_and_go(id);

// 9AFC
hspd = global.pc.hspd ^ $FF;

aud_play_sound(get_audio_theme_track(dk_StrikeSolid));




