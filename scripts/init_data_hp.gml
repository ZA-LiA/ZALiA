/// init_data_hp()


// $01, 02, 03, 04, 08, 0C, 0E, 
// $10, 12, 18, 20, 30, 38, 48, 
// $50, 60, 90, C0, F8, FA, FF, 


// $0-7                                                     // 
ds_list_add(dl_HP, $00); //  $00 =    0
ds_list_add(dl_HP, $01); //  $01 =    1
ds_list_add(dl_HP, $02); //  $02 =    2
ds_list_add(dl_HP, $03); //  $03 =    3
ds_list_add(dl_HP, $04); //  $04 =    4
ds_list_add(dl_HP, $06); //  $06 =    6
ds_list_add(dl_HP, $08); //  $08 =    8
ds_list_add(dl_HP, $0A); //  $0A =   10
// $8-F
ds_list_add(dl_HP, $0C); //  $0C =   12
ds_list_add(dl_HP, $0E); //  $0E =   14
ds_list_add(dl_HP, $10); //  $10 =   16
ds_list_add(dl_HP, $12); //  $12 =   18
ds_list_add(dl_HP, $14); //  $14 =   20
ds_list_add(dl_HP, $18); //  $18 =   24
ds_list_add(dl_HP, $1C); //  $1C =   28
ds_list_add(dl_HP, $20); //  $20 =   32
// $10-17
ds_list_add(dl_HP, $28); //  $28 =   40
ds_list_add(dl_HP, $30); //  $30 =   48
ds_list_add(dl_HP, $38); //  $38 =   56
ds_list_add(dl_HP, $40); //  $40 =   64
ds_list_add(dl_HP, $48); //  $48 =   72
ds_list_add(dl_HP, $50); //  $50 =   80
ds_list_add(dl_HP, $60); //  $60 =   96
ds_list_add(dl_HP, $70); //  $70 =  112
// $18-1F
ds_list_add(dl_HP, $80); //  $80 =  128
ds_list_add(dl_HP, $90); //  $90 =  144
ds_list_add(dl_HP, $A8); //  $A8 =  168
ds_list_add(dl_HP, $C0); //  $C0 =  192
ds_list_add(dl_HP, $D8); //  $D8 =  216
ds_list_add(dl_HP, $F8); //  $F8 =  248
ds_list_add(dl_HP, $FA); //  $FA =  250
ds_list_add(dl_HP, $FF); //  $FF =  255
// $20-27
ds_list_add(dl_HP,$120); // $120 =  288
ds_list_add(dl_HP,$150); // $150 =  336
ds_list_add(dl_HP,$190); // $190 =  400
ds_list_add(dl_HP,$1E0); // $1E0 =  480
ds_list_add(dl_HP,$240); // $240 =  560
ds_list_add(dl_HP,$2B0); // $2B0 =  688
ds_list_add(dl_HP,$330); // $330 =  816
ds_list_add(dl_HP,$3C0); // $3C0 =  960
//                                                          // 


ds_list_copy(dl_HP_DEFAULT, dl_HP);




