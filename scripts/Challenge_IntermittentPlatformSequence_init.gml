/// Challenge_IntermittentPlatformSequence_init()


var _i, _a, _val, _pos;


palidx = global.PI_BGR1;

//ST_SUB1_NORM = 1; // 
//state_sub1   = ST_SUB1_NORM;

                  _a=1;
State_SLEEP     = _a++; // not solid, no graphic
State_TELL      = _a++; // not solid, appear tell/hint graphic
State_ANIM_IN   = _a++; // not solid, animation in
State_ANIM_OUT  = _a++; //     solid, animation out
State_FULL      = _a++; //     solid, static graphic
//State_WARN      = _a++; // 


// Color for dev
TELL_COLOR = c_red;
//TELL_COLOR = c_green;

var    _CASE = 3;
switch(_CASE) // Testing diff timings
{
    case 1:{
    DUR_TELL = $40; // 
    DUR_ANIM = $20; // For State_ANIM_IN, State_ANIM_OUT
    DUR_FULL = $C0; // 
    break;}
    
    case 2:{
    DUR_TELL = $30; // 
    DUR_ANIM = $18; // For State_ANIM_IN, State_ANIM_OUT
    DUR_FULL = $90; // 
    break;}
    
    case 3:{
    DUR_TELL = $18; // 
    DUR_ANIM = $18; // For State_ANIM_IN, State_ANIM_OUT
    DUR_FULL = $90; // 
    break;}
    
    case 4:{
    DUR_TELL = $18; // 
    DUR_ANIM = $08; // For State_ANIM_IN, State_ANIM_OUT
    DUR_FULL = $90; // 
    break;}
}


DUR_START = $80; // Restart delay
DUR_SLEEP = $FF; // 



SPR_PLAT_1A = spr_Platform_Rock_01a;
SPR_PLAT_1B = spr_Platform_Rock_01b;
SPR_PLAT_1C = spr_Platform_Rock_01c;




HIDDEN_TYPE = 0;

if(!is_undefined(dk_spawn))
{
        _val  = val(g.dm_spawn[?dk_spawn+STR_Data+"01"]);
        _val  = string(_val);
        _pos  = string_pos(   STR_HIDDEN, _val);
    if (_pos)
    {
        _pos += string_length(STR_HIDDEN);
        HIDDEN_TYPE = str_hex(string_copy(_val,_pos,2));
    }
}



ds_grid_resize(g.dg_RmTile_TempSolid, ds_grid_width(g.dg_RmTile_solid),ds_grid_height(g.dg_RmTile_solid)); // unit8
ds_grid_clear (g.dg_RmTile_TempSolid, 0);
//ds_grid_clear(g.dg_RmTile_TempSolid, 0);


// pending_dir_change = false;
// resetting = false;


// seq_dir: iteration dir through dg_platform.
// Which dir/adjacent-platform a platform will activate from.
seq_dir     = 1;
//seq_dir_new = seq_dir;

// dg_restart: Contains hitboxes that restart the sequence 
// when PC is colliding. This way player doesn't have to 
// wait for new cycle.
// This also tells which dir(fwrd/bkwd) the sequence will go.
dg_restart = ds_grid_create(0,5);


PLATFORMS  = 1;
var _PROPS = 7;


dg_platform = ds_grid_create(PLATFORMS, _PROPS);
// dg_data = ds_grid_create(0, 0);
// dg_seq
// dm_data

// 
// The 1st platform can restart when 
// the 5th starts OR the last ends.



switch(ver)
{
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case 1:{ // 1st test
                                PLATFORMS = 12;
    ds_grid_resize(dg_platform, PLATFORMS, _PROPS);
    ds_grid_clear( dg_platform, 0);
    
    
    dg_platform[#0,  0] = State_SLEEP;    // state
    dg_platform[#0,  1] = DUR_START;   // timer
    dg_platform[#0,  2] = $1E;        // clm (x)
    dg_platform[#0,  3] = $18;        // row (y)
    dg_platform[#0,  4] = $02;        // clms (width)
    dg_platform[#0,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#1,  0] = State_SLEEP;    // state
    dg_platform[#1,  1] = 0;          // timer
    dg_platform[#1,  2] = $26;        // clm (x)
    dg_platform[#1,  3] = $18;        // row (y)
    dg_platform[#1,  4] = $02;        // clms (width)
    dg_platform[#1,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#2,  0] = State_SLEEP;    // state
    dg_platform[#2,  1] = 0;          // timer
    dg_platform[#2,  2] = $2C;        // clm (x)
    dg_platform[#2,  3] = $18;        // row (y)
    dg_platform[#2,  4] = $02;        // clms (width)
    dg_platform[#2,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#3,  0] = State_SLEEP;    // state
    dg_platform[#3,  1] = 0;          // timer
    dg_platform[#3,  2] = $34;        // clm (x)
    dg_platform[#3,  3] = $18;        // row (y)
    dg_platform[#3,  4] = $02;        // clms (width)
    dg_platform[#3,  5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#4,  0] = State_SLEEP;    // state
    dg_platform[#4,  1] = 0;          // timer
    dg_platform[#4,  2] = $3C;        // clm (x)
    dg_platform[#4,  3] = $16;        // row (y)
    dg_platform[#4,  4] = $02;        // clms (width)
    dg_platform[#4,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#5,  0] = State_SLEEP;    // state
    dg_platform[#5,  1] = 0;          // timer
    dg_platform[#5,  2] = $3E;        // clm (x)
    dg_platform[#5,  3] = $12;        // row (y)
    dg_platform[#5,  4] = $02;        // clms (width)
    dg_platform[#5,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#6,  0] = State_SLEEP;    // state
    dg_platform[#6,  1] = 0;          // timer
    dg_platform[#6,  2] = $46;        // clm (x)
    dg_platform[#6,  3] = $11;        // row (y)
    dg_platform[#6,  4] = $02;        // clms (width)
    dg_platform[#6,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#7,  0] = State_SLEEP;    // state
    dg_platform[#7,  1] = 0;          // timer
    dg_platform[#7,  2] = $49;        // clm (x)
    dg_platform[#7,  3] = $18;        // row (y)
    dg_platform[#7,  4] = $02;        // clms (width)
    dg_platform[#7,  5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#8,  0] = State_SLEEP;    // state
    dg_platform[#8,  1] = 0;          // timer
    dg_platform[#8,  2] = $51;        // clm (x)
    dg_platform[#8,  3] = $18;        // row (y)
    dg_platform[#8,  4] = $02;        // clms (width)
    dg_platform[#8,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#9,  0] = State_SLEEP;    // state
    dg_platform[#9,  1] = 0;          // timer
    dg_platform[#9,  2] = $54;        // clm (x)
    dg_platform[#9,  3] = $17;        // row (y)
    dg_platform[#9,  4] = $02;        // clms (width)
    dg_platform[#9,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#10,  0] = State_SLEEP;    // state
    dg_platform[#10,  1] = 0;          // timer
    dg_platform[#10,  2] = $5A;        // clm (x)
    dg_platform[#10,  3] = $14;        // row (y)
    dg_platform[#10,  4] = $02;        // clms (width)
    dg_platform[#10,  5] = $02;        // rows (height)
                                                        // 
    dg_platform[#11,  0] = State_SLEEP;    // state
    dg_platform[#11,  1] = 0;          // timer
    dg_platform[#11,  2] = $64;        // clm (x)
    dg_platform[#11,  3] = $18;        // row (y)
    dg_platform[#11,  4] = $02;        // clms (width)
    dg_platform[#11,  5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    
    
    
    ds_grid_resize(dg_restart, 2, ds_grid_height(dg_restart));
    ds_grid_clear( dg_restart, 0);
    
    
    dg_restart[#0, 0] =  1;            // sequence dir
    dg_restart[#0, 1] =  cam_xl_min(); // x
    dg_restart[#0, 2] =  0;            // y
    dg_restart[#0, 3] = (dg_platform[#0,  2] <<3) - dg_restart[#0, 1]; // w
    dg_restart[#0, 4] =  g.rm_h;     // h
                                                        // 
    dg_restart[#1, 0] = -1;            // sequence dir
    dg_restart[#1, 1] = (dg_platform[#ds_grid_width(dg_platform)-1,  2] <<3) + (dg_platform[#ds_grid_width(dg_platform)-1,  4] <<3); // x
    dg_restart[#1, 2] =  0;            // y
    dg_restart[#1, 3] =  cam_xr_max() - dg_restart[#1, 1]; // w
    dg_restart[#1, 4] =  g.rm_h;     // h
    break;}//case 1:{
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case 2:{ // Tantari desert cave 1 (TROPHY cave 1)
                                PLATFORMS = $09;
    ds_grid_resize(dg_platform, PLATFORMS, _PROPS);
    ds_grid_clear( dg_platform, 0);
    
    
    dg_platform[#$00,0] = State_SLEEP;    // state
    dg_platform[#$00,1] = DUR_START;   // timer
    dg_platform[#$00,2] = $2C;        // clm (x)
    dg_platform[#$00,3] = $0F;        // row (y)
    dg_platform[#$00,4] = $02;        // clms (width)
    dg_platform[#$00,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$01,0] = State_SLEEP;    // state
    dg_platform[#$01,1] = 0;          // timer
    dg_platform[#$01,2] = $2F;        // clm (x)
    dg_platform[#$01,3] = $13;        // row (y)
    dg_platform[#$01,4] = $02;        // clms (width)
    dg_platform[#$01,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$02,0] = State_SLEEP;    // state
    dg_platform[#$02,1] = 0;          // timer
    dg_platform[#$02,2] = $33;        // clm (x)
    dg_platform[#$02,3] = $17;        // row (y)
    dg_platform[#$02,4] = $02;        // clms (width)
    dg_platform[#$02,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$03,0] = State_SLEEP;    // state
    dg_platform[#$03,1] = 0;          // timer
    dg_platform[#$03,2] = $37;        // clm (x)
    dg_platform[#$03,3] = $14;        // row (y)
    dg_platform[#$03,4] = $02;        // clms (width)
    dg_platform[#$03,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#$04,0] = State_SLEEP;    // state
    dg_platform[#$04,1] = 0;          // timer
    dg_platform[#$04,2] = $3A;        // clm (x)
    //dg_platform[#$04,2] = $39;        // clm (x)
    dg_platform[#$04,3] = $10;        // row (y)
    dg_platform[#$04,4] = $02;        // clms (width)
    dg_platform[#$04,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$05,0] = State_SLEEP;    // state
    dg_platform[#$05,1] = 0;          // timer
    dg_platform[#$05,2] = $3E;        // clm (x)
    dg_platform[#$05,3] = $14;        // row (y)
    dg_platform[#$05,4] = $04;        // clms (width)
    dg_platform[#$05,5] = $02;        // rows (height)
    /*
    dg_platform[#$05,0] = State_SLEEP;    // state
    dg_platform[#$05,1] = 0;          // timer
    dg_platform[#$05,2] = $3F;        // clm (x)
    dg_platform[#$05,3] = $14;        // row (y)
    dg_platform[#$05,4] = $02;        // clms (width)
    dg_platform[#$05,5] = $02;        // rows (height)
    */
                                                        // 
    dg_platform[#$06,0] = State_SLEEP;    // state
    dg_platform[#$06,1] = 0;          // timer
    dg_platform[#$06,2] = $44;        // clm (x)
    dg_platform[#$06,3] = $18;        // row (y)
    dg_platform[#$06,4] = $04;        // clms (width)
    dg_platform[#$06,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$07,0] = State_SLEEP;    // state
    dg_platform[#$07,1] = 0;          // timer
    dg_platform[#$07,2] = $4A;        // clm (x)
    dg_platform[#$07,3] = $18;        // row (y)
    dg_platform[#$07,4] = $02;        // clms (width)
    dg_platform[#$07,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#$08,0] = State_SLEEP;    // state
    dg_platform[#$08,1] = 0;          // timer
    dg_platform[#$08,2] = $50;        // clm (x)
    dg_platform[#$08,3] = $14;        // row (y)
    dg_platform[#$08,4] = $04;        // clms (width)
    dg_platform[#$08,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    
    
    
    ds_grid_resize(dg_restart, 2, ds_grid_height(dg_restart));
    ds_grid_clear( dg_restart, 0);
    
    
    dg_restart[#0,0] =  1;            // sequence dir
    dg_restart[#0,1] =  0;            // x
    dg_restart[#0,2] =  0;            // y
    dg_restart[#0,3] = (dg_platform[#0,2]<<3) - dg_restart[#0,1]; // w
    dg_restart[#0,4] =  g.rm_h;     // h
                                                        // 
    dg_restart[#1,0] = -1;            // sequence dir
    dg_restart[#1,1] = (dg_platform[#ds_grid_width(dg_platform)-1, 2]<<3) + (dg_platform[#ds_grid_width(dg_platform)-1, 4]<<3); // x
    dg_restart[#1,2] =  0;            // y
    dg_restart[#1,3] =  g.rm_w - dg_restart[#1,1]; // w
    dg_restart[#1,4] =  g.rm_h;     // h
    break;}//case 2:{
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case 3:{ // EastA_B1,  Caves to Mount Dragmire
                 _a=0; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = DUR_START;   // timer
    dg_platform[#_a,2] = $1C;        // clm (x)
    dg_platform[#_a,3] = $14;        // row (y)
    dg_platform[#_a,4] = $04;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $24;        // clm (x)
    dg_platform[#_a,3] = $14;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $28;        // clm (x)
    dg_platform[#_a,3] = $14;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $30;        // clm (x)
    dg_platform[#_a,3] = $10;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $35;        // clm (x)
    dg_platform[#_a,3] = $10;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $3D;        // clm (x)
    dg_platform[#_a,3] = $0C;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $42;        // clm (x)
    dg_platform[#_a,3] = $08;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $46;        // clm (x)
    dg_platform[#_a,3] = $03;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $4D;        // clm (x)
    dg_platform[#_a,3] = $07;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $50;        // clm (x)
    dg_platform[#_a,3] = $0C;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                 _a++; ds_grid_resize(dg_platform, _a+1, _PROPS);
    dg_platform[#_a,0] = State_SLEEP;    // state
    dg_platform[#_a,1] = 0;          // timer
    dg_platform[#_a,2] = $53;        // clm (x)
    dg_platform[#_a,3] = $11;        // row (y)
    //dg_platform[#_a,3] = $11;        // row (y)
    dg_platform[#_a,4] = $02;        // clms (width)
    dg_platform[#_a,5] = $02;        // rows (height)
                                                        // 
                                                        // 
    PLATFORMS=ds_grid_width(dg_platform);
    
    
    ds_grid_resize(dg_restart, 2,ds_grid_height(dg_restart));
    // 1,2,3,4 are the data for a hb. 
    // dg_restart[#0 is anywhere left of first platform
    dg_restart[#0,0] =  1;            // sequence dir
    dg_restart[#0,1] =  0;            // x
    dg_restart[#0,2] =  0;            // y
    dg_restart[#0,3] = (dg_platform[#0,2]<<3) - dg_restart[#0,1]; // w
    dg_restart[#0,4] =  g.rm_h;     // h
    
    // dg_restart[#1 is anywhere right of last platform                                                    // 
    dg_restart[#1,0] = -1;            // sequence dir
    dg_restart[#1,1] = (dg_platform[#PLATFORMS-1,2]<<3) + (dg_platform[#PLATFORMS-1,4]<<3); // x
    dg_restart[#1,2] =  0;            // y
    dg_restart[#1,3] =  g.rm_w - dg_restart[#1,1]; // w
    dg_restart[#1,4] =  g.rm_h;     // h
    break;}//case 3:{
    /*
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case 3:{ // WestA_42, Vertical climb challenge in front of N Palace w/ Kakusu007
                                PLATFORMS = $09;
    ds_grid_resize(dg_platform, PLATFORMS, _PROPS);
    ds_grid_clear( dg_platform, 0);
    
    
    dg_platform[#$00,0] = State_SLEEP;    // state
    dg_platform[#$00,1] = DUR_START;   // timer
    dg_platform[#$00,2] = $2C;        // clm (x)
    dg_platform[#$00,3] = $0F;        // row (y)
    dg_platform[#$00,4] = $02;        // clms (width)
    dg_platform[#$00,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$01,0] = State_SLEEP;    // state
    dg_platform[#$01,1] = 0;          // timer
    dg_platform[#$01,2] = $2E;        // clm (x)
    dg_platform[#$01,3] = $13;        // row (y)
    dg_platform[#$01,4] = $02;        // clms (width)
    dg_platform[#$01,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$02,0] = State_SLEEP;    // state
    dg_platform[#$02,1] = 0;          // timer
    dg_platform[#$02,2] = $32;        // clm (x)
    dg_platform[#$02,3] = $17;        // row (y)
    dg_platform[#$02,4] = $02;        // clms (width)
    dg_platform[#$02,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$03,0] = State_SLEEP;    // state
    dg_platform[#$03,1] = 0;          // timer
    dg_platform[#$03,2] = $37;        // clm (x)
    dg_platform[#$03,3] = $14;        // row (y)
    dg_platform[#$03,4] = $02;        // clms (width)
    dg_platform[#$03,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#$04,0] = State_SLEEP;    // state
    dg_platform[#$04,1] = 0;          // timer
    dg_platform[#$04,2] = $39;        // clm (x)
    dg_platform[#$04,3] = $10;        // row (y)
    dg_platform[#$04,4] = $02;        // clms (width)
    dg_platform[#$04,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$05,0] = State_SLEEP;    // state
    dg_platform[#$05,1] = 0;          // timer
    dg_platform[#$05,2] = $3F;        // clm (x)
    dg_platform[#$05,3] = $14;        // row (y)
    dg_platform[#$05,4] = $02;        // clms (width)
    dg_platform[#$05,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$06,0] = State_SLEEP;    // state
    dg_platform[#$06,1] = 0;          // timer
    dg_platform[#$06,2] = $44;        // clm (x)
    dg_platform[#$06,3] = $18;        // row (y)
    dg_platform[#$06,4] = $04;        // clms (width)
    dg_platform[#$06,5] = $02;        // rows (height)
                                                        // 
    dg_platform[#$07,0] = State_SLEEP;    // state
    dg_platform[#$07,1] = 0;          // timer
    dg_platform[#$07,2] = $4A;        // clm (x)
    dg_platform[#$07,3] = $18;        // row (y)
    dg_platform[#$07,4] = $02;        // clms (width)
    dg_platform[#$07,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#$08,0] = State_SLEEP;    // state
    dg_platform[#$08,1] = 0;          // timer
    dg_platform[#$08,2] = $50;        // clm (x)
    dg_platform[#$08,3] = $14;        // row (y)
    dg_platform[#$08,4] = $04;        // clms (width)
    dg_platform[#$08,5] = $02;        // rows (height)
                                                        // 
                                                        // 
                                                        // 
    
    
    
    ds_grid_resize(dg_restart, 2, ds_grid_height(dg_restart));
    ds_grid_clear( dg_restart, 0);
    
    
    dg_restart[#0, 0] =  1;            // sequence dir
    dg_restart[#0, 1] =  0;            // x
    dg_restart[#0, 2] =  0;            // y
    dg_restart[#0, 3] = (dg_platform[#0,2]<<3) - dg_restart[#0,1]; // w
    dg_restart[#0, 4] =  viewH();     // h
                                                        // 
    dg_restart[#1, 0] = -1;            // sequence dir
    dg_restart[#1, 1] = (dg_platform[#ds_grid_width(dg_platform)-1, 2]<<3) + (dg_platform[#ds_grid_width(dg_platform)-1, 4]<<3); // x
    dg_restart[#1, 2] =  0;            // y
    dg_restart[#1, 3] =  g.rm_w - dg_restart[#1,1]; // w
    dg_restart[#1, 4] =  viewH();     // h
    break;}
    */
    
    
    
    
    
    // ===============================================================
    // ---------------------------------------------------------
    case 4:{
    DUR_FULL = $40; // 
    
                                PLATFORMS = $08;
    ds_grid_resize(dg_platform, PLATFORMS, _PROPS);
    ds_grid_clear( dg_platform, 0);
    
    var _CLM    = $12;
    var _clm    = _CLM;
    var _CLMS1  = $04; // clms to next platform
    var _ROW    = (g.rm_rows-PAGE_ROWS) + $10;
    
    dg_platform[#$00,0] = State_SLEEP;// state
    dg_platform[#$00,1] = DUR_START;  // timer
    dg_platform[#$00,2] = _clm;       // clm (x)
    dg_platform[#$00,3] = _ROW;       // row (y)
    dg_platform[#$00,4] = $02;        // clms (width)
    dg_platform[#$00,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
    dg_platform[#$01,0] = State_SLEEP;// state
    dg_platform[#$01,1] = 0;          // timer
    dg_platform[#$01,2] = _clm;       // clm (x)
    dg_platform[#$01,3] = _ROW;       // row (y)
    dg_platform[#$01,4] = $02;        // clms (width)
    dg_platform[#$01,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
    dg_platform[#$02,0] = State_SLEEP;// state
    dg_platform[#$02,1] = 0;          // timer
    dg_platform[#$02,2] = _clm;       // clm (x)
    dg_platform[#$02,3] = _ROW;       // row (y)
    dg_platform[#$02,4] = $02;        // clms (width)
    dg_platform[#$02,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
    _clm += _CLMS1; // gap                                   //
                                                        // 
    dg_platform[#$03,0] = State_SLEEP;// state
    dg_platform[#$03,1] = 0;          // timer
    dg_platform[#$03,2] = _clm;       // clm (x)
    dg_platform[#$03,3] = _ROW;       // row (y)
    dg_platform[#$03,4] = $02;        // clms (width)
    dg_platform[#$03,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
                                                        // 
                                                        // 
    dg_platform[#$04,0] = State_SLEEP;// state
    dg_platform[#$04,1] = 0;          // timer
    dg_platform[#$04,2] = _clm;       // clm (x)
    dg_platform[#$04,3] = _ROW;       // row (y)
    dg_platform[#$04,4] = $02;        // clms (width)
    dg_platform[#$04,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
    dg_platform[#$05,0] = State_SLEEP;// state
    dg_platform[#$05,1] = 0;          // timer
    dg_platform[#$05,2] = _clm;       // clm (x)
    dg_platform[#$05,3] = _ROW;       // row (y)
    dg_platform[#$05,4] = $02;        // clms (width)
    dg_platform[#$05,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
    dg_platform[#$06,0] = State_SLEEP;// state
    dg_platform[#$06,1] = 0;          // timer
    dg_platform[#$06,2] = _clm;       // clm (x)
    dg_platform[#$06,3] = _ROW;       // row (y)
    dg_platform[#$06,4] = $04;        // clms (width)
    dg_platform[#$06,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
    dg_platform[#$07,0] = State_SLEEP;// state
    dg_platform[#$07,1] = 0;          // timer
    dg_platform[#$07,2] = _clm;       // clm (x)
    dg_platform[#$07,3] = _ROW;       // row (y)
    dg_platform[#$07,4] = $02;        // clms (width)
    dg_platform[#$07,5] = $02;        // rows (height)
    _clm += _CLMS1;                                    //
                                                        // 
                                                        // 
                                                        // 
    
    
    
    ds_grid_resize(dg_restart, 2, ds_grid_height(dg_restart));
    ds_grid_clear( dg_restart, 0);
    
    
    dg_restart[#0,0] =  1;            // sequence dir
    dg_restart[#0,1] =  0;            // x
    dg_restart[#0,2] =  0;            // y
    dg_restart[#0,3] = (dg_platform[#0,2]<<3) - dg_restart[#0,1]; // w
    dg_restart[#0,4] =  viewH();     // h
                                                        // 
    dg_restart[#1,0] = -1;            // sequence dir
    dg_restart[#1,1] = (dg_platform[#ds_grid_width(dg_platform)-1, 2]<<3) + (dg_platform[#ds_grid_width(dg_platform)-1, 4]<<3); // x
    dg_restart[#1,2] =  0;            // y
    dg_restart[#1,3] =  g.rm_w - dg_restart[#1,1]; // w
    dg_restart[#1,4] =  viewH();     // h
    break;}//case 4:{
}







if (val(g.dm_rm[?g.rm_name+STR_View+STR_Data]) &$1  // if rm is locked to bottom page
&&  g.rm_row0 )
{
    for(_i=0; _i<PLATFORMS; _i++)
    {
        dg_platform[#_i,3] += g.rm_row0;
    }
}




