/// Spawner_Drop_update()


// B9BF: JSR EF11
update_EF11();


if(!active)
{
    active = qual_spawn_3a(spawn_x,ww_, spawn_y,hh_);
    //active = qual_spawn_1a(spawn_x, ww);
    //if (active) sdm("DropSpawner activated!");
}

if(!active) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!





counter = (counter+1)&$FF;


// !(counter&$3F): every 64 frames. 1.067s
if (counter & (TIMING-1)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
var _UIDX = avail_uidx_goc(MAX_GOC1);
if (_UIDX == UIDX_NULL)   exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!




// ---------------------------------------------------------------
// ---------------------------------------------------------------
//var _RAND   = irandom($FF);
var _RAND   = rand();
var _CHANCE = (8>>luck)-1; // ((8>>luck)-1): 7 or 3

if!(_RAND & (_CHANCE<<1))
{
    counter = (counter+(TIMING>>luck)) &$FF;
}


var _XX = xl + 4;
var _YY = yt + DROP_YOFF + ((_XX&$FF)<4);


if (ver==3)
{
    if(!irandom(1))
    {
        projectile     = Flame1;
        projectile_ver = 1;
    }
    else
    {
        projectile     = Drop;
        projectile_ver = 1;
    }
}


g.go_mgr.uIdxSwap_goc = _UIDX;
with(GOC1_create(_XX,_YY, facing_dir, projectile,projectile_ver))
{
    is_from_spawner = true;
    
    GO_depth_init(other.Projectile_DEPTH);
    
    hspd = 0;
    vspd = 0;
    
    if (is_ancestor(object_index,Drop))
    {
        control = _RAND & _CHANCE; // will spawn bot if this = 0
        //control = _RAND&$7; // OG. will spawn bot if this = 0
    }
}




