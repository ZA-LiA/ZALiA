/// cutscene_build_bridge_1(build dir, speed, x base, y base, *bridge clm limit, *depth, *tileset, *tsrc top, *tsrc btm)


if(!val(f.dm_quests[?BUILD_QUAL_DK]) 
||  g.ChangeRoom_timer > 0  // g.change_room_tmr is NOT a whole number. Need >0 check.
||  g.EnterRoom_SpawnGO_timer )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (g.mod_BuildBridge_COND==2  // 2: Talk to NPC only once and bridge will auto build when PC is close enough.
&& !g.cutscene 
&&  val(f.dm_quests[?BUILD_QUAL_DK]) )  // if given permission from NPC
{
    var _CLMS =  8; // PC proximity to water edge to trigger build
    var _XL   = (CLM_L-_CLMS)    <<3;
    var _DIST = (CLMS+(_CLMS<<1))<<3;
    if(!inRange(global.pc.x, _XL, _XL+_DIST))
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




// -------------------------------------------------------------------------------------
var _i;


var _arg  = 0;
var _ARGS = argument_count;



// _DIR:
//  0: Build from both ends meeting in middle, 
//  1: Build from left to right, 
// -1: Build from right to left
var _DIR    =  sign(argument[_arg++]);
var _SPEED  = clamp(argument[_arg++], 1,8); // build 1 clm every 2,4,8,16,32,64,128,256 frames
var _TIMING = (1<<_SPEED) - 1;



// -------------------------------------------------------------------------------------
// cutscene_ctr is 8 for the first piece, so I'm giving it a -8 offset. 
// var _x   =        (g.cutscene_ctr>>3)-1;
//     _x  *=        
var _x   =       (argument[_arg++]>>3)<<3;
var _Y   =       (argument[_arg++]>>3)<<3;

var                                 _CLM_LIMIT  = $10;                  // 
if (_ARGS>_arg && argument[_arg++]) _CLM_LIMIT  = argument[_arg-1];


// -------------------------------------------------------------------------------------
// +1 to guarantee cutscene_ctr = 8 for the first bridge piece instead of possibly 0 or 8
if(!g.cutscene) g.cutscene_ctr = (g.counter1&_TIMING)+1; // First frame of cutscene. 
else            g.cutscene_ctr++;

    g.cutscene = 1;
//
// A7CD
if (g.cutscene_ctr & _TIMING)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// -------------------------------------------------------------------------------------
var                                       _DEPTH        = DEPTH_FG3;         // 
if (_ARGS>_arg && argument[_arg++] != -1) _DEPTH        = argument[_arg-1];

var                                       _TS           = ts_Man_made_1a_WRB;   // 
if (_ARGS>_arg && argument[_arg++])       _TS           = argument[_arg-1];

var                                       _TSRC_TOP     = $B0; // $B0: railings
if (_ARGS>_arg && argument[_arg++]+1)     _TSRC_TOP     = argument[_arg-1];

var                                       _TSRC_BTM     = $A0; // $A0: new graphic, $B1: OG graphic
// var                                       _TSRC_BTM     = _TSRC+1;                  // 
if (_ARGS>_arg && argument[_arg++]+1)     _TSRC_BTM     = argument[_arg-1];







// -------------------------------------------------------------------------------------
// _DIR:
//  0: Build from both ends meeting in middle, 
//  1: Build from left to right, 
// -1: Build from right to left

var _COUNT1  = g.cutscene_ctr >>_SPEED;
var _COUNT2  = _DIR==0 && (!(_CLM_LIMIT&1) || _COUNT1<(_CLM_LIMIT>>1));
    _COUNT2++;


var _XL  = (CLM_L+(_COUNT1-1))<<3; // _DIR: 0,1
var _XR  = (CLM_R-(_COUNT1-1))<<3; // _DIR:  -1
if (_DIR+1) _x  = _XL; // _DIR: 0,1
else        _x  = _XR; // _DIR:  -1
//_x += (g.cutscene_ctr-(_TIMING+1)) * _DIR; // cutscene_ctr already an even 8th


// _COUNT2 == 1,2.
for(_i=0; _i<_COUNT2; _i++)
{
    tile_change_1a(_DEPTH, _x,_Y-8, _TS,_TSRC_TOP, 0); // bridge top half
    tile_change_1a(_DEPTH, _x,_Y,   _TS,_TSRC_BTM, 2); // bridge btm half
    _x  = _XR; // if _DIR==0, add another segment from the opposite end next _i iteration.
}


aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));


if ((_DIR==0 && _COUNT1>=(_CLM_LIMIT>>1))  // When building from both ends
||  (_DIR!=0 && _COUNT1>= _CLM_LIMIT) )    // When building from  one end
{   // Bridge is complete.
    g.cutscene    = 0;
    g.pc_lock     = 0;
}




