/// BossBot_update()


// A180
if(!hp 
||  hp < g.dl_HP[|HP_IDX]-8 ) // OG: spawns w/ $38 hp
{
    state = 0;
    BossBot_update_2(); // spawn Bots
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// -------------------------------------------------------------------
// A1CA
var _carry = 0;
if(!behavior) // 0: HIDING
{
    facing_dir = dir_to_pc( id);
    _carry    = DC91_carry(id);
}




var _ATTACK_DIST = ATK_DIST;
if (abs(y-g.pc.y)-(hh_+g.pc.hh_) < ($3<<3)) _ATTACK_DIST += $08; // MOD. Added this because enemy rando has BossBot spawning too close to PC

var _IN_DIST = (abs(x-g.pc.x)+_carry) < _ATTACK_DIST;



if(!behavior 
&&  _IN_DIST )
{   behavior = 1;  } // 1: REVEAL!!


if (behavior 
||  _IN_DIST )
{   // A1DF.  ATTACK!!
    if (cs&$4)
    {
        solid_clip_correction(vspd && vspd<$80);
        vspd = 0;
    }
    
    BossBot_update_1();
    /*// MOD 2023/12/02. With enemy hp rando, it's possible to kill BossBot here which means the Bots won't spawn.
    if(!hp)
    {
        state = 0;
        BossBot_update_2(); // spawn Bots
    }
    */
}




