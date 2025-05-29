/// Fountain_1_init()


scr_draw = Fountain_1_draw;


Water_SPR1 = spr_Fountain_Water_1a_1; // anim frame 1
Water_SPR2 = spr_Fountain_Water_1b_1; // anim frame 2
//Water_SPR1 = spr_Fountain_Water_1a; // anim frame 1
//Water_SPR2 = spr_Fountain_Water_1b_2; // anim frame 2
GO_sprite_init(Water_SPR1);
ANIM_SPEED = (1<<3);

var _TSRC1 = $F3; // Fountain statue head
var _DEPTH_ADD = 3;
//var _DEPTH_ADD = 1; // Causes palette issue with cover layer/depth
var _DEPTH = tile_find_depth_by_tsrc((xl>>3)+1,yt>>3, ts_Man_made_1a_WRB, _TSRC1);
if (_DEPTH == -1)
{   _DEPTH = DEPTH_BG4;  }
GO_depth_init(_DEPTH+_DEPTH_ADD);


var _pi_base   = global.PI_BGR3;
var _pi_permut = 0;

if(    !is_undefined(         dk_spawn)){
    if (val(         g.dm_rm[?dk_spawn+STR_pal_idx]))
    {   _pi_base =   g.dm_rm[?dk_spawn+STR_pal_idx];  }
    
    if(!is_undefined(g.dm_rm[?dk_spawn+STR_Data+"01"]))
    {   _pi_permut = g.dm_rm[?dk_spawn+STR_Data+"01"];  }
    
    if(!is_undefined(g.dm_rm[?dk_spawn+STR_Data+"02"])){
        depth =      g.dm_rm[?dk_spawn+STR_Data+"02"];
        GO_depth_init(depth+_DEPTH_ADD);
    }
}


switch(_pi_permut){
default:{PALIDX=_pi_base; break;}
case  1:{PALIDX=add_pi_permut(_pi_base,"WBRGYKMC","Fountain"); break;}
case  2:{PALIDX=add_pi_permut(_pi_base,"RWBGMYKC","Fountain"); break;}
case  3:{PALIDX=add_pi_permut(_pi_base,"RBWGMKYC","Fountain"); break;}
case  4:{PALIDX=add_pi_permut(_pi_base,"BWRGKYMC","Fountain"); break;}
case  5:{PALIDX=add_pi_permut(_pi_base,"BRWGKMYC","Fountain"); break;}
}

GO_init_palidx(_pi_base);
palidx_permut = _pi_permut;



    can_draw_self = true;
if (g.town_name==STR_Nabooru 
//if (g.town_num==TOWN_IDX_NAB+1 
&& !quest_is_complete(QuestID_Nabooru_Spell) )
{
    can_draw_self = false;
}




