/// Geldarm_init2()

// GeldA


var _i, _val, _count, _dk, _pos;


if(!is_undefined(dk_spawn) 
&& !is_undefined(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized]) )
{    GO_depth_init(DEPTH_BG4+1);  } // attempting to stop from hiding behind tile graphics in enemy rando
else GO_depth_init(DEPTH_BG6+1);

if (g.dungeon_num)
{
    var _layer_name, _depth, _ci_;
    for(_i=ds_list_size(g.dl_TILE_DEPTH_NAMES)-1; _i>=0; _i--)
    {
        _dk = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
        //if(!string_pos("BG",_dk)) break;//_i
        _depth      = g.dm_TILE_DEPTH[?_dk];
        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
        if(!is_undefined(_depth) 
        && !is_undefined(_layer_name) 
        //&&  string_pos("STRUCTURE_FGWALL01_01",_layer_name) )
        &&  string_pos("PILLAR",_layer_name) )
        {
            GO_depth_init(_depth-1);
            break;//_i
        }
    }
}


SEGMENT_SPR = spr_Geldarm2;
   HEAD_SPR = spr_Geldarm1;
//HEAD_SPR = spr_Geldarm1a_1; // Testing better looking segment overlap

dl_sprites[|0] = spr_Placement_08x16;

// So the shadow color is black
_val = color_str(p.C_BLK1);
_pos  = string_pos("B",global.PAL_BASE_COLOR_ORDER) - 1;
_pos *= global.PAL_CHAR_PER_COLOR;
_pos += get_pal_pos(palidx_def);
change_pal(strReplaceAt(p.pal_rm_new, _pos, string_length(_val), _val));


SEGMENTS = 5; // 5: OG
SEGMENTS = 4 + (rand()&$3) + (update_idx&$1); // 4-7
//

HEAD_DRAW_YOFF    = 0;
SEGMENT_OVERLAP   = 3; // Amt each segment overlaps eachother (fully unscrunched).
if(0){ // Testing
HEAD_DRAW_YOFF    = 1;
SEGMENT_OVERLAP   = 2;
}

var _SEGMENT_H   = sprite_get_height(SEGMENT_SPR);
var _HEIGHT_MAX  = (SEGMENTS * _SEGMENT_H) + _SEGMENT_H; // +1 for head
    _HEIGHT_MAX -= (SEGMENTS *  SEGMENT_OVERLAP);
    _HEIGHT_MAX--; // In OG the bottom 2 segments are overlapping by 1 extra pixel
//

GROUND_Y = spawn_yt + hh;
GROUND_Y = get_ground_y(x,GROUND_Y-8, 1,GROUND_Y, TID_SOLID1|TID_ONEWY1);
//GROUND_Y = get_ground_y(x,GROUND_Y-8, 1,GROUND_Y);



set_xlyt(id, xl, GROUND_Y-_HEIGHT_MAX);



facing_dir = dir_to_pc_1();


isIdle      = true; // 00AF,X. 1: fully unscrunched, 0: all else
MIN_Y       = yt;
MAX_Y       = MIN_Y + (_HEIGHT_MAX-_SEGMENT_H); // 0081,X
DIFF_DW     =  1;
DIFF_UP     = -2;
scrunch_dir =  0; // 0060,X schrunch state. idle 0,  down +1,  up -2,


sway_dir         = -1;
xScale           = -1;
addOneY_cnt      =  0;
segmentYOff      =  0;
canDraw_segments =  1;


canDrawScrunchHB = true;
SCRUNCH_W = 8; // hb w
scrunch_h = 0; // hb h

scrunchX1 = 0; // hb x
scrunchY1 = 0; // hb y
Geldarm_update_scrunchHB();




