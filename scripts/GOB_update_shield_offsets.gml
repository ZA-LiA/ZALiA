/// GOB_update_shield_offsets()


if(!inRange(ShieldHB_idx, 0, ds_grid_width(g.dg_ShieldHB)-1) 
&&  ShieldHB_idx != $FF )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (ShieldHB_idx == $FF) // $FF means use body hb
{
    ShieldHB_xoff = BodyHB_xoff;
    ShieldHB_yoff = BodyHB_yoff;
    ShieldHB_w    = BodyHB_w;
    ShieldHB_h    = BodyHB_h;
}
else
{
    ShieldHB_xoff = g.dg_ShieldHB[#ShieldHB_idx, !facing_dir]; // xoff RGT(0), LFT(1)
    ShieldHB_yoff = g.dg_ShieldHB[#ShieldHB_idx, 2]; // yoff
    ShieldHB_w    = g.dg_ShieldHB[#ShieldHB_idx, 3]; // w
    ShieldHB_h    = g.dg_ShieldHB[#ShieldHB_idx, 4]; // h
}

// E5BA

// 0005 shldYOff: array E59C-E5A2: 12 00 05 10 05 02 02
// 0007 shldH:    array E5A3-E5A9: 08 0D 20 10 20 0D 10
// 0004 shldXOff: array E5AA-E5B0: 00 00 00 FC 00 FF 02
// 0006 shldW:    array E5B1-E5B7: 02 02 10 18 0F 12 14




