/// debug_exit_data_2a()

var i, j, k, m, _idx, _str, _clm, _row, _rc;
var _key, _area, _rm_name, _exit_name, _goto_name, _data;


for (i = 0; i < ds_list_size(g.dl_AREA_NAME); i++) // each area
{
    _area = g.dl_AREA_NAME[| i];
    show_debug_message("");
    show_debug_message("");
    show_debug_message("");
    show_debug_message(_area + " ----------------------------------------------");
    
    for (j = 0; j < $100; j++) // each room
    {
        _rm_name = _area + hex_str(j);
        for (k = 0; k < ds_list_size(g.dl_exit_dirs); k++) // each possible exit dir
        {
            for (m = 0; m < $10; m++) // each possible exit of this exit dir
            {
                _exit_name = hex_str(g.dl_exit_dirs[| k] + m);
                _exit_name = _rm_name + _exit_name;
                
                if (_area == Area_EastA 
                &&  inRange(j, $08, $10) 
                &&  m < 3 )
                {
                    // show_debug_message(_exit_name + " - " + string(isDefined(g.dm_rm[? _exit_name + STR_Open])));
                }
                
                if(!is_undefined(g.dm_rm[? _exit_name + STR_Open]))
                {
                    _goto_name = g.dm_rm[? _exit_name + STR_goto_reen];
                    if(!area_is_ow(string_copy(_goto_name, 1, AreaID_LEN)))
                    {
                        if (is_undefined(g.dm_rm[? _goto_name + STR_Open]))
                        {
                            _str = "";
                            // _str += "" + ", ";
                            _str += _exit_name + ":   " + _goto_name + ", ";
                            show_debug_message(_str);
                            show_debug_message("");
                        }
                    }
                }
            }
        }
    }
}


show_debug_message("");
show_debug_message("");
show_debug_message("");
show_debug_message("");


// Make sure all OW exits connect to existing room exits
var _move_dir, _str_exit_num;
for (i = 0; i < $100; i++)
{
    for (j = 0; j < $100; j++)
    {
        _clm = j;
        _row = i;
        
        _rc = _clm + (_row<<8);
        
        _exit_name = hex_str(_rc);
        _data = global.OVERWORLD.dm[? _exit_name + STR_AccessData];
        if(!is_undefined(_data))
        {
            _rm_name = global.OVERWORLD.dm[? _exit_name + STR_RmName];
            
            for (k = 0; k < 4; k++)
            {
                // _move_dir = 1 << k;
                
                // move_dir:   1      2      4      8
                // exit_num: "FF" + "FF" + "20" + "10"
                _str_exit_num = string_copy(_data, (k<<1)+1, 2);
                
                if (_str_exit_num != 'FF')
                {
                    _goto_name = _rm_name + _str_exit_num;
                    if (is_undefined(g.dm_rm[? _goto_name + STR_Open]))
                    {
                        _str = "";
                        // _str += "" + ", ";
                        _str += _rm_name + ":   ";
                        _str += _exit_name + "  -  " + _goto_name + ", ";
                        show_debug_message(_str);
                        show_debug_message("");
                    }
                }
            }
        }
    }
}

