/// p_Room_Start_palette_rando()


var _i,_j, _idx;
var _dk, _pos;
var _pi, _pal, _color;
var _depth, _layer_name;

var _scene_used = g.rm_name;
if (global.SceneRando_enabled) _scene_used = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], _scene_used);


if (room!=rmB_Title 
&&  room!=rmB_FileSelect 
&&  g.RandoPalette_state ) // 0: Off, 1: Dungeons, PC, 2: Dungeons, 2 background PI of Non-dungeon scenes, PC
{
    if (g.room_type=="A")
    {
        if (g.dungeon_num 
        ||  g.RandoPalette_state==2 ) // state 1 only uses rando palettes for pc and dungeons
        {
            // `f.dm_rando[?STR_Palette+STR_Rando+g.rm_name]`: The palettes for PI_BGR1-PI_BGR4
            _pal = f.dm_rando[?STR_Palette+STR_Rando+_scene_used];
            if(!is_undefined(_pal))
            {
                pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_BGR1), string_length(_pal), _pal);
                
                if (g.dungeon_num)
                {
                    var _solid_wall_pi_pos = get_pal_pos(global.PI_BGR1);
                    
                    var _dl_TILE_DEPTH_NAMES_COUNT = ds_list_size(g.dl_TILE_DEPTH_NAMES);
                    for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                    {
                        _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                        _depth      = g.dm_TILE_DEPTH[?_dk];
                        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                        if(!is_undefined(_depth) 
                        && !is_undefined(_layer_name) 
                        &&  string_pos("FGWALL01_01",_layer_name) ) // use "STRUCTURE_FGWALL01_02" in the layer name so this doesn't run
                        //&&  string_pos("STRUCTURE_FGWALL01_01",_layer_name) ) // use "STRUCTURE_FGWALL01_02" in the layer name so this doesn't run
                        {
                            _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                            if (_idx!=-1)
                            {
                                _pi = dg_depth_pi[#_idx,1];
                                _solid_wall_pi_pos = get_pal_pos(_pi);
                                break;//_i
                            }
                        }
                    }
                    
                    
                    var _color_shd = string_copy(pal_rm_def, _solid_wall_pi_pos+(global.PAL_CHAR_PER_COLOR*2), global.PAL_CHAR_PER_COLOR); // "B" color(shadow-tone) of STRUCTURE_FGWALL01_01 palette
                    _color_shd = str_hex(_color_shd);
                    var _LUM = max($00, floor(colour_get_value(_color_shd)*0.8));
                    _color = make_colour_hsv(colour_get_hue(_color_shd), colour_get_saturation(_color_shd), _LUM);
                    
                    //show_debug_message("");
                    //show_debug_message("BGR WALL COLOR: $"+color_str(_color)+"."+" H-"+hex_str(colour_get_hue(_color))+" S-"+hex_str(colour_get_saturation(_color))+" L-"+hex_str(colour_get_value(_color)));
                    if (_color==C_WHT0 
                    ||  _color==C_RED0 
                    ||  _color==C_BLU0 
                    ||  _color==C_GRN0 
                    ||  _color==C_YLW0 
                    ||  _color==C_MGN0 
                    ||  _color==C_BLK0 
                    ||  _color==C_CYN0 
                    ||  _color==global.C_ALPHA0 )
                    {
                        _color = C_BLK1;
                    }
                    //show_debug_message("BGR WALL COLOR: $"+color_str(_color)+"."+" H-"+hex_str(colour_get_hue(_color))+" S-"+hex_str(colour_get_saturation(_color))+" L-"+hex_str(colour_get_value(_color)));
                    //show_debug_message("");
                    
                    for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                    {
                        _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                        _depth      = g.dm_TILE_DEPTH[?_dk];
                        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                        if(!is_undefined(_depth) 
                        && !is_undefined(_layer_name) )
                        {
                            if (string_pos("BGWALL01_01",_layer_name)   // use "STRUCTURE_BGWALL01_02" in the layer name if you dont want this to run
                            //if (string_pos("STRUCTURE_BGWALL01_01",_layer_name)   // use "STRUCTURE_BGWALL01_02" in the layer name if you dont want this to run
                            ||  string_pos("WINDOW01",_layer_name) )
                            {
                                _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                                if (_idx!=-1)
                                {
                                    _pi  = dg_depth_pi[#_idx,1]; // pi for the layer
                                    _pos = get_pal_pos(_pi) + (global.PAL_CHAR_PER_COLOR*2);
                                    _pal = color_str(_color);
                                    pal_rm_def = strReplaceAt(pal_rm_def, _pos, string_length(_pal), _pal);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    // PC Palette ----------------------------------------------------------------------
    _pal = f.dm_rando[?STR_Palette+"_PC"+"01"];
    if(!is_undefined(_pal))
    {
        pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_PC1), string_length(_pal), _pal);
    }
    
    // Cucco Palette ----------------------------------------------------------------------
    _pal = f.dm_rando[?STR_Palette+STR_Cucco+"01"];
    if(!is_undefined(_pal))
    {
        pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_CUCCO1), string_length(_pal), _pal);
    }
}
/*
switch(_color_mid){
case        p.C_WHT0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$04]; break;}
case        p.C_RED0:{_color_mid=global.dl_COLOR01[|($C*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_BLU0:{_color_mid=global.dl_COLOR01[|($3*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_GRN0:{_color_mid=global.dl_COLOR01[|($7*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_YLW0:{_color_mid=global.dl_COLOR01[|($9*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_MGN0:{_color_mid=global.dl_COLOR01[|($0*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_BLK0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$04]; break;}
case        p.C_CYN0:{_color_mid=global.dl_COLOR01[|($5*p.ColorGrid_CLMS)+$02]; break;}
case global.C_ALPHA0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$04]; break;}
}
*/




/*
/// p_Room_Start_palette_rando()


var _i,_j, _idx;
var _dk, _pos;
var _pi, _pal, _color;
var _depth, _layer_name;


if (room!=rmB_Title 
&&  room!=rmB_FileSelect 
&&  g.RandoPalette_state ) // 0: Off, 1: Dungeons, PC, 2: Dungeons, 2 background PI of Non-dungeon scenes, PC
{
    if (g.room_type=="A")
    {
        if (g.dungeon_num 
        ||  g.RandoPalette_state==2 )
        {
            _pal = f.dm_rando[?STR_Palette+STR_Rando+g.rm_name];
            if(!is_undefined(_pal))
            {
                pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_BGR1), string_length(_pal), _pal);
                
                if (g.dungeon_num)
                {
                    var _solid_wall_pi_pos = get_pal_pos(global.PI_BGR1);
                    
                    var _dl_TILE_DEPTH_NAMES_COUNT = ds_list_size(g.dl_TILE_DEPTH_NAMES);
                    for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                    {
                        _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                        _depth      = g.dm_TILE_DEPTH[?_dk];
                        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                        if(!is_undefined(_depth) 
                        && !is_undefined(_layer_name) 
                        &&  string_pos("STRUCTURE_FGWALL01_01",_layer_name) ) // use "STRUCTURE_FGWALL01_02" in the layer name so this doesn't run
                        {
                            _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                            if (_idx!=-1)
                            {
                                _pi = dg_depth_pi[#_idx,1];
                                _solid_wall_pi_pos = get_pal_pos(_pi);
                                break;//_i
                            }
                        }
                    }
                    
                    
                    for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                    {
                        _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                        _depth      = g.dm_TILE_DEPTH[?_dk];
                        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                        if(!is_undefined(_depth) 
                        && !is_undefined(_layer_name) 
                        &&  string_pos("STRUCTURE_BGWALL01_01",_layer_name) ) // use "STRUCTURE_BGWALL01_02" in the layer name if you dont want this to run
                        {
                            _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                            if (_idx!=-1)
                            {
                                _pi = dg_depth_pi[#_idx,1]; // pi for bgr wall
                                
                                var _COLOR_MID = string_copy(pal_rm_def, _solid_wall_pi_pos+(global.PAL_CHAR_PER_COLOR*1), global.PAL_CHAR_PER_COLOR); // "R" color(mid-tone)    of STRUCTURE_FGWALL01_01 palette
                                var _COLOR_SHD = string_copy(pal_rm_def, _solid_wall_pi_pos+(global.PAL_CHAR_PER_COLOR*2), global.PAL_CHAR_PER_COLOR); // "B" color(shadow-tone) of STRUCTURE_FGWALL01_01 palette
                                
                                if (_COLOR_MID!=color_str(C_BLK1))
                                {
                                    if (_COLOR_SHD==color_str(C_BLK1)) _color = str_hex(_COLOR_MID);
                                    else                               _color = str_hex(_COLOR_SHD);
                                    
                                    if (_color==C_WHT0 
                                    ||  _color==C_RED0 
                                    ||  _color==C_BLU0 
                                    ||  _color==C_GRN0 
                                    ||  _color==C_YLW0 
                                    ||  _color==C_MGN0 
                                    ||  _color==C_BLK0 
                                    ||  _color==C_CYN0 )
                                    {
                                        _color = C_BLK1;
                                    }
                                    //if (ds_list_find_index(dl_COLOR,str_hex(_color_data))>=$40) _color_data = color_str(C_BLK1); // temp fix for new colors
                                    
                                    if (_color!=C_BLK1)
                                    {
                                        // find the color in `dl_colors_s` closest to _color
                                        var _BASE_R = color_get_red(  _color);
                                        var _BASE_G = color_get_green(_color);
                                        var _BASE_B = color_get_blue( _color);
                                        var _BASE_BRIGHTNESS = get_color_brightness(_color);
                                        var _min_dist = $FFFFFFFF;
                                        var _closest_color = C_BLK1;
                                        
                                        for(_j=ds_list_size(dl_colors_s)-1; _j>=0; _j--)
                                        {
                                            var _CURRENT_COLOR = dl_colors_s[|_j]; // all dl_colors_s colors brightness are < $40
                                            var _CURRENT_BRIGHTNESS = get_color_brightness(_CURRENT_COLOR);
                                            if (_CURRENT_BRIGHTNESS<_BASE_BRIGHTNESS 
                                            ||  (_CURRENT_BRIGHTNESS==_BASE_BRIGHTNESS && _BASE_BRIGHTNESS<$40) )
                                            {
                                                var _CURRENT_R = color_get_red(  _CURRENT_COLOR);
                                                var _CURRENT_G = color_get_green(_CURRENT_COLOR);
                                                var _CURRENT_B = color_get_blue( _CURRENT_COLOR);
                                                
                                                var _DIST_SQ = power(_BASE_R-_CURRENT_R,2) + power(_BASE_G-_CURRENT_G,2) + power(_BASE_B-_CURRENT_B,2);
                                                if (_DIST_SQ<_min_dist)
                                                {
                                                    _min_dist = _DIST_SQ;
                                                    _closest_color = _CURRENT_COLOR;
                                                }
                                            }
                                        }
                                        
                                        _color = _closest_color;
                                    }
                                    
                                    _pos  = get_pal_pos(_pi) + (global.PAL_CHAR_PER_COLOR*2);
                                    _pal1 = color_str(_color);
                                }
                                else
                                {   // If the "R" color is black, make the bgr wall full black to contrast the STRUCTURE_FGWALL01_01 palette
                                    _pos  = get_pal_pos(_pi);
                                    _pal1 = build_pal(C_BLK1,C_BLK1,C_BLK1,C_BLK1, -2,-2,-2,-2);
                                }
                                
                                
                                pal_rm_def = strReplaceAt(pal_rm_def, _pos, string_length(_pal1), _pal1);
                                break;//_i
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    // PC Palette ----------------------------------------------------------------------
    _pal = f.dm_rando[?STR_Palette+"_PC"+"01"];
    if(!is_undefined(_pal))
    {
        pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_PC1), string_length(_pal), _pal);
    }
    
    // Cucco Palette ----------------------------------------------------------------------
    _pal = f.dm_rando[?STR_Palette+STR_Cucco+"01"];
    if(!is_undefined(_pal))
    {
        pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_CUCCO1), string_length(_pal), _pal);
    }
}
*/
