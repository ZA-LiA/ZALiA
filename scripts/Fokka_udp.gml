/// Fokka_udp()


can_draw_self = true;


if (cs&$4)
{ // ON  GROUND -------------------------------------------------------
    if (hspd 
    &&  g.counter1 & ($4<<(abs8b(hspd)<HSPD_CHASE)) ) // 4, 8
    {
        if (ShieldHB_idx==ShieldHB_IDX_HGH) GO_set_sprite(id,SPR_WALK2);
        else                                GO_set_sprite(id,SPR_WALK1);
    }
    else
    {
        if (ShieldHB_idx==ShieldHB_IDX_HGH) GO_set_sprite(id,SPR_IDLE2);
        else                                GO_set_sprite(id,SPR_IDLE1);
    }
}
else
{ // OFF GROUND -------------------------------------------------------
         if (vspd&$80)                       GO_set_sprite(id,SPR_JUMP1);
    else if (ShieldHB_idx==ShieldHB_IDX_HGH) GO_set_sprite(id,SPR_IDLE2);
    else                                     GO_set_sprite(id,SPR_IDLE1);
}




Arm_sprite = dl_Arm_SPRITES[|behavior]; // dl_Arm_SPRITES[|0] = 0;

if (behavior)
{
    var                        _idx1  = 0;
    if (behavior > BVR_ATKH)   _idx1  = 1;
    if (facing_dir == -1)       _idx1 += 2;
    
    var                        _idx2  = 0;
    if!(behavior&$1)           _idx2 += 3;
    if (timer<=CUE_ATK_PHASE2) _idx2++;
    if (timer<=CUE_ATK_PHASE3) _idx2++;
    
    Arm_xoff = dg_Arm_XOFF[#_idx1,_idx2];
}




