/// Moby_update()


if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// 9B94: JSR DA02, 9B97
if (yt >= g.pc.yt)
{
    hspd = ($20*facing_dir) &$FF;
    vspd = 0;
}

// 9BA7, 9BAA
updateY();
updateX();

// 9BAD: JSR DE40
GOB_update_2();
// E2EF
if (cs&CS_BD1) enemy_collide_pc_body();




