/// Input_update2a()


var _R_KEY = 0;
var _L_KEY = 0;
var _D_KEY = 0;
var _U_KEY = 0;
var _S_KEY = 0;
var _E_KEY = 0;
var _B_KEY = 0;
var _A_KEY = 0;

if (1) // Temporary until controller support is implemented. Certain players need the keyboard inputs so they can bind controller buttons through 3rd party controller support app.
//if (gamepad_slot==-1) // -1: Gamepad NOT connected
{
    _R_KEY = keyboard_check(ord("D")) || keyboard_check(vk_right);
    _L_KEY = keyboard_check(ord("A")) || keyboard_check(vk_left);
    _D_KEY = keyboard_check(ord("S")) || keyboard_check(vk_down);
    _U_KEY = keyboard_check(ord("W")) || keyboard_check(vk_up);
    _S_KEY = keyboard_check(vk_enter);
    _E_KEY = keyboard_check(ord("T"));
    _B_KEY = keyboard_check(vk_control);
    _A_KEY = keyboard_check(vk_space);
}

var _R_NEW = R * (GP_Right_held  || _R_KEY);  // $01 NES d-pad  RIGHT
var _L_NEW = L * (GP_Left_held   || _L_KEY);  // $02 NES d-pad  LEFT
var _D_NEW = D * (GP_Down_held   || _D_KEY);  // $04 NES d-pad  DOWN
var _U_NEW = U * (GP_Up_held     || _U_KEY);  // $08 NES d-pad  UP
//                                                              // 
var _S_NEW = S * (GP_Pause_held  || _S_KEY);  // $10 NES button START
var _E_NEW = E * (GP_Magic_held  || _E_KEY);  // $20 NES button SELECT
//                                                              // 
var _B_NEW = B * (GP_Attack_held || _B_KEY);  // $40 NES button B
var _A_NEW = A * (GP_Jump_held   || _A_KEY);  // $80 NES button A
//                                                              // 
//                                                              // 
//                                                              // 
//                                                              // 
//                                                              // 
// Pressed
Right_pressed  = R * (_R_NEW && !Right_held);  // $01
Left_pressed   = L * (_L_NEW && !Left_held);   // $02
Down_pressed   = D * (_D_NEW && !Down_held);   // $04
Up_pressed     = U * (_U_NEW && !Up_held);     // $08

Pause_pressed  = S * (_S_NEW && !Pause_held);  // $10
Magic_pressed  = E * (_E_NEW && !Magic_held);  // $20

Attack_pressed = B * (_B_NEW && !Attack_held); // $40
Jump_pressed   = A * (_A_NEW && !Jump_held);   // $80


// Released
Right_released  = R * (!_R_NEW && Right_held); // $01
Left_released   = L * (!_L_NEW && Left_held);  // $02
Down_released   = D * (!_D_NEW && Down_held);  // $04
Up_released     = U * (!_U_NEW && Up_held);    // $08

Pause_released  = S * (!_S_NEW && Pause_held); // $10
Magic_released  = E * (!_E_NEW && Magic_held); // $20

Attack_released = B * (!_B_NEW && Attack_held);// $40
Jump_released   = A * (!_A_NEW && Jump_held);  // $80


// Held.  *** Held MUST be AFTER Pressed and Released
Right_held  = R * _R_NEW; // $01
Left_held   = L * _L_NEW; // $02
Down_held   = D * _D_NEW; // $04
Up_held     = U * _U_NEW; // $08

Pause_held  = S * _S_NEW; // $10
Magic_held  = E * _E_NEW; // $20

Attack_held = B * _B_NEW; // $40
Jump_held   = A * _A_NEW; // $80
//                                                              // 
//                                                              // 
//                                                              // 
// Xbox B button, PS CIRCLE button
Other1_pressed  =  GP_Other1_held && !Other1_held; // 
Other1_released = !GP_Other1_held &&  Other1_held; // 
Other1_held     =  GP_Other1_held;                 // 
// Xbox Y button, PS TRIANGLE button
Other2_pressed  =  GP_Other2_held && !Other2_held; // 
Other2_released = !GP_Other2_held &&  Other2_held; // 
Other2_held     =  GP_Other2_held;                 // 
// LEFT  bumper
Other3_pressed  =  GP_Other3_held && !Other3_held; // 
Other3_released = !GP_Other3_held &&  Other3_held; // 
Other3_held     =  GP_Other3_held;                 // 
// RIGHT bumper
Other4_pressed  =  GP_Other4_held && !Other4_held; // 
Other4_released = !GP_Other4_held &&  Other4_held; // 
Other4_held     =  GP_Other4_held;                 // 
// LEFT  trigger
Other5_pressed  =  GP_Other5_held && !Other5_held; // 
Other5_released = !GP_Other5_held &&  Other5_held; // 
Other5_held     =  GP_Other5_held;                 // 
// RIGHT trigger
Other6_pressed  =  GP_Other6_held && !Other6_held; // 
Other6_released = !GP_Other6_held &&  Other6_held; // 
Other6_held     =  GP_Other6_held;                 // 
//                                                              // 




