/// Ganon3_ProjRain_update_1a(inst idx)


if (sub_state!=sub_state_BATTLE)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if(!GO_can_collide_this_frame(argument0))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _collided=false;
var _X = dg_ProjRain[#argument0,$0];
var _Y = dg_ProjRain[#argument0,$1];
var _RAD = $2;
if (collide_pc_shield(_X,_Y, 1,1, _RAD))
{
    _collided=true;
    aud_play_sound(get_audio_theme_track(dk_HitShield));
}
else if (collide_pc_body(_X,_Y, 1,1, _RAD))
{
    _collided=true;
    if(!global.pc.iframes_timer) PC_take_damage(id, $0C);
}

if (_collided)
{
    dg_ProjRain[#argument0,$1] -= $02;
    dg_ProjRain[#argument0,$5]  = $0E; // $5 disintigrate timer
    dg_ProjRain[#argument0,$4]  = 2;   // $4 state
}




