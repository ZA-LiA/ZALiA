/// dev_automateRoomData1_3(text file line, rm name)


var _i,_j, _a,_b,_c, _val, _count;
var _len1,_len2;
var _pos,_pos1,_pos2;
var _str,_str1,_str2,_str3, _char,_char1;
var _obj,_obj_name, _ver;
var _double_space_tokens=0;
var _palette_str=undefined;

var                      _arg=0;
var _LINE_OLD = argument[_arg++];
var _RM_NAME  = argument[_arg++];

var _line_new=undefined;

var _LEN=string_length(_LINE_OLD);

var _STR_A1="data_spawn(";
var _STR_A2="data_spawn_1a(";
var _STR_B1=_STR_A1;

//var _DATA_1ST=6;
var _is_last_data=false;
var _is_dlg_data=false;



    _a=string_pos(_STR_A1,_LINE_OLD);
    _b=string_pos(_STR_A2,_LINE_OLD);
if (_a 
||  _b )
{
    _count=0;
    _str="";
    _str1="";
    _str2="";
    _str3=undefined;
    _obj_name="";
    _ver=1;
    _is_last_data=false;
    _is_dlg_data=false;
    
    if (_a) _c=_a;
    else    _c=_b;
    
    if (_a) _len1=string_length(_STR_A1);
    else    _len1=string_length(_STR_A2);
    
    _line_new = "";
    if (_c>1) _line_new += string_copy(_LINE_OLD, 1, _c-1);
    _line_new+=_STR_B1;
    
    
    for(_i=_c+_len1; _i<=_LEN; _i++)
    {
        _char=string_char_at(_LINE_OLD,_i);
        _str1+=_char;
        
        //if (_char==" ") continue;
        _is_last_data = _char==")" && string_char_at(_LINE_OLD,_i+1)==";";
        _is_dlg_data  = _b && _count==6;
        
        if (_is_last_data 
        ||  _char=="," )
        {   // data_spawn(   rm+STR_PRXM,Bagin01,1,  x3,y4,  -1, STR_Qualified+STR_Quest+STR_Nums+"02"); // Bagin
            // data_spawn_1a(rm+STR_PRIO,Bagin01,1,  x3,y3,  -1,-1,  0,1);
            _count++;
            
            
            switch(_count)
            {
                case 1:{ // rm name + spawn type
                _line_new += _str+",";
                break;}
                
                case 2:{ // object
                _obj_name  = _str;
                _line_new += _str+",";
                break;}
                
                case 3:{ // version
                _ver=string_lettersdigits(_str);
                _ver=str_hex(_ver);
                _ver=max(1,_ver);
                _str2=hex_str(_ver);
                if (string_char_at(_str2,1)=="0") _str2=string_char_at(_str2,2)
                _str="$"+_str2;
                _line_new += _str+",";
                    _double_space_tokens++;
                if (_double_space_tokens)
                {
                    _double_space_tokens--;
                    _line_new += "  ";
                }
                break;}
                
                case 4:{ // XL
                _line_new += _str+",";
                break;}
                
                case 5:{ // YT
                _line_new += _str;
                _double_space_tokens++;
                break;}
            }
            
            
            
            _str3=undefined;
            
            if ((string_pos("STR_Qualified",_str) && string_pos("STR_Quest",_str)) 
            ||  (string_pos("STR_Encounter",_str) && string_pos("STR_Strong",_str)) 
            ||  (string_pos("STR_Treasure",_str)  && string_pos("STR_Map",_str)) ) // STR_Treasure+STR_Map+"01"
            {
                _str3 = _str;
            }
            else if (_count==$6)
            {
                if(!string_pos("-1",_str))
                {
                    _str3 = "STR_Palette+hex_str("+_str+")";
                }
            }
            else if (_count>=$7)
            {
                //data_spawn_1a(rm+STR_PRIO,Carock01,2,  x3,y3,  -1,-1,  x4);
                if (isVal(_obj_name,"Horsehead01","Helmethead01","Rebonack01A","Carock01","Gooma01","Barba01","Thunderbird01","ShadowLonk01","Ganon1","Ganon3") 
                &&  _count==$8 )
                {
                    _str3 = "STR_Arena+"+"'_x'+"+"hex_str("+_str+")";
                }
                else if (string_pos("NPC_",_obj_name))
                {
                         if (string_pos("STR_Dialogue",_str))        _str3 = string_delete(_str,string_pos("STR_Datakey",_str),string_length("STR_Datakey+"));
                    else if (string_pos("STR_Sprite",_str))          _str3 = string_delete(_str,string_pos("STR_Datakey",_str),string_length("STR_Datakey+"));
                    else if (string_pos("STR_Spawn+STR_Depth",_str)) _str3 = string_delete(_str,string_pos("STR_Spawn",_str),string_length("STR_Spawn+"));
                    else if (string_pos("STR_Quest+STR_ID",_str))    _str3 = _str;
                }
                else if (string_pos("Kakusu",_obj_name))
                {
                    switch(_obj_name)
                    {
                        case "Kakusu003":{ // data_spawn_1a(rm+STR_PRIO,Kakusu003,5,  x3,y3,  -1,-1,  $30<<3,-1,STR_Treasure+STR_Map+"01");
                        if (_count==$8) _str3 = "STR_Distance+hex_str("+_str+")";
                        break;}
                        case "Kakusu009":{ // data_spawn_1a(rm+STR_PRIO,Kakusu009,4,  x3,y3,  -1,STR_Treasure+STR_Map+"02",  _data);
                        if (_count==$8) _str3 = "STR_Locations"+_str;
                        break;}
                    }
                }
                else if(!_is_dlg_data)
                {
                    switch(_obj_name)
                    {
                        default:{_str3=_str; break;}
                        
                        // --------------------------------------------
                        case "Bagin01":{ // Bagin
                        // data_spawn(   rm+STR_PRXM,Bagin01,1,  x3,y4,  -1,STR_Qualified+STR_Quest+STR_Nums+"02");
                        // data_spawn_1a(rm+STR_PRXM,Bagin01,1,  x3,y3,  -1,-1,  DEPTH_ENEMY);
                        // data_spawn_1a(rm+STR_PRXM,Bagin01,1,  x3,y3,  -1,-1, _val);
                        if (_count==$8) _str3 = "STR_Depth+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "Blaze01":{ // Blaze
                        // data_spawn_1a(rm+STR_PRIO,Blaze01,1,  x4,y5,  -1,-1,  STR_Qualified+STR_Quest+STR_Nums+"02");
                        // data_spawn_1a(rm+STR_PRXM,Blaze01,6,  x3,y3,  -1,-1,  3);
                        if (_ver==6 && _count==$8) _str3 = "STR_Size+hex_str("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        //case "Boggnipp":{_line_new += "STR_Depth+string("+_str+")"; break;}
                        
                        // --------------------------------------------
                        //case "Bot_A":{break;}
                        
                        // --------------------------------------------
                        case "BubbA":{ // Bubble
                        if (_ver&$20) // Cling Bubble
                        {// data_spawn_1a(rm+STR_PRXM,BubbA,$22,  x3,y3,  -1,-1,  $4);
                            if (_count==$8) _str3 = "STR_Direction+hex_str("+_str+")";
                        }
                        else if (_ver&$10) // Dormant Bubble
                        {// data_spawn_1a(rm+STR_PRIO,BubbA,$12,  x3,y3,  -1,-1,  -1,-1,1);
                            if (_count==$A) _str3 = "STR_Qualified+STR_Quest+STR_Nums+hex_str("+_str+")";
                        }
                        else
                        {// data_spawn_1a(rm+STR_PRXM,BubbA,$02,  x3,y3,  -1,-1,  $1|$4);
                            if (_count==$8) _str3 = "STR_Direction+hex_str("+_str+")";
                        }
                        break;}
                        
                        // --------------------------------------------
                        case "DeelA":{ // Deeler
                        // data_spawn(   rm+STR_PRXM,DeelA,1,  x3,y4,  -1, STR_Strong+STR_Encounter);
                        // data_spawn_1a(rm+STR_PRXM,DeelA,1,  x3,y4,  -1,-1, $0D<<3);
                        if (_b && _count==$8)
                        {
                            if (string_pos("STR_",_str)) _str3 = _str;
                            else                         _str3 = "STR_Distance+hex_str("+_str+")";
                        }
                        break;}
                        
                        // --------------------------------------------
                        case "GeruB":{ // RockGeru
                        // data_spawn_1a(rm+STR_PRXM,GeruB,2,  x3,y4,  -1,-1,  $0C);
                        if (_ver==2 
                        &&  _count==$8 )
                        {
                            _str3 = "STR_Clms+hex_str("+_str+")";
                        }
                        break;}
                        
                        // --------------------------------------------
                        case "GiruA":{ // Giruboku
                        // data_spawn_1a(rm+STR_PRXM,GiruA,1,  x3,y6,  -1,-1,  _depth);
                        if (_count==$8) _str3 = "STR_Depth+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "Moa_B":{ // Fiery Moa
                        // data_spawn(rm+STR_PRXM,Moa_B,1,  x3,y4,  -1,  y4);
                        if (_count==$7) _str3 = "STR_Reset+'_y'+hex_str("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "Tyell":{ // Tyell
                        // data_spawn_1a(rm+STR_PRIO,Tyell,1,  x3,y3,  _pi,-1,  _depth);
                        if (_count==$8) _str3 = "STR_Depth+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "Stallakk":{ // 
                        // data_spawn_1a(rm+STR_PRXM,Stallakk,1,  x3,y3,  -1,-1, -1);
                        if (_count==$8) _str3 = "STR_Direction+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "WosuA":{ // 
                        // data_spawn_1a(rm+STR_PRXM,WosuA,1,  x3,y5,  -1,-1,  -1);
                        if (_count==$8) _str3 = "STR_Direction+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        //case "SpBlA":{break;} // Falling Block Spawner
                        
                        // --------------------------------------------
                        case "SpDrA":{ // Drop Spawner
                        // data_spawn(   rm+STR_PRIO,SpDrA,1,  x3,y4,  -1,  2);
                        // data_spawn_1a(rm+STR_PRIO,SpDrA,3,  x3,y4,  _pi,-1,  4);
                        // data_spawn_1a(rm+STR_PRIO,SpDrA,1,  x3,y3,  -1,-1,  -1,1);
                        if (_a && _count==$7) _str3 = "STR_Type+hex_str("+_str+")";
                        else if (_b)
                        {
                            if (_count==$8)
                            {
                                if(!string_pos("-1",_str)) _str3 = "STR_Type+hex_str("+_str+")";
                            }
                            else if (_count==$A)
                            {
                                _str3 = "STR_Luck+hex_str("+_str+")";
                            }
                        }
                        break;}
                        // --------------------------------------------
                        case "SpRoA":{ // Rock Spawner
                        // data_spawn(rm+STR_PRIO,SpRoA,1,  0,0,  -1,STR_Strong+STR_Encounter);
                        //if (string_pos("STR_Encounter",_str)) _str3 = _str;
                        break;}
                        
                        // --------------------------------------------
                        case "LoDoA":{ // Locked Door
                        // data_spawn(   rm+STR_PRIO,LoDoA,2,  x3,y3,  -1,  $1);
                        // data_spawn_1a(rm+STR_PRIO,LoDoA,2,  x4,y5,  -1,-1,  $2);
                             if (_a && _count==$7) _str3 = "STR_Side+hex_str("+_str+")";
                        else if (_b && _count==$8) _str3 = "STR_Side+hex_str("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        case "SpTrA":{ // Spike Trap A
                        // data_spawn_1a(rm+STR_PRIO,SpTrA,2,  x3,y3,  -1,-1,  STR_Duration+_val1, STR_Speed+_val4);
                        if (isVal(_count,$8,$9)) _str3=_str;
                        break;}
                        
                        // --------------------------------------------
                        case "SpTrB":{ // Spike Trap B
                        // data_spawn_1a(rm+STR_PRIO,SpTrB,2,  x3,y4,  PI_MOB_RED,-1,  4,-1);
                             if (_count==$8) _str3 = "STR_Speed+hex_str("+_str+")";
                        else if (_count==$9) _str3 = "STR_Direction+string("+_str+")";
                        break;}
                        
                        // --------------------------------------------
                        //case "PushA":{break;} // Pushable
                        
                        // --------------------------------------------
                        case "TorchA":{ // 
                        // data_spawn(   rm+STR_PRIO,TorchA,1,  x3,y3,  -1,     0,1);
                        // data_spawn(   rm+STR_PRIO,TorchA,1,  x3,y4,  -1,     0,TorchBrightness_Cave_DEF);
                        // data_spawn_1a(rm+STR_PRIO,TorchA,1,  x3,y5,  -1,-1,  0,1);
                        // data_spawn_1a(rm+STR_PRIO,TorchA,1,  x3,y4,  -1,-1,  1,STR_Qualified+STR_Quest+STR_Nums+"01");
                        if(!string_pos("TorchBrightness_Cave",_str))
                        {
                            _char1=string_char_at(_str,string_length(_str));
                            
                            if (_count==$7+(_b!=0))
                            {
                                if (real(_char1)>0) _str3 = "STR_Lit";
                            }
                            else if (_count==$8+(_b!=0))
                            {
                                if (real(_char1)>1) _str3 = "STR_Brightness+'"+_char1+"'";
                            }
                        }
                        break;}
                        
                        // --------------------------------------------
                        case "Blooby":{ // 
                        // data_spawn_1a(rm+STR_PRXM,Blooby,1,  x3,y3,  -1,-1,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,  "_XC_MIN"+hex_str($15<<3),"_XC_MAX"+hex_str($20<<3));
                        if (inRange(_count,$8,$B)) _str3 = _str;
                        break;}
                        
                        // --------------------------------------------
                        case "Ganon3":{ // 
                        // data_spawn_1a(rm+STR_PRIO,Ganon3,1,  x3,y3,  -1,-1,  rm_w>>1,STR_Phase+"02");
                        if (_count==$9) _str3 = _str;
                        break;}
                    }//switch(_obj_name)
                }
            }
            
            
            if(!is_undefined(_str3))
            {
                _line_new += ",";
                if (_double_space_tokens)
                {
                    _double_space_tokens--;
                    _line_new += "  ";
                }
                //if (_count==6) _line_new += "  ";
                _line_new += _str3;
            }
            
            
            
            if (_is_last_data)
            {
                if (_b && strong_encounter_spawns) _line_new += ",STR_Strong+STR_Encounter";
                _line_new += strR(_LINE_OLD,_i);
                break;//_i
            }
            
            
            _str="";
            _str1="";
        }
        else
        {
            if (_char!=" ") _str+=_char;
        }
    }
}




// ---------------------------------------------------------------
if (is_undefined(_line_new)) _line_new =_LINE_OLD;
//else                         _line_new+=");";


if(!is_undefined(_line_new)) sdm(_line_new);



return _line_new;




