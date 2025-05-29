/// db_spawnData_Automate_code_1b(condition 1)

var _c1 = argument0;

var i, j;
var _str, _key;
var _oi_name, _ver, _spawn_x, _spawn_y;
var _go_id, _go_full_name;
var _key, _go_count;



_go_count = val(g.dm_spawn[? get_spawn_datakey(g.rm_name,STR_PRXM, -1)]);


if (_c1 && !g.encounter_type)
{
    _str  = "// ------------ Room ID   $_";
    _str += hex_str(g.rm_num);
    show_debug_message(_str);
}

_str  = "_rm ";
if (g.encounter_type == g.ENC_STRG) 
{
    _str += "+= STR_Enc_Strong";
}
else if (_c1)
{
    _str += " = _area + ";
    _str += "'"+hex_str(g.rm_num)+"'";
}
else
{
    _str += " = rm_name";
}

_str += ";";
if (_go_count || _c1) show_debug_message(_str);





// show_debug_message("// g.area_name "+g.area_name+", g.rm_num "+hex_str(g.rm_num)+", rmName() "+rmName());

// _go_count = mv(g.dm_spawn[? get_spawn_data_key(-1)])
// _go_count = get_spawn_data_key(-1);
if (!_go_count && _c1) show_debug_message("");

for (j = 0; j < _go_count; j++) // Each GO of the rm
{
    _key  = get_spawn_datakey(g.rm_name,STR_PRXM, j);
    
    // _spawn_idx  = hex_str(j);
    _oi_name    = object_get_name(g.dm_spawn[? _key + STR_obj_idx]);
    _ver        = g.dm_spawn[? _key + STR_Version];
    //_ver        = g.dm_spawn[? _key + "_ver"];
    _spawn_x    = g.dm_spawn[? _key + "_x" + STR_Default];
    _spawn_y    = g.dm_spawn[? _key + "_y" + STR_Default];
    
    _go_id        = g.dm_go_prop[? _oi_name + STR_gob_id];
    _go_full_name = g.dm_go_prop[? _oi_name + dk_FullName];
    
    
    _str  = "data_spawn_PRXM(_rm";
    _str += ", ";
    
    // _str += "'"+_spawn_idx+"'";
    // _str += ", ";
    
    _str += _oi_name;
    _str += ", ";
    
    if (_ver < 10) _str += " ";
    _str += string(_ver);
    _str += ", ";
    
    if (_spawn_x < $1000) _str += " ";
    if (_spawn_x < $100)  _str += " ";
    if (_spawn_x < $10)   _str += " ";
    _str += "$";
    _str1 = hex_str(_spawn_x);
    if (string_char_at(_str1,1)=="0") _str1 = string_copy(_str1,2,string_length(_str1)-1);
    _str += _str1;
    _str += ", ";
    
    if (_spawn_y < $1000) _str += " ";
    if (_spawn_y < $100)  _str += " ";
    if (_spawn_y < $10)   _str += " ";
    _str += "$";
    _str1 = hex_str(_spawn_y);
    if (string_char_at(_str1,1)=="0") _str1 = string_copy(_str1,2,string_length(_str1)-1);
    _str += _str1;
    // _str += ", ";
    
    _str += ");";
    
    
    
    _str += " // $";
    _str += hex_str(_go_id);
    _str += ": ";
    _str += _go_full_name;
    _str += " ";
    if (_ver < 10) _str += " ";
    _str += string(_ver);
    
    show_debug_message(_str);
}




if (!g.encounter_type 
&& !is_undefined(g.dm_spawn[?g.rm_name+STR_eCount+STR_Enc_Strong]) )
{
    // i--;
    g.encounter_type = g.ENC_STRG;
    db_spawnData_Automate_code_1b(_c1);
    if (_c1) show_debug_message("");
    
    exit;
}
else
{
    g.encounter_type = 0;
}



// if (_c1) show_debug_message("");
// if (_go_count || _c1) show_debug_message("");
if ((_go_count && g.encounter_type != g.ENC_STRG) || _c1) show_debug_message("");

