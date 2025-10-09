/// Elevator_update()


if (state!=state_NORMAL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


/*
// -----------------------------------------------------------------
if (cs&CS_BD1)
{
    //Elevator_update_1();
    if (g.view_update_order==2) // view updates after gob
    {
        Elevator_update_1();
    }
}
*/


// -----------------------------------------------------------------
// D8C2
GO_update_cam_vars();

GO_update_cs(); // mod

update_EF11();
can_draw_self = true;

// E4D9 - PC_body collide GOB_body
update_body_hb_1a();

    cs &= ~CS_BD1; // remove CS_BD1 from cs
if (collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h))
{
    cs |=  CS_BD1;
    global.pc.colliding_elevator = id;
}




