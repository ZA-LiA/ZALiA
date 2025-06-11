/// PC_take_damage(obj inst Enemy, *alt damage)


if (g.pc.iframes_timer)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _INST = argument[0];

var                   _ALT_DMG = undefined;
//var                   _ALT_DMG = -1;
if (argument_count>1) _ALT_DMG = argument[1];

if(!_INST 
&&  is_undefined(_ALT_DMG) )
//&& !_ALT_DMG )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------
// E2EF & E45C
if (_INST)
{
    f.xpDrain = g.dl_XP_DRAIN[|_INST.xp_drain];
}



// ---------------------------------------------------------------
// E314
var _damage = 0;

if(!is_undefined(_ALT_DMG))
//if (_ALT_DMG+1)
{
    _damage = _ALT_DMG;
}
else if (_INST)
{
    var _DAMAGE = g.dg_enemy_damage[#f.level_lif-1, _INST.attack_level];
        _damage = _DAMAGE;
    if (_damage)
    {
        switch(sign(g.spells_active&SPL_PRTC) + sign(f.items&ITM_RING)){
        default:{_damage=_DAMAGE; break;}
        case  1:{_damage=_DAMAGE>>1; break;}
        case  2:{_damage=round(_DAMAGE*.33); break;} // changed 7/28/23
        }
        
        _damage = max(1,_damage); // Added 7/28/23. I believe every dmg in OG is at least 1.
    }
}


if (g.DevTools_state)
{   // g.dev_invState. 2: skip all, 1 skip dmg, 0 regular
    if (g.dev_invState&$3==2)  exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    if (g.dev_invState&$3==1) _damage = 0; // dev
}

adjust_stat(-_damage, 0);



// ---------------------------------------------------------------
with(g.pc)
{
    attack_phase  = 0;
    iframes_timer = 4;
    
    stun_timer = Stun_DURATION1; // $20
    
    if (is_cucco 
    &&  CUCCO_KNOCKBACK_REDUCTION )
    {
        stun_timer = Stun_DURATION2; // $1A
    }
    /*
    if (Cucco_STUNNED_BEHAVIOR 
    &&  isVal(cucco_knockback_testing,2,3,4) 
    &&  pc_is_cucco() )
    {
        stun_timer = Stun_DURATION2;
    }
    */
    
    if (f.hp<=0) is_dead = true;
    
    
    
    // Knockback --------------------------------------
    if (_INST)
    {
        var _AMOUNT=$D;
        
        if (is_cucco 
        &&  CUCCO_KNOCKBACK_REDUCTION )
        {
            _AMOUNT=$C;
        }
        /*
        if (Cucco_STUNNED_BEHAVIOR 
        &&  isVal(cucco_knockback_testing,1,3,4) 
        &&  is_cucco )
        {
            _AMOUNT=$C;
        }
        */
        pushback_pc(_INST.x, _AMOUNT);
    }
    else
    {
        if (( xScale && !(cs&$2)) 
        ||  (!xScale && !(cs&$1)) )
        {
            hspd = ($A * -xScale) &$FF;
        }
    }
    
    
    if(!HoldItem_timer  // MOD
    &&  g.gui_state==g.gui_state_NONE ) // Added 2024/07/24. PC can't jump after taking damage with dialogue window open. It causes a scenario where PC_update_vertical() can't update vspd because: cs&$4=$4, ogr=0, vspd=$FE.
    {
        if(!is_fairy)
        {
            cs  &= ~CS_BTM;     // removes CS_BTM
            vspd = VSPD_DAMAGE; // VSPD_DAMAGE: $FE. Low velocity
            /*
            if (Cucco_STUNNED_BEHAVIOR 
            &&  isVal(cucco_knockback_testing,1,3) 
            &&  is_cucco )
            {
                vspd = VSPD_DAMAGE2; // $FF
                vspd_grav = 0;
            }
            */
        }
    }
    
    
    // Cucco Fury --------------------------------------
    if (g.mod_PC_CUCCO_3 
    &&  is_cucco 
    &&  _damage )
    {
        Cucco_damaged_count++;
        Cucco_damage_taken += _damage;
        
        
        var _HP_MAX = get_stat_max(STR_Heart);
        
        if (_damage           >=round(_HP_MAX*0.5)  // If this hit is hard enough.
        ||  Cucco_damage_taken>=round(_HP_MAX*0.7)  // If total dmg taken is enough
        || (Cucco_damage_taken>=round(_HP_MAX*0.15) && Cucco_damaged_count>=$20)  // If hit enough times
        || (Cucco_damage_taken>=round(_HP_MAX*0.4)  && Cucco_damaged_count>=$03) )
        {
            Cucco_rage_tokens++; // Triggers fury atk when ready.
            
            Cucco_damaged_count = 0;
            Cucco_damage_taken  = 0;
        }
    }
}



aud_play_sound(get_audio_theme_track(STR_PC+STR_Damage));




