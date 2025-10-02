/// TonnA_update()


if (abilities & ABL_WALK)
{
    if (cs&$3)
    {
        facing_dir = -facing_dir;
        hspd      = byte_negate(hspd);
    }
    
    updateX();
}


Enemy_update_3(); // update vertical


GO_update_cs();


GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();




