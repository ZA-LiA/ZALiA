/// Backwall_update()


switch(sub_state)
{
    // ----------------------------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;
    
    timer = 0;
    sub_state = sub_state_MOVING;
    break;}//case sub_state_IDLE
    
    
    
    
    
    
    
    // ----------------------------------------------------------------
    case sub_state_MOVING:{
    if (timer) break;
    
    if (DIRECTION&$3)
    {
        hspd  = byte_to_int(hspd);
        hspd += acceleration*2;
        hspd  = clamp(hspd, -SPEED1,SPEED1);
        hspd &= $FF;
        hspd_impel = sign(acceleration);
    }
    else
    {
        vspd  = byte_to_int(vspd);
        vspd += acceleration*2;
        vspd  = clamp(vspd, -SPEED1,SPEED1);
        vspd &= $FF;
        vspd_impel = sign(acceleration);
    }
    
    if (hspd) updateX();
    if (vspd) updateY();
    set_xy(id, clamp(x,X_MIN,X_MAX), clamp(y,Y_MIN,Y_MAX));
    
    timer = 0;
    //sub_state = sub_state_IDLE;
    break;}//case sub_state_MOVING
    
    
    
    
    
    
    
    // ----------------------------------------------------------------
    case sub_state_DROWNING:{
    if (timer) break;
    
    timer = 0;
    //sub_state = sub_state_MOVING;
    break;}//case sub_state_DROWNING
}//switch(sub_state)




// Slow down to stop when not moving.
if (DIRECTION&$3)
{
    if (hspd)
    {
        hspd  = abs8b(hspd);
        hspd -= acceleration;
        hspd  = clamp(hspd,$00,$7F);
        hspd *= sign_(DIRECTION&$1);
        hspd &= $FF;
    }
}
else
{
    if (vspd)
    {
        vspd  = abs8b(vspd);
        vspd -= acceleration;
        vspd  = clamp(vspd,$00,$7F);
        vspd *= sign_(DIRECTION&$4);
        vspd &= $FF;
    }
}





switch(ver)
{
    // -----------------------------------------------------
    case 1:{
    if(!global.pc.is_dead)
    {
        if (pc_is_drowning)
        {
            var _CHANGE = sign_(DIRECTION&$A);
            if (DIRECTION&$3) set_xy(global.pc, global.pc.x+_CHANGE, global.pc.y);
            else              set_xy(global.pc, global.pc.x, global.pc.y+_CHANGE);
            
            var      _qual=false;
            switch(DIRECTION){
            case $1:{_qual=global.pc.x<x-global.pc.ww_; break;}//case $1
            case $2:{_qual=global.pc.x>x+global.pc.ww_; break;}//case $2
            case $4:{_qual=global.pc.y<y-global.pc.hh_; break;}//case $4
            case $8:{_qual=global.pc.y>y+global.pc.hh_; break;}//case $8
            }//switch(DIRECTION)
            
            if (_qual)
            {
                global.pc.is_dead = true;
                //if (f.items&ITM_FRY1)
            }
        }
        else
        {
            var _DIST = $4<<sign(DIRECTION&$C);
            switch(DIRECTION){
            case $1:{pc_is_drowning=global.pc.xl+_DIST<x; break;}//case $1
            case $2:{pc_is_drowning=global.pc.xr-_DIST>x; break;}//case $2
            case $4:{pc_is_drowning=global.pc.yt+_DIST<y; break;}//case $4
            case $8:{pc_is_drowning=global.pc.yb-_DIST>y; break;}//case $8
            }//switch(DIRECTION)
            
            if (pc_is_drowning)
            {
                var _damage = get_stat_max(STR_Heart);
                //if (f.items&ITM_FRY1) _damage = Container_AMT<<1;
                //if (g.DevTools_state && g.dev_invState&$3) _damage = 0; // g.dev_invState. 2: skip all, 1 skip dmg, 0 regular
                with(global.pc) adjust_stat(-_damage, 0);
                
                g.pc_lock = PC_LOCK_ALL;
                PC_set_behavior(global.pc.behavior_DAMAGE);
                global.pc.stun_timer = $10;
                aud_play_sound(get_audio_theme_track(STR_PC+STR_Damage));
                //timer = 0;
                //sub_state = sub_state_DROWNING;
            }
        }
    }
    break;}//case 1
    
    
    
    
    // -----------------------------------------------------
    case 2:{
    
    break;}//case 2
}//switch(ver)




