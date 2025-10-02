/// Boss_update_3()

// Used by: Horsehead, Helmethead


var _HORSE  = is_ancestor(object_index,HorsA);
var _HELMET = is_ancestor(object_index,HelmA);


// BB74
var _DIR_TO_PC = dir_to_pc(id);

if!(g.counter1&$1F) // face towards PC cue
{
    if ( _HELMET  // is HelmetHead
    ||  (_HORSE && !attack_state) ) // is HorseHead AND NOT attacking
    {
        facing_dir = _DIR_TO_PC; // Face towards PC
    }
}



// BB94
hspd = 0;



if (counter&$7F 
&&  facing_dir!=_DIR_TO_PC )
{   // No moving unless facing PC
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


Boss_update_3b(_DIR_TO_PC); // if (counter&$7F){hspd = +-8}, updates counter



// BBB2
if (Boss_update_3a(DISTANCE1)  // DISTANCE1=$20. Check & set move dir. Returns true if in atk dist && !behavior
&&  _HORSE                     // is Horsehead
&&  facing_dir==_DIR_TO_PC )    // is facing PC
{   // BBF5: JSR BC23
    attack_state = attack_state_DRAWBACK; // ATTACK!!!
    timer = DURATION1;         // DURATION1=$F
}




