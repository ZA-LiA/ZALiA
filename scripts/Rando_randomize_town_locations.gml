/// Rando_randomize_town_locations()


var _i,_j;
var _val, _val1, _val2;
var _dir, _dir1, _dir2;
var _datakey, _datakey1, _datakey2;
var _rm_name, _rm_name1, _rm_name2;
var _town_name, _town_name1, _town_name2;
var _exit_name, _exit_name1, _exit_name2;
var _exit_name1a, _exit_name1b, _exit_name1c, _exit_name1d, _exit_name2a, _exit_name2b, _exit_name2c, _exit_name2d;
var _owrc1, _owrc2;
var _map_area_name1,_map_area_name2;
var _file_name, _file_name1, _file_name2;
var _STR1 = "TOWN RANDO ";
var _z1 = false;
var _z2 = false;
var _z3 = false;
var _Z1 = false;
var _Z2 = false;
var _Z3 = false;


if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
if (DEBUG){debug_str="--- TOWN LOCATION RANDO ---"; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}

random_set_seed(Rando_SEED);


ds_list_clear(dl_list1);
ds_list_add(dl_list1,STR_Rauru);
ds_list_add(dl_list1,STR_Ruto);
ds_list_add(dl_list1,STR_Saria);
ds_list_add(dl_list1,STR_Mido);
ds_list_add(dl_list1,STR_Nabooru);
ds_list_add(dl_list1,STR_Darunia);
ds_list_add(dl_list1,STR_New_Kasuto);
ds_list_add(dl_list1,STR_Old_Kasuto);
//ds_list_add(dl_list1,STR_Bulblin);

ds_list_copy(dl_list2,dl_list1);
ds_list_shuffle(dl_list2);

if(_Z3){
sdm("g.OWRC_TOWN_RAUR1 $"+hex_str(g.OWRC_TOWN_RAUR1));
sdm("g.OWRC_TOWN_RUTO1 $"+hex_str(g.OWRC_TOWN_RUTO1));
sdm("g.OWRC_TOWN_SARI1 $"+hex_str(g.OWRC_TOWN_SARI1));
sdm("g.OWRC_TOWN_MIDO1 $"+hex_str(g.OWRC_TOWN_MIDO1));
sdm("g.OWRC_TOWN_NABO1 $"+hex_str(g.OWRC_TOWN_NABO1));
sdm("g.OWRC_TOWN_DARU1 $"+hex_str(g.OWRC_TOWN_DARU1));
sdm("g.OWRC_TOWN_NEWK1 $"+hex_str(g.OWRC_TOWN_NEWK1));
sdm("g.OWRC_TOWN_OLDK1 $"+hex_str(g.OWRC_TOWN_OLDK1));
sdm("g.OWRC_TOWN_BULB1 $"+hex_str(g.OWRC_TOWN_BULB1));
}


var          _dl_list1_COUNT = ds_list_size(dl_list1);
for(_i=0; _i<_dl_list1_COUNT; _i++)
{
    _town_name1 = dl_list1[|_i]; // The overworld location for _town_name2
    _town_name2 = dl_list2[|_i]; // What will inhabit the _town_name1's overworld location
    
    dm_save_data[?STR_Town+STR_Rando+_town_name2+"A"] = _town_name1; // "A": Get what the overworld town is for _town_name2
    dm_save_data[?STR_Town+STR_Rando+_town_name1+"B"] = _town_name2; // "B": Get what town inhabits the overworld town of _town_name1
    
    if (_town_name1!=_town_name2)
    {
        switch(_town_name1){
        default:            {_owrc1=OWRC_DFL;          break;}
        case STR_Rauru:     {_owrc1=g.OWRC_TOWN_RAUR1; break;}
        case STR_Ruto:      {_owrc1=g.OWRC_TOWN_RUTO1; break;}
        case STR_Saria:     {_owrc1=g.OWRC_TOWN_SARI1; break;}
        case STR_Mido:      {_owrc1=g.OWRC_TOWN_MIDO1; break;}
        case STR_Nabooru:   {_owrc1=g.OWRC_TOWN_NABO1; break;}
        case STR_Darunia:   {_owrc1=g.OWRC_TOWN_DARU1; break;}
        case STR_New_Kasuto:{_owrc1=g.OWRC_TOWN_NEWK1; break;}
        case STR_Old_Kasuto:{_owrc1=g.OWRC_TOWN_OLDK1; break;}
        case STR_Bulblin:   {_owrc1=g.OWRC_TOWN_BULB1; break;}
        }
        switch(_town_name2){
        default:            {_owrc2=OWRC_DFL;          break;}
        case STR_Rauru:     {_owrc2=g.OWRC_TOWN_RAUR1; break;}
        case STR_Ruto:      {_owrc2=g.OWRC_TOWN_RUTO1; break;}
        case STR_Saria:     {_owrc2=g.OWRC_TOWN_SARI1; break;}
        case STR_Mido:      {_owrc2=g.OWRC_TOWN_MIDO1; break;}
        case STR_Nabooru:   {_owrc2=g.OWRC_TOWN_NABO1; break;}
        case STR_Darunia:   {_owrc2=g.OWRC_TOWN_DARU1; break;}
        case STR_New_Kasuto:{_owrc2=g.OWRC_TOWN_NEWK1; break;}
        case STR_Old_Kasuto:{_owrc2=g.OWRC_TOWN_OLDK1; break;}
        case STR_Bulblin:   {_owrc2=g.OWRC_TOWN_BULB1; break;}
        }
        if(_Z3)sdm(_town_name1+" _owrc1 $"+hex_str(_owrc1)+",  "+_town_name2+" _owrc2 $"+hex_str(_owrc2));
        
        
        _map_area_name1 = val(g.dm_town[?_town_name1+MapAreaName_DATAKEY], MapAreaName_DEF);
        _map_area_name2 = val(g.dm_town[?_town_name2+MapAreaName_DATAKEY], MapAreaName_DEF);
        
        
        
        
        // ---------------------------------------------------------------------------
        // ---------------------------------------------------------------------------
        _datakey1 = dk_FastTravel+STR_Exit;
        
                                               _datakey = _town_name1+_datakey1+"A";
                         _exit_name = g.dm_rm[?_datakey]; // "A": exit-enter fast-travel-tunnel
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1a =   _exit_name;
        if(_Z2)sdm(_datakey1+" _exit_name1a: "+string(val(_exit_name)));
        
                                               _datakey = _town_name1+_datakey1+"B";
                         _exit_name = g.dm_rm[?_datakey]; // "B": exit-leave fast-travel-tunnel
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1b =   _exit_name;
        if(_Z2)sdm(_datakey1+" _exit_name1b: "+string(val(_exit_name)));
        
        
        
                                               _datakey = _town_name2+_datakey1+"A";
                         _exit_name = g.dm_rm[?_datakey]; // "A": exit-enter fast-travel-tunnel
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2a =   _exit_name;
        if(_Z2)sdm(_datakey1+" _exit_name2a: "+string(val(_exit_name)));
        
                                               _datakey = _town_name2+_datakey1+"B";
                         _exit_name = g.dm_rm[?_datakey]; // "B": exit-leave fast-travel-tunnel
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2b =   _exit_name;
        if(_Z2)sdm(_datakey1+" _exit_name2b: "+string(val(_exit_name)));
        //sdm("");
        
        
        
        
        _exit_name1 = _exit_name1b; // "B": exit-leave fast-travel-tunnel
        _exit_name2 = _exit_name2a; // "A": exit-enter fast-travel-tunnel
        
        if(!is_undefined(_exit_name2a))
        {
            if(!is_undefined(_exit_name1b))
            {
                dm_save_data[?_exit_name2a+STR_goto_reen] = _exit_name1b;
                dm_save_data[?_exit_name1b+STR_goto_reen] = _exit_name2a;
                dm_save_data[?_exit_name2a+STR_Open] = true;
            }
            
            if (is_undefined(_exit_name1b))
            {
                dm_save_data[?_exit_name2a+STR_Open] = false;
            }
        }
        
        
        
        
        // ---------------------------------------------------------------------------
        // ---------------------------------------------------------------------------
        // a-b are linked, c-d are linked
        _z2 = false;
        _datakey1 = "_Backside"+STR_Exit;
        
                                               _datakey = _town_name1+_datakey1+"A";
                         _exit_name = g.dm_rm[?_datakey]; // front door - enter house. linked to ("B")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1a =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name1a: "+string(val(_exit_name)));
        
                                               _datakey = _town_name1+_datakey1+"B";
                         _exit_name = g.dm_rm[?_datakey]; // front door - leave house. linked to ("A")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1b =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name1b: "+string(val(_exit_name)));
        
        
                                               _datakey = _town_name1+_datakey1+"C";
                         _exit_name = g.dm_rm[?_datakey]; //  back door - leave house. linked to ("D")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1c"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1c =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name1c: "+string(val(_exit_name)));
        
                                               _datakey = _town_name1+_datakey1+"D";
                         _exit_name = g.dm_rm[?_datakey]; //  back door - enter house. linked to ("C")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1d"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1d =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name1d: "+string(val(_exit_name)));
        
        
        
                                               _datakey = _town_name2+_datakey1+"A";
                         _exit_name = g.dm_rm[?_datakey]; // front door - enter house. linked to ("B")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2a =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name2a: "+string(val(_exit_name)));
        
                                               _datakey = _town_name2+_datakey1+"B";
                         _exit_name = g.dm_rm[?_datakey]; // front door - leave house. linked to ("A")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2b =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name2b: "+string(val(_exit_name)));
        
        
                                               _datakey = _town_name2+_datakey1+"C";
                         _exit_name = g.dm_rm[?_datakey]; //  back door - leave house. linked to ("D")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2c"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2c =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name2c: "+string(val(_exit_name)));
        
                                               _datakey = _town_name2+_datakey1+"D";
                         _exit_name = g.dm_rm[?_datakey]; //  back door - enter house. linked to ("C")
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2d"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2d =   _exit_name;
        if(_z2)sdm(_datakey1+" _exit_name2d: "+string(val(_exit_name)));
        //sdm("");
        
        
        
        
        if(!is_undefined(_exit_name1a) 
        && !is_undefined(_exit_name1b) 
        && !is_undefined(_exit_name1c) 
        && !is_undefined(_exit_name1d) 
        && !is_undefined(_exit_name2a) 
        && !is_undefined(_exit_name2b) 
        && !is_undefined(_exit_name2c) 
        && !is_undefined(_exit_name2d) )
        {
            _val1 = !isVal(_exit_name1d, _exit_name1b,_exit_name1c); // true: _town_name1 has a backside because exit-d is set to exit-b or exit-c if there's no backside
            _val2 = !isVal(_exit_name2d, _exit_name2b,_exit_name2c); // true: _town_name2 has a backside because exit-d is set to exit-b or exit-c if there's no backside
            
            if (_val1!=_val2) // if only 1 of these 2 towns has a backside
            {
                _rm_name2 = string_copy(_exit_name2b,1,RmName_LEN);
                _datakey2 = _rm_name2+dk_FileName+STR_Quest;
                _datakey3 = _datakey2+hex_str(QUEST_NUM);
                _file_name2 =     g.dm_rm[?_datakey2+"01"];          // _town_name2's inside house
                _file_name2 = val(g.dm_rm[?_datakey3], _file_name2); // _town_name2's inside house
                _file_name  = undefined;           // what _town_name2 will use for rando
                if(!is_undefined(_file_name2))
                {
                    if (_val1) _file_name="TownA_086"; // double
                    else       _file_name="TownA_066"; // single
                    
                    switch(_file_name2){
                    case "TownA_064":{if (_val1){_file_name="TownA_065";} break;} // single to double
                    case "TownA_065":{if(!_val1){_file_name="TownA_064";} break;} // double to single
                    case "TownA_089":{if (_val1){_file_name="TownA_086";} break;} // single to double
                    case "TownA_086":{if(!_val1){_file_name="TownA_069";} break;} // double to single
                    case "TownA_066":{if (_val1){_file_name="TownA_086";} break;} // single to double
                    case "TownA_069":{if (_val1){_file_name="TownA_086";} break;} // single to double
                    }
                    //RAUR - TownA_41 - area_TA+'064' - area_TA+'065'
                    //RUTO - TownA_42 - area_TA+'086' - area_TA+'066'
                    //SARI - TownA_46 - area_TA+'066' - area_TA+'086'
                    //MIDO - TownA_6F - area_TA+'089' - area_TA+'086'
                    //NABO - TownA_49 - area_TA+'086' - area_TA+'066'
                    //DARU - TownA_4A - area_TA+'064' - area_TA+'065'
                    //NEWK - TownA_4C - area_TA+'064' - area_TA+'065'
                    //OLDK - TownA_4F - area_TA+'064' - area_TA+'065'
                    
                    if(!is_undefined(_file_name))
                    {
                        dm_save_data[?_datakey3] = _file_name;
                    }
                    //sdm("_file_name: "+_file_name+", _file_name2: "+_file_name2);
                }
            }
            
            
            if (_val1) // if _town_name1 has a backside
            {
                _dir1 = str_hex(string_char_at(_exit_name1d,string_length(_exit_name1d)-1));
                _dir2 = str_hex(string_char_at(_exit_name2c,string_length(_exit_name2c)-1));
                if (_dir1&$3       // right or left exit
                &&  _dir1==_dir2 ) // linked exit is same dir. This makes it look awkward when you enter a room from the opposite side you exited previous room
                {   // Flipping exit links here so it doesn't look awkward.
                    dm_save_data[?_exit_name2a+STR_goto_reen] = _exit_name2c;
                    dm_save_data[?_exit_name2c+STR_goto_reen] = _exit_name2a;
                    
                    dm_save_data[?_exit_name2b+STR_goto_reen] = _exit_name1d;
                    dm_save_data[?_exit_name1d+STR_goto_reen] = _exit_name2b;
                }
                else
                {
                    dm_save_data[?_exit_name2c+STR_goto_reen] = _exit_name1d;
                    dm_save_data[?_exit_name1d+STR_goto_reen] = _exit_name2c;
                }
                
                dm_save_data[?_exit_name2a+STR_Open] = true;
            }
        }
        
        _z2 = false;
        
        
        
        
        // ---------------------------------------------------------------------------
        // ---------------------------------------------------------------------------
        // a-b are linked, c-d are linked
        _datakey1 = STR_Rando+STR_Town+"_End"+STR_Exit;
        
                                               _datakey = _town_name1+_datakey1+"_Right";
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1a =   _exit_name;
        
                                               _datakey = string(val(_exit_name1a))+STR_goto_reen;
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1b =   _exit_name;
        
        
                                               _datakey = _town_name1+_datakey1+"_Left";
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1c"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1c =   _exit_name;
        
                                               _datakey = string(val(_exit_name1c))+STR_goto_reen;
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name1d"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name1d =   _exit_name;
        
        
        
        
                                               _datakey = _town_name2+_datakey1+"_Right";
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2a"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2a =   _exit_name;
        
                                               _datakey = string(val(_exit_name2a))+STR_goto_reen;
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2b"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2b =   _exit_name;
        
        
                                               _datakey = _town_name2+_datakey1+"_Left";
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2c"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2c =   _exit_name;
        
                                               _datakey = string(val(_exit_name2c))+STR_goto_reen;
                         _exit_name = g.dm_rm[?_datakey];
        if (is_undefined(_exit_name)&&_Z1){sdm("!!! WARNING !!!  "+_STR1+_datakey1+". "+"_exit_name2d"+" - g.dm_rm[?"+_datakey+"] is undefined.");}
        _exit_name2d =   _exit_name;
        //sdm("");
        
        
        _datakey2 = dk_FileName+STR_Quest+hex_str(QUEST_NUM);
        switch(_town_name2){
        //default:            {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Rauru:     {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Ruto:      {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Saria:     {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Mido:      {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Nabooru:   {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Darunia:   {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        case STR_New_Kasuto:{
        if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2] = "TownA_028";
        //_exit_name2b = Area_OvrwA+hex_str(g.OWRC_TOWN_NEWK1);
        break;}
        //case STR_Old_Kasuto:{if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        //case STR_Bulblin:   {if(!is_undefined(_exit_name2a)) dm_save_data[?string_copy(_exit_name2a,1,RmName_LEN)+_datakey2]="TownA_028"; break;}
        }
        
        if(_Z2)sdm(_datakey1+" _exit_name1a: "+string(val(_exit_name1a)));
        if(_Z2)sdm(_datakey1+" _exit_name1b: "+string(val(_exit_name1b)));
        if(_Z2)sdm(_datakey1+" _exit_name1c: "+string(val(_exit_name1c)));
        if(_Z2)sdm(_datakey1+" _exit_name1d: "+string(val(_exit_name1d)));
        if(_Z2)sdm(_datakey1+" _exit_name2a: "+string(val(_exit_name2a)));
        if(_Z2)sdm(_datakey1+" _exit_name2b: "+string(val(_exit_name2b)));
        if(_Z2)sdm(_datakey1+" _exit_name2c: "+string(val(_exit_name2c)));
        if(_Z2)sdm(_datakey1+" _exit_name2d: "+string(val(_exit_name2d)));
        
        
        
        
        for(_j=0; _j<4; _j++) // each pc move dir($1,2,4,8)
        {
            _dir = $1<<_j; // pc movement dir when entering town from overworld. $1,2,4,8
            _datakey1 = hex_str(_owrc1)+hex_str(_dir)+STR_Exit;
            
            if (_dir==$1 
            ||  _dir==$4 )
            {   // _dir=$1: moving right / approaching town from its left
                // _dir=$4: moving down  / approaching town from its top
                if(!is_undefined(_exit_name2c)  // town's "_Left" entrance
                &&  (is_undefined(_exit_name1d) || string_pos(Area_OvrwA,_exit_name1d)) )
                {
                    dm_save_data[?_datakey1] = _exit_name2c;
                    continue;//_j
                }
                
                if(!is_undefined(_exit_name2a)  // town's "_Right" entrance
                &&  (is_undefined(_exit_name1b) || string_pos(Area_OvrwA,_exit_name1b)) )
                {
                    dm_save_data[?_datakey1] = _exit_name2a;
                    continue;//_j
                }
            }
            else
            {   // _dir=$2: moving left / approaching town from its right
                // _dir=$8: moving up   / approaching town from its bottom
                if(!is_undefined(_exit_name2a)  // town's "_Right" entrance
                &&  (is_undefined(_exit_name1b) || string_pos(Area_OvrwA,_exit_name1b)) )
                {
                    dm_save_data[?_datakey1] = _exit_name2a;
                    continue;//_j
                }
                
                if(!is_undefined(_exit_name2c)  // town's "_Left" entrance
                &&  (is_undefined(_exit_name1d) || string_pos(Area_OvrwA,_exit_name1d)) )
                {
                    dm_save_data[?_datakey1] = _exit_name2c;
                    continue;//_j
                }
            }
        }
        
        
        
        ds_grid_resize(dg_1,2,2);
        ds_grid_clear( dg_1,0);
        // "_Right"
        dg_1[#0,0] = _exit_name1b;
        //dg_1[#0,0] = val(_exit_name1b,_exit_name1d);
        dg_1[#0,1] = _exit_name2a;
        //dg_1[#0,1] = val(_exit_name2a,_exit_name2c);
        // "_Left"
        dg_1[#1,0] = _exit_name1d;
        //dg_1[#1,0] = val(_exit_name1d,_exit_name1b);
        dg_1[#1,1] = _exit_name2c;
        //dg_1[#1,1] = val(_exit_name2c,_exit_name2a);
        
        for(_j=ds_grid_width(dg_1)-1; _j>=0; _j--)
        {
            _exit_name1 = dg_1[#_j,0];
            _exit_name2 = dg_1[#_j,1];
            
            if(!is_undefined(_exit_name2))
            {
                if(!is_undefined(_exit_name1))
                {
                    if(!string_pos(Area_OvrwA,_exit_name1))
                    {
                        dm_save_data[?_exit_name1+STR_goto_reen] = _exit_name2;
                    }
                    dm_save_data[?_exit_name2+STR_goto_reen] = _exit_name1;
                }
                
                if (is_undefined(_exit_name1) 
                ||  string_pos(Area_OvrwA,_exit_name1) )
                {
                    dm_save_data[?_exit_name2+STR_OWRC] = _owrc1; // `_exit_name2+STR_OWRC` value for this datakey is the owrc _exit_name2 will take you to.
                    //dm_save_data[?_exit_name2+STR_goto_reen] = Area_OvrwA+hex_str(_owrc1);
                }
            }
        }
        
        
        
        
        
        
        // ---------------------------------------------------------------------------
        // ---------------------------------------------------------------------------
        for(_j=0; _j<$100; _j++) // Each town scene
        {
            _rm_name2 = Area_TownA+hex_str(_j);
            if(!is_undefined(g.dm_rm[?_rm_name2+STR_Rm+STR_Num+STR_Game])) // if _rm_name2 exists
            {
                _town_name = g.dm_rm[?_rm_name2+STR_Town+STR_Name];
                if(!is_undefined(_town_name) 
                &&  _town_name==_town_name2 
                && !val(g.dm_rm[?_rm_name2+STR_Rando+dk_LandLocked]) )
                {
                    dm_save_data[?_rm_name2+STR_OWRC] = _owrc1;
                    dm_save_data[?_rm_name2+STR_Overworld+STR_Town+STR_Name] = _town_name1;
                    //dm_save_data[?_rm_name2+MapAreaName_DATAKEY] = _map_area_name1;
                }
            }
        }
        
        
        
        
        // ---------------------------------------------------------------------------
        // ---------------------------------------------------------------------------
        // Change _town_name2 sign dialogue to _town_name1
        if (0)
        {
            _datakey  = STR_Town+STR_Sign+STR_Dialogue+STR_Datakey;
            _datakey1 = g.DIALOGUE_WINDOW.dm_dialogue[?_datakey+_town_name1];
            if(!is_undefined(_datakey1))
            {
                dm_save_data[?_datakey+_town_name2] = _datakey1;
            }
        }
    }
    
    if (DEBUG){debug_str = _town_name1+string_repeat(" ",string_length(STR_Old_Kasuto)-string_length(_town_name1))+" - "+_town_name2;
    sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    }
}




