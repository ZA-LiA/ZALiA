/// Bagin_update()


if (stun_timer)
{
    GOB_update_2();
    Bagin_update_1(); // replacement update
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------
if (cs&CS_BD1) enemy_collide_pc_body();



// ----------------------------------------------------------------------
switch(sub_state)
{
    // -------------------------------------
    case ST_SUB1_IDLE:{
        counter = (counter+1) &$7F;
    var              _DIR = -1;
    if (counter&$40) _DIR =  1;
                            y_off_float  =  _DIR; // 1, -1
    if (counter&$3F >= $20) y_off_float += -_DIR; // 0
    if (counter&$3F >= $30) y_off_float += -_DIR; // 1, -1
    set_xlyt(id, xl, y_idle+y_off_float);
    
    
    
    if (atk_cooldown_timer)
    {   atk_cooldown_timer--;  }
    
    if(!atk_cooldown_timer) facing_dir = dir_to_pc(id);
    
    if(!atk_cooldown_timer 
    // &&  y_off_float == 0 
    &&  abs(g.pc.x-x) <= DIST_ATK )
    {
        y_off_float =  0;
        
        set_xy(id, x,y-1);
        vspd = VSPD1;
        
        sub_state = ST_SUB1_JUMP;
    }
    break;}
    
    
    
    
    // -------------------------------------
    case ST_SUB1_JUMP:{
    if (yt < y_dive)
    {
        updateY();
        vspd = (vspd+1)&$FF;
        
        // ver2 only
        if (projectile 
        &&  vspd==0   // jump peak
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            GOC1_create(x-4,yt, facing_dir, projectile,projectile_ver);
        }
    }
    else
    {
        set_xlyt(id, xl,y_dive);
        vspd = 0;
        
        sub_state = ST_SUB1_RESF;
    }
    break;}
    
    
    
    
    // -------------------------------------
    case ST_SUB1_RESF:{
    if (timer) break; // replacement delay
    
    if!(g.counter1&$1)
    {   set_xy(id, x,y-1);  }
    
    if (yt <= y_idle)
    {
        set_xlyt(id, xl,y_idle);
        
        atk_cooldown_timer = DUR_COOLDOWN_ATK;
        counter = $60;
        
        sub_state = ST_SUB1_IDLE;
    }
    break;}
}





// ----------------------------------------------------------------------
GO_update_cs();
GOB_update_2();

Bagin_update_1(); // replacement update




