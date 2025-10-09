/// Cutscene_SariaBridge_init()


Cutscene_init();


scr_step = Cutscene_SariaBridge_update;
//scr_draw = Cutscene_GameEnd_1B_draw;
//scr_iend = Cutscene_GameEnd_1B_end;


var _i;
var _clm;

     DIR    = -1; // The river search dir
if ( DIR)
{    CLM    = 0;  }
else CLM    = global.dg_solid_w-1;
     ROW    = global.dg_solid_h-2;
//
     CLM    = find_clm_solid(0, CLM,        ROW, DIR,0, CLM);
     ROW    = find_row_solid(0, CLM + -DIR, ROW,  -1,0, ROW-2);
     ROW++;
//
    _clm    = find_clm_solid(TID_SOLID1|TID_ONEWY1, CLM,ROW, DIR,0, CLM+(8*DIR));
//
     CLMS   = abs(_clm-CLM);
     CLM_L  = min(_clm,CLM) + !DIR; // left   column
     CLM_R  = CLM_L+(CLMS-1);       // right  column
     CLM_C  = CLM_L+(CLMS>>1);      // center column
//
     DIR    = sign_(global.pc.x < (CLM_C<<3));  // The direction of the build
if ( DIR)
{    CLM    = CLM_L;  }
else CLM    = CLM_R;
//
if ( CLMS>$10)
{   // Build from both ends, meet in middle.
     DIR    = 0;
     CLM    = CLM_L;
}



// var _SPEED  = clamp(argument[_arg++], 1,8); // build 1 clm every 2,4,8,16,32,64,128,256 frames
// var _TIMING = (1<<_SPEED) - 1;
SPEED = 3; // 3: Every 8 frames

BUILD_QUAL_DK = f.BuildBridge_QUAL_DK+g.rm_name;




