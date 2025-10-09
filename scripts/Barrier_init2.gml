/// Barrier_init2()


var _i, _a, _count;


can_draw_self = false;

DEPTH1 = DEPTH_ENEMY;
DEPTH2 = DEPTH_BG6+1;
GO_depth_init(DEPTH1);

DRAW_YOFF = $10;

dl_sprites[|1] = spr_Barrier_1b;
dl_sprites[|0] = spr_Barrier_1a;

dg_PI_SEQ_IDX = $08;
GO_init_palidx(p.dg_PI_SEQ[#dg_PI_SEQ_IDX,0]);
p.dg_PI_SEQ[#dg_PI_SEQ_IDX,2] = add_pi_permut(p.dg_PI_SEQ[#dg_PI_SEQ_IDX,0], "WBRGYKMC", "Barrier");


Anim_VER  = 1; // 0: OG, 1: Vertical Movement 1, 2: Vertical Movement 2
Anim_yoff = 0;


facing_dir = -1;



CLMS_DEF  = $C; // Horizontal. 8x8 tile size
clms      = CLMS_DEF; // current draw count horizontal

ROWS_DEF  = $E; // Vertical. 8x8 tile size
GROUND_Y  = get_ground_y(xl-($2<<3),yt+($2<<3), 1, yt+(ROWS_DEF<<3));
//GROUND_Y  = get_ground_y(xl,yt, 1, yt+(ROWS_DEF<<3));
ROWS_DEF  = (GROUND_Y-yt)>>3; // Vertical. 8x8 tile size
rows      = ROWS_DEF; // current draw count vertical

draw_rows = rows;
draw_clms = clms;


sub_state = 0; // 00AF[eIndex]
counter   = 0; // 0071[eIndex]
//_003F = 0; // 003F
//_0051 = 0; // 0051
//_0084 = 0; // 0084




var _PAL = color_str(p.C_RED3)+color_str(p.C_VLT2); // the colors used by Barrier
var _LEN  = string_length(_PAL);
var _pos  = palidx_def*global.PAL_CHAR_PER_PAL;
    _pos += global.PAL_CHAR_PER_PAL-_LEN;
    _pos++; // +1 bc string
change_pal(strReplaceAt(p.pal_rm_new, _pos, _LEN, _PAL));





if (g.mod_BARRIER_LOOK==1)
{
    //f.crystals = $2D; // TESTING. $3F: all crystals
    
    DRAW_YOFF = 0;
    
    set_xlyt(id, spawn_xl,spawn_yt);
    
    ROWS_DEF = $0C;
    GROUND_Y = get_ground_y(xl-($2<<3),yt+($2<<3), 1, yt+(ROWS_DEF<<3));
    ROWS_DEF = (GROUND_Y-yt)>>3; // 
    
                             _i=0;
    barrier_state_IDLE     = _i++;
    barrier_state_GREETING = _i++;
    barrier_state_RAISING  = _i++;
    barrier_state_COMPLETE = _i++;
    
    BARRIER_COUNT = f.CRYSTAL_MAX;
    dg_barrier_W  = BARRIER_COUNT;
    dg_barrier_W++; // ++: To reserve index 0 for general info
    dg_barrier = ds_grid_create(dg_barrier_W, 6);
    
    dg_barrier[#0,0] = 0; // raising/raised count
    // 0:Idle, 1:Crystals' greeting, 2:Raising, 3:Raise complete
    for(_i=1; _i<dg_barrier_W; _i++)
    {
        dg_barrier[#_i,0]  = val(f.dm_quests[?g.rm_name+STR_Barrier+hex_str(_i)+STR_State]);
        dg_barrier[# 0,0] += dg_barrier[#_i,0]==barrier_state_COMPLETE; // 3: Raise complete
        //sdm("dg_barrier[#0,0]: "+string(dg_barrier[#0,0])+", dg_barrier[#"+string(_i)+",0]: "+string(dg_barrier[#_i,0]));
        
        dg_barrier[#_i,2]  = ROWS_DEF; // current num of rows left.
        dg_barrier[#_i,3]  = false; // barrier can draw
    }
    
    
    
        PLACED_CRYSTALS_REQUIREMENT_COUNT = get_saved_value(f.file_num, STR_Crystal+STR_Required+STR_Count, f.CRYSTAL_MAX);
        //PLACED_CRYSTALS_REQUIREMENT_COUNT = 4; // *** TESTING ***
        //sdm("dg_barrier[#0,0]: "+string(dg_barrier[#0,0])+", f.crystals $"+hex_str(f.crystals)+", bitCount(f.crystals): "+string(bitCount(f.crystals)));
    if (PLACED_CRYSTALS_REQUIREMENT_COUNT<f.CRYSTAL_MAX          // if dont have to place all the crystals
    &&  PLACED_CRYSTALS_REQUIREMENT_COUNT<=bitCount(f.crystals)  // if have placed enough crystals
    &&  dg_barrier[#0,0]                                         // if any barriers have been raised yet
    &&  dg_barrier[#0,0]>=bitCount(f.crystals) )                 // all that can be raised, have been raised
    {
        dg_barrier[#0,0] = 0;
        for(_i=1; _i<dg_barrier_W; _i++)
        {
            dg_barrier[# 0,0]++;
            dg_barrier[#_i,0] = barrier_state_COMPLETE;
            f.dm_quests[?g.rm_name+STR_Barrier+hex_str(_i)+STR_State] = barrier_state_COMPLETE;
        }
    }
    
    
    CRYSTAL_SPR_1A = spr_Crystal_1a;   // 1a: Placing-Crystal spr. 10 pixel high graphic
    CRYSTAL_SPR_1B = spr_Crystal_1b;   // 1b: Empty-Crystal ver of 1a.
    CRYSTAL_SPR_W  = sprite_get_width(CRYSTAL_SPR_1A);
    
    SND_CRYSTAL = get_audio_theme_track(STR_Sword+STR_Beam);
    
    
    
    // -----------------------------------------------------------------------
                              _a=1;
    SUB_STATE_DELAY1        = _a++;
    SUB_STATE_IDLE          = _a++;
    SUB_STATE_CRYSTAL_HELLO = _a++;
    SUB_STATE_RAISING       = _a++;
    SUB_STATE_COMPLETE      = _a++;
    sub_state               = SUB_STATE_IDLE;
    
    
    
    BARRIER_W       = $02<<3;
    BARRIER_H       = ROWS_DEF<<3;
    BARRIER_PAD     = $02<<3; // Dist between each barrier.
    BARRIER_AREA_W  = (BARRIER_W   *  BARRIER_COUNT);
    BARRIER_AREA_W += (BARRIER_PAD * (BARRIER_COUNT-1));
    BARRIER_AREA_H  =  BARRIER_H;
    
    
    Barrier_update_2a(); // set dg_barrier[#0,1] (curr barrier num being raised)
}




