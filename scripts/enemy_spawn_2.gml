/// enemy_spawn_2(object_index, version)

// MobySpawner  $66, Moby  $A4
// GruntSpawner $64, Grunt $A3


var _OBJ = argument0;
var _VER = argument1;

var _C1  = object_index==SpGrA; // SpGrA: Grunt Spawner

// 9B48
var      _X  = viewXC();
if (_C1) _X += viewW_() * sign_(rand()&$1); // GruntSpawner
else     _X += $58      * sign_(rand()&$1); // MobySpawner
         _X -= $08;
         _X += _C1;
//
var      _Y  = viewYT() - $10;
//var      _Y  =  viewYT() + $18;

/*  OG
var               _val  = rand()&$1;
                  _val += (_C1<<1);  // Grunt
//
     if (_val==0) _val  = $20; // Moby  left    side       $30
else if (_val==1) _val  = $D0; // Moby  right   side

else if (_val==2) _val  =  -8; // Grunt left    side       $00
else if (_val==3) _val  = $F8; // Grunt right   side

var _X =  g.camXL    + _val + _C1;
var _Y = (g.camYT-8) + $20;
*/



with(GameObject_create(_X,_Y, _OBJ,_VER))
{
    HP_IDX      = $03; // g.dl_HP_DEFAULT[|$03] = $03
    hp          = g.dl_HP[|HP_IDX];
    //hp          = $03;
    hspd = $00;
    vspd = $20;
    facing_dir = dir_to_pc(id);
    
    return id;
}




