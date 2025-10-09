/// SmasherTrapManager_init2()


var _i,_j,_k, _val1, _data, _str, _pos;
var _delay = 0;
var _xl,_yt, _w,_h, _dir, _speed, _idx;
var _trap_data = undefined;
var _trap_count;


if(!is_undefined(dk_spawn))
{
    //facing_dir = val(g.dm_spawn[?dk_spawn+STR_Direction],facing_dir);
    //facing_dir = sign_(facing_dir);
    
    //attack_speed = val(g.dm_spawn[?dk_spawn+STR_Speed], attack_speed);
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        
        _str = STR_Delay;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _delay = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        
        _str = STR_Trap+STR_Data;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _trap_data = string_copy(_data, _pos, string_length(_data)-(_pos-1));
        }
        
        
        _str = STR_Trigger+STR_Position;
        _pos = string_pos(_str,_data);
        if (_pos)
        {
            _pos += string_length(_str);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            trigger_x = str_hex(string_copy(_val1,1,4));
            trigger_y = str_hex(string_copy(_val1,5,4));
        }
    }
}




if(!is_undefined(_trap_data))
{
    var _x_ax,_x_ay, _x_bx,_x_by, _y_ax,_y_ay, _y_bx,_y_by;
    var _PROP_COUNT = $B;
    var _CHAR_COUNT = $4;
    _trap_count = string_length(_trap_data) div (_PROP_COUNT*_CHAR_COUNT);
    //show_debug_message("_trap_count=$"+hex_str(_trap_count));
    for(_i=0; _i<_trap_count; _i++)
    {
        _data = string_copy(_trap_data, (_i*(_PROP_COUNT*_CHAR_COUNT))+1, _PROP_COUNT*_CHAR_COUNT);
        
        
        _idx = ds_grid_width(Trap_dg);
        ds_grid_resize(Trap_dg, _idx+1,ds_grid_height(Trap_dg));
        
        Trap_dg[#_idx,$1] = sub_state_IDLE; // state
        //Trap_dg[#_idx,$1] = Smasher_SPRITE1; // sprite
        //Trap_dg[#_idx,$8] = Attack_DELAY2;
        
        _j=-1;
        Trap_dg[#_idx,$2] = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        
        _w    = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _h    = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        
        _x_ax = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _x_ay = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _x_bx = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _x_by = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        
        _y_ax = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _y_ay = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _y_bx = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        _y_by = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        
        //_speed = str_hex(string_copy(_data, ((++_j)*_CHAR_COUNT)+1, _CHAR_COUNT));
        
        if (_x_ax!=_x_bx)
        {
            _xl = _x_ax + ((_w>>1)*sign_(_x_ax>_x_bx)) - (_w>>1);
            _yt = _x_ay - (_h>>1);
        }
        else
        {
            _xl = _y_ax - (_w>>1);
            _yt = _y_ay + ((_h>>1)*sign_(_y_ay>_y_by)) - (_h>>1);
        }
        
        
        with(GameObject_create(_xl,_yt, SmasherTrap01,1, -1, palidx))
        {
            other.Trap_dg[#_idx,$0] = id;
            GO_sprite_init(Smasher_SPRITE1);
            SmasherTrap01_init3(attack_speed, _x_ax,_x_ay, _x_bx,_x_by, _y_ax,_y_ay, _y_bx,_y_by);
            //show_debug_message("SmasherTrap01. "+"_xl=$"+hex_str(_xl)+" _yt=$"+hex_str(_yt));
            //if (isVal(_idx,0,1)) show_debug_message(", attack_x_head_start_x=$"+hex_str(attack_x_head_start_x)+", attack_x_head_start_y=$"+hex_str(attack_x_head_start_y)+", attack_x_head_end_x=$"+hex_str(attack_x_head_end_x)+", attack_x_head_end_y=$"+hex_str(attack_x_head_end_y)+", attack_y_head_start_x=$"+hex_str(attack_y_head_start_x)+", attack_y_head_start_y=$"+hex_str(attack_y_head_start_y)+", attack_y_head_end_x=$"+hex_str(attack_y_head_end_x)+", attack_y_head_end_y=$"+hex_str(attack_y_head_end_y));
        }
        
        /*
        // Change tiles to solid
        for(_j=0; _j<_w>>3; _j++)
        {
            for(_k=0; _k<_h>>3; _k++)
            {
                tile_change_1a(0, _xl+(_j<<3), _yt+(_k<<3), -1,0, TID_SOLID1);
            }
        }
        */
    }
}




