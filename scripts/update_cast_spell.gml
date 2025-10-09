/// update_cast_spell()

// D3EC: JSR 8DC3.  cast spell, spell effects, spellFlashTimer


if (Input.Magic_pressed 
&&  f.spells&g.spell_ready 
&&  global.pc.state 
&&  !(g.pc_lock&PC_LOCK_SPEL) )
{
    // ---------  A SPELL WAS REQUESTED THIS FRAME  ---------------------
    var _COST = get_spell_cost(g.spell_ready);
    
    if (f.mp-_COST >= 0)
    {
        adjust_stat(0, -min(f.mp, _COST));
        cast_spell(g.spell_ready);
    }
}




