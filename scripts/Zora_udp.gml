/// Zora_udp()


can_draw_self = true;

if (shoot_timer) Head_xoff = -facing_dir;
else             Head_xoff = 0;

if (timer)
{
    GO_set_sprite(id,SPR_STND);
}
else
{
    GO_set_sprite(id,SPR_IDLE);
    
    if (hspd)
    {
        var            _val  = hspd;
        if (hspd&$80)  _val ^= $FF;
        
        if (_val<9)    _val  = 8;
        else           _val  = 4;
        
        if!(g.counter1&_val)
        {
            GO_set_sprite(id,SPR_WALK);
        }
    }
}




