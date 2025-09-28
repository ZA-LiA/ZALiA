/// ArenaGateA_step()


GameObjectB_step();


if(!state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




if (state==state_EXPLODE 
&&  timer<=1 )
//&&  timer==1 )
{
    state = ST_CTRL;
}


if(!state
||  state==ST_CTRL )
{
    g.view_lock &= ~g.view_lock_boss;
    g.view_lock |=  g.view_lock_rm;
    g.view_lock_boss = 0;
    
    g.pc_lock = 0;
    
    global.ViewCatchUp_move_x = 0;
    if (g.pc.x!=viewXC())
    {
        if!(g.view_lock&$1) global.ViewCatchUp_state |= $1;
        if!(g.view_lock&$2) global.ViewCatchUp_state |= $2;
    }
    
    global.ViewCatchUp_move_y = 0;
    if (g.pc.y!=viewYC())
    {
        if!(g.view_lock&$4) global.ViewCatchUp_state |= $4;
        if!(g.view_lock&$8) global.ViewCatchUp_state |= $8;
    }
    
    Audio.can_play_mus_rm_body = true;
    state = 0;
    if (g.mod_destroy_go_on_death && !state) GO_destroy_1a();
}




