/// Balshot_init2()


var _i,_j, _val1, _data, _str, _pos;
var _delay = 0;


if(!is_undefined(dk_spawn))
{
    facing_dir = val(g.dm_spawn[?dk_spawn+STR_Direction],facing_dir);
    facing_dir = sign_(facing_dir);
    
    projectile_hspd = val(g.dm_spawn[?dk_spawn+STR_Speed], projectile_hspd);
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        _str = STR_Cooldown;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            Shoot_cooldown = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _str = STR_Delay;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _delay = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _str = STR_Projectile+STR_Object;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _data = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            projectile_obj = val(g.dm_go_prop[?_data+STR_Object+STR_Idx], projectile_obj);
        }
        
        _str = STR_Projectile+STR_Version;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            projectile_ver = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _str = STR_Projectile+STR_Palette+STR_Index;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            projectile_pi = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _str = STR_Projectile+STR_Attack+STR_Level;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            projectile_attack_level = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
    }
}


Shoot_timer += _delay;
//Shoot_timer = Shoot_cooldown + _delay;


projectile_w = val(g.dm_go_prop[?object_get_name(projectile_obj)+STR_Width],  projectile_w);
projectile_h = val(g.dm_go_prop[?object_get_name(projectile_obj)+STR_Height], projectile_h);




/*
switch(projectile_obj)
{
    default:{
    projectile_pi = global.PI_MOB_BLU;
    break;}
    
    case Bullet1:{
    projectile_pi = global.PI_MOB_BLU;
    break;}
    
    case Fireball1:{
    projectile_pi = global.PI_MOB_ORG;
    break;}
}
*/




// Change tiles to solid
for(_i=0; _i<ww>>3; _i++)
{
    for(_j=0; _j<hh>>3; _j++)
    {
        tile_change_1a(0, xl+(_i<<3), yt+(_j<<3), -1,0, TID_SOLID1);
    }
}




