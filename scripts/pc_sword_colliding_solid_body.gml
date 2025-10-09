/// pc_sword_colliding_solid_body()

// E654. PC sword collide GOB shield or GOB solid body


aud_play_sound(get_audio_theme_track(dk_StrikeSolid));

if (global.pc.behavior==global.pc.behavior_STAB_DOWN)
{
    PC_set_bounce();
}
else
{
    pushback_pc_and_go(id);
}




