

// ***** Keep mp even because spell costs are drawn as half of what the 
// actual values are. Pause menu could show that the player has the 
// exact mp to cast a spell but the spell is actually costs +1 more


// 0E48DA80AE0F0AE2003071200F08E300D20E1D600E08D2089473F4158237F41F8638FA1B7237630F089774E300DE0E24600E08D40860016B02D10E84919091D6

/*
8D7B-8DBA:  $40 bytes
403030202020202060504040282018108C8C787864646464A0A0787850505050F0A0783C20202020F0F0A06050403020F0E0C0A060403020F0F0F0F0F0F0C880
40 30 30 20 20 20 20 20     
60 50 40 40 28 20 18 10     
8C 8C 78 78 64 64 64 64     
A0 A0 78 78 50 50 50 50     
F0 A0 78 3C 20 20 20 20     
F0 F0 A0 60 50 40 30 20     
F0 E0 C0 A0 60 40 30 20     
F0 F0 F0 F0 F0 F0 C8 80     
*/


var _idx, _val;
var _MAX = SPELL_COST_MAX;
// dg_spell_cost: width = spell num(1-8), height = magic_lvl_idx(0-7)



// column 0 of dg_spell_cost is intentionally skipped. 1st spell is column 1.
               _idx=0;
dg_spell_cost[#_idx,0] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,1] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,2] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,3] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,4] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,5] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,6] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,7] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,8] =_MAX; // $F0(240) >>1 = 120


// PROTECT/SHIELD - $40, $30, $30, $20, $20, $20, $20, $20
               _idx=bitNum(SPL_PRTC);
dg_spell_cost[#_idx,0] = $40; // $40( 64) >>1 =  32
dg_spell_cost[#_idx,1] = $30; // $30( 48) >>1 =  24
dg_spell_cost[#_idx,2] = $30; // $30( 48) >>1 =  24
dg_spell_cost[#_idx,3] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,4] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,5] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,6] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,7] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,8] = $18; // $18( 24) >>1 =  12

// JUMP - $60, $50, $40, $40, $28, $20, $18, $10
               _idx=bitNum(SPL_JUMP);
dg_spell_cost[#_idx,0] = $60; // $60( 96) >>1 =  48
dg_spell_cost[#_idx,1] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,2] = $40; // $40( 64) >>1 =  32
dg_spell_cost[#_idx,3] = $40; // $40( 64) >>1 =  32
dg_spell_cost[#_idx,4] = $28; // $28( 40) >>1 =  20
dg_spell_cost[#_idx,5] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,6] = $18; // $18( 24) >>1 =  12
dg_spell_cost[#_idx,7] = $10; // $10( 16) >>1 =  08
dg_spell_cost[#_idx,8] = $0C; // $0C( 12) >>1 =  06

// HEAL/LIFE - $8C, $8C, $78, $78, $64, $64, $64, $64
               _idx=bitNum(SPL_LIFE);
dg_spell_cost[#_idx,0] = $8C; // $8C(140) >>1 =  70
dg_spell_cost[#_idx,1] = $8C; // $8C(140) >>1 =  70
dg_spell_cost[#_idx,2] = $78; // $78(120) >>1 =  60
dg_spell_cost[#_idx,3] = $78; // $78(120) >>1 =  60
dg_spell_cost[#_idx,4] = $64; // $64(100) >>1 =  50
dg_spell_cost[#_idx,5] = $64; // $64(100) >>1 =  50
dg_spell_cost[#_idx,6] = $64; // $64(100) >>1 =  50
dg_spell_cost[#_idx,7] = $64; // $64(100) >>1 =  50
dg_spell_cost[#_idx,8] = $50; // $50( 80) >>1 =  40

// FAIRY - $A0, $A0, $78, $78, $50, $50, $50, $50
               _idx=bitNum(SPL_FARY);
dg_spell_cost[#_idx,0] = $A0; // $A0(160) >>1 =  80
dg_spell_cost[#_idx,1] = $A0; // $A0(160) >>1 =  80
dg_spell_cost[#_idx,2] = $78; // $78(120) >>1 =  60
dg_spell_cost[#_idx,3] = $78; // $78(120) >>1 =  60
dg_spell_cost[#_idx,4] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,5] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,6] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,7] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,8] = $3C; // $3C( 60) >>1 =  30

// FIRE - $F0, $A0, $78, $3C, $20, $20, $20, $20
               _idx=bitNum(SPL_FIRE);
dg_spell_cost[#_idx,0] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,1] = $A0; // $A0(160) >>1 =  80
dg_spell_cost[#_idx,2] = $78; // $78(120) >>1 =  60
dg_spell_cost[#_idx,3] = $3C; // $3C( 60) >>1 =  30
dg_spell_cost[#_idx,4] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,5] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,6] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,7] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,8] = $18; // $18( 24) >>1 =  12

// REFLECT - $F0, $F0, $A0, $60, $50, $40, $30, $20
               _idx=bitNum(SPL_RFLC);
dg_spell_cost[#_idx,0] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,1] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,2] = $A0; // $A0(160) >>1 =  80
dg_spell_cost[#_idx,3] = $60; // $60( 96) >>1 =  48
dg_spell_cost[#_idx,4] = $50; // $50( 80) >>1 =  40
dg_spell_cost[#_idx,5] = $40; // $40( 64) >>1 =  32
dg_spell_cost[#_idx,6] = $30; // $30( 48) >>1 =  24
dg_spell_cost[#_idx,7] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,8] = $18; // $18( 24) >>1 =  12

// ENIGMA/SPELL - $F0, $E0, $C0, $A0, $60, $40, $30, $20
               _idx=bitNum(SPL_SPEL);
dg_spell_cost[#_idx,0] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,1] = $E0; // $E0(224) >>1 = 112
dg_spell_cost[#_idx,2] = $C0; // $C0(192) >>1 =  96
dg_spell_cost[#_idx,3] = $A0; // $A0(160) >>1 =  80
dg_spell_cost[#_idx,4] = $60; // $60( 96) >>1 =  48
dg_spell_cost[#_idx,5] = $40; // $40( 64) >>1 =  32
dg_spell_cost[#_idx,6] = $30; // $30( 48) >>1 =  24
dg_spell_cost[#_idx,7] = $20; // $20( 32) >>1 =  16
dg_spell_cost[#_idx,8] = $18; // $18( 24) >>1 =  12

// THUNDER - $F0, $F0, $F0, $F0, $F0, $F0, $C8, $80
               _idx=bitNum(SPL_THUN);
dg_spell_cost[#_idx,0] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,1] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,2] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,3] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,4] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,5] =_MAX; // $F0(240) >>1 = 120
dg_spell_cost[#_idx,6] = $C8; // $C8(200) >>1 = 100
dg_spell_cost[#_idx,7] = $80; // $80(128) >>1 =  64
dg_spell_cost[#_idx,8] = $60; // $60( 96) >>1 =  48

// SUMMON
_val=$60;      _idx=bitNum(SPL_SUMM); // $60( 96) >>1 =  48
//_val=$80;      _idx=bitNum(SPL_SUMM); // $80(128) >>1 =  64
//_val=$F0;      _idx=bitNum(SPL_SUMM); // $F0(240) >>1 = 120
dg_spell_cost[#_idx,0] = _val;
dg_spell_cost[#_idx,1] = _val;
dg_spell_cost[#_idx,2] = _val;
dg_spell_cost[#_idx,3] = _val;
dg_spell_cost[#_idx,4] = _val;
dg_spell_cost[#_idx,5] = _val;
dg_spell_cost[#_idx,6] = _val;
dg_spell_cost[#_idx,7] = _val;
dg_spell_cost[#_idx,8] = _val;




ds_grid_copy(dg_spell_cost_DEFAULT, dg_spell_cost);


var                         _DK = STR_Rando+STR_Cost+STR_Max;
dm_Spell[?hex_str($0)      +_DK] = min(Container_AMT*3, dg_spell_cost[#0,0]);
dm_Spell[?hex_str(SPL_PRTC)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_PRTC),0]);
dm_Spell[?hex_str(SPL_JUMP)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_JUMP),0]);
dm_Spell[?hex_str(SPL_LIFE)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_LIFE),0]);
dm_Spell[?hex_str(SPL_FARY)+_DK] = min(Container_AMT*4, dg_spell_cost[#bitNum(SPL_FARY),0]);
dm_Spell[?hex_str(SPL_FIRE)+_DK] = min(Container_AMT*2, dg_spell_cost[#bitNum(SPL_FIRE),0]);
dm_Spell[?hex_str(SPL_RFLC)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_RFLC),0]);
dm_Spell[?hex_str(SPL_SPEL)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_SPEL),0]);
dm_Spell[?hex_str(SPL_THUN)+_DK] = min(Container_AMT*5, dg_spell_cost[#bitNum(SPL_THUN),0]);
dm_Spell[?hex_str(SPL_SUMM)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_SUMM),0]);




