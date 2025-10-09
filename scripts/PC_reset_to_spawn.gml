/// PC_reset_to_spawn(invulnerable value)

// Place PC back at spawn.


with(global.pc)
{
    iframes_timer = argument0;
    state = state_SPAWN;
    
    set_pc_spawn_xy();
    rm_set_cam_1a(spawn_xl+ww_, spawn_yt+hh_);
    
    // Cam position may have changed so some GO may qualify for spawn.
    update_go_spawn_1b(true);
}




