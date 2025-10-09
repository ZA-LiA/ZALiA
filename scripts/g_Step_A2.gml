/// g_Step_A2()


// --------------------------------------------------------------------
//var _PC_CAN_DRAW_SELF = global.pc.can_draw_self;
// C1A2: JSR D250       - set all GO.canDrawSelf = false
set_go_can_draw_self(false);

// --------------------------------------------------------------------
// C2D5: JSR D385, C2E9: JSR D385, D3CC
if (PC_update_death()) // goes to rmB_Death if PC dead
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D3E9: JSR FFC5
// D3EC: JSR 8DC3       - Cast spell
update_cast_spell();
// 8E26                 - Spell effects
update_spell_effects();


// D3EF                 - Life & Magic restoration
update_stat_restore();

// D433                 - XP Uptick/Drain, D4CE Activate Level-up menu
update_xp();


// 8E23: JSR 9235       - PC pallete and background color
with(p) update_Pallete_1a();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
update_Platforms();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D4D1                 - Low hp beep
update_low_hp_sound();


with(global.pc)
{   // D4F3: JSR 903A       - PC
    PC_update_1();
    
    // D4F6                 - colliding_elevator & colliding_locked_door
    if(!is_undefined(   colliding_elevator) 
    &&  instance_exists(colliding_elevator) )
    {   g.pc_lock &=   ~colliding_elevator.pc_lock_bits;  }
    
    colliding_elevator    = noone;
    colliding_locked_door = $00;
}



global.pc.x_change1 = global.pc.x_change;
global.pc.y_change1 = global.pc.y_change;

// D4FE: JSR 9925       - Camera    (OG update order)
update_view_1();
//if (view_update_order==1) update_view_1();

with(global.pc) PC_update_hitboxes_1a(); // 2023/10/31. Added so hb draw has right info

//                      - PC projectile hb update
update_pc_proj_2a();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D504: JSR D5A7       - Entities & projectiles
if (global.pc.state)
{
    with(go_mgr) update_GameObjectMgr();
}


//with(SmasherTrapManager) SmasherTrapManager_update();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
global.pc.x_change2 = global.pc.x_change;
global.pc.y_change2 = global.pc.y_change;

// D4FE: JSR 9925       - Camera    (MOD: Moved cam update to here)
// Added 2023/11/01. Because some GO can move PC
if (global.pc.x_change!=0 
||  global.pc.y_change!=0 )
{
    update_view_1();
}
/*
if (view_update_order==2)
{
    update_view_1();
}
else
{
    // Added 2023/11/01. Because some GO can move PC
    if (global.pc.x_change!=0 
    ||  global.pc.y_change!=0 )
    {
        update_view_1();
    }
}
*/


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D50A: JSR 80E5       - Animate fire in North Palace & other animations
update_NIAO();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D50D: JSR 9847       - PC beam spawn
update_pc_proj_1a();
// 9878                 - PC projectile update
update_pc_proj();

with(BurnableMgr) BurnableMgr_update();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D510: JSR A6D2       - breakable blocks
update_tile_anims();


// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// D513                 - PC landingTimer
// D52D: JSR EBF0       - PC camX, ocs, udp, update_swrdXY
// D530                 - PC scs (sword collide solid)
with(global.pc) PC_update_2();




