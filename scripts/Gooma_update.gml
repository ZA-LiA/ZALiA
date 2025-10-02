/// Gooma_update()


// BAC3, BAC8: JMP B4AD, B4B2: JSR BE8B
if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// -----------------------------------------------------------
// B4C0: JSR 9C45
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
// B4B5: JSR BC4E. EF11, hspdPB, updateX, shld coll, DE3D, body coll, check & set pending death
Boss_update_2();


if (pending_death)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ------------------------------------------------------------
// B4B8: JSR E579
if (attack_state) GOB_sword_collision_1a(); // handles BODY collision check & reaction

// B4BB: JSR B53B
if (attack_state 
&& !timer )
{   //  attack_state 0: NOT attacking
    //  attack_state 1: Drawing back
    //  attack_state 2: Swing weapon
    switch(attack_state)
    {
        case attack_state_DRAWBACK:{
        attack_state = attack_state_SWING;
        timer = $0F; // attack melee
        break;}
        
        case attack_state_SWING:{
        attack_state = attack_state_IDLE;
        timer = $20; // attack cooldown
        break;}
    }
}


// -----------------------------------------------------------
// B4C3
var _DIR = dir_to_pc(id);


if!(g.counter1&$1F) facing_dir = _DIR;

// B4D6. if (counter&$7F){hspd = +-8, updates counter}
if(!Boss_update_3b(_DIR)) hspd = 0;



// -----------------------------------------------------------
// B4EC. Check & set move dir. 
if (Boss_update_3a($40)  // Returns true if in atk dist && !attack_state
&& !timer )
{   // B51F: JSR B557
    attack_state = attack_state_DRAWBACK;   // start attack
    timer = $2F; // atk twirl timer
}








// -----------------------------------------------------------
// -----------------------------------------------------------
// -----------------------------------------------------------
if (g.mod_Gooma_Projectile_1 
&&  ver==2 )
{
    switch(g.mod_Gooma_Projectile_1)
    {
        // ----------------------------------------
        case 1:{
        if (attack_state==attack_state_IDLE)
        {   projectile_tokens = 1;  }
        
        
        if (projectile_tokens 
        &&  attack_state==attack_state_SWING 
        &&  (g.counter1>>1)&$7 == 5 ) // Spikeball furthest out at 5
        {
            var _XL = Weapon_Ball_x-$4;
            var _YT = Weapon_Ball_y-$C;
            // Flame2
            with(GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver, id, global.PI_MOB_ORG))
            {
                hspd = ($20*facing_dir) &$FF;
                vspd = $FF;
            }
            
            projectile_tokens--;
        }
        break;}//case 1
        
        
        
        
        // ----------------------------------------
        case 2:{
        if (attack_state==attack_state_SWING)
        {
            projectile_tokens = 0;
            projectile_timer  = 0;
        }
        
        
        if (attack_state==attack_state_IDLE 
        && !projectile_tokens 
        &&  hp < g.dl_HP[|HP_IDX]>>1 )
        {
            projectile_tokens  = 1;
            projectile_tokens += hp < (g.dl_HP[|HP_IDX] div 3)<<1;
            projectile_tokens += hp < (g.dl_HP[|HP_IDX] div 3);
        }
        
        if (attack_state==attack_state_IDLE 
        && !projectile_timer )
        {   projectile_timer = irandom(7)+8;  }
        
        
        if (attack_state==attack_state_DRAWBACK 
        &&  projectile_timer )
        {   projectile_timer--;  }
        
        if (attack_state==attack_state_DRAWBACK 
        &&  projectile_tokens 
        && !projectile_timer )
        {
            var _DIRX  = sign_(inRange((timer>>1)&$7, 3,6));
            var _DIRY  = sign_(inRange((timer>>1)&$7, 1,4));
                _DIRX *= facing_dir;
                _DIRY *= facing_dir;
            //
            var _XL = Weapon_Ball_x-4;
            var _YT = Weapon_Ball_y-8;
            // Fireball2 v3: Bounces
            with(GOC1_create(_XL,_YT, _DIRX, projectile,projectile_ver, id, global.PI_MOB_ORG))
            {
                var     _SPEED = $30;
                hspd = (_SPEED*_DIRX) &$FF;
                vspd = (_SPEED*_DIRY) &$FF;
            }
            
            projectile_tokens--;
            projectile_timer = irandom(7)+8;
        }
        break;}//case 2
    }//switch(g.mod_Gooma_Projectile_1)
}




Boss_Roar_update();




