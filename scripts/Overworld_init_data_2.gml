/// Overworld_init_data_2()

show_debug_message("Overworld_init_data_2()");


var _data;


dm_file_data = -1;

var             _FILE_NAME1 = 'ow_tile_data/OverworldData01.txt';
if (file_exists(_FILE_NAME1))
{
    var _FILE      = file_text_open_read(working_directory+_FILE_NAME1);
    var _FILE_DATA = file_text_read_string(_FILE);
                     file_text_close(      _FILE);
    dm_file_data = json_decode(_FILE_DATA);
}
else
{
    show_debug_message('');
    show_debug_message('!!!! WARNING! Overworld_init_data_2(). File  `ow_tile_data/OverworldData01.txt`  does not exist !!!!');
    show_debug_message('');
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (dm_file_data==-1)
{
    show_debug_message('');
    show_debug_message('!!!! WARNING! Overworld_init_data_2(). `dm_file_data = json_decode(_FILE_DATA);` failed to get data !!!!');
    show_debug_message('');
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


_data = dm_file_data[?dk_Map0];
if (is_undefined(_data))
{
    show_debug_message('');
    show_debug_message('!!!! WARNING! Overworld_init_data_2(). `dm_file_data[?dk_Map0]` is undefined !!!!');
    show_debug_message('');
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


dm = json_decode(_data);
if (dm==-1)
{
    show_debug_message('');
    show_debug_message('!!!! WARNING! Overworld_init_data_2(). `dm = json_decode(_data);` failed to get data !!!!');
    show_debug_message('');
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








var _owrc,_owrc_;
var _scene_id;




OW_CLMS = $0100;
OW_ROWS = $0100;
OW_W = OW_CLMS<<SHIFT;
OW_H = OW_ROWS<<SHIFT;








_owrc=$5D56; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5D56;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5D56; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5D56;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4B2A; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4B2A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4B2A; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_05';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4B2A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8230; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8230;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8030; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_08';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8030;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7264; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7264;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7264; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7264;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7C91;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7C91;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$617D; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $617D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$617D; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_11';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $617D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$95B8; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_12';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $95B8;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A39C; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_15';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A39C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A39C; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_17';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A39C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_19';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7B93;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D5C1; _owrc_=hex_str(_owrc);
_scene_id = '_TownB_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D5C1;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D5C1; _owrc_=hex_str(_owrc);
_scene_id = '_TownB_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D5C1;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3C64; _owrc_=hex_str(_owrc);
_scene_id = '_PalcA_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3C64;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3C64; _owrc_=hex_str(_owrc);
_scene_id = '_PalcA_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3C64;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6734; _owrc_=hex_str(_owrc);
_scene_id = '_PalcB_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6734;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6734; _owrc_=hex_str(_owrc);
_scene_id = '_PalcB_14';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6734;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7CB8; _owrc_=hex_str(_owrc);
_scene_id = '_PalcE_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7CB8;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7CB8;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7CB8; _owrc_=hex_str(_owrc);
_scene_id = '_PalcE_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7CB8;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8961; _owrc_=hex_str(_owrc);
_scene_id = '_PalcC_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8961;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8961; _owrc_=hex_str(_owrc);
_scene_id = '_PalcC_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8961;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcD_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FD6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcD_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5FD6;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$ABAC; _owrc_=hex_str(_owrc);
_scene_id = '_PalcF_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $ABAC;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$ABAC; _owrc_=hex_str(_owrc);
_scene_id = '_PalcF_16';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $ABAC;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$897E; _owrc_=hex_str(_owrc);
_scene_id = '_PalcG_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $897E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$EAD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcH_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $EAD6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$897E; _owrc_=hex_str(_owrc);
_scene_id = '_PalcG_3C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $897E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$63C7; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $63C6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $63C8;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$69CA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $69C9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $69CB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FC3; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_03';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $5FC3;             // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FC3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$61D3; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $61D3;             // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $61D3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FCA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_05';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FC9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5FCB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$56CD; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $55CD;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $57CD;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$57C8; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_07';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $57C7;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $57C9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$53CA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_08';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $53C9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $53CB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4FCC; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4FCB;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4FCD;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5AD9; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_0A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5AD9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5AD9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$68B1; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $68B0;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$68BF; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_00';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $68C0;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$982A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $982A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$952D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_01';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $952D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9632; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9632;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9835; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_02';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9835;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9A3C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_03';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9A3C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$963C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_03';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $963C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B2D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B2D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_04';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B31;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E2D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_05';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E2D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D2F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_05';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9D2F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D38; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D38;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E3A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_06';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E3A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A12E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_07';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A12E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A42F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_07';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A42F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E3E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_08';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E3E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A03F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_08';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A03F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A53E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A53E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A33F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_09';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A33F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A92D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A92D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A731; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0A';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A731;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A839; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A839;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A73C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0B';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A73C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA37; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AA37;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA3D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0C';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AA3D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AF3A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AF3A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AD3C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0D';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AD3C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AD40; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AD40;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA42; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0E';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AA42;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AE34; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AE34;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9939; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_16';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9939;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9538; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_16';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9538;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D33; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_17';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D33;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E35; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_17';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E35;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A232; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_18';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A232;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A134; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_18';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A134;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A435; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_19';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A435;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A438; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_19';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A438;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AE32; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AE32;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9341; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9341;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$893D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1C';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $893D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A828; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A828;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A81E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1F';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A81E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A81B; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_21';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $A81B;             // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BA2E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $BA2E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$B448; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_24';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $B448;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $B448;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A53A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A53A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8C31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B31;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D33; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D34;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C13E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_31';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $C13E;             // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8E31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2C';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8F31;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D9D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D9C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9D9E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A49F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A49E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A4A0;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8C8F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B8F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D8F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$918B; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_03';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $908B;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $928B;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$948D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $948C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $948E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A092; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_05';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9F92;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A192;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6483; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6383;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6583;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$78B9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_07';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $78B9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $78B9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7492; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_08';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7492;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7095; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_08';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7095;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8793; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8793;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8E99; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8E99;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8EAB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8EAB;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8EB3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8EB3;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8B7C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_10';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B7C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8B7E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_10';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8B7E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D80; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_13';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8D80;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D84; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_14';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D84;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6684; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_17';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6584;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6784;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9682; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_18';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9582;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9782;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$937D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_19';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $927D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $947D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A382; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A381;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A383;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$81AF; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_21';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $81AF;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $81AF;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $81AF;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7A84; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_26';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7A84;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7A84;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7A84;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9BB0; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9BB0;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9BB0;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9BB0;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8487; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8487;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8487;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $8487;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A7AA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A7AA;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A7AA;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9194; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_33';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9194;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9194;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9194;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6CAA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6CAA;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6CAA;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6CAA;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$789C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $789C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $789C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $789C;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A395; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A395;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A395;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $A395;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B7E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B7E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B7E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9B7E;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5E82; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_11';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5E82;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$729F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_12';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $729F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$94A9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_15';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $94A9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $94A9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8996; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_16';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8996;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$46A3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_6A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $46A3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $46A3;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$698D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $698D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E7C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E7C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$1F68; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_20';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $1F68;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $1F68;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$63A3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_23';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $63A3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $63A3;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$87B2; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_68';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $86B2;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$37A5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_29';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $38A5;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$36A5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $38A5;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3AA4; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_52';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3AA4;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$839C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_24';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $839C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $839C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F6C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $0F6C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F72; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_41';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $0F72;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$1598; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_31';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $1598;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $1598;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$98BB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_69';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $97BB;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B8F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_36';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B8F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B8F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9B8F;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$288E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_37';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $288E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $288E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$88B2; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_68';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $89B2;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$99BB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_69';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9ABB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D548; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_48';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D547;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DA4E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_49';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DA4E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D84C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_49';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D84C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D559; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D559;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E446; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E346;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E545; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4E';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E645;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E750; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E750;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E750;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $E750;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7795; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_5B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7795;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7795;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$788D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_62';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $788D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $788D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8587; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_70';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8587;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8587;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BFC9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_77';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $BFC9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BF94; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_78';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $BF93;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0C3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D0C3;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBC4; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBC4;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BFD0; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_80';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $BFD0;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C1D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_81';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C1D3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C0DA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_84';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C0DA;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C7D7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_87';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C7D7;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCCA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCCA;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C4DC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_85';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C4DC;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C8DC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_86';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C8DC;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBD1; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_88';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBD1;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CACB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'21'+STR_OWRC]      = $CACB;             // goto owrc
g.dm_rm[?_scene_id+'21'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'21'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D0D3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDD9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8D';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDD9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DEB3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_64';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $DEB3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D6D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_90';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D6D3;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D6D3;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E0BD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_A0';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E0BD;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C9C1; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_91';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C9C1;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C9C1;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C8BD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_92';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C8BD;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C8BD;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDB6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_93';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDB6;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CDB6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D3B5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_94';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D3B5;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D3B5;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBBE; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_95';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBBE;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBBE;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCBC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_96';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CCBC;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCBC;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CABB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_97';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CABB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CABB;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCBA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_98';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CCBA;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCBA;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBB9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_99';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBB9;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBB9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDB8; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDB8;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CDB8;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CEB7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CEB7;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CEB7;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D1B6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D1B6;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D1B6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0B7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D0B7;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D0B7;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D3B6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D3B6;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D3B6;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CABD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CABD;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CABD;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D9C6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B2';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D9C6;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A08A; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_C6';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A08A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DCC8; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B3';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $DCC7;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DBC8;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E0CB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B4';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E1CB;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DFCB;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D7C6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B5';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D7C7;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E4CD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B6';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E4CE;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E4CC;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D7C5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B5';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D7C4;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$10B9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $10B9;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D64B; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D64B;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E261; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_42';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E261;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$867E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $867E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B3F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_00';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $5B3F;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7938; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7838;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7A38;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7E42; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_02';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7E41;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7E43;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8842; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8841;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8849; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_05';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $884A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6266; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6166;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6366;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$555F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_07';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $555F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4D56; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_07';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4D56;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B44; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_03';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5B45;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6129; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6129;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$652B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $652B;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$654E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $654E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6C31; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6C31;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$655E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_10';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $655E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$875A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_12';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $875A;             // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $875A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D64; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D64;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$672F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_14';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $672F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $672F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $672F;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$733C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_15';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $733C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $733C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $733C;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7439; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_16';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7439;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7439;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7439;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$743D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_17';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $743D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $743D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $743D;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B38; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5B37;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$743F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $743F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $743F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $743F;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$753B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $753B;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $753B;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $753B;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D4E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8D4E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D4E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $8D4E;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F47; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_20';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F47;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7F47;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7F47;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4745; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_21';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4745;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6766; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_26';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6766;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6766;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6766;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$514D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $514D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $514D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $514D;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6338; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6338;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7D3C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7D3C;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7D3C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7D3C;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6E30; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_33';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6E30;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6E30;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6E30;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6D4F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_34';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6D4F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6D4F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$825E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_38';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $825E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $825E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $825E;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6B4D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6B4D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6B4D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6B4D;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$563F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_29';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $563F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $563F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F5A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_24';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F5A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7F5A;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$733D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_25';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $733D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $733D;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6F38; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_08';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6F38;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6B37; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_08';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6B37;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8535; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_37';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8535;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8535;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3A5E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3A5E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3A5E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5D33; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5D33;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F57; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_60';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F57;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F47; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $0F47;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $0F47;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $0F47;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3D5F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_43';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3E5F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3C5F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$493C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $493C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$2F31; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_44';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $2F31;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7919; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7919;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$751F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $741F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7428; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4F';
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7428;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$751C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_52';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $741C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$681D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_55';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $681D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E4F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_45';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E4F;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E4F;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9E4F;             // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F;               // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6A3E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_47';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6A3E;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6A3E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$405E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_58';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $405E;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$415D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_58';
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $415D;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$432A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_FF';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $432A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$402B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_F8';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $402B;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6E64; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_40';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6E64;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6965; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_5C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6965;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A44B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_59';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A44A;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A44C;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7416; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_53';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7315;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6057; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_5B';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc;             // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5F57;             // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08;               // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6157;             // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04;               // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit








// STR_Scene+STR_OWRC
// This is an exit obj that's soley here to 
// indicate the owrc of a scene so pause menu 
// map will acurately show the ow position of PC.
// _data Example: '_WestA_FF'
// _data Example: '_WestA_FA,_WestA_F4,_WestA_F3'  (all share same owrc)

_owrc = $452A;
g.dm_rm[?'_WestA_FF'+STR_OWRC] = _owrc;

_owrc = $BFA4;
g.dm_rm[?'_EastA_75'+STR_OWRC] = _owrc;

_owrc = $BFBA;
g.dm_rm[?'_EastA_76'+STR_OWRC] = _owrc;

_owrc = $3E2B;
g.dm_rm[?'_WestA_F7'+STR_OWRC] = _owrc;

_owrc = $3B2B;
g.dm_rm[?'_WestA_FE'+STR_OWRC] = _owrc;

_owrc = $5B3E;
g.dm_rm[?'_WestA_18'+STR_OWRC] = _owrc;

_owrc = $5B3B;
g.dm_rm[?'_WestA_19'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_48'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_49'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3D'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3E'+STR_OWRC] = _owrc;

_owrc = $5B42;
g.dm_rm[?'_WestA_03'+STR_OWRC] = _owrc;

_owrc = $5B40;
g.dm_rm[?'_WestA_31'+STR_OWRC] = _owrc;

_owrc = $5B3F;
g.dm_rm[?'_WestA_00'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_32'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3C'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_42'+STR_OWRC] = _owrc;

_owrc = $6C31;
g.dm_rm[?'_WestA_0F'+STR_OWRC] = _owrc;

_owrc = $632A;
g.dm_rm[?'_WestA_0A'+STR_OWRC] = _owrc;

_owrc = $492A;
g.dm_rm[?'_TownA_03'+STR_OWRC] = _owrc;

_owrc = $655E;
g.dm_rm[?'_WestA_11'+STR_OWRC] = _owrc;

_owrc = $8B5D;
g.dm_rm[?'_WestA_13'+STR_OWRC] = _owrc;

_owrc = $4745;
g.dm_rm[?'_WestA_36'+STR_OWRC] = _owrc;

_owrc = $733D;
g.dm_rm[?'_TownA_5F'+STR_OWRC] = _owrc;

_owrc = $8D31;
g.dm_rm[?'_DthMt_2C'+STR_OWRC] = _owrc;

_owrc = $812F;
g.dm_rm[?'_WestA_4A'+STR_OWRC] = _owrc;

_owrc = $7E22;
g.dm_rm[?'_WestA_4C'+STR_OWRC] = _owrc;

_owrc = $7C20;
g.dm_rm[?'_WestA_4D'+STR_OWRC] = _owrc;

_owrc = $7523;
g.dm_rm[?'_WestA_4F'+STR_OWRC] = _owrc;

_owrc = $AE34;
g.dm_rm[?'_DthMt_0F'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_10'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_11'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_12'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_13'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_14'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_15'+STR_OWRC] = _owrc;

_owrc = $BA2E;
g.dm_rm[?'_DthMt_23'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_22'+STR_OWRC] = _owrc;

_owrc = $A81B;
g.dm_rm[?'_DthMt_21'+STR_OWRC] = _owrc;

_owrc = $C13E;
g.dm_rm[?'_DthMt_31'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_30'+STR_OWRC] = _owrc;

_owrc = $8848;
g.dm_rm[?'_WestA_05'+STR_OWRC] = _owrc;

_owrc = $8843;
g.dm_rm[?'_WestA_04'+STR_OWRC] = _owrc;

_owrc = $BF95;
g.dm_rm[?'_EastA_74'+STR_OWRC] = _owrc;

_owrc = $68B8;
g.dm_rm[?'_MazIs_00'+STR_OWRC] = _owrc;

_owrc = $7C91;
g.dm_rm[?'_TownA_78'+STR_OWRC] = _owrc;

_owrc = $654E;
g.dm_rm[?'_WestA_0D'+STR_OWRC] = _owrc;

_owrc = $3A2B;
g.dm_rm[?'_WestA_FA'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F6'+STR_OWRC] = _owrc;

_owrc = $3C2B;
g.dm_rm[?'_WestA_F4'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F5'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F3'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_FC'+STR_OWRC] = _owrc;

_owrc = $6E64;
g.dm_rm[?'_WestA_41'+STR_OWRC] = _owrc;

_owrc = $8E99;
g.dm_rm[?'_EastA_0C'+STR_OWRC] = _owrc;

_owrc = $8793;
g.dm_rm[?'_EastA_0A'+STR_OWRC] = _owrc;

_owrc = $A7AA;
g.dm_rm[?'_EastA_34'+STR_OWRC] = _owrc;

_owrc = $36A5;
g.dm_rm[?'_EastA_50'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_51'+STR_OWRC] = _owrc;

_owrc = $7C91;
g.dm_rm[?'_EastA_53'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_54'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_56'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_57'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_58'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_59'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5A'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5C'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5D'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5E'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5F'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_61'+STR_OWRC] = _owrc;

_owrc = $1598;
g.dm_rm[?'_EastA_63'+STR_OWRC] = _owrc;

_owrc = $C0D5;
g.dm_rm[?'_EastA_82'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_83'+STR_OWRC] = _owrc;

_owrc = $CCCF;
g.dm_rm[?'_EastA_89'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_8A'+STR_OWRC] = _owrc;

_owrc = $E8B9;
g.dm_rm[?'_EastA_A2'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A3'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A4'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A5'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A6'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A7'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A8'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_AA'+STR_OWRC] = _owrc;

_owrc = $D6C2;
g.dm_rm[?'_EastA_B0'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_B1'+STR_OWRC] = _owrc;

_owrc = $AE34;
g.dm_rm[?'_DthMt_10'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_11'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_12'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_13'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_14'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_15'+STR_OWRC] = _owrc;

_owrc = $D54A;
g.dm_rm[?'_EastA_4F'+STR_OWRC] = _owrc;

_owrc = $839C;
g.dm_rm[?'_TownA_74'+STR_OWRC] = _owrc;

_owrc = $DEB3;
g.dm_rm[?'_EastA_65'+STR_OWRC] = _owrc;

_owrc = $46A3;
g.dm_rm[?'_EastA_6B'+STR_OWRC] = _owrc;

_owrc = $8587;
g.dm_rm[?'_EastA_71'+STR_OWRC] = _owrc;

_owrc = $EBB7;
g.dm_rm[?'_EastA_A1'+STR_OWRC] = _owrc;

_owrc = $6B32;
g.dm_rm[?'_WestA_5A'+STR_OWRC] = _owrc;

_owrc = $7F5A;
g.dm_rm[?'_WestA_60'+STR_OWRC] = _owrc;

_owrc = $6733;
g.dm_rm[?'_PalcB_16'+STR_OWRC] = _owrc;

_owrc = $7518;
g.dm_rm[?'_WestA_54'+STR_OWRC] = _owrc;

_owrc = $897E;
g.dm_rm[?'_EastA_C0'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C1'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C2'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C3'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C6'+STR_OWRC] = _owrc;




_data = dm_file_data[?'dg_boulders'];
if(!is_undefined(_data)) ds_grid_read(dg_boulders, _data);




   BoulderCircle_center_OWRC = $C13E;
dl_BoulderCircle_OWRC[|$00]  = $BE3E;
dl_BoulderCircle_OWRC[|$01]  = $BF40;
dl_BoulderCircle_OWRC[|$02]  = $C141;
dl_BoulderCircle_OWRC[|$03]  = $C340;
dl_BoulderCircle_OWRC[|$04]  = $C43E;
dl_BoulderCircle_OWRC[|$05]  = $C33C;
dl_BoulderCircle_OWRC[|$06]  = $C13B;
dl_BoulderCircle_OWRC[|$07]  = $BF3C;




_data = dm_file_data[?'HiddenExitIndicator_dg'];
if(!is_undefined(_data)) ds_grid_read(HiddenExitIndicator_dg, _data);




_data = dm_file_data[?'dg_ChangeTiles_Boots'];
if(!is_undefined(_data)) ds_grid_read(dg_ChangeTiles_Boots, _data);




_data = dm_file_data[?'dg_tsrc_def'];
if(!is_undefined(_data)) ds_grid_read(dg_tsrc_def, _data);
ds_grid_copy(dg_tsrc, dg_tsrc_def);


_data = dm_file_data[?'dg_solid_def'];
if(!is_undefined(_data)) ds_grid_read(dg_solid_def, _data);
ds_grid_copy(dg_solid, dg_solid_def);




_data = dm_file_data[?'dg_area'];
if(!is_undefined(_data)) ds_grid_read(dg_area, _data);


_data = dm_file_data[?'dg_AreaNames'];
if(!is_undefined(_data)) ds_grid_read(dg_AreaNames, _data);




ds_map_destroy(dm_file_data); dm_file_data=undefined;




