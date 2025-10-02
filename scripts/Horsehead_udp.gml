/// Horsehead_udp()


var _val;

// 981D
can_draw_self = true;


// Placement sprite is 16x48
GO_set_sprite(id,dl_sprites[|attack_state]); // body sprite


// 9870
if(!pending_death 
&& !is_facing_pc(id) )
{
    Head_xoff   = dir_to_pc(id) * 2;
    Head_xscale = dir_to_pc(id);
}
else
{
    Head_xoff   = 0;
    Head_xscale = facing_dir;
}


// 983B. Placement sprite is 16x48
Arm_sprite = dl_Arm_SPRITES[|attack_state]; // dl_Arm_SPRITES[|0] = 0

if (attack_state)
{
    switch(attack_state){
    default:                     {Arm_xoff =   0; break;}
    case   attack_state_DRAWBACK:{Arm_xoff = -16 * facing_dir; break;}
    case   attack_state_SWING:   {Arm_xoff =  16 * facing_dir; break;}
    }
}



if (inRange(counter&$7, $3,$5)) Legs_sprite = spr_Boss_legs1B; // 3,4,5
else                            Legs_sprite = spr_Boss_legs1A;


// ----------------------------------------
// 983B. Placement sprite is 16x48
if (attack_state) GOB_update_sword_offsets();




