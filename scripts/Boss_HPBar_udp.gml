/// Boss_HPBar_udp()


HPBar_can_draw = true;

if (HPBar_timer)
{   HPBar_timer--;  }

if (HPBar_timer&$4) HPBar_hp_color = p.C_ORG4; // damage flash
else                HPBar_hp_color = p.C_RED3;

if (hp)
{
    if (object_index==ShadowLonk01 
    ||  object_index==Ganon3 )
    {   // Some enemy hp should not be randomized
        var _HP_PER_UNIT = g.dl_HP_DEFAULT[|HP_IDX];
    }
    else
    {
        var _HP_PER_UNIT = g.dl_HP[|HP_IDX];
    }
    _HP_PER_UNIT = _HP_PER_UNIT div HPBar_unit_COUNT;
    
    HPBar_units_full = hp div _HP_PER_UNIT;
    HPBar_units_full = clamp(HPBar_units_full, 1,HPBar_unit_COUNT);
}
else
{
    HPBar_units_full=0;
}




