/// update_SoundWave()


var _collided_src = false;

// AD29
if (reflected 
//if(!counter 
&& !is_undefined(   source_inst) 
&&  instance_exists(source_inst) 
&&  source_inst.hp 
&&  source_inst.state == source_inst.state_NORMAL 
&&  source_inst.behavior )
{   // AD3E
    update_body_hb_1a();
    with(source_inst) update_body_hb_1a();
    
    if (rectInRect(BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h, source_inst.BodyHB_xl,source_inst.BodyHB_yt,source_inst.BodyHB_w,source_inst.BodyHB_h))
    {
        _collided_src = true;
        disintegrate_counter = $F2;
        state = state_EXPLODE;
        
        
        with(source_inst)
        {
            if (is_ancestor_(object_index,Carock01,WizaA))
            {    var      _DAMAGE = 2;  }
            else var      _DAMAGE = g.dg_enemy_damage[#f.level_lif-1, other.attack_level];
            damage_gob(id,_DAMAGE,true); // damage enemy
            
            if (is_ancestor( object_index,Carock01)) Boss_update_5(); // $22 Carock
        }
    }
}

if(!_collided_src)
{   // ADB4, ADBF
    Projectile_update_3a(despawn_offscreen_hor); // Projectile_update_1a(pID != 8);
}




