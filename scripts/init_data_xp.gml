/// init_data_xp()


// 50
// 150
// 300
// 300
// 500
// 700


// $00-07 --------------------------------------
ds_list_add(dl_XP,   0); //    0 ==   $0
ds_list_add(dl_XP,   1); //    1 ==   $1
ds_list_add(dl_XP,   2); //    2 ==   $2
ds_list_add(dl_XP,   3); //    3 ==   $3
ds_list_add(dl_XP,   4); //    4 ==   $4
ds_list_add(dl_XP,   5); //    5 ==   $5
ds_list_add(dl_XP,   6); //    6 ==   $6
ds_list_add(dl_XP,   7); //    7 ==   $7


// $08-0F --------------------------------------
ds_list_add(dl_XP,   8); //    8 ==   $8
ds_list_add(dl_XP,   9); //    9 ==   $9

ds_list_add(dl_XP,  10); //   10 ==   $A
ds_list_add(dl_XP,  15); //   15 ==   $F
ds_list_add(dl_XP,  20); //   20 ==  $14
ds_list_add(dl_XP,  25); //   25 ==  $19

ds_list_add(dl_XP,  30); //   30 ==  $1E
ds_list_add(dl_XP,  40); //   40 ==  $28


// $10-17 --------------------------------------
ds_list_add(dl_XP,  50); //   50 ==  $32
ds_list_add(dl_XP,  60); //   60 ==  $3C
ds_list_add(dl_XP,  70); //   70 ==  $46
ds_list_add(dl_XP,  80); //   80 ==  $50
ds_list_add(dl_XP,  90); //   90 ==  $5A

ds_list_add(dl_XP, 100); //  100 ==  $64
ds_list_add(dl_XP, 150); //  150 ==  $96
ds_list_add(dl_XP, 200); //  200 ==  $C8


// $18-1F --------------------------------------
ds_list_add(dl_XP, 250); //  250 ==  $FA

//ds_list_add(dl_XP, 301); //  301 == $12D
ds_list_add(dl_XP, 300); //  300 == $12C
ds_list_add(dl_XP, 400); //  400 == $190
ds_list_add(dl_XP, 500); //  500 == $1F4
ds_list_add(dl_XP, 600); //  600 == $258
ds_list_add(dl_XP, 700); //  700 == $2BC
ds_list_add(dl_XP, 800); //  800 == $320
ds_list_add(dl_XP, 900); //  900 == $384



// $20-27 --------------------------------------
ds_list_add(dl_XP,1000); // 1000 == $3E8
ds_list_add(dl_XP,1200); // 1200 == $44C
ds_list_add(dl_XP,1500); // 1500 == $5CC
ds_list_add(dl_XP,1700); // 1700 == $
ds_list_add(dl_XP,2000); // 2000 == $


ds_list_copy(dl_XP_DEFAULT, dl_XP);




// ===============================================
// ===============================================
ds_list_add(dl_XP_DRAIN,$00); // $00 =  0
ds_list_add(dl_XP_DRAIN,$05); // $05 =  5
ds_list_add(dl_XP_DRAIN,$0A); // $0A = 10
ds_list_add(dl_XP_DRAIN,$14); // $14 = 20



// Rising XP sprites
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_0);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_1);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_2);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_3);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_4);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_5);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_6);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_7);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_8);
ds_list_add(dl_rising_xp_spr,spr_Rising_XP_text_9);
RisingXP_SPR_W = sprite_get_width(dl_rising_xp_spr[|0]);




