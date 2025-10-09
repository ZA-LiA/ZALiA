/// spawn_pc_proj_2a()


if (global.pc.attack_phase-1 != global.pc.stab_type 
||  global.pc.attack_timer   != global.pc.attack_phase_DURATION1-1 )   // attack_phase_DURATION1-1 = 5
{
    return noone;
}



var _i;
var _proj    = noone;
var _idx     = -1;
var _tokens  =  1;
    //_tokens +=  g.spells_active&SPL_FIRE  &&  f.level_atk>=4  &&  (!pc_is_cucco() || (g.CUCCO_CAN_PROJ==2 && f.Cucco_skills&f.CuccoSkill_PROJ2));
if (g.spells_active&SPL_FIRE)
{
    if (f.level_atk>=4)
    {
        if(!pc_is_cucco() 
        || (g.CUCCO_CAN_FIRE && f.Cucco_skills&f.CuccoSkill_PROJ2) )
        {
            _tokens++;
        }
    }
}
else if (f.items&ITM_SWRD)
{
    for(_i=ds_list_size(g.go_mgr.dl_goc2)-1; _i>=0; _i--)
    {
        if (is_undefined(   g.go_mgr.dl_goc2[|_i]) 
        || !instance_exists(g.go_mgr.dl_goc2[|_i]) )
        {
            continue;
        }
        
            _proj = g.go_mgr.dl_goc2[|_i];
        if (_proj.state 
        &&  _proj.timeout>=_proj.CUE2 )
        {
            _tokens++;
            break;
        }
    }
}





for(_i=ds_list_size(g.go_mgr.dl_goc2)-1; _i>=0; _i--)
{
    if(!_tokens)
    {
        return noone;
    }
    
    
    if (is_undefined(   g.go_mgr.dl_goc2[|_i]) 
    || !instance_exists(g.go_mgr.dl_goc2[|_i]) )
    {
        continue;
    }
    
    
    
        _proj = g.go_mgr.dl_goc2[|_i];
    if(!_proj.state)
    {
        _idx = _i;
        continue; // keep updating _tokens
    }
    
    if (wINw(_proj.BodyHB_xl,_proj.BodyHB_w, g.view_xl_og,VIEW_W_OG))
    {
        _tokens--;
    }
}



if (_tokens    // if the spawned limit has NOT been reached
&&  _idx+1 )   // if an instance was available to use
{
    return spawn_pc_proj(_idx);
}



return noone;




