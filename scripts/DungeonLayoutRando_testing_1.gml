/// DungeonLayoutRando_testing_1()


var _dm = ds_map_create();
var _i,_j,_k,_m,_p,_q, _dir, _count0,_count1;
var _val1,_val2;
var _dk0,_dk1,_dk2,_dk3;
var _clm0,_row0, _clm1,_row1, _clms1,_rows1, _clms2,_rows2, _clm_offset0,_row_offset0;
//var _qualifies;
var _section_count, _section_count_x0,_section_count_y0, _section_count_x1,_section_count_y1, _section_count_x_next_scene,_section_count_y_next_scene;
var _map_clm0,_map_row0, _map_clm1,_map_row1, _map_clm2,_map_row2;
var _section_count_x_MAX = 4;
var _section_count_x_MIN = 1;
var _section_count_y_MAX = 4;
var _section_count_y_MIN = 1;
//var _clear_count;
var _SCENE_COUNT = val(g.dm_rm[?Area_PalcA+STR_Rm+STR_Count]);
_dm[?STR_Scene+STR_Count] = _SCENE_COUNT;
var _scenes_placed_count = 0;
//var _scenes_remaining_count = _SCENE_COUNT;
var _scene_num0,_scene_num1;
var _exit_dir;
//var _origin_exit_dir = choose($1,$2);
//var _ENTRANCE_ENTER_DIR = _origin_exit_dir;
//var _dl_1 = ds_list_create();
var _dl_scenes_placed = ds_list_create();
var _dl_scene_rc = ds_list_create();
//var _dl_offset_options = ds_list_create();
var _dl_branch_dirs = ds_list_create();
//var _dl_branches_remaining = ds_list_create();
//ds_list_add(_dl_branch_dirs,$4,$8,_ENTRANCE_ENTER_DIR^$3);
//ds_list_shuffle(_dl_branch_dirs);
//var _branch_dir_count = irandom(2) + 1;
//repeat(ds_list_size(_dl_branch_dirs)-_branch_dir_count) ds_list_delete(_dl_branch_dirs,0);
//var _ENTRANCE_EXIT_ID = (_scene_num0<<8) | _ENTRANCE_ENTER_DIR;
//_dm[?STR_Scene+hex_str(_scene_num0)+"_Branch"+STR_Direction+STR_Count] = _branch_dir_count;
_scene_num0 = $00;
_scene_num1 = $00;
_map_clm0 = 0;
_map_row0 = 0;
_map_clm1 = 0;
_map_row1 = 0;

while (_scenes_placed_count<_SCENE_COUNT)
//while (_scene_num0<_SCENE_COUNT)
//while (_scenes_remaining_count)
//for(_i=0; _i<_SCENE_COUNT; _i++)
{
    _section_count_x1  = 1;
    _section_count_x1 += irandom($FF)!=0;
    _section_count_x1 += irandom($7)<$7;
    _section_count_x1 += irandom($7)<$7;
    _section_count_x1  = clamp(_section_count_x1, _section_count_x_MIN,_section_count_x_MAX);
    
    _section_count_y1  = 1;
    _section_count_y1 +=!irandom($3F-($20*(_section_count_x1<3)));
    _section_count_y1 +=!irandom($5F-($20*(_section_count_x1<3)));
    _section_count_y1 +=!irandom($7F-($20*(_section_count_x1<3)));
    _section_count_y1  = clamp(_section_count_y1, _section_count_y_MIN,_section_count_y_MAX);
    
    _section_count_x1=4; _section_count_y1=1; // testing
    
    ds_list_clear(_dl_scenes_placed);
    for(_i=0; _i<_scenes_placed_count+1; _i++) ds_list_add(_dl_scenes_placed,_i);
    ds_list_shuffle(_dl_scenes_placed);
    
    _exit_dir = -1;
    if(!_scenes_placed_count)
    {
        _exit_dir = choose($1,$2);
    }
    
    
    for(_i=ds_list_size(_dl_scenes_placed)-1; _i>=0; _i--)
    {
        ds_list_clear(_dl_branch_dirs);
        _scene_num0 = _dl_scenes_placed[|_i];
        _dk0 = STR_Scene+hex_str(_scene_num0)+STR_Exit;
        for(_j=0; _j<4; _j++)
        {
            _dir = $1<<_j;
            if (is_undefined(_dm[?_dk0+hex_str(_dir)]))
            {
                ds_list_add(_dl_branch_dirs,_dir);
            }
        }
        
        if (ds_list_size(_dl_branch_dirs))
        {
            ds_list_clear(_dl_scene_rc);
            _section_count_x0 = val(_dm[?STR_Scene+hex_str(_scene_num0)+STR_Section+STR_Count+"_X"]);
            _section_count_y0 = val(_dm[?STR_Scene+hex_str(_scene_num0)+STR_Section+STR_Count+"_Y"]);
            for(_j=0; _j<_section_count_x0; _j++)
            {
                for(_k=0; _k<_section_count_y0; _k++)
                {
                    _clm0 = val(_dm[?STR_Scene+hex_str(_scene_num0)+STR_Section+hex_str(_j)+hex_str(_k)+STR_Map+STR_Clm]);
                    _row0 = val(_dm[?STR_Scene+hex_str(_scene_num0)+STR_Section+hex_str(_j)+hex_str(_k)+STR_Map+STR_Row]);
                    ds_list_add(_dl_scene_rc, _clm0*_row0);
                }
            }
            
            
            ds_list_shuffle(_dl_branch_dirs);
            for(_j=ds_list_size(_dl_branch_dirs)-1; _j>=0; _j--)
            {
                //ds_list_clear(_dl_offset_options);
                _dir = _dl_branch_dirs[|_j];
                switch(_dir)
                {
                    case $1:{
                    // To make this less complicated, randomly pick _scene_num1's row offset from _scene_num0 (assuming _section_count_y1>1)
                    _row_offset0  = -(_section_count_y1-1);
                    _row_offset0 += irandom((_section_count_y0-1)+(_section_count_y1-1));
                    
                    //_dl_offset_options
                    _clms1 = _section_count_x1 + 2; // +2: check the outside rc, they must be clear
                    _rows1 = _section_count_y1 + 2; // +2: check the outside rc, they must be clear
                    
                    _map_clm1 =  _map_clm0 + (_section_count_x0-1);
                    _map_row1 = (_map_row0 + _row_offset0) - 1;
                    for(_k=0; _k<_clms1; _k++)
                    {
                        for(_m=0; _m<_rows1; _m++)
                        {
                            if (inRange(_k,1,_clms1-2)   // dont check outer corners
                            &&  inRange(_m,1,_rows1-2) ) // dont check outer corners
                            {
                                _map_clm2 = _map_clm1 + _k;
                                _map_row2 = _map_row1 + _m;
                                if (ds_list_find_index(_dl_scene_rc, _map_clm2*_map_row2)==-1) // dont check _scene_num0 sections
                                {
                                    if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene]))
                                    {   // A different scene is in the way. This exit dir fails.
                                        _k = _clms1;
                                        break;//_m
                                    }
                                }
                            }
                        }
                    }
                    
                    if (_k==_clms1 
                    &&  _m==_rows1 )
                    {
                        _exit_dir = _dir;
                        _map_clm1 = _map_clm0 + _section_count_x0;
                        _map_row1 = _map_row0 + _row_offset0;
                    }
                    break;}//case $1
                    
                    
                    
                    
                    case $2:{
                    // To make this less complicated, randomly pick _scene_num1's row offset from _scene_num0 (assuming _section_count_y1>1)
                    _row_offset0  = -(_section_count_y1-1);
                    _row_offset0 += irandom((_section_count_y0-1)+(_section_count_y1-1));
                    
                    _clms1 = _section_count_x1 + 2; // +2: check the outside rc, they must be clear
                    _rows1 = _section_count_y1 + 2; // +2: check the outside rc, they must be clear
                    
                    _map_clm1 =  _map_clm0 - (_section_count_x1+1);
                    _map_row1 = (_map_row0 + _row_offset0) - 1;
                    for(_k=0; _k<_clms1; _k++)
                    {
                        for(_m=0; _m<_rows1; _m++)
                        {
                            if (inRange(_k,1,_clms1-2)   // dont check outer corners
                            &&  inRange(_m,1,_rows1-2) ) // dont check outer corners
                            {
                                _map_clm2 = _map_clm1 + _k;
                                _map_row2 = _map_row1 + _m;
                                if (ds_list_find_index(_dl_scene_rc, _map_clm2*_map_row2)==-1) // dont check _scene_num0 sections
                                {
                                    if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene]))
                                    {   // A different scene is in the way. This exit dir fails.
                                        _k = _clms1;
                                        break;//_m
                                    }
                                }
                            }
                        }
                    }
                    
                    if (_k==_clms1 
                    &&  _m==_rows1 )
                    {
                        _exit_dir = _dir;
                        _map_clm1 = _map_clm0 - _section_count_x1;
                        _map_row1 = _map_row0 + _row_offset0;
                    }
                    break;}//case $2
                    
                    
                    
                    
                    case $4:{
                    // To make this less complicated, randomly pick _scene_num1's clm offset from _scene_num0 (assuming _section_count_x1>1)
                    _clm_offset0  = -(_section_count_x1-1);
                    _clm_offset0 += irandom((_section_count_x0-1)+(_section_count_x1-1));
                    
                    _clms1 = _section_count_x1 + 2; // +2: check the outside rc, they must be clear
                    _rows1 = _section_count_y1 + 2; // +2: check the outside rc, they must be clear
                    
                    _map_clm1 = (_map_clm0 + _clm_offset0) - 1;
                    _map_row1 =  _map_row0 + _section_count_y0;
                    for(_k=0; _k<_clms1; _k++)
                    {
                        for(_m=0; _m<_rows1; _m++)
                        {
                            if (inRange(_k,1,_clms1-2)   // dont check outer corners
                            &&  inRange(_m,1,_rows1-2) ) // dont check outer corners
                            {
                                _map_clm2 = _map_clm1 + _k;
                                _map_row2 = _map_row1 + _m;
                                if (ds_list_find_index(_dl_scene_rc, _map_clm2*_map_row2)==-1) // dont check _scene_num0 sections
                                {
                                    if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene]))
                                    {   // A different scene is in the way. This exit dir fails.
                                        _k = _clms1;
                                        break;//_m
                                    }
                                }
                            }
                        }
                    }
                    
                    if (_k==_clms1 
                    &&  _m==_rows1 )
                    {
                        _exit_dir = _dir;
                        _map_clm1 = _map_clm0 + _clm_offset0;
                        _map_row1 =(_map_row0 + _section_count_y0) + 1;
                    }
                    break;}//case $4
                    
                    
                    
                    
                    case $8:{
                    // To make this less complicated, randomly pick _scene_num1's clm offset from _scene_num0 (assuming _section_count_x1>1)
                    _clm_offset0  = -(_section_count_x1-1);
                    _clm_offset0 += irandom((_section_count_x0-1)+(_section_count_x1-1));
                    
                    _clms1 = _section_count_x1 + 2; // +2: check the outside rc, they must be clear
                    _rows1 = _section_count_y1 + 2; // +2: check the outside rc, they must be clear
                    
                    _map_clm1 = (_map_clm0 + _clm_offset0) - 1;
                    _map_row1 = (_map_row0 - 2) - _section_count_y1;
                    for(_k=0; _k<_clms1; _k++)
                    {
                        for(_m=0; _m<_rows1; _m++)
                        {
                            if (inRange(_k,1,_clms1-2)   // dont check outer corners
                            &&  inRange(_m,1,_rows1-2) ) // dont check outer corners
                            {
                                _map_clm2 = _map_clm1 + _k;
                                _map_row2 = _map_row1 + _m;
                                if (ds_list_find_index(_dl_scene_rc, _map_clm2*_map_row2)==-1) // dont check _scene_num0 sections
                                {
                                    if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene]))
                                    {   // A different scene is in the way. This exit dir fails.
                                        _k = _clms1;
                                        break;//_m
                                    }
                                }
                            }
                        }
                    }
                    
                    if (_k==_clms1 
                    &&  _m==_rows1 )
                    {
                        _exit_dir = _dir;
                        _map_clm1 = _map_clm0 + _clm_offset0;
                        _map_row1 =(_map_row0 - 2) - (_section_count_y1-1);
                    }
                    break;}//case $8
                }//switch(_dir)
                
                
                if (_exit_dir!=-1)
                {
                    _i = -1;
                    break;//_j
                }
            }//_j
        }
    }//_i
    
    if (_exit_dir==-1)
    {
        break;//while (_scenes_placed_count<_SCENE_COUNT)
    }
    
    
    if (_map_clm1<0 
    ||  _map_row1<0 )
    {
        for(_i=0; _i<_scenes_placed_count; _i++)
        {
            _dk0 = STR_Scene+hex_str(_i)+STR_Section;
            _section_count_x0 = val(_dm[?_dk0+STR_Count+"_X"]);
            _section_count_y0 = val(_dm[?_dk0+STR_Count+"_Y"]);
            for(_j=0; _j<_section_count_x0; _j++)
            {
                for(_k=0; _k<_section_count_y0; _k++)
                {
                    _dk1 = _dk0+hex_str(_j)+hex_str(_k);
                    if (_map_clm1<0) _dm[?_dk1+STR_Map+STR_Clm] = val(_dm[?_dk1+STR_Map+STR_Clm]) + abs(_map_clm1);
                    if (_map_row1<0) _dm[?_dk1+STR_Map+STR_Row] = val(_dm[?_dk1+STR_Map+STR_Row]) + abs(_map_row1);
                }
            }
        }
        
        if (_map_clm1<0) _map_clm1 = 0;
        if (_map_row1<0) _map_row1 = 0;
    }
    
    
    _dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+STR_Count+"_X"] = _section_count_x1;
    _dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+STR_Count+"_Y"] = _section_count_y1;
    for(_i=0; _i<_section_count_x1; _i++)
    {
        for(_j=0; _j<_section_count_y1; _j++)
        {
            _map_clm2 = _map_clm1 + _i;
            _map_row2 = _map_row1 + _j;
            _dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+hex_str(_i)+hex_str(_j)+STR_Map+STR_Clm] = _map_clm2;
            _dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+hex_str(_i)+hex_str(_j)+STR_Map+STR_Row] = _map_row2;
            _dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene] = _scene_num1;
            _dm[?STR_Map+STR_Clm+hex_str(_map_clm2)+STR_Row+hex_str(_map_row2)+STR_Scene+STR_Section] = hex_str(_i)+hex_str(_j);
        }
    }
    
    
    
    
    _map_clm0 = _map_clm1;
    _map_row0 = _map_row1;
    
    _scene_num0 = _scene_num1;
    _scene_num1 = ++_scenes_placed_count;
}




ds_map_copy(global.DungeonLayoutRandoTesting_dm, _dm);
ds_map_destroy(_dm); _dm=undefined;

//ds_list_destroy(_dl_1); _dl_1=undefined;
ds_list_destroy(_dl_scenes_placed); _dl_scenes_placed=undefined;
ds_list_destroy(_dl_scene_rc); _dl_scene_rc=undefined;
//ds_list_destroy(_dl_offset_options); _dl_offset_options=undefined;
ds_list_destroy(_dl_branch_dirs); _dl_branch_dirs=undefined;
//ds_list_destroy(_dl_branches_remaining); _dl_branches_remaining=undefined;




/*
            if (ds_list_size(_dl_branch_dirs))
            {
                ds_list_shuffle(_dl_branch_dirs);
                _branch_dir_count = irandom(ds_list_size(_dl_branch_dirs)-1) + 1;
                for(_i=0; _i<_branch_dir_count; _i++) ds_list_add(_dl_branches_remaining, (_scene_num0<<8) | _dl_branch_dirs[|_i]);
            }
            
            
            _scenes_placed_count++;
            _scene_num0++;
            
            //if (_scene_num0<_SCENE_COUNT)
            if (ds_list_size(_dl_branches_remaining))
            {
                ds_list_shuffle(_dl_branches_remaining);
                _val1 =         _dl_branches_remaining[|0];
                ds_list_delete( _dl_branches_remaining,0);
                
                _scene_num1 = (_val1>>8)&$FF;
                _dir = _val1&$FF;
                
                _map_clm0 = val(_dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+"00"+"00"+STR_Map+STR_Clm]);
                _map_row0 = val(_dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+"00"+"00"+STR_Map+STR_Row]);
                _section_count_x0 = val(_dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+STR_Count+"_X"]);
                _section_count_y0 = val(_dm[?STR_Scene+hex_str(_scene_num1)+STR_Section+STR_Count+"_Y"]);
                
                _clear_count = 0;
                if (_dir&$3) _section_count = _section_count_y0;
                else         _section_count = _section_count_x0;
                for(_i=0; _i<_section_count; _i++)
                {
                    switch(_dir){
                    case $1:{_map_clm1=_map_clm0+_section_count_x0; _map_row1=_map_row0+_i; break;}
                    case $2:{_map_clm1=_map_clm0-1;                _map_row1=_map_row0+_i; break;}
                    case $4:{_map_clm1=_map_clm0+_i;               _map_row1=_map_row0+_section_count_y0+1; break;}
                    case $8:{_map_clm1=_map_clm0+_i;               _map_row1=_map_row0-2; break;}
                    }
                    
                    if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                    {
                        _clear_count = 0;
                    }
                    else
                    {
                        _clear_count++;
                        if (_clear_count>=2)
                        {
                            //
                            break;//_i
                        }
                    }
                }//_i
            }
*/

/*
            _section_count_x_next_scene = 2;
            _section_count_y_next_scene = 1;
            ds_map_clear(_dl_branch_dirs);
            for(_i=0; _i<4; _i++)
            {
                _clear_count = 0;
                _dir = $1<<_i;
                if (_dir!=_origin_exit_dir)
                {
                    if (_dir&$3) _section_count = _section_count_y0 + (_section_count_y_next_scene<<1);
                    else         _section_count = _section_count_x0 + (_section_count_x_next_scene<<1);
                    
                    switch(_dir)
                    {
                        case $1:{
                        _qualifies = true;
                        for(_j=0; _j<_section_count_x_next_scene+1; _j++)
                        {
                            for(_k=0; _k<_section_count_y_next_scene+2; _k++)
                            {
                                _map_clm1  = _map_clm0 + _section_count_x0;
                                _map_clm1 += _j;
                                _map_row1  = _map_row0 - 1;
                                _map_row1 += _k;
                                if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                                {
                                    _qualifies = false;
                                }
                            }
                        }
                        if (_qualifies)
                        {
                            ds_list_add(_dl_branch_dirs,_dir);
                        }
                        break;}
                        
                        case $2:{
                        _qualifies = true;
                        for(_j=0; _j<_section_count_x_next_scene+1; _j++)
                        {
                            for(_k=0; _k<_section_count_y_next_scene+2; _k++)
                            {
                                _map_clm1  = _map_clm0 - (_section_count_x_next_scene+1);
                                _map_clm1 += _j;
                                _map_row1  = _map_row0 - 1;
                                _map_row1 += _k;
                                if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                                {
                                    _qualifies = false;
                                }
                            }
                        }
                        if (_qualifies)
                        {
                            ds_list_add(_dl_branch_dirs,_dir);
                        }
                        break;}
                        
                        case $4:{
                        _qualifies = true;
                        for(_j=0; _j<_section_count_x_next_scene+2; _j++)
                        {
                            for(_k=0; _k<_section_count_y_next_scene+2; _k++)
                            {
                                _map_clm1  = _map_clm0 - (_section_count_x_next_scene+1);
                                _map_clm1 += _j;
                                _map_row1  = _map_row0 - 1;
                                _map_row1 += _k;
                                if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                                {
                                    _qualifies = false;
                                }
                            }
                        }
                        if (_qualifies)
                        {
                            ds_list_add(_dl_branch_dirs,_dir);
                        }
                        break;}
                        
                        case $8:{
                        _map_clm1 = _map_clm0 - _section_count_x_next_scene + _j;
                        _map_row1 = _map_row0 - 2;
                        break;}
                    }
                }
            }//_i
*/

/*
                _section_count_x_next_scene = 4;
                _section_count_y_next_scene = 1;
                ds_map_clear(_dl_branch_dirs);
                for(_i=0; _i<4; _i++)
                {
                    _clear_count = 0;
                    _dir = $1<<_i;
                    if (_dir!=_origin_exit_dir)
                    {
                        if (_dir&$3) _section_count = _section_count_y0 + (_section_count_y_next_scene<<1);
                        else         _section_count = _section_count_x0 + (_section_count_x_next_scene<<1);
                        
                        switch(_dir)
                        {
                            case $1:{
                            _count0 = (_section_count_y0-1) + (_section_count_y_next_scene-1);
                            for(_j=0; _j<_count0; _j++)
                            {
                                _qualifies = true;
                                for(_k=0; _k<_section_count_x_next_scene+2; _k++)
                                {
                                    for(_m=0; _m<_section_count_y_next_scene+2; _m++)
                                    {
                                        _map_clm1  = _map_clm0 + (_section_count_x0-1);
                                        _map_clm1 += _k;
                                        _map_row1  = _map_row0 - _section_count_y_next_scene;
                                        _map_row1 += _j;
                                        _map_row1 += _m;
                                        if (_map_clm1!=_map_clm0+(_section_count_x0-1) 
                                        || !inRange(_map_row0,_map_row0+(_section_count_y0-1)) )
                                        {
                                            if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                                            {
                                                _qualifies = false;
                                                _k = _section_count_x_next_scene+2;
                                                break;//_m
                                            }
                                        }
                                    }
                                }
                                
                                if (_qualifies)
                                {
                                    ds_list_add(_dl_branch_dirs,_dir);
                                }
                            }
                            //_map_clm1 = _map_clm0 + _section_count_x0;
                            //_map_row1 = _map_row0 - _section_count_y_next_scene + _j;
                            break;}
                            
                            case $2:{
                            _map_clm1 = _map_clm0 - 1;
                            _map_row1 = _map_row0 - _section_count_y_next_scene + _j;
                            break;}
                            
                            case $4:{
                            _map_clm1 = _map_clm0 - _section_count_x_next_scene + _j;
                            _map_row1 = _map_row0 + _section_count_y0 + 1;
                            break;}
                            
                            case $8:{
                            _map_clm1 = _map_clm0 - _section_count_x_next_scene + _j;
                            _map_row1 = _map_row0 - 2;
                            break;}
                        }
                    }
                }//_i
*/

                            /*
                            for(_j=0; _j<_section_count_y0; _j++)
                            {
                                for(_k=0; _k<_section_count_y_next_scene; _k++)
                                {   // check all sections and squares around the sections of next scene
                                    for(_m=0; _m<_section_count_x_next_scene+2; _m++)
                                    {
                                        for(_p=0; _p<_section_count_y_next_scene+2; _p++)
                                        {
                                            _map_clm1 = _map_clm0 - 1 + _m;
                                            _map_row1 = _map_row0 + _j - _section_count_y_next_scene + _p;
                                            if (_map_clm1!=_map_clm0+(_section_count_x0-1) 
                                            || !inRange(_map_row0,_map_row0+(_section_count_y0-1)) )
                                            {
                                                if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                                                {
                                                    _m = _section_count_x_next_scene+2;
                                                    break;//_p
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            */

                        /*
                        for(_j=0; _j<_section_count; _j++)
                        {
                            if(!is_undefined(_dm[?STR_Map+STR_Clm+hex_str(_map_clm1)+STR_Row+hex_str(_map_row1)+STR_Scene]))
                            {
                                _clear_count = 0;
                            }
                            else
                            {
                                _clear_count++;
                                if (_clear_count>=2)
                                {
                                    ds_list_add(_dl_branch_dirs,_dir);
                                    break;//_j
                                }
                            }
                        }//_j
                        */
