/// GameObjectMgr_Room_Start()

// For NPC, Enemy, Item, Spawner, Projectile

show_debug_message(" GameObjectMgr_Room_Start()");


var _i;
var _inst;


counter      =  0; // 0485
update_idx   = UIDX_NULL;
uIdxSwap_gob = UIDX_NULL; // if != -1, addToEntityList() will use eIndexSwap value
uIdxSwap_goc = UIDX_NULL; // if != -1, addToProjectileList() will use pIndexSwap value


// -------------------------------------------------------------------
if (g.mod_destroy_go_on_death)
{
    ds_list_clear(dl_gob1);
    for(_i=0; _i<MAX_GOB1; _i++) ds_list_add(dl_gob1, noone);
    
    
    ds_list_clear(dl_goc1);
    for(_i=0; _i<MAX_GOC1; _i++) ds_list_add(dl_goc1, noone);
    
    
    ds_list_clear(dl_goc2); // array of GameObject_D (projectiles PC)
    for(_i=MAX_GOC2-1; _i>=0; _i--){
             dl_goc2[|_i] = instance_create(0,0, ProjectileFriendly); // Projectile Friendly
        with(dl_goc2[|_i])  state = 0;
    }
    
    
    ds_list_clear(dl_gob2);
}
else
{
    ds_list_clear(dl_gob1);
    for(_i=MAX_GOB1-1; _i>=0; _i--)
    {
        _inst = instance_create(0,0, GameObject);
        ds_list_add(dl_gob1,_inst);
        with(_inst) init_vars_go_A();
    }
    
    
    
    ds_list_clear(dl_goc1);
    for(_i=0; _i<MAX_GOC1; _i++)
    {
             dl_goc1[|_i] = instance_create(0,0, GameObject);
        with(dl_goc1[|_i]) init_vars_go_A();
    }
    
    
    
    ds_list_clear(dl_goc2); // array of GameObject_D (projectiles PC)
    for(_i=MAX_GOC2-1; _i>=0; _i--)
    {
             dl_goc2[|_i] = instance_create(0,0, ProjectileFriendly); // Projectile Friendly
        with(dl_goc2[|_i]) state = 0;
    }
    
    
    
    ds_list_clear(dl_gob2);
}




