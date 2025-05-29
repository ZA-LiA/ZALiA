/// Input_Create()


if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("Input_Create() START");
}


var _i, _count;
var _sprite1,_sprite2;
var _dk,_dk0,_dk1, _datakey;


Buttons_dm = ds_map_create();


depth = DEPTH_Input;


gamepad_slot = -1; // -1: No gamepad connected
gamepad_name = undefined;


// ------------------------------------------------
// Bit values that represent NES buttons
R = $01; // $01 = NES d-pad  RIGHT
L = $02; // $02 = NES d-pad  LEFT
D = $04; // $04 = NES d-pad  DOWN
U = $08; // $08 = NES d-pad  UP
S = $10; // $10 = NES button START
E = $20; // $20 = NES button SELECT
B = $40; // $40 = NES button B
A = $80; // $80 = NES button A
//








// ------------------------------------------------
// DPad RIGHT
GP_DPadR_pressed    = false;
GP_DPadR_held       = false;
GP_DPadR_released   = false;
// DPad LEFT
GP_DPadL_pressed    = false;
GP_DPadL_held       = false;
GP_DPadL_released   = false;
// DPad DOWN
GP_DPadD_pressed    = false;
GP_DPadD_held       = false;
GP_DPadD_released   = false;
// DPad UP
GP_DPadU_pressed    = false;
GP_DPadU_held       = false;
GP_DPadU_released   = false;

// Face1(XBox A)
GP_Face1_pressed    = false;
GP_Face1_held       = false;
GP_Face1_released   = false;
// Face2(XBox B)
GP_Face2_pressed    = false;
GP_Face2_held       = false;
GP_Face2_released   = false;
// Face3(XBox X)
GP_Face3_pressed    = false;
GP_Face3_held       = false;
GP_Face3_released   = false;
// Face4(XBox Y)
GP_Face4_pressed    = false;
GP_Face4_held       = false;
GP_Face4_released   = false;

// Select Button
GP_Select_pressed   = false;
GP_Select_held      = false;
GP_Select_released  = false;
// Start Button
GP_Start_pressed    = false;
GP_Start_held       = false;
GP_Start_released   = false;


// Shoulder1 LEFT(XBox Bumper)
GP_Shoulder1L_pressed   = false;
GP_Shoulder1L_held      = false;
GP_Shoulder1L_released  = false;
// Shoulder1 RIGHT(XBox Bumper)
GP_Shoulder1R_pressed   = false;
GP_Shoulder1R_held      = false;
GP_Shoulder1R_released  = false;

// Shoulder2 LEFT(XBox Trigger)
GP_Shoulder2L_pressed   = false;
GP_Shoulder2L_held      = false;
GP_Shoulder2L_released  = false;
// Shoulder2 RIGHT(XBox Trigger)
GP_Shoulder2R_pressed   = false;
GP_Shoulder2R_held      = false;
GP_Shoulder2R_released  = false;


GP_pressed  = false;
GP_held     = false;
GP_released = false;





// gp_face1:       32769
// gp_face2:       32770
// gp_face3:       32771
// gp_face4:       32772
// gp_start:       32778
// gp_select:      32777
// gp_shoulderl:   32773
// gp_shoulderr:   32774
// gp_shoulderlb:  32775
// gp_shoulderrb:  32776

// ------------------------------------------
GP_right_DEFAULT    = gp_padr;
GP_left_DEFAULT     = gp_padl;
GP_down_DEFAULT     = gp_padd;
GP_up_DEFAULT       = gp_padu;
GP_jump_DEFAULT     = gp_face1; // Xbox A button
GP_other1_DEFAULT   = gp_face2; // Xbox B button
GP_attack_DEFAULT   = gp_face3; // Xbox X button
GP_other2_DEFAULT   = gp_face4; // Xbox Y button
GP_pause_DEFAULT    = gp_start;
GP_magic_DEFAULT    = gp_select;
GP_other3_DEFAULT   = gp_shoulderl;
GP_other4_DEFAULT   = gp_shoulderr;
GP_other5_DEFAULT   = gp_shoulderlb;
GP_other6_DEFAULT   = gp_shoulderrb;

GP_right    = GP_right_DEFAULT;
GP_left     = GP_left_DEFAULT;
GP_down     = GP_down_DEFAULT;
GP_up       = GP_up_DEFAULT;
GP_magic    = GP_magic_DEFAULT;
GP_pause    = GP_pause_DEFAULT;
GP_jump     = GP_jump_DEFAULT;   // Xbox A button
GP_attack   = GP_attack_DEFAULT; // Xbox X button
GP_other1   = GP_other1_DEFAULT; // Xbox B button
GP_other2   = GP_other2_DEFAULT; // Xbox Y button
GP_other3   = GP_other3_DEFAULT;
GP_other4   = GP_other4_DEFAULT;
GP_other5   = GP_other5_DEFAULT;
GP_other6   = GP_other6_DEFAULT;

gamepad_set_default();



// ------------------------------------------
GP_Right_pressed   = false;
GP_Right_held      = false;
GP_Right_released  = false;

GP_Left_pressed    = false;
GP_Left_held       = false;
GP_Left_released   = false;

GP_Down_pressed    = false;
GP_Down_held       = false;
GP_Down_released   = false;

GP_Up_pressed      = false;
GP_Up_held         = false;
GP_Up_released     = false;


GP_Magic_pressed   = false;
GP_Magic_held      = false;
GP_Magic_released  = false;

GP_Pause_pressed   = false;
GP_Pause_held      = false;
GP_Pause_released  = false;


// Xbox X
GP_Attack_pressed  = false;
GP_Attack_held     = false;
GP_Attack_released = false;
// Xbox A
GP_Jump_pressed    = false;
GP_Jump_held       = false;
GP_Jump_released   = false;


// XBox B
GP_Other1_pressed  = false;
GP_Other1_held     = false;
GP_Other1_released = false;
// XBox Y                         //
GP_Other2_pressed  = false;
GP_Other2_held     = false;
GP_Other2_released = false;
// XBox bump L                         //
GP_Other3_pressed  = false;
GP_Other3_held     = false;
GP_Other3_released = false;
// XBox bump R                         //
GP_Other4_pressed  = false;
GP_Other4_held     = false;
GP_Other4_released = false;
// XBox trig L                         //
GP_Other5_pressed  = false;
GP_Other5_held     = false;
GP_Other5_released = false;
// XBox trig R                         //
GP_Other6_pressed  = false;
GP_Other6_held     = false;
GP_Other6_released = false;
//                          //




// ------------------------------------------
// Which game action inputs were triggered this frame
Right_pressed   = false;
Right_held      = false;
Right_released  = false;

Left_pressed    = false;
Left_held       = false;
Left_released   = false;

Down_pressed    = false;
Down_held       = false;
Down_released   = false;

Up_pressed      = false;
Up_held         = false;
Up_released     = false;


Magic_pressed   = false;
Magic_held      = false;
Magic_released  = false;

Pause_pressed   = false;
Pause_held      = false;
Pause_released  = false;


Attack_pressed  = false;
Attack_held     = false;
Attack_released = false;

Jump_pressed    = false;
Jump_held       = false;
Jump_released   = false;


Other1_pressed  = false;
Other1_held     = false;
Other1_released = false;
//                      //
Other2_pressed  = false;
Other2_held     = false;
Other2_released = false;
//                      //
Other3_pressed  = false;
Other3_held     = false;
Other3_released = false;
//                      //
Other4_pressed  = false;
Other4_held     = false;
Other4_released = false;
//                      //
Other5_pressed  = false;
Other5_held     = false;
Other5_released = false;
//                      //
Other6_pressed  = false;
Other6_held     = false;
Other6_released = false;
//                      //










// held: which buttons are being held on current frame
held   = 0;
heldH  = 0; // H:  Horizontal
heldV  = 0; // V:  Vertical
heldHV = 0; // HV: Horizontal & Vertical
heldS  = 0; // S:  Start/Select
heldC  = 0; // C:  B&A buttons
heldSC = 0; // SC: Start/Select + B&A buttons

// pressed: which buttons are being pressed on current frame
pressed   = 0;
pressedH  = 0; // H:  Horizontal
pressedV  = 0; // V:  Vertical
pressedHV = 0; // HV: Horizontal & Vertical
pressedS  = 0; // S:  Start/Select
pressedC  = 0; // C:  B&A buttons
pressedSC = 0; // SC: Start/Select + B&A buttons

// released: which buttons have being released on current frame
released   = 0;
releasedH  = 0; // H:  Horizontal
releasedV  = 0; // V:  Vertical
releasedHV = 0; // HV: Horizontal & Vertical
releasedS  = 0; // S:  Start/Select
releasedC  = 0; // C:  B&A buttons
releasedSC = 0; // SC: Start/Select + B&A buttons









// ------------------------------------------------
// The following relate to certain inputs held or pressed
// They are updated in Lonk's update only under certain conditions
dHeld    = 0; // 0017. 0: down NOT held, 1: down held.  ***OG is reverse of this.
hHeld    = 0; // 0742. 1: right or 2: left held.  h: horizontal
vHeld    = 0; // 0743. 4:  down or 8:   up held.  v: vertical
heldPrev = 0; // 0744. buttons held on the previous frame
cPres    = 0; // 0741. $80: a and/or $40: b pressed.  c: NES A or B

// The buttons held when spawning at g.exit_enter
// until they're released.
// This can be used to prevent immediately using a door 
// exit when spawning at it.
held_0 = 0;



// ------------------------------------------------
// HV: Horizontal Vertical
// The first dir held/pressed after the last release
// Can only be 0 or cardinal dirs 1,2,4,8. 
// CanNOT   be      diagonal dirs 5,9,6,A
heldHV_first = 0;




keypressed_curr = 0;
keypressed_prev = 0;
keypressed_hist = "";












/*
GP_right_DEFAULT    = gp_padr;
GP_left_DEFAULT     = gp_padl;
GP_down_DEFAULT     = gp_padd;
GP_up_DEFAULT       = gp_padu;
GP_jump_DEFAULT     = gp_face1; // Xbox A button
GP_other1_DEFAULT   = gp_face2; // Xbox B button
GP_attack_DEFAULT   = gp_face3; // Xbox X button
GP_other2_DEFAULT   = gp_face4; // Xbox Y button
GP_pause_DEFAULT    = gp_start;
GP_magic_DEFAULT    = gp_select;
GP_other3_DEFAULT   = gp_shoulderl;
GP_other4_DEFAULT   = gp_shoulderr;
GP_other5_DEFAULT   = gp_shoulderlb;
GP_other6_DEFAULT   = gp_shoulderrb;

GP_right    = GP_right_DEFAULT;
GP_left     = GP_left_DEFAULT;
GP_down     = GP_down_DEFAULT;
GP_up       = GP_up_DEFAULT;
GP_magic    = GP_magic_DEFAULT;
GP_pause    = GP_pause_DEFAULT;
GP_jump     = GP_jump_DEFAULT;   // Xbox A button
GP_attack   = GP_attack_DEFAULT; // Xbox X button
GP_other1   = GP_other1_DEFAULT; // Xbox B button
GP_other2   = GP_other2_DEFAULT; // Xbox Y button
GP_other3   = GP_other3_DEFAULT;
GP_other4   = GP_other4_DEFAULT;
GP_other5   = GP_other5_DEFAULT;
GP_other6   = GP_other6_DEFAULT;
*/
Buttons_dm[?string(gp_padr)+STR_Name]       = "DPAD RIGHT";
Buttons_dm[?string(gp_padl)+STR_Name]       = "DPAD LEFT";
Buttons_dm[?string(gp_padd)+STR_Name]       = "DPAD DOWN";
Buttons_dm[?string(gp_padu)+STR_Name]       = "DPAD UP";

Buttons_dm[?string(gp_face1)+STR_Name]      = "FACE1"; // Xbox A button
Buttons_dm[?string(gp_face2)+STR_Name]      = "FACE2"; // Xbox B button
Buttons_dm[?string(gp_face3)+STR_Name]      = "FACE3"; // Xbox X button
Buttons_dm[?string(gp_face4)+STR_Name]      = "FACE4"; // Xbox Y button

Buttons_dm[?string(gp_start)+STR_Name]      = "START";
Buttons_dm[?string(gp_select)+STR_Name]     = "SELECT";

Buttons_dm[?string(gp_shoulderl)+STR_Name]  = "BUMP LEFT";
Buttons_dm[?string(gp_shoulderr)+STR_Name]  = "BUMP RIGHT";
Buttons_dm[?string(gp_shoulderlb)+STR_Name] = "TRIG LEFT";
Buttons_dm[?string(gp_shoulderrb)+STR_Name] = "TRIG RIGHT";








_dk1="_GP_face";
_dk0=dk_XBox; _i=1;

_sprite1 = spr_Button_XBoxA01; // GP_face1
Buttons_dm[?_dk0+"_A"             +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_XBoxB01; // GP_face2
Buttons_dm[?_dk0+"_B"             +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_XBoxX01; // GP_face3
Buttons_dm[?_dk0+"_X"             +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_XBoxY01; // GP_face4
Buttons_dm[?_dk0+"_Y"             +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;




_dk0=dk_PlayStation; _i=1;

_sprite1 = spr_Button_PlaystationCircle01;   // GP_face1
Buttons_dm[?_dk0+"_Circle"        +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_PlaystationX01;        // GP_face2
Buttons_dm[?_dk0+"_X"             +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_PlaystationTriangle01; // GP_face3
Buttons_dm[?_dk0+"_Triangle"      +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;

_sprite1 = spr_Button_PlaystationSquare01;   // GP_face4
Buttons_dm[?_dk0+"_Square"        +STR_Sprite] = _sprite1;
Buttons_dm[?_dk0+_dk1+string(_i++)+STR_Sprite] = _sprite1;
Buttons_dm[?sprite_get_name(_sprite1)+"_Controller_Make"] = _dk0;


_count = _i;
for(_i=1; _i<=_count; _i++)
{
    _sprite1 = Buttons_dm[?dk_XBox       +string(_i)+STR_Sprite];
    _sprite2 = Buttons_dm[?dk_PlayStation+string(_i)+STR_Sprite];
    if(!is_undefined(_sprite1) 
    && !is_undefined(_sprite2) )
    {
        Buttons_dm[?sprite_get_name(_sprite1)+dk_PlayStation+STR_Sprite] = _sprite2;
        Buttons_dm[?sprite_get_name(_sprite2)+dk_PlayStation+STR_Sprite] = _sprite2;
        
        Buttons_dm[?sprite_get_name(_sprite2)+dk_XBox       +STR_Sprite] = _sprite1;
        Buttons_dm[?sprite_get_name(_sprite1)+dk_XBox       +STR_Sprite] = _sprite1;
    }
}
/*
Buttons_dm[?dk_XBOX+string(GP_jump_DEFAULT)  +STR_Sprite] = spr_Button_XBoxA01;
Buttons_dm[?dk_XBOX+string(GP_other1_DEFAULT)+STR_Sprite] = spr_Button_XBoxB01;
Buttons_dm[?dk_XBOX+string(GP_attack_DEFAULT)+STR_Sprite] = spr_Button_XBoxX01;
Buttons_dm[?dk_XBOX+string(GP_other2_DEFAULT)+STR_Sprite] = spr_Button_XBoxY01;
*/








dm_UserInputConfig = ds_map_create();




if (DEV)
{
    show_debug_message("Input_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




