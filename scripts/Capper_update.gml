/// Capper_update()


if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




switch(sub_state)
{
    // --------------------------------------------------------------------------
    // -------------------------------------------------------------
    case ST_SUB1_LURK:{
    GO_update_cs();
    // DE40
    GOB_update_2();
    // E2EF
    if (cs&CS_BD1) enemy_collide_pc_body();
    
    //is_idle = false;
    
    if (    g.pc.hspd 
    &&      g.pc.hspd_dir == -dir_to_pc_(id) 
    &&  abs(g.pc.x - x)   <= AGRO_DIST )
    {
        switch(ver){
        case 1:{sub_state = ST_SUB1_DROP; break;}
        case 2:{sub_state = ST_SUB1_ATCK; break;}
        }
    }
    break;}
    
    
    
    
    
    
    // --------------------------------------------------------------------------
    // -------------------------------------------------------------
    case ST_SUB1_DROP:{
    updateY();
    
    GO_update_cs();
    // DE40
    GOB_update_2();
    // E2EF
    if (cs&CS_BD1) enemy_collide_pc_body();
    
    if (cs&$4)
    {
        set_xy(id, x, (y>>3)<<3);
        
        facing_dir = dir_to_pc(id);
        
        hspd = byte(hspd_jump * facing_dir);
        vspd = VSPD_BOUNCE;
        
        
        sub_state = ST_SUB1_ATCK;
    }
    break;}
    
    
    
    
    
    
    // --------------------------------------------------------------------------
    // -------------------------------------------------------------
    case ST_SUB1_ATCK:{
    Bot_update();
    break;}

}//switch(sub_state)




