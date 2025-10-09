/// Ganon1_init1()


var _i,_j, _a;


Ganon_init_1();

Collision_VER = 3;

GO_init_palidx(PALIDX1);


TERMINAL_VELOCITY = $60;


HP_IDX = $0D; // $0D: $18
HP     = g.dl_HP[|HP_IDX];
hp     = HP;



projectile_OBJ = Flame1;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


Background_COLOR01 = p.C_BLK1;
//solid_type  = TID_SOLID1;

pc_is_inside = false;
pc_x_min  = 0;
pc_x_max  = 0;

PC_HB1_XLOFF = global.pc.csLft1_xoff;
PC_HB1_YTOFF = global.pc.csLft1_yoff;
//PC_HB1_YTOFF = global.pc.csTop1_yoff;
PC_HB1_W  = global.pc.csRgt1_xoff-PC_HB1_XLOFF;
PC_HB1_H  = global.pc.csBtm1_yoff-PC_HB1_YTOFF;
PC_HB1_xl = global.pc.xl+PC_HB1_XLOFF;
PC_HB1_yt = global.pc.yt+PC_HB1_YTOFF;

Fought_DATAKEY = STR_Battle+STR_Count+STR_Quest+hex_str(f.quest_num);



                          _a=1;
sub_state_SUMMON1       = _a++;
sub_state_PC_WALK1      = _a++;
sub_state_PC_POSITION2  = _a++;
sub_state_PC_POSITION3  = _a++;
sub_state_SUMMON2       = _a++;
sub_state_SUMMON3       = _a++;
sub_state_SUMMON4       = _a++;
sub_state_SUMMON5       = _a++;
sub_state_SUMMON6       = _a++;
sub_state_SUMMON7       = _a++;
sub_state_POUR_BLOOD    = _a++;
sub_state_RIVIVING      = _a++;
sub_state_DIALOGUE1     = _a++;
sub_state_PRE_BATTLE    = _a++;
sub_state_BATTLE        = _a++;
sub_state_DIALOGUE2     = _a++;
sub_state_REMOVE_FLOOR1 = _a++;
sub_state_REMOVE_FLOOR2 = _a++;
sub_state_DONE          = _a++;
sub_state               = sub_state_SUMMON1;




                               _a=1;
BattleState_ATTACK1_INIT     = _a++;
BattleState_ATTACK1_IDLE     = _a++;
BattleState_ATTACK1_POSITION = _a++;
BattleState_ATTACK1_JUMP1    = _a++;
BattleState_ATTACK1_JUMP2    = _a++;
BattleState_ATTACK1_THOMP    = _a++;
//                                          //
BattleState_ATTACK2_INIT     = _a++;
BattleState_ATTACK2_IDLE     = _a++;
BattleState_ATTACK2_TELL     = _a++;
BattleState_ATTACK2_POSITION = _a++;
BattleState_ATTACK2_DONE     = _a++;
//                                          //
BattleState_ATTACK3_IDLE     = _a++;
BattleState_ATTACK3_POSITION = _a++;
BattleState_ATTACK3_RISE     = _a++;
BattleState_ATTACK3_CROSS    = _a++;
BattleState_ATTACK3_DECEND   = _a++;
//                                          //
BattleState_ATTACK4_IDLE     = _a++;
BattleState_ATTACK4_RISE     = _a++;
BattleState_ATTACK4_SHOOT    = _a++;
BattleState_ATTACK4_DECEND   = _a++;
//                                          //
BattleState_DECIDE_ATTACK    = _a++;
BattleState                  = BattleState_ATTACK1_INIT;
//                                          //
Attack1_counter = 0;
Attack2_counter = 0;





DURATION1 = $28;
DURATION2 = $28;
DURATION3 = DURATION2+$40;
DURATION4 = $50;
DURATION5 = $FF;
DURATION6 = $80;





Crystal_state        = 1; // 0: dead, 1: normal
Crystal_sprite_state = 0; // 0: can't draw, 1: empty spr, 2: full, 3: full & flashing spr
Crystal_xoff         =  $00;
Crystal_yoff         = -$24;
Crystal_x            = x + Crystal_xoff;
Crystal_y            = y + Crystal_yoff;


Bottle_can_draw  = false;
BottleTop_SPRITE = spr_Item_Bottle_8_Top;
Bottle_SPRITE1   = spr_Item_Bottle_8d; // No top
Bottle_SPRITE2   = spr_Item_Bottle_8c; // full, including liquid
Bottle_sprite    = Bottle_SPRITE2;
Bottle_x         = x;
Bottle_y         = yt-$0C;
Bottle_yt        = Bottle_y-$08;
Bottle_yb        = Bottle_y+$08;
Bottle_y_MIN     = Bottle_y-$14;
Bottle_yscale    = 1;


            dl_BottleLiquid_SPRITES=ds_list_create();
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_8);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_7);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_6);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_5);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_4);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_3);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_2);
ds_list_add(dl_BottleLiquid_SPRITES,spr_Item_Bottle_8_Liquid_1b_1);
BottleLiquid_can_draw = false;
BottleLiquid_level    = 0;


Blood_can_draw = false;
Blood_COLOR    = p.C_ORG4;
Blood_x        = x;
Blood_yt       = 0;
Blood_yb       = 0;
Blood_yb_MAX   = yt+$04;
Blood_h        = 2;


Door_xl          = arena_xl-$10;
Door_yt          =(GROUND_Y>>3)-$06;
Door_yt          = find_row_solid(TID_SOLID1, (Door_xl>>3)+1, (GROUND_Y>>3)-1, -1, $FF,Door_yt);
Door_yt          =(Door_yt+1)<<3;
Door_DEPTH       = DEPTH_BG3;
Door_TS          = ts_DungeonH01;
Door_TSRC        = $EE; // $EE, $EF, $FE, $FF
//Door_TS          = ts_Man_made_1a_WRB;
//Door_TSRC        = $34; // $34, $35, $36, $37
DoorBlocks_COUNT =(GROUND_Y-Door_yt)>>4; // 
DoorBlocks_count = 0; // number placed so far




Ground_HP1 = $4; // hp until cracking
Ground_HP2 = $1; // hp when cracked
//Ground_HP1=$2; Ground_HP2=$1; // %% TESTING %%


dg_Ground=ds_grid_create(3,2);

dg_Ground[#0,0] = 3; // state. 0: nothing, 1: crumble, 2: cracked, 3: norm
dg_Ground[#0,1] = Ground_HP1+Ground_HP2;

dg_Ground[#1,0] = 3; // state. 0: nothing, 1: crumble, 2: cracked, 3: norm
dg_Ground[#1,1] = $3+Ground_HP2;

dg_Ground[#2,0] = 3; // state. 0: nothing, 1: crumble, 2: cracked, 3: norm
dg_Ground[#2,1] = $2+Ground_HP2;


Ground_DEPTH = DEPTH_FG5;
Ground_y     = GROUND_Y;





dl_ONEWAY_RC = ds_list_create();
for(_i=0; _i<global.dg_solid_w; _i++)
{
    for(_j=0; _j<global.dg_solid_h; _j++)
    {
        if (global.dg_solid[#_i,_j]==TID_ONEWY1)
        {
            ds_list_add(dl_ONEWAY_RC,(_j<<8)|_i);
        }
    }
}





Boss_set_MusicBattle_props(STR_Ganon+"1");




// To prevent spoilers. Specifically right now in the 'AUDIO - CUSTOM' menu
f.dm_quests[?"_Has_Reached"+STR_Ganon+"1"] = true;




