/// SpikeTrapD_init2()


var _i, _val1;
var _data, _pos;
var _datakey0;


facing_dir = 1;


if(!is_undefined(dk_spawn))
{
    Spike_depth = val(g.dm_spawn[?dk_spawn+STR_Depth], Spike_depth);
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        
        _datakey0 = "_SubState";
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            sub_state = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = STR_Cooldown+STR_Duration;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            Cooldown_duration = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = STR_Attack+STR_Duration;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            Attack_duration = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = "_Spike"+STR_Count;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            Spike_count = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
        }
        
        _datakey0 = STR_Attack+STR_Direction;
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val1 = str_hex(string_copy(_data, _pos, string_length(_data)-(_pos-1)));
                 if (_val1&$3) Attack_x_direction = sign_(_val1&$1);
            else if (_val1&$C) Attack_y_direction = sign_(_val1&$4);
        }
        
        /*
        _datakey0 = STR_Direction+"_X";
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            switch(_val1){
            default:  {Attack_x_direction=0; break;}
            case  "1":{Attack_x_direction=1; break;}
            case "-1":{Attack_x_direction=-1; break;}
            }
        }
        
        _datakey0 = STR_Direction+"_Y";
        _pos = string_pos(_datakey0,_data);
        if (_pos)
        {
            _pos += string_length(_datakey0);
            _val1 = string_copy(_data, _pos, string_length(_data)-(_pos-1));
            switch(_val1){
            default:  {Attack_y_direction=0; break;}
            case  "1":{Attack_y_direction=1; break;}
            case "-1":{Attack_y_direction=-1; break;}
            }
        }
        */
    }
}




GO_depth_init(Spike_depth+1);


switch(sub_state)
{
    case sub_state_IDLE:{
    
    break;}
    
    case sub_state_COOLDOWN:{
    Cooldown_timer = Cooldown_duration;
    break;}
    
    case sub_state_ATTACKING:{
    Attack_timer = Attack_duration;
    break;}
}




if (Attack_y_direction!=0) ww = Spike_count<<3;
else                       ww = $10;
ww_ = ww>>1;

if (Attack_x_direction!=0) hh = Spike_count<<3;
else                       hh = $10;
hh_ = hh>>1;




if(!ds_grid_width( g.dg_RmTile_Spike))
{
    ds_grid_resize(g.dg_RmTile_Spike,     g.rm_clms,g.rm_rows); // unit8
    ds_grid_clear (g.dg_RmTile_Spike,     0);
    ds_grid_resize(g.dg_RmTile_Spike_def, g.rm_clms,g.rm_rows); // unit8
    ds_grid_clear (g.dg_RmTile_Spike_def, 0);
}

var _DEPTH_IDX = ds_list_find_index(g.dl_TILE_DEPTHS,Spike_depth);
if (_DEPTH_IDX!=-1) SpikeGrid_value = (_DEPTH_IDX<<8) | TID_SPIKE1;




