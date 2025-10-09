/// Cutscene_MoaiOpenMouth2_init_2()


var _i,_j, _a;
var _ROW0 = g.rm_rows-PAGE_ROWS;

scr_step = Cutscene_MoaiOpenMouth2_update;

//GO_sprite_init(spr_Moai_mouth_3a_1); // wider, taller
GO_sprite_init(spr_Moai_mouth_3a); // wider, taller
//GO_sprite_init(spr_Moai_mouth_2a);
//GO_sprite_init(spr_Moai_mouth_2a_1); // Shorter mouth

TILE_DEPTH = DEPTH_BG5;
GO_depth_init(TILE_DEPTH-1);



                      _a=1;
SUB_STATE_IDLE      = _a++;
SUB_STATE_ACTV1     = _a++;
SUB_STATE_OPEN1     = _a++;
SUB_STATE_OPEN2     = _a++;
SUB_STATE_WALK      = _a++;
SUB_STATE_DONE      = _a++;
sub_state           = SUB_STATE_IDLE;



spawn_xl = $1D<<3;
spawn_yt = (_ROW0+$1C)<<3; // _ROW0+$1C: ground row
set_xlyt(id, spawn_xl,spawn_yt);

//sdm("Cutscene_MoaiOpenMouth2_init_2 dk_spawn: "+dk_spawn);

PC_DEPTH        = TILE_DEPTH+1;
PC_DEPTH_DEF    = global.pc.depth_def;
//global.pc.depth_def  = PC_DEPTH;


var _EXIT_NAME = g.rm_name+"00";
if(!is_undefined(                dk_spawn))
{   _EXIT_NAME = val(g.dm_spawn[?dk_spawn+STR_Data+"01"], _EXIT_NAME);  }

Exit_inst = noone;
with(Exit)
{
    if (exitName==_EXIT_NAME)
    {
        other.Exit_inst = id;
        break;
    }
}


    opened = false;
if(!is_undefined(             dk_spawn))
{   opened = val(f.dm_quests[?dk_spawn+STR_Open]);  }

if (opened)
{
    if (Exit_inst)
    {   Exit_inst.open = 1;  }
    
    rows_up = ROWS;
    set_xlyt(id, xl, spawn_yt-hh);
    
    var _x,_y;
    
    for(_i=0; _i<ww>>3; _i++)
    {
        _x = xl+(_i<<3);
        for(_j=0; _j<ROWS; _j++)
        {   // Remove tiles behind sprite
            _y = yt+(_j<<3);
            tile_change_1a(TILE_DEPTH, _x,_y, 0,0);
        }
    }
}


if (opened 
||  Exit_inst!=g.exit_enter )
{
    //global.pc.depth_def  = PC_DEPTH_DEF;
    //g.pc_lock       = 0;
    //g.cutscene      = 0;
    
    timer     = 0;
    sub_state = SUB_STATE_DONE;
    //instance_destroy();
}



//sdm("Cutscene_MoaiOpenMouth2 dk_spawn: "+dk_spawn);
//sdm(""); sdm("Cutscene_MoaiOpenMouth2 exitname: "+string(val(g.dm_rm_data[?dk_spawn+STR_Exit+STR_Name])));
//sdm("g.exit_enter.exitName: "+g.exit_enter.exitName+", Exit_inst==g.exit_enter "+string(Exit_inst==g.exit_enter));




