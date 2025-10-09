/// Stallakk_update()


GO_update_cam_vars();
update_EF11();

if (GOB_is_out_of_bounds_y(id)) // Same as OG: if (yy > $FF)
{   // DD3D
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (sub_state==sub_state_ATTACK)
{
    SwordHB_xoff  = x;
    SwordHB_xoff += (SwordHB_w>>1)*facing_dir;
    SwordHB_xoff -=  SwordHB_w>>1
    SwordHB_xoff -= xl;
    SwordHB_yoff  = SwordHB_YOFF;
    GOB_sword_collision_1a(); // handles GOB SWRD to PC BODY collision check & reaction
}

GOB_update_2a(); // DE54 & DE63 collision
if (cs&CS_BD1) enemy_collide_pc_body();




GO_update_cs();

if (cs&$4)
{
    GOB_update_1(true); // update hspdPB
    GO_update_cs();
}
if!(cs&$3) updateX();

if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}
updateY();



if (state!=state_NORMAL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (sub_state==sub_state_IDLE1 
||  sub_state==sub_state_IDLE2 )
{
    var _C1 =  cs&(CS_SW1|CS_PR1);
    if(!_C1)
    {
        _C1 =  facing_dir==dir_to_pc_(id) 
           &&  abs(x-global.pc.x)<=Attack_DIST 
           &&  hINh(yt,hh, global.pc.yt-$04,global.pc.hh+$08);
    }
    
    if (_C1)
    {
        timer     = Attack_Delay_DUR; // Attack_Delay_DUR = $08
        sub_state = sub_state_ATTACK0;
    }
}




switch(sub_state)
{
    // ==============================================================
    // --------------------------------------------------------
    case sub_state_IDLE1:{ // Stand still
    hspd = 0;
    
    if (timer==$08)
    {   facing_dir = -facing_dir;  }
    
    if (timer) break;
    if!(cs&$4) break;
    
    timer      = Idle_Move_DUR;
    sub_state  = sub_state_IDLE2;
    break;}
    
    
    
    
    
    // ==============================================================
    // --------------------------------------------------------
    case sub_state_IDLE2:{ // Walk/Pace
    hspd = (Idle_HSPD*facing_dir) &$FF;
    
    if (timer) break;
    if!(cs&$4) break;
    
    if (irandom(1))
    {    timer = Idle_Still_DUR;  }
    else timer = Idle_Still_DUR2; // shorter duration
    sub_state  = sub_state_IDLE1;
    break;}
    
    
    
    
    
    // ==============================================================
    // --------------------------------------------------------
    case sub_state_ATTACK0:{ // attack delay
    if (timer) break;
    facing_dir  = dir_to_pc_(id);
    if!(cs&$4) break;
    
    timer      = 0;
    sub_state  = sub_state_ATTACK;
    break;}
    
    
    
    
    
    // ==============================================================
    // --------------------------------------------------------
    case sub_state_ATTACK:{
    if (timer) break;
    
    if!(g.counter1&$3F) facing_dir  = dir_to_pc_(id);
    
    hspd = (Attack_HSPD*facing_dir) &$FF;
    break;}
}




