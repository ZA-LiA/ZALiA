/// FireRope_init2()


HostileFire_init_1(global.PI_MOB_ORG);


DRAW_YOFF = 0;

facing_dir = 1;

BodyHB_IDX   = -1;
BodyHB_idx   = BodyHB_IDX;



if(!is_undefined(dk_spawn))
{
    if (!is_undefined( g.dm_spawn[?dk_spawn+STR_Length]))
    {   FIREBALL_COUNT=g.dm_spawn[?dk_spawn+STR_Length];  }
        fireball_count = FIREBALL_COUNT;
    //
    
    if (!is_undefined( g.dm_spawn[?dk_spawn+STR_MoveDir])) 
    {   SPIN_DIR     = g.dm_spawn[?dk_spawn+STR_MoveDir];  }
        SPIN_DIR     = sign(SPIN_DIR);
        spin_dir     =      SPIN_DIR;
    //
    
    if (!is_undefined( g.dm_spawn[?dk_spawn+STR_Duration])) 
    {   REV_DUR      = g.dm_spawn[?dk_spawn+STR_Duration];  }
        rev_dur = REV_DUR;
    //
    
    if (!is_undefined( g.dm_spawn[?dk_spawn+STR_Angle])) 
    {   ANGLE        = g.dm_spawn[?dk_spawn+STR_Angle];  }
        angle        = ANGLE;
    //
}




SPEED1 = (360 / rev_dur) / room_speed;
speed1 = SPEED1;



set_xy_len_ang(id, spawn_xl,spawn_yt, fireball_count<<3, angle);




