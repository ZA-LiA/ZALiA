/// cutscene_build_house_1(build dir, speed, clm, row, *depth, *tsrc data)


if (g.cutscene_house_built 
||  g.ChangeRoom_timer>0 
||  g.EnterRoom_SpawnGO_timer )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// -------------------------------------------------------------------------------------
var _DIR    =        sign_(argument[0]);

var _SPEED  = clamp(bit1st(argument[1]), $01,$08); // build 1 row every 2,4,8,16,32,64,128,256 frames
var _TIMING = (1<<_SPEED) - 1;


// First frame of cutscene.
// if(!g.cutscene) aud_play_sound(g.MUS_LEVL_UP_1);

if(!g.cutscene) g.cutscene_ctr = (g.counter1&_TIMING) + 1; // First frame of cutscene.
else            g.cutscene_ctr++; // Might need this to be able to go beyond 256.

g.cutscene = g.CUTSCENE_BUILD_HOUSE1;
// g.cutscene = 1;


// -------------------------------------------------------------------------------------
if (g.cutscene_ctr&_TIMING) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// -------------------------------------------------------------------------------------
// 8F02. mkh update draw data
// Nothing gets built until the 2nd time it makes it here.
var _BUILD_ROWS = (g.cutscene_ctr>>_SPEED) - 1;
if(!_BUILD_ROWS) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// -------------------------------------------------------------------------------------
var _arg  = 2;
var _ARGS = argument_count;


var _RM_CLM =     argument[_arg++]; // rm clm of house
var _RM_ROW =     argument[_arg++]; // rm row of ground

var                                     _DEPTH     = DEPTH_BG3;         // 
if (_ARGS>_arg && argument[_arg++]!=-1) _DEPTH     = argument[_arg-1];

//var                                       _TS        = ts_Man_made_1a_WRB;   // 
//if (_ARGS>_arg && argument[_arg++])       _TS        = argument[_arg-1];

var                                     _TSRC_DATA = g.MKH_TSRC_DATA;   // 
if (_ARGS>_arg && argument[_arg++]!=-1) _TSRC_DATA = argument[_arg-1];





var _i,_j, _idx, _x,_y, _ts, _tsrc, _tile_data;
var _CHAR_PER_TILE = 4;

for(_i=0; _i<_BUILD_ROWS; _i++) // each row of house built
{
    for(_j=0; _j<g.MKH_CLMS; _j++) // each clm of house
    {
        _x = _RM_CLM + _j;
        _x = _x<<3;
        
        _y = _RM_ROW + (_BUILD_ROWS*_DIR) + (_i*-_DIR);
        _y = _y<<3;
        
        _idx  = (g.MKH_CLMS*_CHAR_PER_TILE) * _i;
        _idx += _j * _CHAR_PER_TILE;
        _tile_data = string_copy(_TSRC_DATA, _idx+1, _CHAR_PER_TILE);
        
        _tsrc = str_hex(string_copy(_tile_data,3,2));
        _idx  = str_hex(string_copy(_tile_data,1,2));
        if(!_idx) _ts = 0; // deletes tile
        else      _ts = g.dl_tileset[|_idx];
        
        //_tsrc = str_hex(string_copy(_tile_data,1,2));
        //if(!_tsrc) _ts = 0; // deletes tile
        //else       _ts = _TS;
        
        tile_change_1a(_DEPTH, _x,_y, _ts,_tsrc);
    }
}


aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));



if (_BUILD_ROWS==g.MKH_ROWS)
{
    g.cutscene_house_built = 1; // Only sets 0 at g_Room_Start()
    g.cutscene      = 0;
    g.cutscene_ctr  = 0;
    g.pc_lock       = 0;
    
    // sdm('MKH TSRC: '+_str);
}


/*
0000 BEBF BEBF BEBF 0000 
00BE BFBE DCDD BFBE BF00 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF
*/



