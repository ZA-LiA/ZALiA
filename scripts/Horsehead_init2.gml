/// Horsehead_init2()


var _i, _a, _val;


Boss_init_2();

GO_init_palidx(global.PI_MOB_RED);


// attack_state is also the index for dl_sprites, dl_Arm_SPRITES
                        _a=0;
attack_state_IDLE     = _a++;
attack_state_DRAWBACK = _a++;
attack_state_SWING    = _a++;
attack_state          = attack_state_IDLE; // 0080


if (f.quest_num>1)
{
    projectile_OBJ = Mace1;
    projectile_VER = 1;
    projectile     = projectile_OBJ;
    projectile_ver = projectile_VER;
}


// body
dl_sprites[|attack_state_IDLE]     = spr_Horsehead_body1A;
dl_sprites[|attack_state_DRAWBACK] = spr_Horsehead_body1B;
dl_sprites[|attack_state_SWING]    = spr_Horsehead_body1C;
GO_set_sprite(id,dl_sprites[|attack_state]);


// arms
dl_Arm_SPRITES=ds_list_create();
dl_Arm_SPRITES[|attack_state_IDLE]     = 0;
dl_Arm_SPRITES[|attack_state_DRAWBACK] = spr_Boss_mace1A;
dl_Arm_SPRITES[|attack_state_SWING]    = spr_Boss_mace1B;
Arm_sprite = dl_Arm_SPRITES[|attack_state];
Arm_xoff   = 0;


// legs
Legs_sprite = spr_Boss_legs1A;


// head
Head_sprite = spr_Horsehead_head1;
Head_xoff   = 0;
Head_xscale = 1;



Boss_init_2b(-1);




if (f.quest_num>1)
{
    // 1st quest: $0F: $20
    HP_IDX  = $14; // HP_IDX $14: $48
    hp = g.dl_HP[|HP_IDX];
    
    XP_IDX += $02;
    xp = g.dl_XP[|XP_IDX];
}

if (g.dungeon_num!=1)
{
    HP_IDX += $03;
    hp = g.dl_HP[|HP_IDX];
    
    XP_IDX += $01;
    xp = g.dl_XP[|XP_IDX];
}


DISTANCE1 = $20;
DISTANCE2 = DISTANCE1+$10;

DURATION1 = $F;
DURATION2 = $60;
DURATION3 = DURATION2-$10;

ProjAttack_timer1 = $10;



// body hb
BodyHB_color = c_blue;



// sword hb
SwordHB_XOFF = 16 + g.HB_ADJ_X; // 
SwordHB_YOFF = 16 + g.HB_ADJ_Y; // 
SwordHB_W    = 14 + g.HB_ADJ_W; // 
SwordHB_H    =  1 + g.HB_ADJ_H; // 
SwordHB_xoff = SwordHB_XOFF * facing_dir;
SwordHB_yoff = SwordHB_YOFF;
SwordHB_w    = SwordHB_W;
SwordHB_h    = SwordHB_H;



// shield hb
ShieldHB_color = c_white;
ShieldHB_IDX   = 8; // OG: 3
ShieldHB_idx   = ShieldHB_IDX;




