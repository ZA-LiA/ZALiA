/// enemy_spawn_1(object_index, version)

// Used by WosuSpawner & MauSpawner


var _OBJ = argument0;
var _VER = argument1;


var _facingDir = facing_dir;
if (Input.heldH) facing_dir = -sign_(Input.heldH&$1);
else             facing_dir = -sign_(rand()&$1);


with(GameObject_create(0,0, _OBJ,_VER))
{   // B876
    facing_dir =  other.facing_dir;
    other.facing_dir = _facingDir;
    
    // WIDE VIEW
    var _XL  = viewXL() + (viewW() * !facing_dir); // left or right end of view
        _XL -= ww_;                               // half GO's width
        _XL +=((g.pc.yt&$FF)<3) * facing_dir;      // OG CARRY. 0, 1, -1
    var _YT  =  g.pc.yt + g.pc.hh - $22;
    /*  OG
    var _XL = g.camXL + ((8*facing_dir)&$FF) + ((g.pc.yt&$FF)<3);
    var _YT = g.pc.yt - 2;
    */
    
    set_xlyt(id, _XL,_YT);
    
    hspd = (HSPD1*facing_dir) &$FF;
    counter = $FF;
    
    
    return id;
}




