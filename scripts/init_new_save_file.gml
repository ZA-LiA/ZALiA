/// init_new_save_file(file num, *quest num)


var                                             _arg=0;
var _FILE_NUM                  = clamp(argument[_arg++], 1,SAVE_FILE_MAX);
set_save_props_def();
if (argument_count>_arg) f.quest_num = argument[_arg++];

// Set at 1st rm's g_Room_Start()
f.dm_quests[?STR_Quest+STR_Started] = 0; // 0: New quest initialized but not started.

file_save(_FILE_NUM,false);


set_saved_value(_FILE_NUM, STR_Quest+hex_str(f.quest_num)+STR_Duration, 0);




