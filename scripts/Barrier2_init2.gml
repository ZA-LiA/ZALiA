/// Barrier2_init2()


var _i, _a, _val;


DRAW_YOFF = 0;


GO_depth_init(DEPTH_BG1+1);
GO_init_palidx(global.PI_BGR4);


                      _a=1;
sub_state_IDLE1     = _a++;
sub_state_IDLE2     = _a++;
sub_state_ACTIVATING= _a++; // PC raises triforce over head to command barrier
//sub_state_PRESENT   = _a++;
sub_state_REMOVING  = _a++; // In process of removing blocks
sub_state           = sub_state_IDLE1;




Barrier1_SCENE_NAME = val(g.dm_rm[?"TriforceBarrier1"+dk_SceneName], STR_undefined);



Blocks_SPR      = spr_Block_02a;

Blocks_CLMS     = $07;
Blocks_ROWS     = $03;
Blocks_COUNT    = Blocks_CLMS * Blocks_ROWS;

Blocks_W        = Blocks_CLMS<<4;
Blocks_XC       = spawn_xl;
Blocks_XL       = Blocks_XC-(Blocks_W>>1);
Blocks_YT       = spawn_yt;

Blocks_DUR1     = $25; // same as DUR_STATE_DED
Blocks_CUE1     = $18; // 
Blocks_DUR2     = $08;
Blocks_CUE2     = Blocks_DUR1-$08; // 



Activate_SOUND_THEME = dk_Fanfare;
Activate_SOUND  = get_audio_theme_track(Activate_SOUND_THEME);
Activate_DIST   = ($03<<3) + (Blocks_W>>1);
//Activate_DIST   = ($04<<3) + (Blocks_W>>1);

PC_HOLD_BEHAVIOR = global.pc.behavior_HOLD_ITEM1;




Triforce_PI1 = global.PI_MOB_ORG;
Triforce_PI2 = add_pi_permut(Triforce_PI1, "RWBGMYKC", "triforce flash");
Triforce_pi  = Triforce_PI1;

TriforceSymbol_SPR  = spr_Triforce_2a;
TriforceSymbol_XC   = Blocks_XC;
TriforceSymbol_YC   = Blocks_YT-$10;
TriforceSymbol_YC  -= $01;




dg_Blocks = ds_grid_create(Blocks_COUNT,6);


    //_val = val(f.dm_quests[?g.TriforceBarrier1_RM_NAME+STR_Barrier+STR_State]);
if (val(f.dm_quests[?Barrier1_SCENE_NAME+STR_Barrier+STR_State]))
{
    sub_state = sub_state_IDLE2;
}
else
{
    var _CLM = Blocks_XL>>3;
    var _ROW = Blocks_YT>>3;
    var _clm,_row;
    var _clms = Blocks_CLMS<<1;
    var _rows = Blocks_ROWS<<1;
    for(_i=(_clms*_rows)-1; _i>=0; _i--)
    {
        _clm = _CLM + (_i mod _clms);
        _row = _ROW + (_i div _clms);
        global.dg_solid[#_clm,_row]=TID_SOLID1;
    }
    
    
    for(_i=0; _i<Blocks_COUNT; _i++)
    {
        dg_Blocks[#_i,0]  = 1; // state
        dg_Blocks[#_i,1]  = 0; // timer
        
        dg_Blocks[#_i,2]  = Blocks_XL;
        dg_Blocks[#_i,2] += (_i mod Blocks_CLMS)<<4;
        dg_Blocks[#_i,2] += 8;
        
        dg_Blocks[#_i,3]  = Blocks_YT;
        dg_Blocks[#_i,3] += (_i div Blocks_CLMS)<<4;
        dg_Blocks[#_i,3] += 8;
    }
}




