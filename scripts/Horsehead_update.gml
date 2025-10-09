/// Horsehead_update()


if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// BB6B,   BB71: JSR 9C45
Boss_HPBar_udp();



if(!Boss_update_4()) // Arena gate
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// MOD. Delay 1st attack -----------------------------------------------
if (start_timer)
{
    start_timer--;
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ------------------------------------------------------------
// BB62: JSR BC4E.  EF11,hspdPB,updateX,shld coll,cs,DE40.dmg pc,death check
Boss_update_2();

if(!pending_death)
{   // BB65: JSR E579
    // GOB sword to PC shld collision(GOB_sword_collision_2a()) is not called.
    // PC cannot block Horsehead weapon w/ PC shield.
    if (attack_state) GOB_sword_collision_1a(); // handles BODY collision check & reaction
    
    
    // BB68: JSR BC11
    if (attack_state  
    && !timer )
    {
        switch(attack_state){
        default:                     {attack_state=attack_state_IDLE;  break;}
        case   attack_state_DRAWBACK:{attack_state=attack_state_SWING; break;}
        case   attack_state_SWING:   {attack_state=attack_state_IDLE;  break;}
        }
        timer = DURATION1; // DURATION1=$F
    }
    
    
    
    if (f.quest_num>1)
    {
        // update projectile attack
        switch(attack_state)
        {
            // -----------------------------------------------------
            case attack_state_IDLE:{
            if (abs(x-global.pc.x)>=DISTANCE2) // DISTANCE2=DISTANCE1($20)+$10
            {   // is far enough from pc to spawn projectile with melee attack
                if (ProjAttack_timer1)
                {   ProjAttack_timer1--;  }
                
                if(!ProjAttack_timer1 
                &&  is_facing_pc_(id) )
                {   // start attack
                    attack_state = attack_state_DRAWBACK; // ATTACK!!!
                    timer = DURATION1; // DURATION1=$F
                }
            }
            break;}
            
            
            // -----------------------------------------------------
            case attack_state_SWING:{ // Swing weapon / Strike
            if (projectile 
            &&  timer==DURATION1-1 ) // DURATION1=$F
            {
                if (is_facing_pc_(id) 
                &&  abs(x-global.pc.x)>=DISTANCE2 ) // DISTANCE2=DISTANCE1($20)+$10
                {
                    with(GOC1_create(x,y, facing_dir, projectile,projectile_ver, id, palidx_def))
                    {
                        set_xy(id, other.x+($A*facing_dir), other.yb-$16);
                    }
                }
                
                ProjAttack_timer1  = DURATION2; // DURATION2=$60
                ProjAttack_timer1 += irandom($20) * sign_(irandom(1));
                ProjAttack_timer1 += timer; // Remaining duration of attack anim
                ProjAttack_timer1  = max(ProjAttack_timer1, DURATION3); // DURATION3=DURATION2-$10;
            }
            break;}
        }
    }
    
    
    
    // BB74
    Boss_update_3(); // facing_dir, hspd, counter, attack_state (start atk)
    Boss_Roar_update();
}




