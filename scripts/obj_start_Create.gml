/// obj_start_Create()


if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("obj_start_Create() START");
    repeat(1) show_debug_message("");
}




global.DB0 = false; // DB: DeBug. 
//global.Split_00 = false;
//global.Split_01 = false;
//global.save_file_selected = false;
//global.run_complete_lose_control_quest1 = false;
//global.run_complete_lose_control = false;
//global.dark_lonk_defeat_lose_control = false;


// --------------------------------------------------------------------
room_speed = ROOM_SPEED_BASE;




// --------------------------------------------------------------------
var _file, _file_data;
var _val = -1;
var _dk_APP_VERSION = "app_version";
var _FILE_NAME0 = "AppData01.txt"; // use %localappdata% directory so data in the file can be updated during runtime
var _dm = -1;
if (file_exists(_FILE_NAME0))
{
    _file      = file_text_open_read(working_directory+_FILE_NAME0);
    _file_data = file_text_read_string(_file);
                 file_text_close(      _file);
        _dm = json_decode(_file_data);
    if (_dm!=-1)
    {
        _val = _dm[?_dk_APP_VERSION];
    }
}

global.APP_VER_OF_LAST_APP_SESSION = _val;

if (_dm==-1) _dm = ds_map_create();
_dm[?_dk_APP_VERSION] = GM_version;
_file_data = json_encode(_dm);
_file = file_text_open_write(working_directory+_FILE_NAME0);
        file_text_write_string(_file, _file_data);
        file_text_close(       _file);
ds_map_destroy(_dm); _dm=undefined;




// --------------------------------------------------------------------
global.App_frame_count = -1;
global.App_frame_count_can_draw = false;

global.App_frame_count_unpaused = -1;
global.App_frame_count_unpaused_can_draw = false;

global.Room_frame_count = -1;
global.Room_frame_count_can_draw = false;


global.use_pal_swap = true;


    global.randomized = false;
if (global.randomized) randomize(); // Give game seed a random value. Turn off for debugging.
else                   random_set_seed(RUN_RANDOMIZATION_SEED);




// --------------------------------------------------------------------
instance_create(0,0,Input);
instance_create(0,0,g);   // g: Game
instance_create(0,0,p);   // p: Palette/Color
instance_create(0,0,Audio);

instance_create(0,0,PauseMenu);
instance_create(0,0,LevelUpMenu);
instance_create(0,0,DialogueWindow);
instance_create(0,0,OptionsMenu);
instance_create(0,0,QuitAppMenu);

instance_create(0,0,Surface);
instance_create(0,0,f);   // f: File

instance_create(0,0,Overworld);

instance_create(0,0,RoomData);
instance_create(0,0,GameObjectData);
instance_create(0,0,GameObjectMgr);
instance_create(0,0,BurnableMgr);

PC_create(Lonk,0,0);


init_save_files();
load_game_pref();
window_set_scale(g.WindowScale_scale);


instance_create(0,0,Dev_RmWarper);
instance_create(0,0,Dev_StabToCheat);




// --------------------------------------------------------------------
//debug_exit_data_2a();
//dev_pal_data_output_1a();




/*
var _val = undefined;
_val = val(_val); // this results to _val=0
sdm("_val: "+string(_val)+", is_string(_val): "+string(is_string(_val)));
_val = string_replace_all(_val,"<"," "); // result: string_replace_all() converts a number to a string
//_val = string_upper(_val); // result: string_upper() converts a number to a string
sdm("_val: "+string(_val)+", is_string(_val): "+string(is_string(_val)));
*/

/*
sdm("TILE_LAYERS_GROUP_PAD "+string(TILE_LAYERS_GROUP_PAD));
//sdm(" "+string());
//sdm(" "+string());
//sdm(" "+string());
sdm("DEPTH_BG1 "+string_repeat(" ",DEPTH_BG1>=0)+string(DEPTH_BG1)+", "+string_repeat("-",DEPTH_BG1<0)+string_repeat(" ",DEPTH_BG1>=0)+"$"+hex_str(abs(DEPTH_BG1)));
sdm("DEPTH_BG2 "+string_repeat(" ",DEPTH_BG2>=0)+string(DEPTH_BG2)+", "+string_repeat("-",DEPTH_BG2<0)+string_repeat(" ",DEPTH_BG2>=0)+"$"+hex_str(abs(DEPTH_BG2)));
sdm("DEPTH_BG3 "+string_repeat(" ",DEPTH_BG3>=0)+string(DEPTH_BG3)+", "+string_repeat("-",DEPTH_BG3<0)+string_repeat(" ",DEPTH_BG3>=0)+"$"+hex_str(abs(DEPTH_BG3)));
sdm("DEPTH_BG4 "+string_repeat(" ",DEPTH_BG4>=0)+string(DEPTH_BG4)+", "+string_repeat("-",DEPTH_BG4<0)+string_repeat(" ",DEPTH_BG4>=0)+"$"+hex_str(abs(DEPTH_BG4)));
sdm("DEPTH_BG5 "+string_repeat(" ",DEPTH_BG5>=0)+string(DEPTH_BG5)+", "+string_repeat("-",DEPTH_BG5<0)+string_repeat(" ",DEPTH_BG5>=0)+"$"+hex_str(abs(DEPTH_BG5)));
sdm("DEPTH_BG6 "+string_repeat(" ",DEPTH_BG6>=0)+string(DEPTH_BG6)+", "+string_repeat("-",DEPTH_BG6<0)+string_repeat(" ",DEPTH_BG6>=0)+"$"+hex_str(abs(DEPTH_BG6)));
sdm("DEPTH_BG7 "+string_repeat(" ",DEPTH_BG7>=0)+string(DEPTH_BG7)+", "+string_repeat("-",DEPTH_BG7<0)+string_repeat(" ",DEPTH_BG7>=0)+"$"+hex_str(abs(DEPTH_BG7)));
sdm("DEPTH_BG8 "+string_repeat(" ",DEPTH_BG8>=0)+string(DEPTH_BG8)+", "+string_repeat("-",DEPTH_BG8<0)+string_repeat(" ",DEPTH_BG8>=0)+"$"+hex_str(abs(DEPTH_BG8)));

sdm("DEPTH_FG1 "+string_repeat(" ",DEPTH_FG1>=0)+string(DEPTH_FG1)+", "+string_repeat("-",DEPTH_FG1<0)+string_repeat(" ",DEPTH_FG1>=0)+"$"+hex_str(abs(DEPTH_FG1)));
sdm("DEPTH_FG2 "+string_repeat(" ",DEPTH_FG2>=0)+string(DEPTH_FG2)+", "+string_repeat("-",DEPTH_FG2<0)+string_repeat(" ",DEPTH_FG2>=0)+"$"+hex_str(abs(DEPTH_FG2)));
sdm("DEPTH_FG3 "+string_repeat(" ",DEPTH_FG3>=0)+string(DEPTH_FG3)+", "+string_repeat("-",DEPTH_FG3<0)+string_repeat(" ",DEPTH_FG3>=0)+"$"+hex_str(abs(DEPTH_FG3)));
sdm("DEPTH_FG4 "+string_repeat(" ",DEPTH_FG4>=0)+string(DEPTH_FG4)+", "+string_repeat("-",DEPTH_FG4<0)+string_repeat(" ",DEPTH_FG4>=0)+"$"+hex_str(abs(DEPTH_FG4)));
sdm("DEPTH_FG5 "+string_repeat(" ",DEPTH_FG5>=0)+string(DEPTH_FG5)+", "+string_repeat("-",DEPTH_FG5<0)+string_repeat(" ",DEPTH_FG5>=0)+"$"+hex_str(abs(DEPTH_FG5)));
sdm("DEPTH_FG6 "+string_repeat(" ",DEPTH_FG6>=0)+string(DEPTH_FG6)+", "+string_repeat("-",DEPTH_FG6<0)+string_repeat(" ",DEPTH_FG6>=0)+"$"+hex_str(abs(DEPTH_FG6)));
sdm("DEPTH_FG7 "+string_repeat(" ",DEPTH_FG7>=0)+string(DEPTH_FG7)+", "+string_repeat("-",DEPTH_FG7<0)+string_repeat(" ",DEPTH_FG7>=0)+"$"+hex_str(abs(DEPTH_FG7)));
sdm("DEPTH_FG8 "+string_repeat(" ",DEPTH_FG8>=0)+string(DEPTH_FG8)+", "+string_repeat("-",DEPTH_FG8<0)+string_repeat(" ",DEPTH_FG8>=0)+"$"+hex_str(abs(DEPTH_FG8)));

sdm("DEPTH_BG1_P1 "+string_repeat(" ",DEPTH_BG1_P1>=0)+string(DEPTH_BG1_P1)+", "+string_repeat("-",DEPTH_BG1_P1<0)+string_repeat(" ",DEPTH_BG1_P1>=0)+"$"+hex_str(abs(DEPTH_BG1_P1)));
sdm("DEPTH_BG1_P2 "+string_repeat(" ",DEPTH_BG1_P2>=0)+string(DEPTH_BG1_P2)+", "+string_repeat("-",DEPTH_BG1_P2<0)+string_repeat(" ",DEPTH_BG1_P2>=0)+"$"+hex_str(abs(DEPTH_BG1_P2)));
sdm("DEPTH_BG1_P3 "+string_repeat(" ",DEPTH_BG1_P3>=0)+string(DEPTH_BG1_P3)+", "+string_repeat("-",DEPTH_BG1_P3<0)+string_repeat(" ",DEPTH_BG1_P3>=0)+"$"+hex_str(abs(DEPTH_BG1_P3)));
sdm("DEPTH_BG1_P4 "+string_repeat(" ",DEPTH_BG1_P4>=0)+string(DEPTH_BG1_P4)+", "+string_repeat("-",DEPTH_BG1_P4<0)+string_repeat(" ",DEPTH_BG1_P4>=0)+"$"+hex_str(abs(DEPTH_BG1_P4)));
sdm("DEPTH_BG2_P1 "+string_repeat(" ",DEPTH_BG2_P1>=0)+string(DEPTH_BG2_P1)+", "+string_repeat("-",DEPTH_BG2_P1<0)+string_repeat(" ",DEPTH_BG2_P1>=0)+"$"+hex_str(abs(DEPTH_BG2_P1)));
sdm("DEPTH_BG2_P2 "+string_repeat(" ",DEPTH_BG2_P2>=0)+string(DEPTH_BG2_P2)+", "+string_repeat("-",DEPTH_BG2_P2<0)+string_repeat(" ",DEPTH_BG2_P2>=0)+"$"+hex_str(abs(DEPTH_BG2_P2)));
sdm("DEPTH_BG2_P3 "+string_repeat(" ",DEPTH_BG2_P3>=0)+string(DEPTH_BG2_P3)+", "+string_repeat("-",DEPTH_BG2_P3<0)+string_repeat(" ",DEPTH_BG2_P3>=0)+"$"+hex_str(abs(DEPTH_BG2_P3)));
sdm("DEPTH_BG2_P4 "+string_repeat(" ",DEPTH_BG2_P4>=0)+string(DEPTH_BG2_P4)+", "+string_repeat("-",DEPTH_BG2_P4<0)+string_repeat(" ",DEPTH_BG2_P4>=0)+"$"+hex_str(abs(DEPTH_BG2_P4)));

sdm("DEPTH_FG1_P1 "+string_repeat(" ",DEPTH_FG1_P1>=0)+string(DEPTH_FG1_P1)+", "+string_repeat("-",DEPTH_FG1_P1<0)+string_repeat(" ",DEPTH_FG1_P1>=0)+"$"+hex_str(abs(DEPTH_FG1_P1)));
sdm("DEPTH_FG1_P2 "+string_repeat(" ",DEPTH_FG1_P2>=0)+string(DEPTH_FG1_P2)+", "+string_repeat("-",DEPTH_FG1_P2<0)+string_repeat(" ",DEPTH_FG1_P2>=0)+"$"+hex_str(abs(DEPTH_FG1_P2)));
sdm("DEPTH_FG1_P3 "+string_repeat(" ",DEPTH_FG1_P3>=0)+string(DEPTH_FG1_P3)+", "+string_repeat("-",DEPTH_FG1_P3<0)+string_repeat(" ",DEPTH_FG1_P3>=0)+"$"+hex_str(abs(DEPTH_FG1_P3)));
sdm("DEPTH_FG1_P4 "+string_repeat(" ",DEPTH_FG1_P4>=0)+string(DEPTH_FG1_P4)+", "+string_repeat("-",DEPTH_FG1_P4<0)+string_repeat(" ",DEPTH_FG1_P4>=0)+"$"+hex_str(abs(DEPTH_FG1_P4)));
sdm("DEPTH_FG2_P1 "+string_repeat(" ",DEPTH_FG2_P1>=0)+string(DEPTH_FG2_P1)+", "+string_repeat("-",DEPTH_FG2_P1<0)+string_repeat(" ",DEPTH_FG2_P1>=0)+"$"+hex_str(abs(DEPTH_FG2_P1)));
sdm("DEPTH_FG2_P2 "+string_repeat(" ",DEPTH_FG2_P2>=0)+string(DEPTH_FG2_P2)+", "+string_repeat("-",DEPTH_FG2_P2<0)+string_repeat(" ",DEPTH_FG2_P2>=0)+"$"+hex_str(abs(DEPTH_FG2_P2)));
sdm("DEPTH_FG2_P3 "+string_repeat(" ",DEPTH_FG2_P3>=0)+string(DEPTH_FG2_P3)+", "+string_repeat("-",DEPTH_FG2_P3<0)+string_repeat(" ",DEPTH_FG2_P3>=0)+"$"+hex_str(abs(DEPTH_FG2_P3)));
sdm("DEPTH_FG2_P4 "+string_repeat(" ",DEPTH_FG2_P4>=0)+string(DEPTH_FG2_P4)+", "+string_repeat("-",DEPTH_FG2_P4<0)+string_repeat(" ",DEPTH_FG2_P4>=0)+"$"+hex_str(abs(DEPTH_FG2_P4)));

sdm("DEPTH_NPC "+string_repeat(" ",DEPTH_NPC>=0)+string(DEPTH_NPC)+", "+string_repeat("-",DEPTH_NPC<0)+string_repeat(" ",DEPTH_NPC>=0)+"$"+hex_str(abs(DEPTH_NPC)));
sdm("DEPTH_ENEMY "+string_repeat(" ",DEPTH_ENEMY>=0)+string(DEPTH_ENEMY)+", "+string_repeat("-",DEPTH_ENEMY<0)+string_repeat(" ",DEPTH_ENEMY>=0)+"$"+hex_str(abs(DEPTH_ENEMY)));
sdm("DEPTH_PROJECTILE "+string_repeat(" ",DEPTH_PROJECTILE>=0)+string(DEPTH_PROJECTILE)+", "+string_repeat("-",DEPTH_PROJECTILE<0)+string_repeat(" ",DEPTH_PROJECTILE>=0)+"$"+hex_str(abs(DEPTH_PROJECTILE)));
sdm("DEPTH_PC_MAIN "+string_repeat(" ",DEPTH_PC_MAIN>=0)+string(DEPTH_PC_MAIN)+", "+string_repeat("-",DEPTH_PC_MAIN<0)+string_repeat(" ",DEPTH_PC_MAIN>=0)+"$"+hex_str(abs(DEPTH_PC_MAIN)));

sdm("DEPTH_PC_MAIN "+string_repeat(" ",DEPTH_PC_MAIN>=0)+string(DEPTH_PC_MAIN)+", "+string_repeat("-",DEPTH_PC_MAIN<0)+string_repeat(" ",DEPTH_PC_MAIN>=0)+"$"+hex_str(abs(DEPTH_PC_MAIN)));
sdm("DEPTH_MENU_WINDOW "+string_repeat(" ",DEPTH_MENU_WINDOW>=0)+string(DEPTH_MENU_WINDOW)+", "+string_repeat("-",DEPTH_MENU_WINDOW<0)+string_repeat(" ",DEPTH_MENU_WINDOW>=0)+"$"+hex_str(abs(DEPTH_MENU_WINDOW)));
sdm("DEPTH_OW "+string_repeat(" ",DEPTH_OW>=0)+string(DEPTH_OW)+", "+string_repeat("-",DEPTH_OW<0)+string_repeat(" ",DEPTH_OW>=0)+"$"+hex_str(DEPTH_OW));
sdm("DEPTH_OW_ENEMY "+string_repeat(" ",DEPTH_OW_ENEMY>=0)+string(DEPTH_OW_ENEMY)+", "+string_repeat("-",DEPTH_OW_ENEMY<0)+string_repeat(" ",DEPTH_OW_ENEMY>=0)+"$"+hex_str(abs(DEPTH_OW_ENEMY)));
sdm("DEPTH_OW_PC "+string_repeat(" ",DEPTH_OW_PC>=0)+string(DEPTH_OW_PC)+", "+string_repeat("-",DEPTH_OW_PC<0)+string_repeat(" ",DEPTH_OW_PC>=0)+"$"+hex_str(abs(DEPTH_OW_PC)));
sdm("DEPTH_SURFACE "+string_repeat(" ",DEPTH_SURFACE>=0)+string(DEPTH_SURFACE)+", "+string_repeat("-",DEPTH_SURFACE<0)+string_repeat(" ",DEPTH_SURFACE>=0)+"$"+hex_str(abs(DEPTH_SURFACE)));
*/




if (DEV)
{
    var _DURATION = current_time - _START_TIME;
    repeat(1) show_debug_message("");
    show_debug_message("obj_start_Create() END. "+string(_DURATION));
    repeat(1) show_debug_message("");
}




