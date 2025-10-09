/// damage_gob(gob inst id, damage amount, is projectile collision)


// E726.  GOB take damage
with(argument0)
{
    if (is_ancestor_(object_index,Item,FaBlA,CrHoA))
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    // *** stun_timer needs to be set BEFORE pushback_pc_and_go() ***
    // stun_timer is checked in set_go_hspd_pushbback() in pushback_pc_and_go()
    stun_timer = STUN_DURATION1; // $30
    
    
    var _HP_PREV=hp;
    
        hp-=argument1;
    if (hp<=0)
    {
        hspd_pushback = 0;
        update_kill_count(); // kill count
        
        aud_play_sound(get_audio_theme_track(dk_EnemyDeath));
        timer = explosion_DURATION1; // explosion_DURATION1=$25: 0.617s
        state = state_EXPLODE;
    }
    else if (global.pc.behavior!=global.pc.behavior_STAB_DOWN)
    {
        if (argument2) pushback_pc_and_go(id,0); // Proj collision: Won't push PC
        else           pushback_pc_and_go(id);
    }
    
    
    if (g.mod_BossHPBarFlash 
    //&&  hp<_HP_PREV 
    &&  is_ancestor(object_index,Boss) )
    {
        HPBar_timer = stun_timer;
    }
    
    
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    /*if(DEV){var _str  = "damage_gob():  ";
    _str += obj_name(object_index)+" v$"+hex_str(ver);
    _str += "  take dmg $"+hex_str(argument1);
    _str += ", hp before $"+hex_str(_HP_PREV)+", hp after $"+hex_str(hp);
    sdm(""); sdm(_str); sdm("");
    }*/
}



/*E66C[atk lvl] = E66D-E674: 02030406090C1218
dl_ATTACK_DAMAGE = ds_list_create();
dl_ATTACK_DAMAGE[|$00] = $01; // If I ever use an attack level 0
dl_ATTACK_DAMAGE[|$01] = $02; // attack level 1
dl_ATTACK_DAMAGE[|$02] = $03; // attack level 2
dl_ATTACK_DAMAGE[|$03] = $04; // attack level 3
dl_ATTACK_DAMAGE[|$04] = $06; // attack level 4
dl_ATTACK_DAMAGE[|$05] = $09; // attack level 5
dl_ATTACK_DAMAGE[|$06] = $0C; // attack level 6
dl_ATTACK_DAMAGE[|$07] = $12; // attack level 7
dl_ATTACK_DAMAGE[|$08] = $18; // attack level 8
dl_ATTACK_DAMAGE[|$09] = $1C; // attack level 9
*/










