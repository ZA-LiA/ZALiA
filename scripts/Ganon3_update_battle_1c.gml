/// Ganon3_update_battle_1c()

// pc-sword to gob-body collision ------------------------------


update_body_hb_1a();
if (global.pc.SwordHB_collidable 
&&  global.pc.attack_bits&(BIT_ATK1|BIT_ATK2|BIT_ATK3|BIT_ATK4) 
&&  collide_pc_sword(BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h,BodyHB_r) )
{
    if!(cs &  CS_SW1)
    {
        cs |= CS_SW1;
        
        with(global.pc)
        {
            if (attack_bits&(BIT_ATK1|BIT_ATK2)) // high stab, low stab
            {
                g.control1_timer = Pushback_DURATION; // PC atk will NOT affect PC.hspd
                if ((xScale && !(cs&$2)) 
                || (!xScale && !(cs&$1)) )
                {    hspd = byte($C * -xScale);  }
            }
            //else if (attack_bits&BIT_ATK3) // ATK3: Downthrust
            else if (behavior==behavior_STAB_DOWN) // Downthrust
            {   // high downthust bounce
                vspd = round(abs8b(vspd)*1.4);
                vspd = clamp(vspd, $08,$0C);
                //vspd = max(2, round(abs8b(vspd)*1.4)); // 1.4 per vspd of pc
                vspd = byte(-vspd);
            }
            else if (attack_bits&BIT_ATK4) // ATK4: Upthrust
            {
                vspd  = 0;
            }
        }
        
        
        
        
        if ((Attack_id==Attack1_ID && BattleState!=BattleState_Attack1_IDLE) 
        ||  (Attack_id!=Attack1_ID && global.pc.behavior==global.pc.behavior_STAB_DOWN) )
        {
            aud_play_sound(get_audio_theme_track(dk_ElevatorMove));
            aud_play_sound(get_audio_theme_track(STR_Stab),0,false,.5);
            aud_play_sound(Audio.SND_STEP_1A);
        }
        else
        //else if (Attack_round<=Attack_ROUNDS)
        {
            stun_timer = STUN_DURATION1; // STUN_DURATION1=$30
            aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
            
                dg_AttackRounds[#Attack_round-1,3]--;
            if(!dg_AttackRounds[#Attack_round-1,3]) // 3: attack-round slime hp remaining
            {
                Attack_id   = Attack1_ID;
                timer       = 0;
                BattleState = BattleState_Attack1_INIT;
            }
        }
    }
}
else
{
    cs &= ~CS_SW1;
}




