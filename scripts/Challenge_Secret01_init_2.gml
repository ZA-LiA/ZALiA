/// Challenge_Secret01_init_2()


var _i, _x;
var _val, _val0,_val1;
var _dk, _pos;


GO_depth_init(min(global.pc.depth_def,DEPTH_ITEM)-3);
GO_init_palidx(global.PI_SPELL_PC1+1); // PI_SPELL_FLASH1+1: Brightest pc spell flash colors
//GO_init_palidx(PI_PC_2+1); // PI_PC_2+1: Brightest pc spell flash colors
//GO_init_palidx(PI_MOB_RED);
GO_sprite_init(SPRITE1);


// spawn_x: headstone xl, spawn_yt: headstone yt and ghost yt
Headstone_x = spawn_xl+8;
Headstone_y = spawn_yt+8;

Ghost_HOME_X = Headstone_x-($0B<<3);
Ghost_HOME_Y = spawn_yt+hh_;
//Ghost_HOME_X = x;
set_xy(id, Ghost_HOME_X,Ghost_HOME_Y);

//spawn_x -= ww_;
//spawn_yt -= hh_;
//set_xlyt(id, spawn_x,spawn_yt);


var _COUNT1 = 4;
var _DIST1 = $14<<3;
//var _dist1 = _DIST1;
var _DIST2 = _DIST1 div _COUNT1;;
var _DIST3 = $10;

//Goal_X = x + _DIST1;

dl_MOVE_TO_X = ds_list_create();
_x = Ghost_HOME_X;
for(_i=0; _i<_COUNT1; _i++)
{
    _val  = _DIST2;
    _val += irandom(_DIST3) * choose(1,-1);
    _x += _val;
    ds_list_add(dl_MOVE_TO_X,_x);
}
dl_MOVE_TO_X[|ds_list_size(dl_MOVE_TO_X)-1] = Ghost_HOME_X + _DIST1;

dl_MOVE_TO_X_idx = 0;



NPC_SPAWN_DATAKEY = undefined;
if(!is_undefined(dk_spawn))
{
    _val0 = STR_NPC+STR_Spawn+STR_Datakey;
    _i=0;
    while (true)
    {
        _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(++_i)];
        if(!is_undefined(_val) 
        &&  _i<=$10 ) // Just in case. Because while loops scare me.
        {
            if (is_string(_val) 
            &&  string_pos(_val0,_val) )
            {
                NPC_SPAWN_DATAKEY = strR(_val,string_length(_val0)+1);
                break;//while (true)
            }
        }
        else
        {
            break;//while (true)
        }
    }
}




