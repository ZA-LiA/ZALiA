/// data_stat_damage()


var _val;


ds_grid_resize(dg_enemy_damage, $09,$10);
//                                  // 
// enemy attack level = $00  (NO DMG)
dg_enemy_damage[#$00,$00] = $00;
dg_enemy_damage[#$01,$00] = $00;
dg_enemy_damage[#$02,$00] = $00;
dg_enemy_damage[#$03,$00] = $00;
dg_enemy_damage[#$04,$00] = $00;
dg_enemy_damage[#$05,$00] = $00;
dg_enemy_damage[#$06,$00] = $00;
dg_enemy_damage[#$07,$00] = $00;
dg_enemy_damage[#$08,$00] = $00;
//                                  // 
// enemy attack level = $01           
dg_enemy_damage[#$00,$01] = $10; // f.level_lif = 1
dg_enemy_damage[#$01,$01] = $0C; // f.level_lif = 2
dg_enemy_damage[#$02,$01] = $0C; // f.level_lif = 3
dg_enemy_damage[#$03,$01] = $0C; // f.level_lif = 4
dg_enemy_damage[#$04,$01] = $08; // f.level_lif = 5
dg_enemy_damage[#$05,$01] = $04; // f.level_lif = 6
dg_enemy_damage[#$06,$01] = $04; // f.level_lif = 7
dg_enemy_damage[#$07,$01] = $04; // f.level_lif = 8
dg_enemy_damage[#$08,$01] = $03; // f.level_lif = 9
//                                  // 
// enemy attack level = $02           
dg_enemy_damage[#$00,$02] = $20;
dg_enemy_damage[#$01,$02] = $1C;
dg_enemy_damage[#$02,$02] = $14;
dg_enemy_damage[#$03,$02] = $10;
dg_enemy_damage[#$04,$02] = $0C;
dg_enemy_damage[#$05,$02] = $0C;
dg_enemy_damage[#$06,$02] = $08;
dg_enemy_damage[#$07,$02] = $08;
dg_enemy_damage[#$08,$02] = $06;
//                                  // 
// enemy attack level = $03           
dg_enemy_damage[#$00,$03] = $30;
dg_enemy_damage[#$01,$03] = $28;
dg_enemy_damage[#$02,$03] = $24;
dg_enemy_damage[#$03,$03] = $20;
dg_enemy_damage[#$04,$03] = $18;
dg_enemy_damage[#$05,$03] = $14;
dg_enemy_damage[#$06,$03] = $10;
dg_enemy_damage[#$07,$03] = $0C;
dg_enemy_damage[#$08,$03] = $08;
//                                  // 
// enemy attack level = $04           
dg_enemy_damage[#$00,$04] = $60;
dg_enemy_damage[#$01,$04] = $48;
dg_enemy_damage[#$02,$04] = $38;
dg_enemy_damage[#$03,$04] = $30;
dg_enemy_damage[#$04,$04] = $28;
dg_enemy_damage[#$05,$04] = $20;
dg_enemy_damage[#$06,$04] = $1C;
dg_enemy_damage[#$07,$04] = $18;
dg_enemy_damage[#$08,$04] = $12;
//                                  // 
// enemy attack level = $05           
dg_enemy_damage[#$00,$05] = $90;
dg_enemy_damage[#$01,$05] = $78;
dg_enemy_damage[#$02,$05] = $60;
dg_enemy_damage[#$03,$05] = $48;
dg_enemy_damage[#$04,$05] = $38;
dg_enemy_damage[#$05,$05] = $30;
dg_enemy_damage[#$06,$05] = $28;
dg_enemy_damage[#$07,$05] = $20;
dg_enemy_damage[#$08,$05] = $18;
//                                  // 
// enemy attack level = $06           
dg_enemy_damage[#$00,$06] = $E0;
dg_enemy_damage[#$01,$06] = $A0;
dg_enemy_damage[#$02,$06] = $80;
dg_enemy_damage[#$03,$06] = $70;
dg_enemy_damage[#$04,$06] = $60;
dg_enemy_damage[#$05,$06] = $50;
dg_enemy_damage[#$06,$06] = $40;
dg_enemy_damage[#$07,$06] = $30;
dg_enemy_damage[#$08,$06] = $24;
//                                  // 
// enemy attack level = $07           
dg_enemy_damage[#$00,$07] = $E0;
dg_enemy_damage[#$01,$07] = $C0;
dg_enemy_damage[#$02,$07] = $A0;
dg_enemy_damage[#$03,$07] = $90;
dg_enemy_damage[#$04,$07] = $80;
dg_enemy_damage[#$05,$07] = $70;
dg_enemy_damage[#$06,$07] = $60;
dg_enemy_damage[#$07,$07] = $50;
dg_enemy_damage[#$08,$07] = $3C;
//                                  // 
// enemy attack level = $08
dg_enemy_damage[#$00,$08] = $F0;
dg_enemy_damage[#$01,$08] = $D0;
dg_enemy_damage[#$02,$08] = $B0;
dg_enemy_damage[#$03,$08] = $A0;
dg_enemy_damage[#$04,$08] = $90;
dg_enemy_damage[#$05,$08] = $80;
dg_enemy_damage[#$06,$08] = $70;
dg_enemy_damage[#$07,$08] = $60;
dg_enemy_damage[#$08,$08] = $48;
//                                  // 
// enemy attack level = $09
                            _val=$70;
dg_enemy_damage[#$00,$09] = _val;
dg_enemy_damage[#$01,$09] = _val;
dg_enemy_damage[#$02,$09] = _val;
dg_enemy_damage[#$03,$09] = _val;
dg_enemy_damage[#$04,$09] = _val;
dg_enemy_damage[#$05,$09] = _val;
dg_enemy_damage[#$06,$09] = _val;
dg_enemy_damage[#$07,$09] = _val;
dg_enemy_damage[#$08,$09] = _val;
//                                  // 
// enemy attack level = $0A
                            _val+=$10;
dg_enemy_damage[#$00,$0A] = _val;
dg_enemy_damage[#$01,$0A] = _val;
dg_enemy_damage[#$02,$0A] = _val;
dg_enemy_damage[#$03,$0A] = _val;
dg_enemy_damage[#$04,$0A] = _val;
dg_enemy_damage[#$05,$0A] = _val;
dg_enemy_damage[#$06,$0A] = _val;
dg_enemy_damage[#$07,$0A] = _val;
dg_enemy_damage[#$08,$0A] = _val;
//                                  // 
// enemy attack level = $0B
                            _val+=$10;
dg_enemy_damage[#$00,$0B] = _val;
dg_enemy_damage[#$01,$0B] = _val;
dg_enemy_damage[#$02,$0B] = _val;
dg_enemy_damage[#$03,$0B] = _val;
dg_enemy_damage[#$04,$0B] = _val;
dg_enemy_damage[#$05,$0B] = _val;
dg_enemy_damage[#$06,$0B] = _val;
dg_enemy_damage[#$07,$0B] = _val;
dg_enemy_damage[#$08,$0B] = _val;
//                                  // 
// enemy attack level = $0C
                            _val+=$10;
dg_enemy_damage[#$00,$0C] = _val;
dg_enemy_damage[#$01,$0C] = _val;
dg_enemy_damage[#$02,$0C] = _val;
dg_enemy_damage[#$03,$0C] = _val;
dg_enemy_damage[#$04,$0C] = _val;
dg_enemy_damage[#$05,$0C] = _val;
dg_enemy_damage[#$06,$0C] = _val;
dg_enemy_damage[#$07,$0C] = _val;
dg_enemy_damage[#$08,$0C] = _val;
//                                  // 
// enemy attack level = $0D
dg_enemy_damage[#$00,$0D] = _val;
dg_enemy_damage[#$01,$0D] = _val;
dg_enemy_damage[#$02,$0D] = _val;
dg_enemy_damage[#$03,$0D] = _val;
dg_enemy_damage[#$04,$0D] = _val;
dg_enemy_damage[#$05,$0D] = _val;
dg_enemy_damage[#$06,$0D] = _val;
dg_enemy_damage[#$07,$0D] = _val;
dg_enemy_damage[#$08,$0D] = _val;
//                                  // 
// enemy attack level = $0E
                            _val+=$10;
dg_enemy_damage[#$00,$0E] = _val;
dg_enemy_damage[#$01,$0E] = _val;
dg_enemy_damage[#$02,$0E] = _val;
dg_enemy_damage[#$03,$0E] = _val;
dg_enemy_damage[#$04,$0E] = _val;
dg_enemy_damage[#$05,$0E] = _val;
dg_enemy_damage[#$06,$0E] = _val;
dg_enemy_damage[#$07,$0E] = _val;
dg_enemy_damage[#$08,$0E] = _val;
//                                  // 
// enemy attack level = $0F
                            _val+=$10;
dg_enemy_damage[#$00,$0F] = _val;
dg_enemy_damage[#$01,$0F] = _val;
dg_enemy_damage[#$02,$0F] = _val;
dg_enemy_damage[#$03,$0F] = _val;
dg_enemy_damage[#$04,$0F] = _val;
dg_enemy_damage[#$05,$0F] = _val;
dg_enemy_damage[#$06,$0F] = _val;
dg_enemy_damage[#$07,$0F] = _val;
dg_enemy_damage[#$08,$0F] = _val;
//                                  // 

dg_enemy_damage_DEFAULT = ds_grid_create(ds_grid_width(dg_enemy_damage),ds_grid_height(dg_enemy_damage));
ds_grid_copy(dg_enemy_damage_DEFAULT,dg_enemy_damage);




