/// Wosu_init2()


var _i, _val, _len, _pos;


dl_sprites[|1] = spr_Wosu2;
dl_sprites[|0] = spr_Wosu1;
GO_init_palidx(global.PI_MOB_ORG);

if(!is_undefined(dk_spawn)) // if not from a spawner
{
    if (1){ // If this is a rm enter spawn, PC.x may not be set yet.
        var _PC_X  = val(g.dm_rm[?f.reen+STR_Spawn_x]) <<3;
            _PC_X += PC_W_;
        //
        facing_dir = sign_(x<_PC_X);
    }
    
    var _spawn_datakey = dk_spawn;
    if(!is_undefined(    dk_spawn))
    {   _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);  }
    
    
    if(!is_undefined(_spawn_datakey))
    {
        _val=val(g.dm_spawn[?_spawn_datakey+STR_Direction]);
        if(!is_string(_val) 
        &&  _val!=0 )
        {
            facing_dir=_val;
        }
    }
}


facing_dir = sign_(facing_dir);



HSPD1 = $10;
hspd  = (HSPD1*facing_dir) &$FF;

VSPD_GRAV   = 2;
vspd_grav   = VSPD_GRAV;


projectile_OBJ = Flame1;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;




