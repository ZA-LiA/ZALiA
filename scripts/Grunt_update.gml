/// Grunt_update()


// 994F
timer = 8;

if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ---------------------------------------------------------
// 9957: JSR DE3D
GO_update_cs();

GOB_update_2();

// 995A: JSR E563: JSR E5F3
if(!GOB_sword_collision_2a()) // handles PC SHLD collision check & reaction
{   // E579: JSR E5F3
    GOB_sword_collision_1a(); // handles PC BODY collision check & reaction
}

// 995D. body to body collision
if (cs&CS_BD1) enemy_collide_pc_body();


// update x & y
// --------------------------------------------
// Turn around if run into wall
if ((hspd<$80 && cs&$1) 
||  (hspd&$80 && cs&$2) )
{
    hspd      = byte_negate(hspd);
    facing_dir = byte_dir(   hspd);
    cs &= ~(CS_RGT|CS_LFT);
}

// 9960
if!(cs&$3) updateX();
           updateY();
//
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}




