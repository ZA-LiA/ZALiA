/// update_Fireball1()


// 9627
// Only Acheman & Aruroda Fireball makes sound.
if (ver==2)
{
    aud_play_fire(true);
    // Sound._00ED |= $40;
}

// pID 3: 9C3D, 9C48
// pID 4: 962F, 9634
Projectile_update_3a(despawn_offscreen_hor); // vspd_adj == 0;




