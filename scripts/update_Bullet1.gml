/// update_Bullet1()


// 974E
// if (yt>=$C5) // OG
// ver 2 from Mau
if (collisionProjCS(0,0) 
&&  ver!=2 )
{   // 9754
    disintegrate_counter = $F4;
    state = state_EXPLODE;
}
else
{   // 9759
    Projectile_update_1a(despawn_offscreen_hor); // Projectile_update_1a(!isVal(pID, 6, 8));
}




