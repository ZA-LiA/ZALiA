/// Octorok_update()


// D888(moving), D842(still)

if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------

// D845: JSR DC91 (still)
if!(abilities&ABL_WALK) facing_dir = dir_to_pc(id);


// D88B: JSR D848 (moving)
// counter.  Jump is on $00,80.  Face PC on $40,C0
counter = (counter+1)&$FF;


if (abilities&ABL_JUMP 
&& !(counter&$7F) )  // Jump on $00,80
{
    vspd = $E0; // Jump!!
}
updateY();



// D858
GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();



// D85E
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}
else
{
    // MOD. Prevent clip into ceiling
    GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;
    
    // at peak of jump
    if(!vspd 
    ||  vspd<vspd_grav )
    {
        if (abilities&ABL_SHOT 
        &&  is_facing_pc(id) 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            GOC1_create(xl,yt, facing_dir, projectile,projectile_ver);
        }
    }
}






// moving Octorok
if (abilities&ABL_WALK) // v2
{   // D88E
    if (cs&$3)
    {
        facing_dir = -facing_dir;
        hspd      = byte_negate(hspd);
    }
    
    updateX();
    
    // D89A:  Face and move towards PC
    if ((counter<<1)&$FF == $80) // on $40,C0
    {
        facing_dir = dir_to_pc(id);
        hspd      = ($08*facing_dir) &$FF;
    }
}



// D8A9
if (abilities&ABL_SHOT 
&&  ver==2 
&& !timer )
{
    timer = rand() | $80;
    
    if (cs&$4 
    &&  is_facing_pc(id) 
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        GOC1_create(xl,yt, facing_dir, projectile,projectile_ver);
    }
}




