/// Wosu_update()


// B362: JSR DE3D
GO_update_cs();

// DE40
GOB_update_2();
// B365
if (cs&CS_BD1) enemy_collide_pc_body();


if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = $F0; // JUMP!!
    counter = !counter; // 0,1. determines sprite
}

// MOD. Prevent clip into ceiling
GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;


// B37B
updateY();


if (cs&$3)
{
    facing_dir = -facing_dir;
    hspd      = byte_negate(hspd);
}

updateX();



if (ver==2 
&&  state==state_EXPLODE )
{
    with(GOC1_create(x-4,yt, facing_dir, projectile,projectile_ver))
    {
        hspd = 0;
    }
}




