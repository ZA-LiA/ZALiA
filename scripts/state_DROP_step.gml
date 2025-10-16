/// state_DROP_step(inst id)


with(argument0)
{
    //db_pbag_rising_xp_1a();
    can_draw_self = false;
    
    // DD6C
    if (timer)
    {
        if (timer <= g.XP_RISE_DURATION)
        {
            xp_can_draw = xp;
            set_xy(id, x, y-(g.counter1&$1));
        }
    }
    // DDEC
    else
    {
        if (xp 
        && !drop_item_obj )
        {
            var _XP  = xp;
                _XP += xp==300 && is_ancestor(object_index,Rebonack01B);
            //
            f.xpPending += _XP;
            f.xpPending &= $FFFF;
            
            xp = max(0,xp-_XP);
        }
    }
}




