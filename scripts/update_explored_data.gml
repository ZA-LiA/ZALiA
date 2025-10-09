/// update_explored_data()


if (global.pc.x>>8 != global.pc.x_prev>>8   // Crossed into a map page
||  global.pc.y>>8 != global.pc.y_prev>>8 ) // Crossed into a map page
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var  _PAGE_X = global.pc.x>>8;
var  _PAGE_Y = global.pc.y>>8;
if(!(_PAGE_X+1) 
|| !(_PAGE_Y+1) )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var _SCENE_NAME = g.rm_name;
    _SCENE_NAME = val(f.dm_rando[?g.rm_name+STR_Scene+STR_Name], _SCENE_NAME);
//
var _DUNGEON_NUM = g.dungeon_num;
    _DUNGEON_NUM = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], _DUNGEON_NUM);
//var _AREA_NAME   = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Area], g.area_name);

var _MAP_ALL_PAGES = false;
if (_DUNGEON_NUM 
&&  val(g.dm_rm[?STR_Map+STR_Explored+STR_Exception+"01"+_SCENE_NAME]) 
&& !val(f.dm_explored[?_SCENE_NAME+STR_Explored]) )
{
    _MAP_ALL_PAGES = true;
}


var _PAGE = hex_str((_PAGE_Y*g.rm_pages_x) + _PAGE_X);

//if(!val(f.dm_explored[?_SCENE_NAME+STR_Explored])) sdm(_SCENE_NAME+". "+"_MAP_ALL_PAGES "+string(_MAP_ALL_PAGES)+", g.rm_pages_x "+string(g.rm_pages_x)+", g.rm_pages_y "+string(g.rm_pages_y)+", _PAGE_X "+string(_PAGE_X)+", _PAGE_Y "+string(_PAGE_Y)+", _PAGE "+string(_PAGE));

f.dm_explored[?_SCENE_NAME+STR_Explored+STR_Page+_PAGE] = 1;
f.dm_explored[?_SCENE_NAME+STR_Explored]                = 1;




// ---------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------
if (_DUNGEON_NUM)
{
    with(g.PAUSE_MENU)
    {
        var _i,_j,_k,_m, _val,_val1,_val2, _count, _page, _clm,_row, _len;
        var _rm_name, _exit_name;
        var _qualifies=false;
        var _IDX1 = 7; // dg_dngn_map index 7: Has visited map page
        var _COUNT2=ds_grid_width(dg_dngn_map);
        
        if (_MAP_ALL_PAGES)
        {        var _COUNT1 = g.rm_pages_x*g.rm_pages_y;  }
        else     var _COUNT1 = 1;
        for(_i=0; _i<_COUNT1; _i++)
        {
            if (_MAP_ALL_PAGES) _page = hex_str(_i);
            else                _page = _PAGE;
            
            f.dm_explored[?_SCENE_NAME+STR_Explored+STR_Page+_page] = 1;
            
            var _datakey = _SCENE_NAME+STR_Page+_page+STR_Map;
            
            // dg_dngn_map: 0:clm, 1:row, 2:tsrc, 3: xscale, 4: yscale, 5: rm_name, 6: rm page, 7: explored, 8: if tsrc is elevator shaft, this is a string of each exit name
                                       _clm = g.dm_rm[?_datakey+STR_Idx];
            if(!_MAP_ALL_PAGES)
            {   if (   !is_undefined(  _clm)) dngn_map_pc_rc =  (dg_dngn_map[#_clm,1]<<8) | dg_dngn_map[#_clm,0];  }
                if (   !is_undefined(  _clm)) update_dngn_vis_rc(dg_dngn_map[#_clm,0],      dg_dngn_map[#_clm,1]);
            //
            if (       !is_undefined(  _clm) 
            &&         !dg_dngn_map[#  _clm,_IDX1] )
            {
                        dg_dngn_map[#  _clm,_IDX1] = 1;
                switch(_DUNGEON_NUM){
                case 1:{dg_dngn_map_1[#_clm,_IDX1] = 1; break;}
                case 2:{dg_dngn_map_2[#_clm,_IDX1] = 1; break;}
                case 3:{dg_dngn_map_3[#_clm,_IDX1] = 1; break;}
                case 4:{dg_dngn_map_4[#_clm,_IDX1] = 1; break;}
                case 5:{dg_dngn_map_5[#_clm,_IDX1] = 1; break;}
                case 6:{dg_dngn_map_6[#_clm,_IDX1] = 1; break;}
                case 7:{dg_dngn_map_7[#_clm,_IDX1] = 1; break;}
                case 8:{dg_dngn_map_8[#_clm,_IDX1] = 1; break;}
                }
                
                //ds_map_add(dg_dngn_map, _datakey+STR_Clm, _clm);
                //ds_map_add(dg_dngn_map, _datakey+STR_Row, _IDX1);
                
                
                
                // ELEVATOR SHAFTS  -------------------------------------------
                _len = string_length(_SCENE_NAME)+2;
                for(_j=0; _j<_COUNT2; _j++) // _COUNT2: dg_dngn_map width
                {
                    if (dg_dngn_map[#_j,2]==TSRC_ELEVATOR_SHAFT) // TSRC_ELEVATOR_SHAFT=$60
                    {
                        _val = dg_dngn_map[#_j,8];
                        if (is_string(_val))
                        {
                            _count = string_length(_val) div ExitName_LEN;
                            for(_k=0; _k<_count; _k++)
                            {
                                _exit_name = string_copy(_val, (ExitName_LEN*_k)+1, ExitName_LEN);
                                _val1 = val(g.dm_rm[?_exit_name+STR_Page], -1);
                                _rm_name = string_copy(_exit_name, 1, RmName_LEN);
                                //sdm("_count "+string(_count)+", "+_val+", _exit_name "+_exit_name+", _rm_name "+_rm_name+", _val1 "+string(_val1)+", _page "+string(_page));
                                if (_rm_name==_SCENE_NAME 
                                &&  _val1==str_hex(_page) )
                                {
                                            dg_dngn_map[#  _j,_IDX1] = 1;
                                    switch(_DUNGEON_NUM){
                                    case 1:{dg_dngn_map_1[#_j,_IDX1] = 1; break;}
                                    case 2:{dg_dngn_map_2[#_j,_IDX1] = 1; break;}
                                    case 3:{dg_dngn_map_3[#_j,_IDX1] = 1; break;}
                                    case 4:{dg_dngn_map_4[#_j,_IDX1] = 1; break;}
                                    case 5:{dg_dngn_map_5[#_j,_IDX1] = 1; break;}
                                    case 6:{dg_dngn_map_6[#_j,_IDX1] = 1; break;}
                                    case 7:{dg_dngn_map_7[#_j,_IDX1] = 1; break;}
                                    }
                                    break;//_k
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}




