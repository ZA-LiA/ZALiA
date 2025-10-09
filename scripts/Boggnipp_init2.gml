/// Boggnipp_init2


var                         _spawn_datakey = dk_spawn;
if(!is_undefined(dk_spawn)) _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);

GO_depth_init(DEPTH_BG1);



YT_IDLE = spawn_yt+YT_IDLE;
set_xlyt(id, xl,YT_IDLE);


hspd_impel  = dir_to_pc_(id);
hspd        = (HSPD_PACE*hspd_impel) &$FF;
hspd_dir    = sign_(hspd<$80);




