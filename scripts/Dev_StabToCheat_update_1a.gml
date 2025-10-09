/// Dev_StabToCheat_update_1a()


var _i;
var _HBW = 4;
var _HBH = 4;
var _x     = CLM_BASE<<3;
var _X_INC =(CLM_OFF <<3); // x increment
var _Y  = (global.pc.yt>>3)<<3;
    _Y  = get_ground_y(global.pc.x,_Y, 1, _Y+PC_H);
    _Y += -PC_H;
    _Y += 8;
//


for(_i=0; _i<OPTION_CNT; _i++)
{
    dg_hb[#_i,0] = _x + 2;
    dg_hb[#_i,1] = _Y;
    dg_hb[#_i,2] = _HBW;
    dg_hb[#_i,3] = _HBH;
    
    if (inRange(_i,  0, 7) 
    ||  inRange(_i, 10,17) )
    { // items & spells
        _i++;
        dg_hb[#_i,0] = dg_hb[#_i-1,0];
        dg_hb[#_i,1] = dg_hb[#_i-1,1] + $10;
        dg_hb[#_i,2] = dg_hb[#_i-1,2];
        dg_hb[#_i,3] = dg_hb[#_i-1,3];
    }
    else if (inRange(_i, 23,25))
    { // decrease level
        dg_hb[#_i,0] = dg_hb[#_i-3,0];
        dg_hb[#_i,1] = dg_hb[#_i-3,1] + $10;
        dg_hb[#_i,2] = dg_hb[#_i-3,2];
        dg_hb[#_i,3] = dg_hb[#_i-3,3];
    }
    else if (inRange(_i, 26,30))
    { // Magic Refill Jar[26], P-Bags[27-30]
        dg_hb[#_i,0] -= ($0C<<3);
        dg_hb[#_i,1] = _Y + ((_i&$1)<<4);
        dg_hb[#_i,2] = _HBW;
        dg_hb[#_i,3] = _HBH;
        
        if!(_i&$1) _x -= _X_INC;
    }
    else
    {
        
    }
    
    _x += _X_INC;
}
// dg_hb[#$0, ] = ; // 


/*
// Major Items
ar_spr[ 0] = SPR_CAND; // 
ar_spr[ 1] = SPR_GLOV; // 
ar_spr[ 2] = SPR_RAFT; // 
ar_spr[ 3] = SPR_BOOT; // 
ar_spr[ 4] = SPR_FLUT; // 
ar_spr[ 5] = SPR_CROS; // 
ar_spr[ 6] = SPR_HAMM; // 
ar_spr[ 7] = SPR_MKEY; // 

// Skills
ar_spr[ 8] = SPR_THDW; // 
ar_spr[ 9] = SPR_THUP; // 

// Spells
ar_spr[10] = SPR_SPEL; // 
ar_spr[11] = SPR_SPEL; // 
ar_spr[12] = SPR_SPEL; // 
ar_spr[13] = SPR_SPEL; // 
ar_spr[14] = SPR_SPEL; // 
ar_spr[15] = SPR_SPEL; // 
ar_spr[16] = SPR_SPEL; // 
ar_spr[17] = SPR_SPEL; // 

// Heart & Magic Containers
ar_spr[18] = SPR_HART; // 
ar_spr[19] = SPR_MAGI; // 

// Attack,Magic,Life Levels
ar_spr[20] = SPR_LVLA; // 
ar_spr[21] = SPR_LVLM; // 
ar_spr[22] = SPR_LVLL; //
ar_spr[23] = ar_spr[20]; // 
ar_spr[24] = ar_spr[21]; // 
ar_spr[25] = ar_spr[22]; //

// Magic Refill Jar
ar_spr[26] = SPR_BOTL;

// P-Bags
ar_spr[27] = SPR_PBAG;
ar_spr[28] = ar_spr[27];
ar_spr[29] = ar_spr[27];
ar_spr[30] = ar_spr[27];

// Suicide
ar_spr[31] = spr_Link_damage_WRB; // For suicide.
*/




