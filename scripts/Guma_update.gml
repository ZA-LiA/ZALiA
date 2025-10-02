/// Guma_update()


// BA57
if(!g.counter1) vspd = $D0;

if ( counter<$D8 
&& !(counter&$1F) )
{
    // BA6A: JSR BC23
    behavior = (behavior+1)&$FF;
    timer = $F; // attack delay timer
}

// BA6D
if (timer==1 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    behavior = 1;
    
    with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver)) // Bolo
    {
        hspd = (hspd>>1) | (hspd&$80);
        vspd = $D5;
    }
}

// BA90
if (counter&$40) hspd = (-$8) &$FF;
else             hspd = ( $8) &$FF;

updateY();

counter = (counter+1)&$FF;

GO_update_cs();

// BAA5
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}

// MOD. Prevent clip into ceiling
GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;

// BAAE
GOB_update_1(true); // update hspdPB

GO_update_cs();

if!(cs&$3) updateX();



// BAB1
GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();

if!(g.counter1&$F) facing_dir = dir_to_pc(id);




