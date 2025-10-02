/// Doomknocker_update()


// B0AD

// Set attack timer
if!(counter&$7F) timer = $10;

if (timer==1 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver, id))
    {
        counter = $40;
    }
}


// B0D7
if (counter&$40) hspd = (-$8) &$FF;
else             hspd = ( $8) &$FF;

// JUMP!!!
if(!g.counter1)  vspd =  $D0;

updateY();

GOB_update_1(true); // hspdPB
GO_update_cs();
if!(cs&$3) updateX();


// B0EA: JSR DE3D
GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();

// B0F0
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
    
    counter = (counter+1)&$FF;
}

// MOD. Prevent clip into ceiling
GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;

// B0FB
facing_dir = dir_to_pc(id);




