/// Spawner_PoisonBubble_init2()

// object: SpPoA


projectile_OBJ = RisingBubble;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


SpawnArea_w  = viewW()-$10;
SpawnArea_x  = g.rm_w_;
SpawnArea_xl = SpawnArea_x-(SpawnArea_w>>1);

/*
if(!is_undefined(                   dk_spawn) 
&& !is_undefined(       g.dm_spawn[?dk_spawn+STR_Rando+STR_Direction]) )
{
     SpawnDir_OPTIONS = g.dm_spawn[?dk_spawn+STR_Rando+STR_Direction];
}
else SpawnDir_OPTIONS = 0;
*/

SpawnDir_OPTIONS = $4;
if (val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Spawner]))
{
    SpawnDir_OPTIONS = choose($4,$8,$C);
}




