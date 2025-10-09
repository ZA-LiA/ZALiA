/// SpikeTrapC_update()


if (spin_dir!=0) // You can set spin_dir to 0 to stop all movement.
{
    set_xy_len_ang(id, spawn_xl,spawn_yt, (chain_length<<3)+LEN_OFF, angle);
    angle += speed1 * -spin_dir;
    angle  = (angle+360) mod 360; // adjust for possible rollover
}


// because image dimensions are even but graphic dimension is odd, 
// this will adjust the hb position depending on PC location.
BodyHB_idx  = BodyHB_IDX;                 // ABOVE & LEFT  of pc
BodyHB_idx +=  x>=global.pc.x;                 // ABOVE & RIGHT of pc
BodyHB_idx +=  y>=global.pc.y;                 // BELOW & LEFT  of pc
BodyHB_idx += (x>=global.pc.x) && (y>=global.pc.y); // BELOW & RIGHT of pc


GO_update_cam_vars();
if (GOB_is_out_of_bounds_y(id)) // Same as OG: if (yy>$FF)
{
    GOB_despawn(id); // set state=0 && spawn permision=1
}
else
{
    update_EF11();
    if (ocsHV1(id)) // if any w or h in ocs area
    {
        GOB_update_2a(); // GOB body to proj/sword/body collision checks
    }
}


if (cs&CS_BD1) enemy_collide_pc_body();




