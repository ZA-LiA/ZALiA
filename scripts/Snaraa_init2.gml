/// Snaraa_init2()


var _i, _data, _datakey, _pos;


if (global.dg_solid[#(xl>>3)-1, yt>>3]&$FF==TID_SOLID1)
{    facing_dir =  1;  }
else facing_dir = -1;

if ( facing_dir) path_dir = $1; // 1: RGT
else             path_dir = $2; // 2: LFT


path_dist = Snaraa_update_1(x>>3);
Snaraa_update_2();


timer = $40;


if(!is_undefined(dk_spawn))
{
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        _datakey = dk_AgroDistance;
        _pos = string_pos(_datakey,_data);
        if (_pos)
        {
            _pos += string_length(_datakey);
            agro_distance = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
            break;//_i
        }
    }
}




