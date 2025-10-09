/// prevent_spawn_in_pc(go inst, *pad)


var                   _PAD = 0;
if (argument_count>1) _PAD = abs(argument[1]);

with(argument[0])
{
    update_body_hb_1a();
    if (collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r))
    {
        var _DIST = (ww_+8+_PAD) * sign_(x-global.pc.x);
        var _X = global.pc.x+_DIST;
        set_xy(id, _X,y);
    }
}




