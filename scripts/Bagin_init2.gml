/// Bagin_init2()


var _i, _val, _len, _data;


var _spawn_datakey = dk_spawn;
if(!is_undefined(    dk_spawn))
{   _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);  }



GO_depth_init(DEPTH_BG1+1);


ds_list_add(dl_sprites,spr_Bagin_1a);
ds_list_add(dl_sprites,spr_Bagin_1b);
GO_sprite_init(dl_sprites[|0]);

VSPD1 = $C0; // Jump speed (initial velocity)
TERMINAL_VELOCITY = 5;

//if(1) // testing
if (ver==2)
{
    projectile_OBJ = RisingBubble;
    projectile_VER = 1;
    projectile     = projectile_OBJ;
    projectile_ver = projectile_VER;
}


               _i=0;
ST_SUB1_IDLE = _i++;
ST_SUB1_JUMP = _i++;
ST_SUB1_RESF = _i++; // Resurfacing. Period below water line, moving to water line
sub_state    = ST_SUB1_IDLE;


DIST_ATK = $28; // $30 more challenging

y_idle = spawn_yt - 2;
y_dive = y_idle + $10;

//Y_OFF_FLOAT_MAX = 1;
y_off_float =   0;
counter     = $60;

DUR_COOLDOWN_ATK    = $40;
atk_cooldown_timer  = 0;




