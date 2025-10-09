/// pushback_pc_and_go(push source inst, *alt PC push amount, *alt GO push amount)

// E371
var                                    _INST   =           argument[0];

var                                    _PC_AMT = $4;                           // default   amount
if (argument_count>1 && argument[1]+1) _PC_AMT = abs8b(abs(argument[1])) &$FF; // alternate amount

var                                    _GO_AMT = $C;                           // default   amount
if (argument_count>2 && argument[2]+1) _GO_AMT = abs8b(abs(argument[2])) &$FF; // alternate amount


if (_PC_AMT) // pass 0 to NOT push back pc
{
    g.control1_timer = global.pc.Pushback_DURATION; // PC atk will NOT affect PC.hspd
    pushback_pc(_INST.x, _PC_AMT);
    //sdm("pushback pc $"+hex_str(_PC_AMT));
}


if (_GO_AMT!=0) // pass 0 to NOT push back GameObject
{
    // Push back dir is which side of colliding-obj _INST is on.
    // Push back dir is RIGHT($0C) when to the right of colliding-obj  OR  even with colliding-obj
    // Push back dir is  LEFT($F4) when to the left  of colliding-obj
    var                                 _AMOUNT = abs8b(_GO_AMT&$FF);
    if (_INST.x >= global.pc.x)
    {    set_go_hspd_pushbback(_INST, ( _AMOUNT)&$FF);  }
    else set_go_hspd_pushbback(_INST, (-_AMOUNT)&$FF);
}




