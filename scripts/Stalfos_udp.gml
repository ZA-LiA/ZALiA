/// Stalfos_udp()


can_draw_self = true;


Arm_sprite = 0;


// behavior:   0:idle,      1:drawback,    2:stab, 3:downstab
// legs:       0:legs open, 1:legs closed, 2:jump, 3:downstab
// hasDroppedFromSpawn: spawn drop only happens once

var _body_idx = 0;
var _legs_idx = 0; // 0: legs open

if(!vspd 
&&  hasDroppedFromSpawn )
{
    Arm_xoff = 16 * facing_dir;
    if (behavior >= 2) Arm_sprite = spr_Piece_Sword1;
    
    if (behavior <  2 && g.counter1&$8)
    {   _legs_idx = 1;  }     // 1: legs closed
        _body_idx = behavior; // 0:idle, 1:drawback, 2:stab, 3:downstab
}
else
{
    if (vspd < $80)
    {
        if(!hasDroppedFromSpawn     // waiting on ceiling/chain
        || (goDist1()+$30)&$FF < $60 ) // in downstab atk dist
        {
            _body_idx = 3; // 3: downstab
            _legs_idx = 3; // 3: downstab
        }
        else
        {
            _body_idx = 0; // 0: idle
            _legs_idx = 1; // 1: legs closed
        }
    }
    else
    {       // moving up
            _body_idx = 0; // 0: idle
            _legs_idx = 2; // 2: jump
    }
}





GO_set_sprite(id, dl_sprites[|_body_idx]);
Legs_sprite = dl_legs_sprites[|_legs_idx];



if (g.mod_STALFOS_CHAIN)
{
    can_draw_chain = !hasDroppedFromSpawn && !vspd;
}




