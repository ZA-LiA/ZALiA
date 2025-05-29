/// Rando_randomize_palettes()


//g.RandoPalette_state = dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2];
if (Palette_WILL_RANDOMIZE) g.RandoPalette_state = 2; // 2: Full palette rando
else                        g.RandoPalette_state = 0; // 0: Palette rando off
save_game_pref();


//if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}

random_set_seed(Rando_SEED);

// Dungeons ------------------------------------------------------------------
var _i,_j,_k, _idx, _count;
var _val,_val1,_val2;
var _layer_count, _layer_name, _layer, _layer_data_num, _dl_layer_data, _dm_layer_data;
var _file, _file_name,_file_name1,_file_name2, _file_data;
var _scene_name;
var _dk;
var _palette;
var _pos;
var _pi, _color1,_color2,_color3;
var _C_BLK1_ = color_str(p.C_BLK1);

var _dl_1 = ds_list_create();
/*
    _count = val(global.dm_pi[?"BGR"+STR_Count]);
if (_count>0) ds_list_add(_dl_1,global.PI_BGR1);
if (_count>1) ds_list_add(_dl_1,global.PI_BGR2);
if (_count>2) ds_list_add(_dl_1,global.PI_BGR3);
if (_count>3) ds_list_add(_dl_1,global.PI_BGR4);
if (_count>4) ds_list_add(_dl_1,global.PI_BGR5);
*/
var _dl_2 = ds_list_create();

//                                                      //
var         _dl_colors1 = ds_list_create();
ds_list_add(_dl_colors1,color_str(p.C_BLK1));
ds_list_add(_dl_colors1,color_str(p.C_GRY4));
ds_list_add(_dl_colors1,color_str(p.C_VLT4)); // blue-violet
ds_list_add(_dl_colors1,color_str(p.C_BLU4)); // blue
ds_list_add(_dl_colors1,color_str(p.C_YLW4)); // yellow
ds_list_add(_dl_colors1,color_str(p.C_YGR4)); // yellow-green
ds_list_add(_dl_colors1,color_str(p.C_GRB4)); // blue-green
ds_list_add(_dl_colors1,color_str(p.C_CYN4)); // cyan/teal
//                                                      //
var         _dl_colors2 = ds_list_create();
ds_list_add(_dl_colors2,color_str(p.C_BLK1));
ds_list_add(_dl_colors2,color_str(p.C_GRY4));
ds_list_add(_dl_colors2,color_str(p.C_VLT4)); // 
ds_list_add(_dl_colors2,color_str(p.C_BLU4)); // 
ds_list_add(_dl_colors2,color_str(p.C_PUR4)); // 
ds_list_add(_dl_colors2,color_str(p.C_MGN4)); // 
ds_list_add(_dl_colors2,color_str(p.C_PNK4)); // 
ds_list_add(_dl_colors2,color_str(p.C_RED4)); // 
//                                                      //
ds_list_add(_dl_colors2,color_str(p.C_ORG4)); // 
ds_list_add(_dl_colors2,color_str(p.C_YLW4)); // 
ds_list_add(_dl_colors2,color_str(p.C_YGR4)); // 
ds_list_add(_dl_colors2,color_str(p.C_GRN4)); // 
ds_list_add(_dl_colors2,color_str(p.C_GRB4)); // 
ds_list_add(_dl_colors2,color_str(p.C_CYN4)); // 
ds_list_add(_dl_colors2,color_str(p.C_VLT3)); // 
ds_list_add(_dl_colors2,color_str(p.C_PUR3)); // 
//                                                      //
ds_list_add(_dl_colors2,color_str(p.C_ORG3)); // 
ds_list_add(_dl_colors2,color_str(p.C_YLW3)); // 
ds_list_add(_dl_colors2,color_str(p.C_YGR3)); // 
ds_list_add(_dl_colors2,color_str(p.C_GRB3)); // 
ds_list_add(_dl_colors2,color_str(p.C_CYN3)); // 
/*
var _COLORS1  = p.CI_BLK1_+p.CI_GRY4_; // darkest colors
    _COLORS1 += "0C"+"0B"+"09"+"08"+"02"+"01"; // darkest colors
var _COLORS2  = p.CI_BLK1_+p.CI_GRY4_;
    _COLORS2 += "01"+"02"+"03"+"04"+"05"+"06"+"07"+"08"+"09"+"0A"+"0B"+"0C";
    _COLORS2 +=      "12"+"13"               +"17"+"18"+"19"     +"1B"+"1C";
*/
var         _dl_DUNGEON_AREAS = ds_list_create();
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcA); // Parapa Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcB); // Midoro Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcC); // Island Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcD); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcE); // Palace on the Sea
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcF); // Hidden Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcG); // Great Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcH); // Dragmire Tower
var _dl_DUNGEON_AREAS_COUNT = ds_list_size(_dl_DUNGEON_AREAS);

var         _dl_DUNGEON_TILESETS = ds_list_create();
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonA01); // Parapa Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonB01); // Midoro Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonC01); // Island Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonD01); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonE01); // Palace on the Sea
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonF01); // Hidden Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonG01); // Great Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonH01); // Dragmire Tower



var          _dl_pals1=ds_list_create();
ds_list_copy(_dl_pals1,p.dl_various_pals1);
var          _dl_pals2=ds_list_create();
ds_list_copy(_dl_pals2,p.dl_various_pals2);

for(_i=1; _i<=_dl_DUNGEON_AREAS_COUNT; _i++) // each dungeon
{
    // Dungeon primary palette
    ds_list_shuffle(_dl_pals2);
    _val2 =         _dl_pals2[|0];
    ds_list_delete( _dl_pals2, 0);
    
    
    // Attempting to lower the brightness
    _color1 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // highlight
    _color2 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*1)+1, global.PAL_CHAR_PER_COLOR); // midtone
    _color3 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // shadow
    
    //if (get_color_brightness(_color2)<$40)
    if (ds_list_find_index(_dl_colors2,_color2)==-1) // if not an acceptable midtone color
    {   // Midtone
        _idx = irandom(ds_list_size(_dl_colors2)-1);
        _color2 = _dl_colors2[|_idx];
    }
    
    
    // Use darker colors if the tileset for dungeon _i is brighter because it has more highlight color pixels in the graphics
    _val = _dl_DUNGEON_TILESETS[|_i-1];
    _val = val(dm_save_data[?STR_Rando+STR_Tileset+background_get_name(_val)], _val);
    if (_val==ts_DungeonB01   // if dungeon _i will use dungeon 2 tileset
    ||  _val==ts_DungeonD01 ) // if dungeon _i will use dungeon 4 tileset
    {
        if (ds_list_find_index(_dl_colors2,_color1)==-1)
        {   // Highlight
            _idx = irandom(ds_list_size(_dl_colors2)-1);
            _color1 = _dl_colors2[|_idx];
        }
        
        if (ds_list_find_index(_dl_colors1,_color3)==-1)
        {   // Shadow
            _idx = irandom(ds_list_size(_dl_colors1)-1);
            _color3 = _dl_colors1[|_idx];
        }
        
        if (ds_list_find_index(_dl_colors1,_color1)==-1 
        &&  ds_list_find_index(_dl_colors1,_color3)==-1 )
        {   // Make sure at least one of these colors is one of the darkest colors
            _idx = irandom(ds_list_size(_dl_colors1)-1);
            if (irandom(1)) _color1 = _dl_colors1[|_idx];
            else            _color3 = _dl_colors1[|_idx];
        }
    }
    
    
    if (ds_list_find_index(_dl_colors2,_color3)==-1)
    {   // Midtone
        _idx = irandom(ds_list_size(_dl_colors2)-1);
        _color3 = _dl_colors2[|_idx];
    }
    
    
    
    
    // The main color scheme palette of the dungeon
    _val2 = build_pal(_color1,_color2,_color3,_C_BLK1_, _color1,_color2,_color3,-2);
    //_val2 = build_pal(_color1,_color2,_color3,_C_BLK1_, -2,-2,-2,-2);
    //_val2 = _color1 + _color2 + _color3 + _C_BLK1_;
    
    
    // Dungeon secondary palette (the palette curtains,crystal-holder,etc.. use)
    ds_list_shuffle(_dl_pals1);
    _val1 =         _dl_pals1[|_val2==_dl_pals1[|0]];
    ds_list_delete( _dl_pals1, _val2==_dl_pals1[|0]);
    
    //_palette = _val2+_val1;
    
    
    for(_j=0; _j<$100; _j++) // Each dungeon scene
    {
        _scene_name = _dl_DUNGEON_AREAS[|_i-1]+hex_str(_j);
        
        if (is_undefined(g.dm_rm[?_scene_name+STR_Rm+STR_Num+STR_Game]))
        {
            continue;//_j
        }
        
        // file name data example: "PalcA_003"
        _file_name1 = g.dm_rm[?_scene_name+dk_FileName+STR_Quest+"01"];
        _file_name2 = g.dm_rm[?_scene_name+dk_FileName+STR_Quest+"02"];
        if (is_undefined(_file_name1))
        {
            continue;//_j
        }
        
        if (QUEST_NUM==2 
        && !is_undefined(_file_name2) )
        {
            _file_name = _file_name2;
        }
        else
        {
            _file_name = _file_name1;
        }
        
        _palette = p.dm_scene_palette[?_file_name+dk_BGR];
        if (is_undefined(_palette))
        {
            continue;//_j
        }
        
        //if (_j<8) sdm("_scene_name "+_scene_name);
        // BGR1
        _pos  = global.PI_BGR1;
        _pos -= global.PI_BGR1;
        _pos *= global.PAL_CHAR_PER_PAL;
        _pos++;
        _palette = strReplaceAt(_palette, _pos, string_length(_val2), _val2);
        // BGR2
        _pos  = global.PI_BGR2;
        _pos -= global.PI_BGR1;
        _pos *= global.PAL_CHAR_PER_PAL;
        _pos++;
        _palette = strReplaceAt(_palette, _pos, string_length(_val1), _val1);
        
        dm_save_data[?STR_Palette+STR_Rando+_scene_name] = _palette;
        //sdm("_scene_name "+_scene_name+", _palette "+_palette);
    }
    //sdm("");
}

ds_list_destroy(_dl_pals1); _dl_pals1=undefined;
ds_list_destroy(_dl_pals2); _dl_pals2=undefined;







//var _debug1=true;
var          _AREA_COUNT = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_AREA_COUNT; _i++) // Each area
{
    _area = g.dl_AREA_NAME[|_i];
    if (ds_list_find_index(_dl_DUNGEON_AREAS,_area)!=-1)
    {
        continue;//_i
    }
    
    for(_j=0; _j<$100; _j++) // Each possible scene of the area
    {
        _scene_name = _area+hex_str(_j);
        
        // file name data example: "PalcA_003"
        _file_name1 = g.dm_rm[?_scene_name+dk_FileName+STR_Quest+"01"];
        _file_name2 = g.dm_rm[?_scene_name+dk_FileName+STR_Quest+"02"];
        if (is_undefined(_file_name1))
        {
            continue;//_j
        }
        
        if (QUEST_NUM==2 
        && !is_undefined(_file_name2) )
        {
            _file_name = _file_name2;
        }
        else
        {
            _file_name = _file_name1;
        }
        
        
        _palette = p.dm_scene_palette[?_file_name+dk_BGR];
        if (is_undefined(_palette))
        {
            continue;//_j
        }
        
        
        _datakey1  = _file_name;
        _datakey1 += STR_Layer;
        _layer_data_num = $01;
        ds_list_clear(_dl_1);
        while (true)
        {
            _layer_name = global.dm_tile_layer_data[?_datakey1+hex_str(_layer_data_num++)+STR_Name];
            if (is_undefined(_layer_name))
            {
                break;//while (true)
            }
            
            if (string_pos("BG",_layer_name) 
            ||  string_pos("FG",_layer_name) )
            {
                if (string_pos("BG",_layer_name)) _pos = string_pos("BG",_layer_name);
                else                              _pos = string_pos("FG",_layer_name);
                
                _val = string_copy(_layer_name, _pos+4, 2);
                _val = str_hex(_val);
                switch(_val){
                default: {_pi=global.PI_BGR1; break;}
                case $02:{_pi=global.PI_BGR2; break;}
                case $03:{_pi=global.PI_BGR3; break;}
                case $04:{_pi=global.PI_BGR4; break;}
                case $05:{_pi=global.PI_BGR5; break;}
                }
                
                if (ds_list_find_index(_dl_1,_pi)==-1)
                {
                    ds_list_add(_dl_1,_pi);
                    if (ds_list_size(_dl_1)>=val(global.dm_pi[?"BGR"+STR_Count]))
                    {
                        break;//while (true)
                    }
                }
            }
        }
        /*
        _file_name  = "rm_tile_data";
        _file_name += "/";
        _file_name += string_lettersdigits(_area);
        _file_name += "/";
        _file_name += _file_name1;
        _file_name += ".json";
        if(!file_exists(_file_name)) continue;//_j. to next file
        
        _file_data = "";
        _file = file_text_open_read(_file_name);
        while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
        file_text_close(_file);
        _file_data = json_decode(_file_data);
        
        
        
        
        ds_list_clear(_dl_1);
        _dl_layer_data = val(_file_data[?"layers"]);
        _layer_count = ds_list_size(_dl_layer_data);
        for(_k=0; _k<_layer_count; _k++) // Each layer
        {
            _dm_layer_data = _dl_layer_data[|_k];
            _layer_name    = _dm_layer_data[?"name"];
            _layer_name    = string(_layer_name);
        */
        
        
        if (ds_list_size(_dl_1))
        {
            ds_list_copy(_dl_2,p.dl_various_pals2);
            ds_list_shuffle(_dl_2);
            ds_list_shuffle(_dl_1);
            
            _count  = 1;
            _count += !irandom($F);
            _count  = min(_count, ds_list_size(_dl_1), ds_list_size(_dl_2));
            for(_k=0; _k<_count; _k++)
            {
                _pos  = _dl_1[|_k];
                _pos -= global.PI_BGR1;
                _pos *= global.PAL_CHAR_PER_PAL;
                _pos++;
                _palette = strReplaceAt(_palette, _pos, string_length(_dl_2[|_k]), _dl_2[|_k]);
                dm_save_data[?STR_Palette+STR_Rando+_scene_name] = _palette;
                //if (_debug1){_debug1=false; sdm(_scene_name+": "+_palette);}
            }
        }
    }
}








// PC and Cucco -----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
var _CHANCE1 = $27;
var _CHANCE2 = $01;
//var _CHANCE3=$03;
var _COLOR_pc_skin    = string_copy(p.PAL_PC_1, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // pc skin
var _COLOR_pc_outline = string_copy(p.PAL_PC_1, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // pc outline
var _COLOR_cucco_legs = string_copy(p.PAL_CUC1, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // cucco legs/beak
var _COLOR_cucco_body = string_copy(p.PAL_CUC1, (global.PAL_CHAR_PER_COLOR*1)+1, global.PAL_CHAR_PER_COLOR); // cucco body
//var _COLOR_cucco_body = string_copy(p.PAL_CUC1, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // cucco body

var         _dl_tunic_colors = ds_list_create(); // acceptable tunic colors
ds_list_add(_dl_tunic_colors, p.C_WHT2,p.C_GRY4,p.C_BLK1)
ds_list_add(_dl_tunic_colors, p.C_BLU2,p.C_BLU3,p.C_BLU4);
ds_list_add(_dl_tunic_colors, p.C_VLT2,p.C_VLT3,p.C_VLT4);
ds_list_add(_dl_tunic_colors, p.C_PUR2,p.C_PUR3,p.C_PUR4);
ds_list_add(_dl_tunic_colors, p.C_MGN2,p.C_MGN3,p.C_MGN4);
ds_list_add(_dl_tunic_colors, p.C_PNK2,p.C_PNK3,p.C_PNK4);
ds_list_add(_dl_tunic_colors, p.C_RED2,p.C_RED3,p.C_RED4);
ds_list_add(_dl_tunic_colors, p.C_ORG2,p.C_ORG3,p.C_ORG4);
ds_list_add(_dl_tunic_colors, p.C_YLW2,p.C_YLW3,p.C_YLW4);
ds_list_add(_dl_tunic_colors, choose(p.C_YGR2,p.C_GRN2,p.C_GRB2), choose(p.C_YGR3,p.C_GRN3,p.C_GRB3), choose(p.C_YGR4,p.C_GRN4,p.C_GRB4));
ds_list_add(_dl_tunic_colors, p.C_CYN2,p.C_CYN3,p.C_CYN4);
//ds_list_add(_dl_tunic_colors, choose(p.C_BLU1,p.C_VLT1,p.C_TEL1), choose(p.C_BLU2,p.C_VLT2,p.C_TEL2), choose(p.C_BLU3,p.C_VLT3,p.C_TEL3), choose(p.C_BLU4,p.C_TEL4));

// Limiting the number of brights because their colors aren't very distinct
var             _dl_bright_colors = ds_list_create(); // bright acceptable tunic colors
ds_list_add(    _dl_bright_colors, p.C_BLU1,p.C_VLT1,p.C_PUR1,p.C_MGN1,p.C_PNK1,p.C_RED1,p.C_ORG1,p.C_YLW1,p.C_YGR1,p.C_GRN1,p.C_GRB1,p.C_CYN1);
ds_list_shuffle(_dl_bright_colors);
ds_list_add(_dl_tunic_colors, _dl_bright_colors[|0],_dl_bright_colors[|1],_dl_bright_colors[|2],_dl_bright_colors[|3]);

ds_list_shuffle(_dl_tunic_colors);




_i=0;

// PC -------------
_val  = build_pal(_COLOR_pc_skin, color_str(_dl_tunic_colors[|_i++]), _COLOR_pc_outline, _C_BLK1_, -2,-2,-2,-2);
_val += build_pal(_COLOR_pc_skin, color_str(_dl_tunic_colors[|_i++]), _COLOR_pc_outline, _C_BLK1_, -2,-2,-2,-2);
_val += build_pal(_COLOR_pc_skin, color_str(_dl_tunic_colors[|_i++]), _COLOR_pc_outline, _C_BLK1_, -2,-2,-2,-2);
dm_save_data[?STR_Palette+"_PC"+"01"] = _val;

// CUCCO -------------
_val  = build_pal(_COLOR_cucco_legs, _COLOR_cucco_body, color_str(_dl_tunic_colors[|_i++]), _C_BLK1_, -2,-2,-2,-2);
_val += build_pal(_COLOR_cucco_legs, _COLOR_cucco_body, color_str(_dl_tunic_colors[|_i++]), _C_BLK1_, -2,-2,-2,-2);
_val += build_pal(_COLOR_cucco_legs, _COLOR_cucco_body, color_str(_dl_tunic_colors[|_i++]), _C_BLK1_, -2,-2,-2,-2);
dm_save_data[?STR_Palette+STR_Cucco+"01"] = _val;








ds_list_destroy(_dl_1); _dl_1=undefined;
ds_list_destroy(_dl_2); _dl_2=undefined;

ds_list_destroy(_dl_colors1); _dl_colors1=undefined;
ds_list_destroy(_dl_colors2); _dl_colors2=undefined;

ds_list_destroy(_dl_tunic_colors); _dl_tunic_colors=undefined;
ds_list_destroy(_dl_bright_colors); _dl_bright_colors=undefined;
ds_list_destroy(_dl_DUNGEON_AREAS); _dl_DUNGEON_AREAS=undefined;
ds_list_destroy(_dl_DUNGEON_TILESETS); _dl_DUNGEON_TILESETS=undefined;




