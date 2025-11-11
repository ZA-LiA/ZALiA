/// Bubble_cling_init(direction)


var _i, _val, _datakey0, _data, _pos;

CLING_VER = 1;
CLING_VER = 2;


ROTATION_USE    = true;
//ROTATION_USE    = false; // Doesn't look good.
rotation        = 0; // 0: 0/360, 1: 90, 2: 180, 3: 270
ROTATION_TIMING = (1<<3)-1;
rotation_ctr    = 0;


WALL_PAD  = 4;
POINT_OFF = ww_ - WALL_PAD;

//set_xy(id, (x>>3)<<3, (y>>3)<<3); // align w/ grid

var _DEFAULT = $1<<irandom(3); // Default. 1,2,4,8
var _direction = argument[0];
if(!_direction) _direction = _DEFAULT;

if(!is_undefined(dk_spawn))
{
    _val=val(g.dm_spawn[?dk_spawn+STR_Direction]);
    if(!is_string(_val) 
    &&  _val!=0 )
    {
        _direction = _val;
    }
    
    /*
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        
        _datakey0 = "_TowardsPC";
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
            if (_val&$3) _direction = $1<<(x>=global.pc.x);
            else         _direction = $4<<(y>=global.pc.y);
        }
    }
    */
}
_direction = clamp(bit1st(_direction), $1,$8);


set_xlyt(id, (xl>>3)<<3, (yt>>3)<<3); // center on center of nearest tile
//set_xy(id, ((x>>3)<<3)+ww_, ((y>>3)<<3)+hh_); // center on center of nearest tile
//set_xy(id, ((x>>3)<<3)+ww_, ((y>>3)<<3)+ww_); // center on center of nearest tile


if (is_dormant)
{
    hspd = 0;
    vspd = 0;
}
else
{   // Should only set one; hspd or vspd
    hspd = byte(spdBase * bit_dir(_direction&$3));
    vspd = byte(spdBase * bit_dir(_direction&$C));
}




dg_cling = ds_grid_create(4+4+1, 3+3+3);
ds_grid_clear(dg_cling, 0);
// if (CLING_VER==2) { dg_cling = ds_grid_create(4+4+1, 3+3+3); ds_grid_clear(dg_cling, 0); }
// else              { dg_cling = ds_grid_create(4+4+1, 3+3+3); ds_grid_clear(dg_cling, 0); }

var _I2 = ds_grid_width(dg_cling)-4; // 4 center points
var _I1 =                     _I2-4; // 4 corner points

var _I3 = ds_grid_height(dg_cling)-2; // 2nd to last grid y

dg_cling[#_I2+0, _I3+1] = _I1+3; // RGT-BTM corner
dg_cling[#_I2+0, _I3-1] = _I1+1; // RGT-TOP corner

dg_cling[#_I2+1, _I3+1] = _I1+2; // LFT-BTM corner
dg_cling[#_I2+1, _I3-1] = _I1+0; // LFT-TOP corner

dg_cling[#_I2+2, _I3+1] = _I1+3; // BTM-RGT corner
dg_cling[#_I2+2, _I3-1] = _I1+2; // BTM-LFT corner

dg_cling[#_I2+3, _I3+1] = _I1+1; // TOP-RGT corner
dg_cling[#_I2+3, _I3-1] = _I1+0; // TOP-LFT corner


dg_cling[#0,0] = val(g.dm_spawn[?dk_spawn+STR_Data+"02"]); // cling side
dg_cling[#0,0] = clamp(bit1st(dg_cling[#0,0]), $0,$8);
//dg_cling[#0,0] = -1; // -1 indicates hasn't determined cling_side yet
dg_cling[#0,1] = dg_cling[#0,0]; // cling side prev frame

dg_cling[#0,2] = -1; // -1 indicates hasn't determined colliding sides yet
dg_cling[#0,3] = dg_cling[#0,2]; // colliding sides prev frame


Bubble_cling_update_2a();


var                     _X_OFF_RGT =   -(dg_cling[#_I2+0,1]&$7); // rgt
var                     _X_OFF_LFT = $7-(dg_cling[#_I2+1,1]&$7); // lft
var                     _X_OFF = 0;
if (dg_cling[#_I2+0,0]) _X_OFF = _X_OFF_RGT;
if (dg_cling[#_I2+1,0]) _X_OFF = _X_OFF_LFT;

var                     _Y_OFF_BTM =   -(dg_cling[#_I2+2,2]&$7); // btm
var                     _Y_OFF_TOP = $7-(dg_cling[#_I2+3,2]&$7); // top
var                     _Y_OFF = 0;
if (dg_cling[#_I2+2,0]) _Y_OFF = _Y_OFF_BTM;
if (dg_cling[#_I2+3,0]) _Y_OFF = _Y_OFF_TOP;

set_xy(id, x+_X_OFF, y+_Y_OFF);



Bubble_cling_update_2a();


        dg_cling[#0,0] = 0; // cling side: 0 or bit 1,2,4,8

if (_direction&$3)
{
    if (dg_cling[#_I2+2,0]     // BTM
    ||  dg_cling[#_I2+3,0] )   // TOP
    {
        // cling to wall
        dg_cling[#0,0] = $4<<(dg_cling[#_I2+3,0]!=0);
    }
    
    if ((dg_cling[#_I2+0,0] && _direction&$1)     // RGT
    ||  (dg_cling[#_I2+1,0] && _direction&$2) )   // LFT
    {
        // cling to wall
        dg_cling[#0,0] = _direction;
        
        // set move speed
                                hspd = 0;
        if (dg_cling[#_I2+2,0]) vspd = -spdBase&$FF; // move up
        else                    vspd =  spdBase&$FF; // move down
    }
}
else
{
    if (dg_cling[#_I2+0,0]     // RGT
    ||  dg_cling[#_I2+1,0] )   // LFT
    {
        // cling to wall
        dg_cling[#0,0] = $1<<(dg_cling[#_I2+1,0]!=0);
    }
    
    if ((dg_cling[#_I2+2,0] && _direction&$4)     // BTM
    ||  (dg_cling[#_I2+3,0] && _direction&$8) )   // TOP
    {
        // cling to wall
        dg_cling[#0,0] = _direction;
        
        // set move speed
                                vspd = 0;
        if (dg_cling[#_I2+0,0]) hspd = -spdBase&$FF; // move left
        else                    hspd =  spdBase&$FF; // move right
    }
}

dg_cling[#0,1] = dg_cling[#0,0]; // set cling side prev frame



if(!dg_cling[#0,0]) Bubble_cling_update_4a(); // Set orientation for rotation



/*
var _str  = " ";
    // _str += ", "+hex_str();
    _str += " _direction $"+hex_str(_direction);
    _str += ", hspd $"+hex_str(hspd);
    _str += ", vspd $"+hex_str(vspd);
    _str += ", dg_cling[#_I2+0,0] "+hex_str(dg_cling[#_I2+0,0]);
    _str += ", POINT_OFF $"+hex_str(POINT_OFF);
    _str += ", _I1 $"+hex_str(_I1)+", _I2 $"+hex_str(_I2);
sdm(""); sdm(_str); sdm("");
*/




