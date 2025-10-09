/// RockGeru_init2()


var _i, _val, _len, _pos;


projectile_OBJ = Rock3;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;
GO_init_palidx(global.PI_MOB_RED);


control     =  0; // 0444[eIndex]

arm         =  0;
Arm_xoff    =  0;
Arm_yoff    =  0;
armXScale   = -1;
armYScale   =  1;

rock        =  0;
rockXOff    =  0;
rockYOff    =  0;


Wall_Y      = spawn_yt;
//GROUND_Y    = get_ground_y(x,y,1,viewYB()-$18);
//Wall_H      = $10<<3;
//Wall_Y      = GROUND_Y - WALL_H;
Wall_XL     = spawn_xl;
Wall_W      = g.rm_w;
Wall_XR     = Wall_XL+Wall_W;


switch(ver)
{
    case 1:{
    GO_depth_init(DEPTH_BG5+3);
    Wall_XL     = 0;
    Wall_W      = g.rm_w;
    break;}
    
    
    case 2:{ // For Bulblin
    GO_depth_init(DEPTH_BG7+3);
    
    var _spawn_datakey = dk_spawn;
    if(!is_undefined(    dk_spawn))
    {   _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);  }
    
    
    if(!is_undefined(_spawn_datakey))
    {
        for(_i=$1; _i<=$F; _i++)
        {
            _val=val(g.dm_spawn[?_spawn_datakey+STR_Data+hex_str(_i)]);
            if (is_string(_val))
            {
                    _pos=string_pos(    STR_Clms,_val);
                if (_pos)
                {   _pos+=string_length(STR_Clms);
                    _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                    Wall_W =  str_hex(_val)<<3;
                    break;//_i
                }
            }
        }
    }
    
    Wall_XR = Wall_XL+Wall_W;
    break;}
}


Wall_XR = clamp(Wall_XR, Wall_XL,g.rm_w);





