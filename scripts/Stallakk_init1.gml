/// Stallakk_init1()


var _i, _a;


GameObjectB_init();


                          _a=1;
sub_state_IDLE1         = _a++;
sub_state_IDLE2         = _a++;
sub_state_ATTACK0       = _a++;
sub_state_ATTACK        = _a++;
sub_state               = sub_state_IDLE1;



Top_SPR1    = spr_Stallakk_Top_1a; // idle
Top_SPR2    = spr_Stallakk_Top_1b; // attack
Top_spr     = Top_SPR1;

Btm_SPR1    = spr_Stallakk_Bottom_1a; // legs closed
Btm_SPR2    = spr_Stallakk_Bottom_1b; // legs open
Btm_spr     = Btm_SPR1;




Idle_HSPD       = $08;
Idle_Still_DUR  = $80;
Idle_Still_DUR2 = Idle_Still_DUR-(Idle_Still_DUR>>2);
Idle_Move_DUR   = $C0;

Attack_DIST     = $60;
Attack_HSPD     = Idle_HSPD+$04;
Attack_Delay_DUR= $08;

switch(sub_state){
case sub_state_IDLE1:{timer=Idle_Still_DUR; break;}
case sub_state_IDLE2:{timer=Idle_Move_DUR;  break;}
}


VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;


// arm forward hb
// this code is copy of Stalfos swrd hb
SwordHB_W      = 13; // 
//SwordHB_W      = 14; // 
//SwordHB_W      = 15; // 
SwordHB_H      =  2; // 
SwordHB_XOFF   = SwordHB_W+1; // 
SwordHB_YOFF   =  9; // 
SwordHB_xoff        = SwordHB_XOFF * facing_dir;
SwordHB_yoff        = SwordHB_YOFF;
SwordHB_w           = SwordHB_W;
SwordHB_h           = SwordHB_H;

/*
                          _a=1;
sub_state_IDLE          = _a++;
sub_state_ATTACK        = _a++;
sub_state               = sub_state_IDLE;

Full_SPRa       = spr_Stallakk_Full_1a;
Full_SPRb       = spr_Stallakk_Full_1b;
Full_SPRc       = spr_Stallakk_Full_1c;
*/
/*
                          _a=1;
sub_state_PILE          = _a++;
sub_state_CONSTRUCT     = _a++;
sub_state_DECONSTRUCT   = _a++;
sub_state_FULL1         = _a++;
sub_state_ATTACK        = _a++;
sub_state               = sub_state_PILE;


Head_SPR        = spr_Stallakk_Head_1a;
Chest_SPR       = spr_Stallakk_Chest_1a;
Waist_SPR       = spr_Stallakk_Waist_1a;
Legs_SPR        = spr_Stallakk_Legs_1a;
Arm_SPRa        = spr_Stallakk_Arm_1a;
Arm_SPRb        = spr_Stallakk_Arm_1b;
Full_SPRa       = spr_Stallakk_Full_1a;
Full_SPRb       = spr_Stallakk_Full_1b;
*/




