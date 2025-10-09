/// Barrier2_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



draw_sprite_(TriforceSymbol_SPR,0, TriforceSymbol_XC,TriforceSymbol_YC, global.PI_BGR2);


if (sub_state==sub_state_IDLE2) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



if (global.pc.behavior==PC_HOLD_BEHAVIOR)
{
    draw_sprite_(spr_Triforce_1a,0, global.pc.x,global.pc.yt-$08, Triforce_pi);
}
/*
ar_PALSEQ_TRIFORCE[3] = _GRN0+_WHT1+_ORG1+_WHT1; // 
ar_PALSEQ_TRIFORCE[2] = _GRN0+_WHT1+_ORG1+_WHT1; // 
ar_PALSEQ_TRIFORCE[1] = _GRN0+_WHT1+_ORG2+_WHT1; // 
ar_PALSEQ_TRIFORCE[0] = _GRN0+_WHT1+_ORG3+_WHT1; // 
*/



var _i, _x,_y, _spr;
var _PI = global.PI_MOB_ORG;
var _Y_SCALE = sign_(g.counter1&$4);
for(_i=0; _i<Blocks_COUNT; _i++)
{
    if(!dg_Blocks[#_i,0]) continue;
    
    _x = dg_Blocks[#_i,2];
    _y = dg_Blocks[#_i,3];
    
    if (dg_Blocks[#_i,0]==1 
    || (dg_Blocks[#_i,0]==2 && dg_Blocks[#_i,1]>=Blocks_CUE1) )
    {
        draw_sprite_(Blocks_SPR,0, _x,_y, palidx);
    }
    
    if (dg_Blocks[#_i,0]==2 
    &&  dg_Blocks[#_i,1] )
    {
        if (inRange(dg_Blocks[#_i,1], 8,23)) 
        {    _spr = spr_Explosion1B;  }
        else _spr = spr_Explosion1A;
        
        
        draw_sprite_(_spr,0, _x,_y, _PI,  1,_Y_SCALE);
        draw_sprite_(_spr,0, _x,_y, _PI, -1,_Y_SCALE);
    }
}




