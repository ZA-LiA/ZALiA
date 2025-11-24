/// Myu_init2()


init_vars_Bot();


dl_sprites[|1] = spr_Myu2; // spikes out
dl_sprites[|0] = spr_Myu1;
GO_init_palidx(global.PI_MOB_BLU);

abilities |= ABL_WALK;


if (g.area_name==Area_PalcC 
||  g.area_name==Area_PalcD 
||  g.area_name==Area_PalcE 
||  g.area_name==Area_PalcF )
{
    XP_IDX = $05;
    xp = g.dl_XP[|XP_IDX];
}


if (g.area_name==Area_PalcG 
||  g.area_name==Area_PalcH )
{
    ATTACK_LEVEL = $04;
    attack_level = ATTACK_LEVEL;
    
    HP_IDX = $0D;
    hp = g.dl_HP[|HP_IDX];
    
    XP_IDX = $0A;
    xp = g.dl_XP[|XP_IDX];
}


// Despawn inst because Myu is too short to see in water
if (global.EnemyRando_enabled 
&&  val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method]) 
&& !is_undefined(dk_spawn) 
&& !is_undefined(g.dm_spawn[?dk_spawn+STR_obj_idx]) 
&& !is_undefined(g.dm_spawn[?dk_spawn+STR_Version]) 
&&  object_get_name(object_index)+hex_str(ver)!=object_get_name(g.dm_spawn[?dk_spawn+STR_obj_idx])+hex_str(g.dm_spawn[?dk_spawn+STR_Version])  // If inst is from a rando location
&&  x>=0 
&&  x<g.rm_w 
&&  y>=0 
&&  y<g.rm_h )
{
    var _CLM = x>>3;
    var _ROW = find_row_solid(TID_SOLID1,_CLM,y>>3, 1, $FF, y>>3) - 1;
    if (g.dg_RmTile_Liquid[#_CLM,_ROW])
    {
        state = 0;
    }
}




