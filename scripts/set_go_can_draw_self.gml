/// set_go_can_draw_self(can_draw_self)


// D250

var _i;


// PC ----------------------------------------------------
with(global.pc)
{
    if (state) can_draw_self = argument0;
    else       can_draw_self = false;
    
    SwordHB_can_draw  = false;
    SwordHB2_can_draw = false;
    SCS_can_draw      = false;
}




// Enemy, ------------------------------------------------
for(_i=0; _i<MAX_GOB1; _i++)
{
    if (g.go_mgr.dl_gob1[|_i]+1)
    {
        with(g.go_mgr.dl_gob1[|_i])
        {
            if (argument0 
            || !state 
            || !is_ancestor_(object_index,Snaraa,Ganon) ) // Allow certain GO to continue drawing
            {
                if (state) can_draw_self = argument0;
                else       can_draw_self = false;
            }
        }
    }
}




// Projectile Hostile -----------------------------------
for(_i=0; _i<MAX_GOC1; _i++)
{
    if (g.go_mgr.dl_goc1[|_i]+1)
    {
        with(g.go_mgr.dl_goc1[|_i])
        {
            if (state) can_draw_self = argument0;
            else       can_draw_self = false;
        }
    }
}




// Projectile Friendly ----------------------------------
for(_i=0; _i<MAX_GOC2; _i++)
{
    if (g.go_mgr.dl_goc2[|_i]+1)
    {
        with(g.go_mgr.dl_goc2[|_i])
        {
            if (state) can_draw_self = argument0;
            else       can_draw_self = false;
        }
    }
}




// GOB2 -------------------------------------------------
for(_i=ds_list_size(g.go_mgr.dl_gob2)-1; _i>=0; _i--)
{
    if(!is_undefined(   g.go_mgr.dl_gob2[|_i]) 
    &&  instance_exists(g.go_mgr.dl_gob2[|_i]) )
    {
        with(g.go_mgr.dl_gob2[|_i])
        {
            if (argument0 
            || !state 
            || !is_ancestor_(object_index,Elevator,LoDoA,BarrA,Barrier2,Torch,Zelda,NPC_0,BlckB,Switch,PushA,ArenaGate) ) // Allow certain GO to continue drawing
            {
                if (state) can_draw_self = argument0;
                else       can_draw_self = false;
            }
        }
    }
}




with(GameObject)
{
    if (variable_instance_exists(id,"BodyHB_can_draw"))   BodyHB_can_draw   = false;
    if (variable_instance_exists(id,"SwordHB_can_draw"))  SwordHB_can_draw  = false;
    if (variable_instance_exists(id,"ShieldHB_can_draw")) ShieldHB_can_draw = false;
    if (variable_instance_exists(id,"canDrawCSHB"))       canDrawCSHB       = false;
}




