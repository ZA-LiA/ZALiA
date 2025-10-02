/// Balshot_update()


//if(!ocs) // if on screen
if (Shoot_timer) Shoot_timer--;
else             Shoot_timer = Shoot_cooldown;


if(!Shoot_timer 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    var _xl  = x;
        _xl += ww_ * facing_dir; // Balshot XL or XR
        _xl += (projectile_w>>1) * facing_dir; // projectile XL
        _xl += $1 * facing_dir; // 
    var _yt  = y - (projectile_h>>1); // projectile YT
    with(GOC1_create(_xl,_yt, facing_dir, projectile_obj,projectile_ver, id, projectile_pi))
    {
        is_from_spawner = true;
        despawn_offscreen_hor = false;
        hspd = (other.projectile_hspd*facing_dir) &$FF;
        attack_level = other.projectile_attack_level;
        //attack_level = max(other.projectile_attack_level, attack_level);
    }
}


if (ocsHV2(id)) GOB_body_collide_pc_sword();


if (hp<=0)
{   // Remove solids
    for(var _i=0; _i<ww>>3; _i++)
    {
        for(var _j=0; _j<hh>>3; _j++)
        {
            tile_change_1a(0, xl+(_i<<3), yt+(_j<<3), -1,0, 0);
        }
    }
}


update_EF11();




/*
/// Balshot_update()


switch(sub_state)
{
    case sub_state_ENABLED:{
    //if(!ocs) // if on screen
    if (Shoot_timer) Shoot_timer--;
    else             Shoot_timer = Shoot_cooldown;
    
    
    if(!Shoot_timer 
    &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
    {
        var _xl  = x;
            _xl += ww_ * facing_dir; // Balshot XL or XR
            _xl += (projectile_w>>1) * facing_dir; // projectile XL
            _xl += $1 * facing_dir; // 
        var _yt  = y - (projectile_h>>1); // projectile YT
        with(GOC1_create(_xl,_yt, facing_dir, projectile_obj,projectile_ver, id, projectile_pi))
        {
            is_from_spawner = true;
            despawn_offscreen_hor = false;
            hspd = (other.projectile_hspd*facing_dir) &$FF;
            attack_level = other.projectile_attack_level;
            //attack_level = max(other.projectile_attack_level, attack_level);
        }
    }
    
    
    update_EF11();
    
    
    if (ocsHV2(id)) GOB_body_collide_pc_sword();
    if (cs&CS_SW1)
    {
        //hp = HP;
        stun_timer = STUN_DURATION1; // $30
        cs &= ~CS_SW1;
        sub_state = sub_state_DISABLED;
        break;//case sub_state_ENABLED
    }
    break;}//case sub_state_ENABLED
    
    
    
    
    case sub_state_DISABLED:{
    update_EF11();
    break;}//case sub_state_DISABLED
}//switch(sub_state)
*/




