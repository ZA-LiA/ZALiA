/// dev_rmdata_cleanup_data_check()


var _i,_j,_k,_m,_n, _a,_b,_c, _val, _count;
var _datakey,_datakey1,_datakey2, _spawn_datakey;

var _area, _rm_name, _exit_num,_exit_name;

var _music1, _color1, _show_ow_pos1,_ow_axis1,_owrc1, _dark_idx1, _encounter1, _view_data1, _town_num1,_town_name1, _dungeon_num1;
var _music2, _color2, _show_ow_pos2,_ow_axis2,_owrc2, _dark_idx2, _encounter2, _view_data2, _town_num2,_town_name2, _dungeon_num2;

var _obj_name1,_obj1, _ver1, _objver1, _xl1,_yt1, _pi1;
var _obj_name2,_obj2, _ver2, _objver2, _xl2,_yt2, _pi2;

var _clm1,_row1, _w1,_h1;
var _clm2,_row2, _w2,_h2;

var _page1, _type1, _open1, _reen1;
var _page2, _type2, _open2, _reen2;


var           _dm_rm_data_COPY=ds_map_create();
ds_map_copy(  _dm_rm_data_COPY,g.dm_rm);
ds_map_clear(g.dm_rm);

var           _dm_spawn_COPY=ds_map_create();
ds_map_copy(  _dm_spawn_COPY,g.dm_spawn);
ds_map_clear(g.dm_spawn);

var           _dm_keys_DEFAULT_COPY=ds_map_create();
ds_map_copy(  _dm_keys_DEFAULT_COPY,f.dm_keys_DEFAULT);
ds_map_clear(f.dm_keys_DEFAULT);

var           _dm_1up_doll_DEFAULT_COPY=ds_map_create();
ds_map_copy(  _dm_1up_doll_DEFAULT_COPY,f.dm_1up_doll_DEFAULT);
ds_map_clear(f.dm_1up_doll_DEFAULT);

var           _dm_PBags_DEFAULT_COPY=ds_map_create();
ds_map_copy(  _dm_PBags_DEFAULT_COPY,f.dm_PBags_DEFAULT);
ds_map_clear(f.dm_PBags_DEFAULT);

var           _dm_Jars_DEFAULT_COPY=ds_map_create();
ds_map_copy(  _dm_Jars_DEFAULT_COPY,f.dm_Jars_DEFAULT);
ds_map_clear(f.dm_Jars_DEFAULT);

cont_piece_count_hp = cont_piece_cnt_hp();
cont_piece_count_mp = cont_piece_cnt_mp();

g.LifeDoll_MAX=0;



RoomData_Create_1a(); // reset properties

//rm_data_init_West_A_temp1(); RoomData_Create_1a();
//rm_data_init_East_A_temp1(); RoomData_Create_1a();
//rm_data_init_DthMt_A_temp1(); RoomData_Create_1a();
//rm_data_init_MazIs_A_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_A_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_B_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_C_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_D_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_E_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_F_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_G_temp1(); RoomData_Create_1a();
//rm_data_init_Palc_H_temp1(); RoomData_Create_1a();
//rm_data_init_Town_A_temp1(); RoomData_Create_1a();
//rm_data_init_Town_B_temp1(); RoomData_Create_1a();


var _mismatch=false;

var          _AREA_COUNT=ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_AREA_COUNT; _i++) // each area
{
    _area = g.dl_AREA_NAME[|_i];
    if(!isVal(_area,Area_WestA,Area_EastA)) continue;
    
    for(_j=0; _j<=$FF; _j++) // each rm
    {
        if (_mismatch) sdm("");
        _mismatch=false;
        
        _rm_name=_area+hex_str(_j);
        
        
        // rm data ----------------------------------------------------
        _music1       = val( _dm_rm_data_COPY[?_rm_name+STR_Music]);
        _music2       = val(g.dm_rm[?          _rm_name+STR_Music]);
        if (_music1!=_music2) {_mismatch=true; sdm(_rm_name+": "+STR_Music+" Data Mismatch.  "+"_music1="+string(_music1)+", "+"_music2="+string(_music2));}
        //                                                  //
        _color1   = val( _dm_rm_data_COPY[?_rm_name+dk_BackgroundColor], -1);
        _color2   = val(g.dm_rm[?          _rm_name+dk_BackgroundColor], -1);
        if (_color1+1 && _color1!=_color2) {_mismatch=true; sdm(_rm_name+": "+dk_BackgroundColor+" Data Mismatch.  "+"_color1="+color_str(_color1)+", "+"_color2="+color_str(_color2));}
        //                                                  //
        _dark_idx1    = val( _dm_rm_data_COPY[?_rm_name+dk_DarkRoom], -1);
        _dark_idx2    = val(g.dm_rm[?          _rm_name+dk_DarkRoom], -1);
        if (_dark_idx1+1 && _dark_idx1!=_dark_idx2) {_mismatch=true; sdm(_rm_name+": "+dk_DarkRoom+" Data Mismatch.  "+"_dark_idx1="+string(_dark_idx1)+", "+"_dark_idx2="+string(_dark_idx2));}
        //                                                  //
        //                                                  //
        _show_ow_pos1 = val( _dm_rm_data_COPY[?_rm_name+STR_show_ow_pos], -1);
        _show_ow_pos2 = val(g.dm_rm[?          _rm_name+STR_show_ow_pos], -1);
        if (_show_ow_pos1!=_show_ow_pos2) {_mismatch=true; sdm(_rm_name+": "+STR_show_ow_pos+" Data Mismatch.  "+"_show_ow_pos1="+string(_show_ow_pos1)+", "+"_show_ow_pos2="+string(_show_ow_pos2));}
        //                                                  //
        _ow_axis1     = val( _dm_rm_data_COPY[?_rm_name+STR_ow_axis], -1);
        _ow_axis2     = val(g.dm_rm[?          _rm_name+STR_ow_axis], -1);
        if (_ow_axis1!=_ow_axis2) {_mismatch=true; sdm(_rm_name+": "+STR_ow_axis+" Data Mismatch.  "+"_ow_axis1="+string(_ow_axis1)+", "+"_ow_axis2="+string(_ow_axis2));}
        //                                                  //
        _owrc1        = val(        _dm_rm_data_COPY[?_rm_name+STR_OWRC], -1);
        //_owrc2        = val(global.OVERWORLD.dm[?_rm_name+STR_OWRC], -1);
        _owrc2        = val(g.dm_rm[?                 _rm_name+STR_OWRC], -1);
        //if (_owrc1!=_owrc2) {_mismatch=true; sdm(_rm_name+": "+STR_OWRC+" Data Mismatch.  "+"_owrc1="+string(_owrc1)+", "+"_owrc2="+string(_owrc2));}
        //                                                  //
        //                                                  //
        _encounter1   = val( _dm_rm_data_COPY[?_rm_name+STR_Enc_Type]);
        _encounter2   = val(g.dm_rm[?     _rm_name+STR_Enc_Type]);
        if (_encounter1 && _encounter1!=_encounter2) {_mismatch=true; sdm(_rm_name+": "+STR_Enc_Type+" Data Mismatch.  "+"_encounter1="+string(_encounter1)+", "+"_encounter2="+string(_encounter2));}
        //                                                  //
        _view_data1   = val( _dm_rm_data_COPY[?_rm_name+STR_View+STR_Data]);
        _view_data2   = val(g.dm_rm[?     _rm_name+STR_View+STR_Data]);
        if (_view_data1 && _view_data1!=_view_data2) {_mismatch=true; sdm(_rm_name+": "+STR_View+STR_Data+" Data Mismatch.  "+"_view_data1="+string(_view_data1)+", "+"_view_data2="+string(_view_data2));}
        //                                                  //
        //                                                  //
        _town_num1    = val( _dm_rm_data_COPY[?_rm_name+STR_Town+STR_Num]);
        _town_num2    = val(g.dm_rm[?     _rm_name+STR_Town+STR_Num]);
        if (_town_num1 && _town_num1!=_town_num2) {_mismatch=true; sdm(_rm_name+": "+STR_Town+STR_Num+" Data Mismatch.  "+"_town_num1="+string(_town_num1)+", "+"_town_num2="+string(_town_num2));}
        //                                                  //
        _town_name1   = val( _dm_rm_data_COPY[?_rm_name+STR_Town+STR_Name], "undefined");
        _town_name2   = val(g.dm_rm[?     _rm_name+STR_Town+STR_Name], "undefined");
        if (_town_name1!=_town_name2) {_mismatch=true; sdm(_rm_name+": "+STR_Town+STR_Name+" Data Mismatch.  "+"_town_name1="+string(_town_name1)+", "+"_town_name2="+string(_town_name2));}
        //                                                  //
        _dungeon_num1 = val( _dm_rm_data_COPY[?_rm_name+STR_Dungeon+STR_Num]);
        _dungeon_num2 = val(g.dm_rm[?     _rm_name+STR_Dungeon+STR_Num]);
        if (_dungeon_num1 && _dungeon_num1!=_dungeon_num2) {_mismatch=true; sdm(_rm_name+": "+STR_Dungeon+STR_Num+" Data Mismatch.  "+"_dungeon_num1="+string(_dungeon_num1)+", "+"_dungeon_num2="+string(_dungeon_num2));}
        //                                                  //
        
        
        
        
        // spawns ------------------------------------------------------
        for(_k=0; _k<2; _k++) // STR_PRXM spawns, STR_PRIO spawns
        {
            if(!_k) _datakey=STR_PRXM;
            else    _datakey=STR_PRIO;
            
                         _count=val(g.dm_spawn[?_rm_name+_datakey+STR_Count])
            for(_m=0; _m<_count; _m++) // each spawn
            {
                _spawn_datakey=_rm_name+_datakey+hex_str(_m);
                
                //var _obj_name,_obj, _ver, _objver, _xl,_yt, _pi;
                _obj_name1 = val(g.dm_spawn[?_spawn_datakey+STR_Obj_Name], "undefined");
                _obj_name2 = val(g.dm_spawn[?_spawn_datakey+STR_Obj_Name], "undefined");
                if (_obj_name1!=_obj_name2) {_mismatch=true; sdm(_spawn_datakey+": "+STR_Obj_Name+" Data Mismatch.  "+"_obj_name1="+string(_obj_name1)+", "+"_obj_name2="+string(_obj_name2));}
                //                                                  //
                _obj1 = val(g.dm_spawn[?_spawn_datakey+STR_obj_idx], "undefined");
                _obj2 = val(g.dm_spawn[?_spawn_datakey+STR_obj_idx], "undefined");
                if (_obj1!=_obj2) {_mismatch=true; sdm(_spawn_datakey+": "+STR_obj_idx+" Data Mismatch.  "+"_obj1="+string(_obj1)+", "+"_obj2="+string(_obj2));}
                //                                                  //
                _ver1 = val(g.dm_spawn[?_spawn_datakey+STR_Version], "undefined");
                _ver2 = val(g.dm_spawn[?_spawn_datakey+STR_Version], "undefined");
                if (_ver1!=_ver2) {_mismatch=true; sdm(_spawn_datakey+": "+STR_Version+" Data Mismatch.  "+"_ver1="+string(_ver1)+", "+"_ver2="+string(_ver2));}
                //                                                  //
                _objver1 = val(g.dm_spawn[?_spawn_datakey+STR_OBJVER], "undefined");
                _objver2 = val(g.dm_spawn[?_spawn_datakey+STR_OBJVER], "undefined");
                if (_objver1!=_objver2) {_mismatch=true; sdm(_spawn_datakey+": "+STR_OBJVER+" Data Mismatch.  "+"_objver1="+string(_objver1)+", "+"_objver2="+string(_objver2));}
                //                                                  //
                _xl1 = val(g.dm_spawn[?_spawn_datakey+"_x"], "undefined");
                _xl2 = val(g.dm_spawn[?_spawn_datakey+"_x"], "undefined");
                if (_xl1!=_xl2) {_mismatch=true; sdm(_spawn_datakey+": "+"_x"+" Data Mismatch.  "+"_xl1="+string(_xl1)+", "+"_xl2="+string(_xl2));}
                //                                                  //
                _yt1 = val(g.dm_spawn[?_spawn_datakey+"_y"], "undefined");
                _yt2 = val(g.dm_spawn[?_spawn_datakey+"_y"], "undefined");
                if (_yt1!=_yt2) {_mismatch=true; sdm(_spawn_datakey+": "+"_y"+" Data Mismatch.  "+"_yt1="+string(_yt1)+", "+"_yt2="+string(_yt2));}
                //                                                  //
                _pi1 = val(g.dm_spawn[?_spawn_datakey+STR_pal_idx], "undefined");
                _pi2 = val(g.dm_spawn[?_spawn_datakey+STR_pal_idx], "undefined");
                if (_pi1!=_pi2) {_mismatch=true; sdm(_spawn_datakey+": "+STR_pal_idx+" Data Mismatch.  "+"_pi1="+string(_pi1)+", "+"_pi2="+string(_pi2));}
                //                                                  //
            }
        }
        
        
        
        
        // exits ------------------------------------------------------
        for(_k=0; _k<5; _k++) // each exit dir
        {
            for(_m=0; _m<$10; _m++) // each exit of its exit dir
            {
                _exit_num=0;
                if (_k) _exit_num=$1<<(_k-1);
                _exit_num  = _exit_num<<4;
                _exit_num |= _m;
                _exit_name = _rm_name+hex_str(_exit_num);
                
                _reen1 = val(g.dm_rm[?_exit_name+STR_goto_reen], "undefined");
                _reen2 = val(g.dm_rm[?_exit_name+STR_goto_reen], "undefined");
                if (_reen1!=_reen2) {_mismatch=true; sdm(_exit_name+": "+STR_goto_reen+" Data Mismatch.  "+"_reen1="+string(_reen1)+", "+"_reen2="+string(_reen2));}
                //                                                  //
                _page1 = val(g.dm_rm[?_exit_name+STR_Page], "undefined");
                _page2 = val(g.dm_rm[?_exit_name+STR_Page], "undefined");
                if (_page1!=_page2) {_mismatch=true; sdm(_exit_name+": "+STR_Page+" Data Mismatch.  "+"_page1="+string(_page1)+", "+"_page2="+string(_page2));}
                //                                                  //
                _page1 = val(g.dm_rm[?_exit_name+STR_Page+"_x"], "undefined");
                _page2 = val(g.dm_rm[?_exit_name+STR_Page+"_x"], "undefined");
                if (_page1!=_page2) {_mismatch=true; sdm(_exit_name+": "+STR_Page+"_x"+" Data Mismatch.  "+"_page1="+string(_page1)+", "+"_page2="+string(_page2));}
                //                                                  //
                _page1 = val(g.dm_rm[?_exit_name+STR_Page+"_y"], "undefined");
                _page2 = val(g.dm_rm[?_exit_name+STR_Page+"_y"], "undefined");
                if (_page1!=_page2) {_mismatch=true; sdm(_exit_name+": "+STR_Page+"_y"+" Data Mismatch.  "+"_page1="+string(_page1)+", "+"_page2="+string(_page2));}
                //                                                  //
                _type1 = val(g.dm_rm[?_exit_name+STR_Type], "undefined");
                _type2 = val(g.dm_rm[?_exit_name+STR_Type], "undefined");
                if (_type1!=_type2) {_mismatch=true; sdm(_exit_name+": "+STR_Type+" Data Mismatch.  "+"_type1="+string(_type1)+", "+"_type2="+string(_type2));}
                //                                                  //
                _open1 = val(g.dm_rm[?_exit_name+STR_Open], "undefined");
                _open2 = val(g.dm_rm[?_exit_name+STR_Open], "undefined");
                if (_open1!=_open2) {_mismatch=true; sdm(_exit_name+": "+STR_Open+" Data Mismatch.  "+"_open1="+string(_open1)+", "+"_open2="+string(_open2));}
                //                                                  //
                _clm1 = val(g.dm_rm[?_exit_name+STR_Exit_x], "undefined");
                _clm2 = val(g.dm_rm[?_exit_name+STR_Exit_x], "undefined");
                if (_clm1!=_clm2) {_mismatch=true; sdm(_exit_name+": "+STR_Exit_x+" Data Mismatch.  "+"_clm1="+string(_clm1)+", "+"_clm2="+string(_clm2));}
                //                                                  //
                _row1 = val(g.dm_rm[?_exit_name+STR_Exit_y], "undefined");
                _row2 = val(g.dm_rm[?_exit_name+STR_Exit_y], "undefined");
                if (_row1!=_row2) {_mismatch=true; sdm(_exit_name+": "+STR_Exit_y+" Data Mismatch.  "+"_row1="+string(_row1)+", "+"_row2="+string(_row2));}
                //                                                  //
                _w1 = val(g.dm_rm[?_exit_name+STR_Width], "undefined");
                _w2 = val(g.dm_rm[?_exit_name+STR_Width], "undefined");
                if (_w1!=_w2) {_mismatch=true; sdm(_exit_name+": "+STR_Width+" Data Mismatch.  "+"_w1="+string(_w1)+", "+"_w2="+string(_w2));}
                //                                                  //
                _h1 = val(g.dm_rm[?_exit_name+STR_Height], "undefined");
                _h2 = val(g.dm_rm[?_exit_name+STR_Height], "undefined");
                if (_h1!=_h2) {_mismatch=true; sdm(_exit_name+": "+STR_Height+" Data Mismatch.  "+"_h1="+string(_h1)+", "+"_h2="+string(_h2));}
                //                                                  //
                _clm1 = val(g.dm_rm[?_exit_name+STR_Spawn_x], "undefined");
                _clm2 = val(g.dm_rm[?_exit_name+STR_Spawn_x], "undefined");
                if (_clm1!=_clm2) {_mismatch=true; sdm(_exit_name+": "+STR_Spawn_x+" Data Mismatch.  "+"_clm1="+string(_clm1)+", "+"_clm2="+string(_clm2));}
                //                                                  //
                _row1 = val(g.dm_rm[?_exit_name+STR_Spawn_y], "undefined");
                _row2 = val(g.dm_rm[?_exit_name+STR_Spawn_y], "undefined");
                if (_row1!=_row2) {_mismatch=true; sdm(_exit_name+": "+STR_Spawn_y+" Data Mismatch.  "+"_row1="+string(_row1)+", "+"_row2="+string(_row2));}
                //                                                  //
            }
        }
    }
    
    sdm(""); sdm(""); sdm(""); sdm(""); // area
}






ds_map_copy(g.dm_rm,_dm_rm_data_COPY);
ds_map_copy(g.dm_spawn,_dm_spawn_COPY);
ds_map_copy(f.dm_keys_DEFAULT,_dm_keys_DEFAULT_COPY);
ds_map_copy(f.dm_1up_doll_DEFAULT,_dm_1up_doll_DEFAULT_COPY);
ds_map_copy(f.dm_PBags_DEFAULT,_dm_PBags_DEFAULT_COPY);
ds_map_copy(f.dm_Jars_DEFAULT,_dm_Jars_DEFAULT_COPY);



ds_map_destroy(_dm_rm_data_COPY); _dm_rm_data_COPY=undefined;
ds_map_destroy(_dm_spawn_COPY); _dm_spawn_COPY=undefined;
ds_map_destroy(_dm_keys_DEFAULT_COPY); _dm_keys_DEFAULT_COPY=undefined;




