/// db_rm_data_Room_Start(file name, scene of file name)


//if(!g.can_use_dev_tools1) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//         exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if(!DEV) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var                        _arg=0;
var _FILE_NAME  = argument[_arg++];
var _SCENE_NAME = argument[_arg++];

//sdm("---------------------------------------");
var  _str  = " ";
     _str += "f.quest_num "+string(f.quest_num)+", ";
     _str += "rm_name: " + g.rm_name + ", ";
     _str += "f.reen:  " + f.reen + ", ";
     _str += "file_name: "
if (is_string(_FILE_NAME))
{    _str +=  _FILE_NAME+"("+_SCENE_NAME+")";  }
else _str  = "WARNING!!!!!  "+_str+" No file name for '"+g.rm_name+dk_FileName+"'";

     _str += ", room_width $"  + hex_str(room_width);
     _str += ", room_height $" + hex_str(room_height);
//
     _str += ", g.town_num "   +string(g.town_num);
     _str += ", g.dungeon_num "+string(g.dungeon_num);
//
show_debug_message(_str); show_debug_message("");




