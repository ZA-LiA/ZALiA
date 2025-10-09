/// Kakusu001_init2()

/* DthMt_0F(1st rm of HAMMER caves)
    There are 5 short pillars in a row.
    Must start at LEFT end pillar and jump 
    on each following pillar w/out touching ground.
*/


var _i,_j,_k, _idx, _a;
var _x,_y;
var _data;


                    _a=1;
SUB_STATE_CHLG_1A = _a++;
SUB_STATE_CHLG_1B = _a++;
SUB_STATE_ACTV    = _a++;
sub_state         = SUB_STATE_CHLG_1A;


abilities |= ABL_WALK;
abilities |= ABL_JUMP;
abilities |= ABL_RUN_;
//abilities |= ABL_SHOT;


VSPD_REVEAL = vspd_jump;

//jump_chance = JUMP_CHANCE2; // JUMP_CHANCE1=$80, JUMP_CHANCE2=$40



var _CLM = global.dg_solid_w;
var _ROW = global.dg_solid_h;
var _clm = 0;
var _row = 0;


Platform_COUNT  = 5;

PLATFORM_DEPTH  = DEPTH_BG2;
PLATFORM_PI     = global.PI_BGR2;
PLATFORM_PI     = val(p.dm_depth_pi[?hex_str(abs(PLATFORM_DEPTH))], PLATFORM_PI);
PLATFORM_DEPTH--;
PLATFORM_TS     = ts_DungeonA01;


PlatformNext_idx = 0;

TSRC_IDX = Platform_COUNT-1;
SURF_IDX = TSRC_IDX-1;
SPR_IDX  = TSRC_IDX-1;

// I can't get the coloring right on these surfaces so 
// I'm adding a flag to easily test using either sprite or surface.
USE_SURF = true;

dg_platform = ds_grid_create(Platform_COUNT, 5);
if (USE_SURF)
{
    for(_i=0; _i<Platform_COUNT; _i++)
    {
                     dg_platform[#_i,SURF_IDX] = surface_create($10,$10);
        surface_free(dg_platform[#_i,SURF_IDX]);
    }
}


// These are the options to choose from. 
// Each nybble's value is a diff pillar head and the row in the tileset.
// Add as many combos another _dl_TSRC[i] line w/ diff combo.
var         _dl_TSRC = ds_list_create();
ds_list_add(_dl_TSRC, $1011); //  0 0,1
ds_list_add(_dl_TSRC, $1311); //  1 1,3
ds_list_add(_dl_TSRC, $0011); //  2 0,1
ds_list_add(_dl_TSRC, $0101); //  3 0,1
ds_list_add(_dl_TSRC, $3010); //  4 0,1,3
ds_list_add(_dl_TSRC, $2111); //  5 1,2
ds_list_add(_dl_TSRC, $1110); //  6 0,1
ds_list_add(_dl_TSRC, $1001); //  7 0,1
ds_list_add(_dl_TSRC, $3100); //  8 0,1,3
ds_list_add(_dl_TSRC, $1010); //  9 0,1
// ds_list_add(_dl_TSRC, $); // 10
//                              // 
for(_i=ds_list_size(_dl_TSRC)-1; _i>=0; _i--)
{
    _data = _dl_TSRC[|_i];
                       _row = (_data>>$C)&$F;
    _dl_TSRC[|_i]  = ((_row<<4)|$0) <<$00; // ts clm $0: TOP-LFT. 
    //                                    // 
                       _row = (_data>>$8)&$F;
    _dl_TSRC[|_i] |= ((_row<<4)|$1) <<$08; // ts clm $1: TOP-RGT. 
    //                                    // 
                       _row = (_data>>$4)&$F;
    _dl_TSRC[|_i] |= ((_row<<4)|$4) <<$10; // ts clm $4: BTM-LFT. 
    //                                    // 
                       _row = (_data>>$0)&$F;
    _dl_TSRC[|_i] |= ((_row<<4)|$5) <<$18; // ts clm $5: BTM-RGT. 
    //                                    // 
}


dg_platform[#0,TSRC_IDX] = _dl_TSRC[|5]; // 
dg_platform[#1,TSRC_IDX] = _dl_TSRC[|9]; // 
dg_platform[#2,TSRC_IDX] = _dl_TSRC[|1]; // 
dg_platform[#3,TSRC_IDX] = _dl_TSRC[|7]; // 
dg_platform[#4,TSRC_IDX] = _dl_TSRC[|8]; // 

ds_list_destroy(_dl_TSRC); _dl_TSRC=undefined;




for(_i=0; _i<Platform_COUNT; _i++)
{
    _idx = max(0,_i-1);
    _clm = dg_platform[#_idx,1] + 3;
    for(_j=_clm; _j<_CLM; _j++) // lft to rgt
    {
        for(_k=_ROW-1; _k>=0; _k--) // btm to top
        {
            if (global.dg_solid[#_j,_k]&TID_ONEWY1)
            {
                dg_platform[#_i,1] = _j;
                dg_platform[#_i,2] = _k;
                
                _j = _CLM;
                break;//_k
            }
        }
    }
}


_idx = Platform_COUNT-3; // Which platform will Kakusu spawn from when revealed.
_x = (dg_platform[#_idx,1]<<3) + ww_;
_y = (dg_platform[#_idx,2]<<3) - hh_;
set_xy(id, _x,_y);


if(0){
    for(var _i=0; _i<Platform_COUNT; _i++){
        var _str  = string(_i)+": ";
            _str += "clm $"+hex_str(dg_platform[#_i,1])+", ";
            _str += "row $"+hex_str(dg_platform[#_i,2]);
        sdm(_str);
    }
    /* output:
    0: clm $10, row $18
    1: clm $18, row $18
    2: clm $20, row $18
    3: clm $28, row $18
    4: clm $30, row $18
    */
}



Kakusu_init2();




