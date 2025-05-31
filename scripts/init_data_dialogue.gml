/// init_data_dialogue()


//     NPC_0 v1    Invisible
//     NPC_0 v2    Town Sign
//     NPC_0 v3    Mirror
//     NPC_0 v4    Fountain
//     NPC_0 v5    Stone Head
//     NPC_0 v6    Plaque

//     NPC_1 v1    Idle Simple

//     NPC_2 v1    Traffic

//     NPC_3 v1    Special Walker
//     NPC_3 v2    Special Walker
//     NPC_3 v3    Special Walker
//     NPC_3 v4    Special Walker

//     NPC_4 v1    Life
//     NPC_4 v2    Magic
//     NPC_4 v3    Save

//     NPC_5 v1    Quest

//     NPC_6 v1    Skill Knight Downthrust
//     NPC_6 v2    Skill Knight Upthrust

//     NPC_7 v1    Spell Giver

//     NPC_8 v1    Town fairy requesting rescue of Rescue Fairy

//     NPC_9 v1    Bagu
//     NPC_9 v2    Riverman
//     NPC_9 v3    Moblin NPC
//     NPC_9 v4    Ache NPC
//     NPC_9 v5    Bot NPC
//     NPC_9 v6    Error
//     NPC_9 v7    Error's friend
//     NPC_9 v8    //
//     NPC_9 v9    Midus
//     NPC_9 vA    Anju's friend 1
//     NPC_9 vB    Anju
//     NPC_9 vC    Anju's friend 2
//     NPC_9 vE    Boulder circle hint

//     NPC_A v1    Triforce Keeper

//     NPC_B v1    Shop, Minigame

//     NPC_Z v1     Zelda



var _i, _a, _num;
var _val, _val1,_val2,_val3,_val4;
var _dk,_dk1,_dk2,_dk3,_dk4;
var _DK_SKIP = STR_Skip+STR_Type;
var _str,_str1,_str2;
var _case;
//var _a1=0;
//var _a2=0;
var _DynamicDialogueA_count = 0;


var         _dm=ds_map_create();
ds_map_copy(_dm,dm_dialogue);


// DK: Dialogue data-Key
// var _DK00 = ''; // 
/*
var _DK000 = '0_00_'; // 
var _DK001 = '0_01_'; // 
var _DK002 = '0_02_'; // 
var _DK003 = '0_03_'; // 
var _DK004 = '0_04_'; // 
var _DK005 = '0_05_'; // 
var _DK006 = '0_06_'; // 
var _DK007 = '0_07_'; // 
var _DK008 = '0_08_'; // 
var _DK009 = '0_09_'; // 
var _DK00A = '0_0A_'; // 
var _DK00B = '0_0B_'; // 
var _DK00C = '0_0C_'; // 
var _DK00D = '0_0D_'; // 
var _DK00E = '0_0E_'; // 
var _DK00F = '0_0F_'; // 
*/

// NPC_0
var _DK0000 = '00_00_'; // 
var _DK0001 = '00_01_'; // 
var _DK0002 = '00_02_'; // 
var _DK0003 = '00_03_'; // 
var _DK0004 = '00_04_'; // 
var _DK0005 = '00_05_'; // 
var _DK0006 = '00_06_'; // 
var _DK0007 = '00_07_'; // 
var _DK0008 = '00_08_'; // 
var _DK0009 = '00_09_'; // 
var _DK000A = '00_0A_'; // 
var _DK000B = '00_0B_'; // 
var _DK000C = '00_0C_'; // 
var _DK000D = '00_0D_'; // 
var _DK000E = '00_0E_'; // 
var _DK000F = '00_0F_'; // 
//                      //
var _DK0010 = '00_10_'; // 
var _DK0011 = '00_11_'; // 
var _DK0012 = '00_12_'; // 
var _DK0013 = '00_13_'; // 
var _DK0014 = '00_14_'; // 
var _DK0015 = '00_15_'; // 
var _DK0016 = '00_16_'; // 
var _DK0017 = '00_17_'; // 
var _DK0018 = '00_18_'; // 
var _DK0019 = '00_19_'; // 
var _DK001A = '00_1A_'; // 
var _DK001B = '00_1B_'; // 
var _DK001C = '00_1C_'; // 
var _DK001D = '00_1D_'; // 
var _DK001E = '00_1E_'; // 
var _DK001F = '00_1F_'; // 
//                      //
var _DK0020 = '00_20_'; // 
var _DK0021 = '00_21_'; // 
var _DK0022 = '00_22_'; // 
var _DK0023 = '00_23_'; // 
var _DK0024 = '00_24_'; // 
var _DK0025 = '00_25_'; // 
var _DK0026 = '00_26_'; // 
var _DK0027 = '00_27_'; // 
var _DK0028 = '00_28_'; // 
var _DK0029 = '00_29_'; // 
var _DK002A = '00_2A_'; // 
var _DK002B = '00_2B_'; // 
var _DK002C = '00_2C_'; // 
var _DK002D = '00_2D_'; // 
var _DK002E = '00_2E_'; // 
var _DK002F = '00_2F_'; // 
//                      //
var _DK0030 = '00_30_'; // 
var _DK0031 = '00_31_'; // 
var _DK0032 = '00_32_'; // 
var _DK0033 = '00_33_'; // 
var _DK0034 = '00_34_'; // 
var _DK0035 = '00_35_'; // 
var _DK0036 = '00_36_'; // 
var _DK0037 = '00_37_'; // 
var _DK0038 = '00_38_'; // 
var _DK0039 = '00_39_'; // 
var _DK003A = '00_3A_'; // 
var _DK003B = '00_3B_'; // 
var _DK003C = '00_3C_'; // 
var _DK003D = '00_3D_'; // 
var _DK003E = '00_3E_'; // 
var _DK003F = '00_3F_'; // 
//                      //
var _DK0040 = '00_40_'; // 
var _DK0041 = '00_41_'; // 
var _DK0042 = '00_42_'; // 
var _DK0043 = '00_43_'; // 
var _DK0044 = '00_44_'; // 
var _DK0045 = '00_45_'; // 
var _DK0046 = '00_46_'; // 
var _DK0047 = '00_47_'; // 
var _DK0048 = '00_48_'; // 
var _DK0049 = '00_49_'; // 
var _DK004A = '00_4A_'; // 
var _DK004B = '00_4B_'; // 
var _DK004C = '00_4C_'; // 
var _DK004D = '00_4D_'; // 
var _DK004E = '00_4E_'; // 
var _DK004F = '00_4F_'; // 
//                      //
var _DK0050 = '00_50_'; // 
var _DK0051 = '00_51_'; // 
var _DK0052 = '00_52_'; // 
var _DK0053 = '00_53_'; // 
var _DK0054 = '00_54_'; // 
var _DK0055 = '00_55_'; // 
var _DK0056 = '00_56_'; // 
var _DK0057 = '00_57_'; // 
var _DK0058 = '00_58_'; // 
var _DK0059 = '00_59_'; // 
var _DK005A = '00_5A_'; // 
var _DK005B = '00_5B_'; // 
var _DK005C = '00_5C_'; // 
var _DK005D = '00_5D_'; // 
var _DK005E = '00_5E_'; // 
var _DK005F = '00_5F_'; // 
//                      //
//                      //
//                      //
//                      //
// NPC_1
var _DK0100 = '01_00_'; // 
var _DK0101 = '01_01_'; // 
var _DK0102 = '01_02_'; // 
var _DK0103 = '01_03_'; // 
var _DK0104 = '01_04_'; // 
var _DK0105 = '01_05_'; // 
var _DK0106 = '01_06_'; // 
var _DK0107 = '01_07_'; // 
var _DK0108 = '01_08_'; // 
var _DK0109 = '01_09_'; // 
var _DK010A = '01_0A_'; // 
var _DK010B = '01_0B_'; // 
var _DK010C = '01_0C_'; // 
var _DK010D = '01_0D_'; // 
var _DK010E = '01_0E_'; // 
var _DK010F = '01_0F_'; // 
//                      //
var _DK0110 = '01_10_'; // 
var _DK0111 = '01_11_'; // 
var _DK0112 = '01_12_'; // 
var _DK0113 = '01_13_'; // 
var _DK0114 = '01_14_'; // 
var _DK0115 = '01_15_'; // 
var _DK0116 = '01_16_'; // 
var _DK0117 = '01_17_'; // 
var _DK0118 = '01_18_'; // 
var _DK0119 = '01_19_'; // 
var _DK011A = '01_1A_'; // 
var _DK011B = '01_1B_'; // 
var _DK011C = '01_1C_'; // 
var _DK011D = '01_1D_'; // 
var _DK011E = '01_1E_'; // 
var _DK011F = '01_1F_'; // 
//                      //
var _DK0140 = '01_40_'; // 
var _DK0141 = '01_41_'; // 
var _DK0142 = '01_42_'; // 
var _DK0143 = '01_43_'; // 
var _DK0144 = '01_44_'; // 
var _DK0145 = '01_45_'; // 
var _DK0146 = '01_46_'; // 
var _DK0147 = '01_47_'; // 
var _DK0148 = '01_48_'; // 
var _DK0149 = '01_49_'; // 
var _DK014A = '01_4A_'; // 
var _DK014B = '01_4B_'; // 
var _DK014C = '01_4C_'; // 
var _DK014D = '01_4D_'; // 
var _DK014E = '01_4E_'; // 
var _DK014F = '01_4F_'; // 
//                      //
var _DK0150 = '01_50_'; // 
var _DK0151 = '01_51_'; // 
var _DK0152 = '01_52_'; // 
var _DK0153 = '01_53_'; // 
var _DK0154 = '01_54_'; // 
var _DK0155 = '01_55_'; // 
var _DK0156 = '01_56_'; // 
var _DK0157 = '01_57_'; // 
var _DK0158 = '01_58_'; // 
var _DK0159 = '01_59_'; // 
var _DK015A = '01_5A_'; // 
var _DK015B = '01_5B_'; // 
var _DK015C = '01_5C_'; // 
var _DK015D = '01_5D_'; // 
var _DK015E = '01_5E_'; // 
var _DK015F = '01_5F_'; // 
//                      //
//                      //
//                      //
//                      //
// NPC_2
var _DK0200 = '02_00_'; // 
var _DK0201 = '02_01_'; // 
var _DK0202 = '02_02_'; // 
var _DK0203 = '02_03_'; // 
var _DK0204 = '02_04_'; // 
var _DK0205 = '02_05_'; // 
var _DK0206 = '02_06_'; // 
var _DK0207 = '02_07_'; // 
var _DK0208 = '02_08_'; // 
var _DK0209 = '02_09_'; // 
var _DK020A = '02_0A_'; // 
var _DK020B = '02_0B_'; // 
var _DK020C = '02_0C_'; // 
var _DK020D = '02_0D_'; // 
var _DK020E = '02_0E_'; // 
var _DK020F = '02_0F_'; // 
//                      //
var _DK0240 = '02_40_'; // 
var _DK0241 = '02_41_'; // 
var _DK0242 = '02_42_'; // 
var _DK0243 = '02_43_'; // 
var _DK0244 = '02_44_'; // 
var _DK0245 = '02_45_'; // 
var _DK0246 = '02_46_'; // 
var _DK0247 = '02_47_'; // 
var _DK0248 = '02_48_'; // 
var _DK0249 = '02_49_'; // 
var _DK024A = '02_4A_'; // 
var _DK024B = '02_4B_'; // 
var _DK024C = '02_4C_'; // 
var _DK024D = '02_4D_'; // 
var _DK024E = '02_4E_'; // 
var _DK024F = '02_4F_'; // 
//                      //
var _DK0250 = '02_50_'; // 
var _DK0251 = '02_51_'; // 
var _DK0252 = '02_52_'; // 
var _DK0253 = '02_53_'; // 
var _DK0254 = '02_54_'; // 
var _DK0255 = '02_55_'; // 
var _DK0256 = '02_56_'; // 
var _DK0257 = '02_57_'; // 
var _DK0258 = '02_58_'; // 
var _DK0259 = '02_59_'; // 
var _DK025A = '02_5A_'; // 
var _DK025B = '02_5B_'; // 
var _DK025C = '02_5C_'; // 
var _DK025D = '02_5D_'; // 
var _DK025E = '02_5E_'; // 
var _DK025F = '02_5F_'; // 
//                      //
//                      //
//                      //
//                      //
// NPC_3
var _DK0300 = '03_00_'; // 
var _DK0301 = '03_01_'; // 
var _DK0302 = '03_02_'; // 
var _DK0303 = '03_03_'; // 
var _DK0304 = '03_04_'; // 
var _DK0305 = '03_05_'; // 
var _DK0306 = '03_06_'; // 
var _DK0307 = '03_07_'; // 
var _DK0308 = '03_08_'; // 
var _DK0309 = '03_09_'; // 
var _DK030A = '03_0A_'; // 
var _DK030B = '03_0B_'; // 
var _DK030C = '03_0C_'; // 
var _DK030D = '03_0D_'; // 
var _DK030E = '03_0E_'; // 
var _DK030F = '03_0F_'; // 
//                      //
var _DK0340 = '03_40_'; // 
var _DK0341 = '03_41_'; // 
var _DK0342 = '03_42_'; // 
var _DK0343 = '03_43_'; // 
var _DK0344 = '03_44_'; // 
var _DK0345 = '03_45_'; // 
var _DK0346 = '03_46_'; // 
var _DK0347 = '03_47_'; // 
var _DK0348 = '03_48_'; // 
var _DK0349 = '03_49_'; // 
var _DK034A = '03_4A_'; // 
var _DK034B = '03_4B_'; // 
var _DK034C = '03_4C_'; // 
var _DK034D = '03_4D_'; // 
var _DK034E = '03_4E_'; // 
var _DK034F = '03_4F_'; // 
//                      //
var _DK0350 = '03_50_'; // 
var _DK0351 = '03_51_'; // 
var _DK0352 = '03_52_'; // 
var _DK0353 = '03_53_'; // 
var _DK0354 = '03_54_'; // 
var _DK0355 = '03_55_'; // 
var _DK0356 = '03_56_'; // 
var _DK0357 = '03_57_'; // 
var _DK0358 = '03_58_'; // 
var _DK0359 = '03_59_'; // 
var _DK035A = '03_5A_'; // 
var _DK035B = '03_5B_'; // 
var _DK035C = '03_5C_'; // 
var _DK035D = '03_5D_'; // 
var _DK035E = '03_5E_'; // 
var _DK035F = '03_5F_'; // 
//                      //
//                      //
//                      //
//                      //
// NPC_4
var _DK0400 = '04_00_'; // 
var _DK0401 = '04_01_'; // 
var _DK0402 = '04_02_'; // 
var _DK0403 = '04_03_'; // 
var _DK0404 = '04_04_'; // 
var _DK0405 = '04_05_'; // 
var _DK0406 = '04_06_'; // 
var _DK0407 = '04_07_'; // 
var _DK0408 = '04_08_'; // 
var _DK0409 = '04_09_'; // 
var _DK040A = '04_0A_'; // 
var _DK040B = '04_0B_'; // 
var _DK040C = '04_0C_'; // 
var _DK040D = '04_0D_'; // 
var _DK040E = '04_0E_'; // 
var _DK040F = '04_0F_'; // 
//                      //
var _DK0440 = '04_40_'; // 
var _DK0441 = '04_41_'; // 
var _DK0442 = '04_42_'; // 
var _DK0443 = '04_43_'; // 
var _DK0444 = '04_44_'; // 
var _DK0445 = '04_45_'; // 
var _DK0446 = '04_46_'; // 
var _DK0447 = '04_47_'; // 
var _DK0448 = '04_48_'; // 
var _DK0449 = '04_49_'; // 
var _DK044A = '04_4A_'; // 
var _DK044B = '04_4B_'; // 
var _DK044C = '04_4C_'; // 
var _DK044D = '04_4D_'; // 
var _DK044E = '04_4E_'; // 
var _DK044F = '04_4F_'; // 
//                      //
var _DK0450 = '04_50_'; // 
var _DK0451 = '04_51_'; // 
var _DK0452 = '04_52_'; // 
var _DK0453 = '04_53_'; // 
var _DK0454 = '04_54_'; // 
var _DK0455 = '04_55_'; // 
var _DK0456 = '04_56_'; // 
var _DK0457 = '04_57_'; // 
var _DK0458 = '04_58_'; // 
var _DK0459 = '04_59_'; // 
var _DK045A = '04_5A_'; // 
var _DK045B = '04_5B_'; // 
var _DK045C = '04_5C_'; // 
var _DK045D = '04_5D_'; // 
var _DK045E = '04_5E_'; // 
var _DK045F = '04_5F_'; // 
//                      //
//                      //
//                      //
//                      //
// NPC_5
var _DK0500 = '05_00_'; // 
var _DK0501 = '05_01_'; // 
var _DK0502 = '05_02_'; // 
var _DK0503 = '05_03_'; // 
var _DK0504 = '05_04_'; // 
var _DK0505 = '05_05_'; // 
var _DK0506 = '05_06_'; // 
var _DK0507 = '05_07_'; // 
var _DK0508 = '05_08_'; // 
var _DK0509 = '05_09_'; // 
var _DK050A = '05_0A_'; // 
var _DK050B = '05_0B_'; // 
var _DK050C = '05_0C_'; // 
var _DK050D = '05_0D_'; // 
var _DK050E = '05_0E_'; // 
var _DK050F = '05_0F_'; // 
//                          //
var _DK0540 = '05_40_'; // 
var _DK0541 = '05_41_'; // 
var _DK0542 = '05_42_'; // 
var _DK0543 = '05_43_'; // 
var _DK0544 = '05_44_'; // 
var _DK0545 = '05_45_'; // 
var _DK0546 = '05_46_'; // 
var _DK0547 = '05_47_'; // 
var _DK0548 = '05_48_'; // 
var _DK0549 = '05_49_'; // 
var _DK054A = '05_4A_'; // 
var _DK054B = '05_4B_'; // 
var _DK054C = '05_4C_'; // 
var _DK054D = '05_4D_'; // 
var _DK054E = '05_4E_'; // 
var _DK054F = '05_4F_'; // 
//                          //


// NPC_6
var _DK0600 = '06_00_'; // 
var _DK0601 = '06_01_'; // 
var _DK0602 = '06_02_'; // 
var _DK0603 = '06_03_'; // 
var _DK0604 = '06_04_'; // 
var _DK0605 = '06_05_'; // 
var _DK0606 = '06_06_'; // 
var _DK0607 = '06_07_'; // 
var _DK0608 = '06_08_'; // 
var _DK0609 = '06_09_'; // 
var _DK060A = '06_0A_'; // 
var _DK060B = '06_0B_'; // 
var _DK060C = '06_0C_'; // 
var _DK060D = '06_0D_'; // 
var _DK060E = '06_0E_'; // 
var _DK060F = '06_0F_'; // 
//                          //
var _DK0640 = '06_40_'; // 
var _DK0641 = '06_41_'; // 
var _DK0642 = '06_42_'; // 
var _DK0643 = '06_43_'; // 
var _DK0644 = '06_44_'; // 
var _DK0645 = '06_45_'; // 
var _DK0646 = '06_46_'; // 
var _DK0647 = '06_47_'; // 
var _DK0648 = '06_48_'; // 
var _DK0649 = '06_49_'; // 
var _DK064A = '06_4A_'; // 
var _DK064B = '06_4B_'; // 
var _DK064C = '06_4C_'; // 
var _DK064D = '06_4D_'; // 
var _DK064E = '06_4E_'; // 
var _DK064F = '06_4F_'; // 
//                          //


// NPC_7
var _DK0700 = '07_00_'; // 
var _DK0701 = '07_01_'; // 
var _DK0702 = '07_02_'; // 
var _DK0703 = '07_03_'; // 
var _DK0704 = '07_04_'; // 
var _DK0705 = '07_05_'; // 
var _DK0706 = '07_06_'; // 
var _DK0707 = '07_07_'; // 
var _DK0708 = '07_08_'; // 
var _DK0709 = '07_09_'; // 
var _DK070A = '07_0A_'; // 
var _DK070B = '07_0B_'; // 
var _DK070C = '07_0C_'; // 
var _DK070D = '07_0D_'; // 
var _DK070E = '07_0E_'; // 
var _DK070F = '07_0F_'; // 
//                          //
var _DK0740 = '07_40_'; // 
var _DK0741 = '07_41_'; // 
var _DK0742 = '07_42_'; // 
var _DK0743 = '07_43_'; // 
var _DK0744 = '07_44_'; // 
var _DK0745 = '07_45_'; // 
var _DK0746 = '07_46_'; // 
var _DK0747 = '07_47_'; // 
var _DK0748 = '07_48_'; // 
var _DK0749 = '07_49_'; // 
var _DK074A = '07_4A_'; // 
var _DK074B = '07_4B_'; // 
var _DK074C = '07_4C_'; // 
var _DK074D = '07_4D_'; // 
var _DK074E = '07_4E_'; // 
var _DK074F = '07_4F_'; // 
//                          //


// NPC_8
var _DK0800 = '08_00_'; // 
var _DK0801 = '08_01_'; // 
var _DK0802 = '08_02_'; // 
var _DK0803 = '08_03_'; // 
var _DK0804 = '08_04_'; // 
var _DK0805 = '08_05_'; // 
var _DK0806 = '08_06_'; // 
var _DK0807 = '08_07_'; // 
var _DK0808 = '08_08_'; // 
var _DK0809 = '08_09_'; // 
var _DK080A = '08_0A_'; // 
var _DK080B = '08_0B_'; // 
var _DK080C = '08_0C_'; // 
var _DK080D = '08_0D_'; // 
var _DK080E = '08_0E_'; // 
var _DK080F = '08_0F_'; // 
//                          //
var _DK0840 = '08_40_'; // 
var _DK0841 = '08_41_'; // 
var _DK0842 = '08_42_'; // 
var _DK0843 = '08_43_'; // 
var _DK0844 = '08_44_'; // 
var _DK0845 = '08_45_'; // 
var _DK0846 = '08_46_'; // 
var _DK0847 = '08_47_'; // 
var _DK0848 = '08_48_'; // 
var _DK0849 = '08_49_'; // 
var _DK084A = '08_4A_'; // 
var _DK084B = '08_4B_'; // 
var _DK084C = '08_4C_'; // 
var _DK084D = '08_4D_'; // 
var _DK084E = '08_4E_'; // 
var _DK084F = '08_4F_'; // 
//                          //


// NPC_9
var _DK0900 = '09_00_'; // 
var _DK0901 = '09_01_'; // 
var _DK0902 = '09_02_'; // 
var _DK0903 = '09_03_'; // 
var _DK0904 = '09_04_'; // 
var _DK0905 = '09_05_'; // 
var _DK0906 = '09_06_'; // 
var _DK0907 = '09_07_'; // 
var _DK0908 = '09_08_'; // 
var _DK0909 = '09_09_'; // 
var _DK090A = '09_0A_'; // 
var _DK090B = '09_0B_'; // 
var _DK090C = '09_0C_'; // 
var _DK090D = '09_0D_'; // 
var _DK090E = '09_0E_'; // 
var _DK090F = '09_0F_'; // 
//                          //
var _DK0910 = '09_10_'; // 
var _DK0911 = '09_11_'; // 
var _DK0912 = '09_12_'; // 
var _DK0913 = '09_13_'; // 
var _DK0914 = '09_14_'; // 
var _DK0915 = '09_15_'; // 
var _DK0916 = '09_16_'; // 
var _DK0917 = '09_17_'; // 
var _DK0918 = '09_18_'; // 
var _DK0919 = '09_19_'; // 
var _DK091A = '09_1A_'; // 
var _DK091B = '09_1B_'; // 
var _DK091C = '09_1C_'; // 
var _DK091D = '09_1D_'; // 
var _DK091E = '09_1E_'; // 
var _DK091F = '09_1F_'; // 
//                          //
var _DK0940 = '09_40_'; // 
var _DK0941 = '09_41_'; // 
var _DK0942 = '09_42_'; // 
var _DK0943 = '09_43_'; // 
var _DK0944 = '09_44_'; // 
var _DK0945 = '09_45_'; // 
var _DK0946 = '09_46_'; // 
var _DK0947 = '09_47_'; // 
var _DK0948 = '09_48_'; // 
var _DK0949 = '09_49_'; // 
var _DK094A = '09_4A_'; // 
var _DK094B = '09_4B_'; // 
var _DK094C = '09_4C_'; // 
var _DK094D = '09_4D_'; // 
var _DK094E = '09_4E_'; // 
var _DK094F = '09_4F_'; // 
//                          //


// NPC_B
var _DK0B00 = '0B_00_'; // 
var _DK0B01 = '0B_01_'; // 
var _DK0B02 = '0B_02_'; // 
var _DK0B03 = '0B_03_'; // 
var _DK0B04 = '0B_04_'; // 
var _DK0B05 = '0B_05_'; // 
var _DK0B06 = '0B_06_'; // 
var _DK0B07 = '0B_07_'; // 
//                          //


// NPC_C
var _DK0C00 = '0C_00_'; // 
var _DK0C01 = '0C_01_'; // 
var _DK0C02 = '0C_02_'; // 
var _DK0C03 = '0C_03_'; // 
var _DK0C04 = '0C_04_'; // 
var _DK0C05 = '0C_05_'; // 
var _DK0C06 = '0C_06_'; // 
var _DK0C07 = '0C_07_'; // 
//                          //


// NPC_D
var _DK0D00 = '0D_00_'; // 
var _DK0D01 = '0D_01_'; // 
var _DK0D02 = '0D_02_'; // 
var _DK0D03 = '0D_03_'; // 
var _DK0D04 = '0D_04_'; // 
var _DK0D05 = '0D_05_'; // 
var _DK0D06 = '0D_06_'; // 
var _DK0D07 = '0D_07_'; // 
//                          //


// NPC_Z
// Zelda -------------------
var _DK0Z00 = '0Z_00_'; // 
var _DK0Z01 = '0Z_01_'; // 
var _DK0Z02 = '0Z_02_'; // 
var _DK0Z03 = '0Z_03_'; // 
var _DK0Z04 = '0Z_04_'; // 
var _DK0Z05 = '0Z_05_'; // 
var _DK0Z06 = '0Z_06_'; // 
var _DK0Z07 = '0Z_07_'; // 
//                          //




var _dlg1 = "UNDEFINED";
var _dlg2 = "UNDEFINED";
var _dlg3 = "UNDEFINED";
var _dlg4 = "UNDEFINED";
var _dlg5 = "UNDEFINED";
//           --------------- // 
//           --------------- // 

// '<' End line
// '>' End line with extra delay


var _HylianDlg_num = 1;












// ---------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Sign Simple ---------------------------------------------
//           --------------- // 
_dk=_DK0000;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Rauru] = _dk;
_dm[?_dk+'A']=' WELCOME<'    // 
             +'__ TO<'       // 
             +'_ RAURU';     // 
//           --------------- // 
_dk=_DK0001;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Ruto] = _dk;
_dm[?_dk+'A']='_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ RUTO';      // 
//           --------------- // 
_dk=_DK0002;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Saria] = _dk;
_dm[?_dk+'A']='WATER TOWN<'  // 
             +'___ OF<'      // 
             +'_ SARIA';     // 
//           --------------- // 
_dk=_DK0003;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Mido] = _dk;
_dm[?_dk+'A']=' HARBOR<'     // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ MIDO';      // 
//           --------------- // 
_dk=_DK0004;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Nabooru] = _dk;
_dm[?_dk+'A']=' WELCOME<'    // 
             +'__ TO<'       // 
             +' NABOORU';    // 
//           --------------- // 
_dk=_DK0005;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Darunia] = _dk;
_dm[?_dk+'A']='MOUNTAIN<'    //  
             +'TOWN OF<'     // 
             +'DARUNIA';     // 
//           --------------- // 
_dk=_DK0006;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_New_Kasuto] = _dk;
_dm[?_dk+'A']=' HIDDEN<'     // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +' KASUTO';     // 
//           --------------- // 
_dk=_DK0007;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Old_Kasuto] = _dk;
_dm[?_dk+'A']='KASUTO.<' 
             +'STRANGE...>' 
             +'IT IS<' 
             +'DESERTED.';
//           --------------- // 
_dk=_DK0013;
_dm[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Old_Kasuto+'B'] = _dk;
_dm[?_dk+'A']=' WELCOME<'    // 
             +'__ TO<'       // 
             +' KASUTO';    // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 



_dm[?_DK0008+'A']='THE DOOR<' 
                 +'WILL NOT<' 
                 +'OPEN. ITS<' 
                 +'VERY QUIET';      // 
//           --------------- // 
_dm[?_DK0009+'A']='THERE IS<' 
                 +'SOMEONE<' 
                 +'BEHIND THE<' 
                 +'DOOR!';
//           --------------- // 
_dm[?_DK000A+'A']='LOOKS LIKE<' 
                 +'I CAN GET<' 
                 +'IN THE<' 
                 +'FIREPLACE.';      // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 



// ----------------------------------------------------
_dk=_DK000B;
g.dm_RandoHints[?_dk]=true;
//_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(2){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="IT IS SAID<"   //     \\
             +"THE EAST<"
             +"OF NABOORU<"
             +"HAS....";         // 
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="IT IS SAID<"   //     \\
             +"A NABOORU<"
             +"SEASIDE<"
             +"CAVE HAS..";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





// ----------------------------------------------------
_dk=_DK000C;
g.dm_RandoHints[?_dk]=true;
//_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(2){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="EAST OF<"   //     \\
             +"TRIPLE EYE<"
             +"ROCK AT<"
             +"SEASHORE.";         // 
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="SOMEWHERE<"   //     \\
             +"IN THE<"
             +"SEASHORE<"
             +"DESERT..";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





// ----------------------------------------------------
_dk=_DK000D;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
//_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(2){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="MAGIC KEY<"   //     \\
             +"READS...<"
             +"TREASURE<"
             +"OF KASUTO";         // 
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="THE POWER<"   //     \\
             +"BRACELET..<"
             +"TREASURE<"
             +"OF KASUTO.";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





// ----------------------------------------------------
_dk=_DK000E;
g.dm_RandoHints[?_dk]=true;
//_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(1){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="THE HERO<"   //     \\
             +"_ERDRICK<"
             +"RESTS HERE";
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="THE HERO<"   //     \\
             +"_ LOTO<"
             +"RESTS HERE";
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





// ----------------------------------------------------
// This is for Durunia Backside house which is only in town rando
_dk=_DK000F;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='TALK WITH<'
             +'ERROR OR<'
             +'BAGU. HOLD<'
             +'UP 1 MIN.';       // 
//           --------------- // 
//           --------------- // 



// ----------------------------------------------------
// Royal Cemetery. Heart Piece Scene. Grave
_dk=_DK0012;
g.dm_RandoHints[?_dk]=true;
switch(3){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='_ LOVED<'
             +'__ TO<'
             +'_ WATCH<'
             +' SUNRISES';
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='_ LOVED<'
             +' WATCHING<'
             +'__ THE<'
             +' SUN RISE';
break;}////////////////////////////////////
case   3:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='LOVED TO<'
             +'WATCH THE<'
             +'SUN RISE';
/*
_dm[?_dk+'A']=' LOVED TO<'
             +' WATCH THE<'
             +' SUN RISE';
*/
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
//           --------------- // 





// ----------------------------------------------------
//           --------------- // 
_dm[?_DK0020+'A'] = '___ TO<'+'_ '+string_upper(STR_Rauru);
_dm[?_DK0021+'A'] = '___ TO<'+'_ '+string_upper(STR_Ruto);
_dm[?_DK0022+'A'] = '___ TO<'+'_ '+string_upper(STR_Saria);
_dm[?_DK0023+'A'] = '___ TO<'+'_ '+string_upper(STR_Mido);
_dm[?_DK0024+'A'] = '___ TO<'+' ' +string_upper(STR_Nabooru);
_dm[?_DK0025+'A'] = '___ TO<'+' ' +string_upper(STR_Darunia);
_dm[?_DK0026+'A'] = '___ TO<'+'__ '+'NEW'+'_ '+'KASUTO';
_dm[?_DK0027+'A'] = '___ TO<'+'_ '+'KASUTO';
_dm[?_DK0028+'A'] = '___ TO<'+' ' +string_upper(STR_Bulblin);
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dm[?_DK0040+'A']=' MONSTER<'     // 
                 +'_ TOWN<'      // 
                 +string_upper(STR_Bulblin);
//           --------------- // 
//           --------------- // 






//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Sign Special ---------------------------------------------
_dk=_DK0010;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='YOU FOUND<'
             +'A MIRROR<'
             +'UNDER THE<'
             +'TABLE.';           // 
//_dm[?_dk+'A']='I FOUND A<MIRROR<UNDER THE<TABLE.';           // 
//           --------------- // 
//           --------------- // 
_dk=_DK0011;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WANT TO<'
             +'GET SOME<'
             +'WATER?';                     // 
// _dm[? '57_03_A']= 'I NEED AN<EMPTY<BOTTLE TO<GET WATER.';         // 
//           --------------- // 
//           --------------- // 
_dm[?_DK0018+'A']='NORTH RUTO<' 
                 +'MOUNTAINS';
//           --------------- // 















// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Idle Simple ---------------------------------------------
//           --------------- // 
//           --------------- // 
/*
_dk=_DK0100;
_dm[?_dk+'A']='IF ALL<' 
             +'ELSE FAILS<' 
             +'USE FIRE.';
//           --------------- // 
*/
//           --------------- // 
_dk=_DK0101;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='WITH BOOTS<'
             +'I COULD<'
             +'WALK ON<'
             +'THE WATER.';
//           --------------- // 
//           --------------- // 
_dk=_DK0102;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='GET CANDLE<'
             +'IN PARAPA<'
             +'PALACE.<'
             +'GO WEST.';
//           --------------- // 
//           --------------- // 
_dk=_DK0103; //g._8w8_=_dk;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='EYES OF<'
             +'GANON ARE<'
             +'EVERYWHERE<'
             +'BE CAREFUL';
//           --------------- // 
//           --------------- // 
_dk=_DK0104;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='A POWERFUL<'
             +'KNIGHT<'
             +'LIVES IN<'
             +'THIS TOWN.';
//           --------------- // 
//           --------------- // 
_dk=_DK0105;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='EACH TOWN<'
             +'HAS A WISE<'
             +'MAN. LEARN<'
             +'FROM HIM.';
//           --------------- // 
//           --------------- // 
_dk=_DK0106;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='DO NOT GO<'
             +'SOUTH<'
             +'WITHOUT A<'
             +'CANDLE.';
//           --------------- // 
//           --------------- // 
_dk=_DK0107;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THERES AN<' 
             +'OLD WELL<' 
             +'BACKSIDE<' 
             +'OF TOWN.';
//           --------------- // 
//           --------------- // 
_dk=_DK0108;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='WE HAD<'
             +'TO FLEE<'
             +'KASUTO.';
//           --------------- // 
//           --------------- // 




_dk=_DK0109;
g.dm_RandoHints[?_dk]=true;
//_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
//switch(6){//_______________________________
switch(1){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="RETURN THE<"   //     \\
             +"CRYSTAL TO<"
             +"THE PALACE<"
             +"IN PARAPA.";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





_dk=_DK010A;
g.dm_RandoHints[?_dk]=true;
switch(13){//_______________________________
//switch(7){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="USE KEYS<"   //     \\
             +"IN PALACES<"
             +"THEY ARE<"
             +"FOUND IN.";         // 
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="DID YOU<"  //     \\
             +"FIND THE<"
             +"3 HEART<"
             +"PIECES?";        //
break;}////////////////////////////////////
case   3:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="DID YOU<"  //     \\
             +"FIND THE<"
             +"THREE<"
             +"HEARTS?";        //
break;}////////////////////////////////////
case   4:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="ASK<"  //     \\
             +"SOMEONE IN<"
             +"RAURU ABOUT<"
             +"A HEART.";        //
break;}////////////////////////////////////
case   5:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="IN RAURU>"  //     \\
             +"ASK ABOUT<"
             +"A HEART.";        //
break;}////////////////////////////////////
case   6:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="SOMEONE IN<"  //     \\
             +"RAURU<"
             +"KNOWS ABOUT<"
             +"A HEART.";        //
break;}////////////////////////////////////
case   7:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="SOMEONE IN<"  //     \\
             +"RAURU<"
             +"KNOWS OF A<"
             +"HEART.";        //
break;}////////////////////////////////////
case   8:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="ASK IN<"  //     \\
             +"RAURU<"
             +"ABOUT A<"
             +"HEART.";        //
break;}////////////////////////////////////
case   9:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="CHECK YOUR<"   //     \\
             +"MAP FOR<"
             +"THE AREA<"
             +"NAME.";         // 
break;}////////////////////////////////////
case  10:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="THE NAME<"   //     \\
             +"OF AN AREA<"
             +"IS ON YOUR<"
             +"MAP.";         // 
break;}////////////////////////////////////
case  11:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="THE NAME<"   //     \\
             +"OF YOUR<"
             +"AREA IS ON<"
             +"YOUR MAP.";         // 
break;}////////////////////////////////////
case  12:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="LOOK AT<"   //     \\
             +"YOUR MAP<"
             +"FOR AREA<"
             +"NAMES.";         // 
break;}////////////////////////////////////
case  13:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="LOOK AT<"   //     \\
             +"YOUR MAP<"
             +"FOR AN<"
             +"AREAS NAME";         // 
break;}////////////////////////////////////
case  14:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="LOOK AT<"   //     \\
             +"YOUR MAP<"
             +"TO SEE AN<"
             +"AREAS NAME";         // 
break;}////////////////////////////////////
case  15:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="YOUR MAP<"   //     \\
             +"SHOWS THE<"
             +"AREAS NAME";         // 
break;}////////////////////////////////////
case  16:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="LOOK AT<"   //     \\
             +"YOUR MAP<"
             +"FOR YOUR<"
             +"AREAS NAME";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH





_dk=_DK010B;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THERE IS<'
             +'A SECRET<'
             +'AT EDGE<'
             +'OF TOWN.';          // 
//           --------------- // 
//           --------------- // 
_dk=_DK010C;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THIS IS<'
             +'KINGS TOMB';                          // 
//           --------------- // 
//           --------------- // 
_dk=_DK010D;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='ITS A<' 
             +'SECRET TO<' 
             +'EVERYBODY.';
//           --------------- // 
_dk=_DK010E;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']='THE TOWN<' 
             +'IS DEAD.>' 
             +'LOOK EAST<' 
             +'IN WOODS.';
//           --------------- // 
//_dm[?_DK0707+'C']='THE TOWN<IS DEAD.>LOOK EAST<IN WOODS.';       // 
//           --------------- // 
//           --------------- // 
_dk=_DK010F;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='DO NOT GO<' 
             +'IN THE<' 
             +'BASEMENT.';
//           --------------- // 
//           --------------- // 





_dk=_DK0111;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(3){//_______________________________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="I SAW A<"   //     \\
             +"HEART NEAR<"
             +"NORTH<"
             +"CASTLE.";         // 
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="I SAW IT<"  //     \\
             +"IN A FIELD<"
             +"NEAR NORTH<"
             +"CASTLE...";        //
break;}////////////////////////////////////
case   3:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="A HEART IS<"   //     \\
             +"IN NORTH<"
             +"CASTLE<"
             +"FIELD.";         // 
break;}////////////////////////////////////
case   4:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']="A HEART IS<"   //     \\
             +"NEAR NORTH<"
             +"CASTLE<"
             +"LAKE.";         // 
break;}////////////////////////////////////
case   5:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']="I SAW IT<"   //     \\
             +"NEAR NORTH<"
             +"CASTLE<"
             +"LAKE...";         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
//           --------------- // 





_dk=_DK0112;
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']="A GORIYA<"
             +"TOOK A<"
             +"HEART TO<"
             +"CEMETERY.";                 // 
//           --------------- // 
//           --------------- // 
_dk=_DK0114;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']="IF ALL<"
             +"ELSE FAILS<"
             +"USE FIRE.";
//           --------------- // 
/*
_dm[?_dk+'A']="GOING OUT<"
             +"THERE ALL<"
             +"ALONE IS<"
             +"DANGEROUS!";
//           --------------- // 
*/


//           --------------- // 
_dk=_DK0115;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='A SKELETON<' 
             +'KEY IS IN<'
             +'THE GREAT<'
             +'PALACE.';
//           --------------- // 
//           --------------- // 






_dk=_DK0140;
if (global.SWAP_LINK_NAME_WITH_SAVE_NAME)
{
    _dm[?_dk+'A']="WE NEED<"
                 +"BLOOD OF<"
                 +global.USE_PLAYER_NAME_INDICATOR+"<"
                 +"FOR GANON.";                 // 
    //           --------------- // 
    //           --------------- // 
}
else
{
    _dm[?_dk+'A']="WE NEED<"
                 +"LINK BLOOD<"
                 +"FOR GANON.";                 // 
    //           --------------- // 
    //           --------------- // 
}

_dk=_DK0141;
_dm[?_dk+'A']="GANON WILL<"
             +"GIVE US<"
             +"MANY MEAT.";
//           --------------- // 
//           --------------- // 
_dk=_DK0142;
_dm[?_dk+'A']='TOWER IS<'
             +'ON ISLAND<'
             +'BEHIND<'
             +'TOWN.';
//           --------------- // 
//           --------------- // 
_dk=_DK0143;
_dm[?_dk+'A']='WHY NOT<'
             +'JUST FLY<'
             +'THERE?';
//           --------------- // 
//           --------------- // 












//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Walk Traffic ---------------------------------------------
_dm[?_DK0200+'A']='I AM MUCH<'
                 +'TOO BUSY<'
                 +'TO TALK TO<'
                 +'A STRANGER.';
//           --------------- // 
//           --------------- // 
_dm[?_DK0201+'A']='HELLO!';
//           --------------- // 
//           --------------- // 
_dm[?_DK0202+'A']='HELLO<'
                 +'YOUNG<'
                 +'FELLOW.';
//           --------------- // 
//           --------------- // 
_dm[?_DK0203+'A']='SORRY.<'
                 +'I KNOW<'
                 +'NOTHING.';
//           --------------- // 
//           --------------- // 
_dm[?_DK0204+'A']='I KNOW<'
                 +'NOTHING.';
//           --------------- // 
//           --------------- // 
_dm[?_DK0205+'A']='PLEASE<'
                 +'SAVE OUR<'
                 +'TOWN!';
//           --------------- // 
//           --------------- // 
_dm[?_DK0206+'A']='YOU MUST<'
                 +'SAVE<'
                 +'HYRULE!';
//           --------------- // 
//           --------------- // 
_dm[?_DK0207+'A']='I CAN NOT<'
                 +'HELP YOU.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dm[?_DK0240+'A']='GRUMBLE..';
//           --------------- // 
//           --------------- // 
_dm[?_DK0241+'A']='SORRY,<'
                 +'NOTHING.';
//           --------------- // 
//           --------------- // 
_dm[?_DK0242+'A']='PRAISE<'
                 +'GANON!';
//           --------------- // 
//           --------------- // 
_dm[?_DK0243+'A']='WHY YOU<'
                 +'LOOK<'
                 +'FUNNY?';
//           --------------- // 
//           --------------- // 













//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Walk Special ---------------------------------------------
_dk=_DK0300;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='FIND MAGIC<'
             +'IN A CAVE<'
             +'NEAR NORTH<'
             +'CASTLE.';   // 
//_dm[?_DK0300+'A']='FIND MAGIC<IN A CAVE<SOUTH OF<THE CASTLE.';   // 
//           --------------- // 
//           --------------- // 
_dk=_DK0301;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THE ISLAND<'
             +'PALACE IN<'
             +'THE SOUTH<'
             +'HAS A RAFT';   // 
//           --------------- // 
//           --------------- // 
_dk=_DK0302;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='JUMP IN A<'
             +'HOLE IN<'
             +'THE PALACE<'
             +'IF YOU GO.';     // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0303;
g.dm_RandoHints[?_dk]=true;
switch(3){//______________
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='THE PALACE<'
             +'HAS A<'
             +'FALSE WALL';
break;}////////////////////////////////////
case   2:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='THE SEA<'
             +'PALACE HAS<'
             +'A FALSE<' 
             +'WALL.';
break;}////////////////////////////////////
case   3:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='THE PALACE<'
             +'ON THE SEA<'
             +'HAS A<' 
             +'FALSE WALL';
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
//           --------------- // 
_dk=_DK0304;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='CALL FOR<'
             +'HELP AT<'
             +'THE THREE<'
             +'EYE ROCKS.';       // 
//           --------------- // 
//           --------------- // 
_dk=_DK0305;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THE OLD<'
             +'MAN WHO<'
             +'REMAINS<'
             +'HAS MAGIC.';          // 
//           --------------- // 
//           --------------- // 
_dk=_DK0306;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='NO. ITS<'
             +'PRONOUNCED>'
             +'RAURU.';    // 
//_dm[?_DK0306+'A']='ONLY THE<HAMMER CAN<DESTROY A<ROADBLOCK.';    // 
//           --------------- // 
//           --------------- // 
_dk=_DK0307;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='ONLY THE<'
             +'HAMMER CAN<'
             +'DESTROY A<'
             +'BOULDER.';      // 
//_dm[?_DK0307+'A']='HAMMER...>SPECTACLE<ROCK...<DEATH MTN.';      // 
//           --------------- // 
//           --------------- // 
_dk=_DK0308;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A'+STR_Hint]=true;
_dm[?_dk+'A']='IT ONLY<'
             +'GROWS IN<'
             +'THE MORUGE<'
             +'SWAMP CAVE';
//           --------------- // 
//           --------------- // 
_dk=_DK0309;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THE RIVER<'
             +'MONSTER<'
             +'HATES<'
             +'NOISE.';
//_dm[?_DK0309+'A']='THE RIVER<DEVIL DOES<NOT LIKE<NOISE.';    // 
//_dm[?_DK0309+'A']='LOOK FOR A<HEART IN<DARUNIA<FIELD.';    // 
//_dm[?_DK0309+'A']='THE RIVER<DEVIL EATS<THOSE WHO<ARE WEAK.';    // 
//           --------------- // 
//           --------------- // 
_dk=_DK030A;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THE HOLE<'
             +'IN PALACE<'
             +'IS ENDLESS<'
             +'TRAP.';         // 
//           --------------- // 
//           --------------- // 
_dk=_DK030B;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='FIND A<'
             +'HEART IN<'
             +'SOUTHERN<'
             +'PARAPA.';          // 
//           --------------- // 
//           --------------- // 
_dk=_DK030C;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='A HEART IS<'
             +'HIDING IN<'
             +'MORUGE<'
             +'SWAMP.';         // 
//_dm[?_DK030C+'A']='A HEART IS<HIDDEN IN<MORUGE<SWAMP.';         // 
//_dm[?_DK030C+'A']='A HIDDEN<HEART LIES<IN MORUGE<SWAMP.';         // 
//_dm[?_DK030C+'A']='A POWERFUL<GLOVE IS<IN MIDORO<PALACE.';         // 
//_dm[?_DK030C+'A']='IN MIDORO<SWAMP FIND<A HANDY<GLOVE.';         // 
//           --------------- // 
//           --------------- // 
_dk=_DK030D;
_dm[?_dk+'A'+STR_Hint]=true;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='I HID SOME<'
             +'MAGIC IN<'
             +'MIDORO<'
             +'SWAMP.';  // 
//_dm[?_DK030D+'A']='NO ONE IS<HERE BUT A<CHURCHBELL<WILL RING.';  // 
//           --------------- // 
//           --------------- // 
_dk=_DK030E;
g.dm_RandoHints[?_dk]=true;
_dm[?_dk+'A']='THE<'
             +'HAMMER CAN<'
             +'CLEAR A<'
             +'FOREST.';               // 
//_dm[?_DK030E+'A']='LOOK FOR A<HEART IN<DARUNIA<FIELD.';               // 
//_dm[?_DK030E+'A']='THE DEVIL<DOES NOT<LIKE NOISE';               // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dk=_DK0340; // 
_dm[?_dk+'A']='LOOK INTO<'
             +'MY EYE<'
             +'AND COUNT<'
             +'TO...';
//           --------------- // 
//           --------------- // 
_dk=_DK0341;
_dm[?_dk+'A']='THE WAY TO<'
             +'TOWER IS<'
             +'CLOSE BY.';
//           --------------- // 
//           --------------- // 
_dk=_DK0342;
_dm[?_dk+'A']='GANON SOON<'
             +'BE AWAKE.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 














//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Heal, Save ---------------------------------------------
_dk=_DK0400;
_dm[?_dk+'A']='PLEASE LET<'
             +'ME HELP<'
             +'YOU. COME<'
             +'INSIDE.';        // Life
//           --------------- // 
_dm[?_dk+'B']='I CAN<'
             +'RESTORE<'
             +'YOUR LIFE.';                    // Life inside house
//           --------------- // 
//           --------------- // 
_dk=_DK0401;
_dm[?_dk+'A']='STOP BY<'
             +'FOR A<'
             +'WHILE.';                          // Life
//           --------------- // 
_dm[?_dk+'B']='REVIVED!';                                    // Life inside house
//           --------------- // 
//           --------------- // 
_dk=_DK0402;
_dm[?_dk+'A']='STOP AND<'
             +'REST HERE.';                         // Magic
//           --------------- // 
_dm[?_dk+'B']='I CAN GIVE<'
             +'YOU MAGIC.<'
             +'COME BACK<'
             +'ANYTIME.';    // Magic inside house
// _dm[?_DK0402+'B']='I CAN GIVE<YOU MAGIC.>COME BACK<ANYTIME.';    // Magic inside house
//           --------------- // 
//           --------------- // 
_dk=_DK0403;
_dm[?_dk+'A']='REST HERE.';                                  // Magic
//           --------------- // 
_dm[?_dk+'B']='HOW ABOUT<'
             +'THAT? ITS<'
             +'MY SPECIAL<'
             +'MEDICINE.';    // Magic inside house
//           --------------- // 
//           --------------- // 
_dk=_DK0406;
_dm[?_dk+'A']='I HAVE<'
             +'SOMETHING<'
             +'TO RESTORE<'
             +'YOUR MAGIC';
//           --------------- // 
_dm[?_dk+'B']='ITS MAGIC<'
             +'SAUCE MADE<'
             +'FROM OUR<'
             +'TOWNS VINE';
//           --------------- // 
//           --------------- // 
// Save
_dk=_DK0404;
_dm[?_dk+'A']='ILL WRITE<'
             +'DOWN YOUR<'
             +'ADVENTURE.<'
             +'COME IN.';
//           --------------- // 
// Save inside house
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='YOUR<'
             +'ADVENTURE<'
             +'HAS BEEN<'
             +'RECORDED!';             // Save inside house
// _dm[? '4E_01_A']= 'I CAN<RECORD<YOUR<PROGRESS.';              // 
// _dm[?_dk+'A']='ILL WRITE<DOWN YOUR<ADVENTURES<COME IN.';          // Save
// _dm[?_dk+'A']='I WANT TO<WRITE DOWN<YOUR<ADVENTURES';          // Save
// _dm[?_dk+'B']='THERE. ITS<ALL<';                     // Save inside house
// _dm[?_dk+'A']='I CAN SAVE<YOUR<PROGRESS.<COME IN.';          // Save
// _dm[?_dk+'B']='YOUR<PROGRESS<IS SAVED!';                     // Save inside house
//           --------------- // 
//           --------------- // 
// Save
_dk=_DK0405;
_dm[?_dk+'A']='COME IN<'
             +'AND TELL<'
             +'ME YOUR<'
             +'STORY.';
//           --------------- // 
// Save inside house
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='AMAZING!>'
             +'ILL NEVER<'
             +'FORGET<'
             +'THAT!';
// _dm[? '4E_02_A']= 'WANT TO<SAVE YOUR<ADVENTURE?';               // 
// _dm[?_dk+'A']='PLEASE,<I WANT TO<HEAR YOUR<STORY.';          // Save
// _dm[?_dk+'A']='COME IN.<I WANT TO<HEAR YOUR<STORY.';          // Save
// _dm[?_dk+'A']='COME WITH<ME. I WANT<TO HEAR<YOUR STORY';      // Save
// _dm[?_dk+'B']='INCREDIBLE>ILL NEVER<FORGET<THAT!';               // Save inside house
// _dm[?_dk+'A']='WANT TO<RECORD<YOUR<PROGRESS?';               // Save
// _dm[?_dk+'B']='PROGRESS<RECORDED!';                          // Save inside house
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0440;
_dm[?_dk+'A']='COME.>'
             +'EAT MEAT<'
             +'GIVE YOU<'
             +'STRONG.';
//           --------------- // 
_dm[?_dk+'B']='THIS VERY<'
             +'TASTY<'
             +'MEAT.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0441;
_dm[?_dk+'A']='MAGIC<'
             +'DRINK IS<'
             +'IN HOUSE.<'
             +'COME.';
//           --------------- // 
_dm[?_dk+'B']='SEE?>'
             +'I MAKE<'
             +'GOOD<'
             +'DRINK.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0442;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='YOU COME<'
             +'TELL ME<'
             +'STORY<'
             +'IN HOUSE.';
//           --------------- // 
if (global.SWAP_LINK_NAME_WITH_SAVE_NAME)
{
    _val1='A';
    _dk1=_dk+'B';
    _dk2=_dk1+dk_DynamicDialogue+_val1+hex_str(++_DynamicDialogueA_count);
    _dm[?_dk1+dk_DynamicDialogue+STR_Type] = _val1;
    _dm[?_dk1+dk_DynamicDialogue+STR_Datakey] = _dk2;
    _dm[?_dk2+'A'+STR_Character+"_Limit"] = 6;
    // Whether A or B is used depends on the length of the save file name in session.
    _dm[?_dk2+'A']='WHY '+global.USE_PLAYER_NAME_INDICATOR+'<' 
                  +'STRONG?>' 
                  +'THIS STORY<' 
                  +'BAD.';
    //           --------------- // 
    _dm[?_dk2+'B']=global.USE_PLAYER_NAME_INDICATOR+'<' 
                  +'STRONG??>' 
                  +'THIS STORY<' 
                  +'BAD.';
    /*
    _dm[?_dk+'B']='WHY<'
                 +global.USE_PLAYER_NAME_INDICATOR+'<' 
                 +'STRONG?<' 
                 +'BAD STORY.';
    */
    //           --------------- // 
}
else
{
    _dm[?_dk+'B']='WHY LINK<'
                 +'STRONG?<'
                 +'THIS STORY<'
                 +'BAD.';
    //           --------------- // 
}
//           --------------- // 
/*
_dm[?_dk+'B']='THIS VERY<'
             +'GOOD<'
             +'STORY!';
//           --------------- // 
//           --------------- // 
*/
/*
_dm[?_dk+'B']='YOU VERY<'
             +'GOOD AT<'
             +'STORY<'
             +'TIME.';
//           --------------- // 
//           --------------- // 
*/
//           --------------- // 
//           --------------- // 













//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Quest ---------------------------------------------
//______________________________________________\
_dk=_DK0500;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='TALK WITH<'
             +'MY FATHER<'
             +'BEFORE YOU<'
             +'LEAVE TOWN';   // 
//           --------------- // 
_dm[?_dk+'B']='TALK WITH<'
             +'MY FATHER<'
             +'BEFORE YOU<'
             +'LEAVE TOWN';   // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0501;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='GORIYA OF<'
             +'TANTARI<'
             +'STOLE OUR<'
             +'TROPHY.';         // 
//           --------------- // 
_dm[?_dk+'B']='YOU SAVED<'
             +'THE TROPHY>'
             +'COME SEE<'
             +'MY UNCLE.';     // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0502;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(g.mod_QUEST_MIRROR){//______________
case   0:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='I LOST<'   //     \\
             +'MY MIRROR.';
break;}////////////////////////////////////
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='I LOST MY<'   //     \\
             +'MIRROR<'
             +'IN THE<'
             +'CEMETERY.';         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='OH! YOU<'
             +'FOUND MY<'
             +'MIRROR!<'
             +'FOLLOW ME.';         // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_str1='WE NEED A<';
//_str=_str1+"SUN BLOOM!";
switch(val(g.dm_ITEM[?hex_str(ITM_MEDI)+STR_pal_idx],global.PI_MOB_ORG)){
//case PI_MOB_ORG:{_str=_str1+"SUN BLOOM"; break;}
//case PI_MOB_ORG:{_str=_str1+"FIRE BLOOM"; break;}
//case PI_MOB_ORG:{_str=_str1+"FIRE HERB"; break;}
case global.PI_MOB_ORG:{_str1='WE NEED AN<'; _str2='IO FLOWER'; break;}
case global.PI_MOB_RED:{_str2="RED EYE"; break;}
case global.PI_MOB_BLU:{_str2="BLUE EYE"; break;}
case global.PI_MOB_PUR:{_str2="NIGHT EYE"; break;}
}
_str = _str1+_str2;
//_str = "POE BLOOM";
//______________________________________________\
_dk=_DK0503;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(g.mod_MedicinePlantItem){//_________
case   0:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='PLEASE. MY<'   //     \\
             +'DAUGHTER<'
             +'IS SICK.<'
             +'HELP HER!';         // 
break;}////////////////////////////////////
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='MY CHILD<'   //     \\
             +'IS SICK!<'
             +'WE NEED AN<'
             +'IO FLOWER!';         // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
switch(g.mod_MedicinePlantItem){//_________
case   0:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'B']='THE WATER<'
             +'OF LIFE!<' 
             +'QUICK COME<' 
             +'WITH ME.';      // 
break;}////////////////////////////////////
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'B']='THE RARE<'
             +'IO FLOWER!<' 
             +'QUICK COME<' 
             +'WITH ME.';      // 
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
/*
_dm[?_dk+'B']='YOU FOUND<'
             +'MEDICINE?<' 
             +'QUICK COME<' 
             +'WITH ME!';      // 
*/
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0504;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
switch(g.mod_QuestNabooru){//_________
case   0:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='I AM<'   //     \\
             +'THIRSTY.';
break;}////////////////////////////////////
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'A']='HELP! THE<'
             +'FOUNTAINS<'
             +'HAVE DRIED<'
             +'UP!';
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
switch(g.mod_QuestNabooru){//_________
case   0:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'B']='YOU HAVE<'
             +'WATER.<' 
             +'COME TO<' 
             +'MY HOUSE.';      // 
break;}////////////////////////////////////
case   1:{//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
_dm[?_dk+'B']='THE WATER<' 
             +'IS BACK!<' 
             +'WE SHALL<' 
             +'REWARD YOU';
break;}////////////////////////////////////
}//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0505;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='RESCUE THE<'
             +'KIDNAPPED<'
             +'CHILD ON<'
             +'THE ISLAND';    // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='YOU ARE A<'
             +'HERO FOR<'
             +'SAVING MY<'
             +'CHILD.COME';     // 
//______________________________________________\
_dk=_DK0506;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='DO YOU<'
             +'HAVE THE<'
             +' 7 MAGIC<'
             +'CONTAINERS';          // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='YOU<'
             +'DESERVE<'
             +'MY HELP.<'
             +'FOLLOW ME.';             // 
//           --------------- // 
//           --------------- // 
/*
//______________________________________________\
_dk=_DK0507;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='BRING ME<A BOTTLE<TO FILL<WITH BLOOD';          // 
_dm[?_dk+'B']='YOUR<BLOOD IS<NOW IN THE<BOTTLE.';             // 
//           --------------- // 
//           --------------- // 
*/
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
_dk=_DK0540;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='YOU LEARN<'
             +'SPELL<'
             +'INSIDE.<'
             +'COME.';                               // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']=_dm[?_dk+'A'];
//           --------------- // 











//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Skill Knight ---------------------------------------------
_dlg1 = 'I CANNOT<'+'HELP YOU<'+'ANYMORE.<'+'GO NOW.';          // 
_dlg2 = 'YOU KNOW<'+'ALL I CAN<'+'TEACH YOU.<'+'GO.';           // 
_dlg3 = 'COME BACK<'+'WHEN YOU<'+'ARE READY.';               // 
//______________________________________________\
_dk=_DK0600;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WHEN YOU<' + 'JUMP PRESS<' + 'DOWNWARD<' + 'TO STAB.';
_dm[?_dk+'B']='HOLD JUMP<' + 'TO GET A<' + 'BETTER<' + 'BOUNCE.';  
//_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
//______________________________________________\
_dk=_DK0601;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WHEN YOU<' + 'JUMP PRESS<' + 'UP TO STAB.';             // 
_dm[?_dk+'B']=_dlg2; // 'YOU KNOW<ALL I CAN<TEACH YOU.<GO.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
//           --------------- // 













//           --------------- // 

//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//var _DLG1 = "POWER THIS<CRYSTAL IN<";
//var _DLG1 = "RENEW THIS<CRYSTAL IN<";
//var _DLG2 = "SPEAK TO<THE WISE<MAN OF<";
//var _DLG3 = "HE WILL KNOW WHAT TO DO NEXT.";
_dlg4 = "BOULDER<CIRCLE...>";

// Wiseman (Spell Giver) ---------------------------------------------
//  =================================================================================
//______________________________________________\
_dk=_DK0700; //  RAURU
_dm[?_dk+'A'+_DK_SKIP]=SkipType_TOEND;
_dm[?_dk+'A']='IN PARAPA<'
             +'DESERT USE<'
             +'THIS MAGIC<'
             +'TO SURVIVE';
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]=SkipType_TOEND;
_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
//           --------------- // 
_dm[?_dk+'C'+_DK_SKIP]=SkipType_TOEND;
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
//           --------------- // 
_dm[?_dk+'D'+_DK_SKIP]=SkipType_TOEND;
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//  =================================================================================
//______________________________________________\
_dk=_DK0701; //  RUTO
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WITH THIS<'
             +'YOU CAN<'
             +'JUMP VERY<'
             +'HIGH.';           // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//  =================================================================================
//______________________________________________\
_dk=_DK0702; //  SARIA
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='USE THIS<'
             +'MAGIC TO<'
             +'RESTORE<'
             +'YOUR LIFE.';        // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//  =================================================================================
//______________________________________________\
_dk=_DK0703; //  MIDO
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THIS MAGIC<'
             +'WORD WILL<'
             +'GIVE YOU<'
             +'POWER.';        // 
_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
if (g.mod_PC_CUCCO_1){
_dm[?_dk+'E']='OH DEAR.>'
             +'IT<'
             +'HAPPENED<'
             +'AGAIN.';
}
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//  =================================================================================
//______________________________________________\
_dk=_DK0704; //  NABOORU
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THIS MAGIC<'
             +'WILL MAKE<'
             +'YOUR SWORD<'
             +'SHOOT FIRE';  // 
_dm[?_dk+'B']=_dlg2; // 'YOU KNOW<ALL I CAN<TEACH YOU.<GO.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//  =================================================================================
//______________________________________________\
_dk=_DK0705; //  DARUNIA
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THIS MAGIC<'
             +'WILL<'
             +'STRENGTHEN<'
             +'A SHIELD.';        // 
_dm[?_dk+'B']=_dlg2; // 'YOU KNOW<ALL I CAN<TEACH YOU.<GO.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//                                                                         //
//                                                                         //
//                                                                         //
//  =================================================================================
//______________________________________________\
_dk=_DK0706; //  NEW KASUTO
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='REMEMBER<'
             +'THE MAGIC<'
             +'WORD.';                    // 
_dm[?_dk+'B']=_dlg2; // 'YOU KNOW<ALL I CAN<TEACH YOU.<GO.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//                                                                         //
//                                                                         //
//                                                                         //
//  =================================================================================
//______________________________________________\
_dk=_DK0707; //  OLD KASUTO
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='I CAN GIVE<'
             +'YOU MOST<'
             +'POWERFUL<'
             +'MAGIC.';         // 
_dm[?_dk+'B']=_dlg2; // 'YOU KNOW<ALL I CAN<TEACH YOU.<GO.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
//_dm[?_dk+'C']='THE TOWN<IS DEAD.>LOOK EAST<IN WOODS.';       // 
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
//                                                                         //
//                                                                         //
//                                                                         //
//  =================================================================================
//______________________________________________\
_dk=_DK0708; //  MIDO - FAIRY SPELL 2
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='LETS TRY<'
             +'THIS AGAIN>'
             +'...FAIRY!';        // 
//_dm[?_dk+'A']='I HAVE NOW<MASTERED<THE FAIRY<SPELL.';        // 
_dm[?_dk+'B']=_dlg1; // 'I CANNOT<HELP YOU<ANYMORE.<GO NOW.'
_dm[?_dk+'C']=_dlg3; // 'COME BACK<WHEN YOU<ARE READY.'
_dm[?_dk+'D']=_dlg4; // Boulder Circle Puzzle
_dm[?_dk+'E']= 'OH...';               // 
//_dm[?_dk+'E']= '..._>..._>..._>.....';               // 
//_dm[?_dk+'E']= '..._>..._>..._>...OH_';               // 
//_dm[?_dk+'E']= '._>._>._>OH..._';               // 
//_dm[?_dk+'E']= '._>._>._>..._';               // 
//                                                                         //
//                                                                         //
//  =================================================================================
//______________________________________________\
_dk=_DK0740; //  BULBLIN
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='YELL THIS<'
             +'WORD TO<'
             +'CONJURE>'
             +'GANON!';        // 
//_dm[?_dk+'A']='YELL THIS<WORD TO<CONJURE<OUR LORD.';        // 
//_dm[?_dk+'A']='CONJURE<OUR LORD<WITH THIS<MAGIC.';        // 
//_dm[?_dk+'A']='CONJURE<GANON BY<YELLING<THIS WORD.';        // 
//_dm[?_dk+'A']='THIS WORD<CAN<CONJURE<ENTITIES.';        // 
//_dm[?_dk+'A']='THIS MAGIC<WORD WILL<CALL UPON<EVIL.';        // 
//_dm[?_dk+'A']='THIS MAGIC<WORD WILL<CALL EVIL.';        // 
//_dm[?_dk+'A']='CALL GANON<WITH THIS<WORD.';        // 
//_dm[?_dk+'A']='SAY THIS<TO CALL<GANON.';        // 
//_dm[?_dk+'A']='THIS WORD<MAKE GANON<ALIVE.';        // 
//_dm[?_dk+'A']='THIS SPELL<FOR MAKE<GANON.';        // 
//_dm[?_dk+'A']='THIS SPELL<FOR<SUMMON<GANON.';        // 
//_dm[?_dk+'A']='THIS SPELL<FOR<AWAKEN<GANON.';        // 
_dm[?_dk+'B']='I DONT<'
             +'KNOW<'
             +'ANYMORE<'
             +'SPELL.';                                         // 
//           --------------- // 
_dm[?_dk+'C']='YOU NOT<'
             +'READY YET.';                                         // 
//           --------------- // 
_dm[?_dk+'D']=_dm[?_dk+'B'];                                         // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 

















//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  Fairy NPC ---------------------------------------------
//           --------------- // 
_dk=_DK0800;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='RESCUE THE<' 
             +'FAIRY IN<'
             +'THE NORTH<'
             +'RUTO MTNS!';
//           --------------- // 
_dm[?_dk+'B']='YOU ARE A<' 
             +'HERO FOR<' 
             +'SAVING<' 
             +'MY FRIEND!';
//           --------------- // 
//           --------------- // 













//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Idle Special ---------------------------------------------
_dk=_DK0900; g._8w8_=_dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='BAGU IS MY<'
             +'NAME. SHOW<'
             +'MY NOTE TO<'
             +'RIVER MAN.';  // 
//           --------------- // 
//           --------------- // 
_dk=_DK0901;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='ONLY TOWN<'
             +'FOLK MAY<'
             +'CROSS THIS<'
             +'RIVER!';        // 
//           --------------- // 
_dm[?_dk+'B']='YOU KNOW<'
             +'BAGU? THEN<'
             +'I CAN HELP<'
             +'YOU CROSS.';   // 
//           --------------- // 
//           --------------- // 
_dk=_DK0902; g._8x8_=_dk;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='I AM<'
             +'ERROR.';                                 // 
//           --------------- // 
_dm[?_dk+'B']='SOUTH OF<'
             +'KINGS TOMB<'
             +'IN MIDO IS<'
             +'A TUNNEL.';    // 
//           --------------- // 
//           --------------- // 
_dk=_DK0903;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='ASK ERROR<'
             +'OF RUTO<'
             +'ABOUT THE<'
             +'PALACE.';         // 
//           --------------- // 
//           --------------- // 
_dk=_DK0904;
_dm[?_dk+'A']="'''''";                                       // 
//_dm[?_dk+'B'+STR_Hint]=true;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='YOU ARE<'
             +'PERSISTENT<'
             +'FIND HEART<'
             +'OVER OCEAN';    // 
//           --------------- // 
//           --------------- // 
_dk=_DK0905;
_dm[?_dk+'A']='ZZZ...';                                      // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='LET ME BE!<'
             +'MASTER IS<'
             +'IN WOODS<'
             +'N OF RIVER';    // 
//           --------------- // 
//           --------------- // 
_dk=_DK090A;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='ANJU OF<' 
             +'RAURU HAS<'
             +'THE BOOK<'
             +'OF MUDORA.';
//           --------------- // 
//           --------------- // 
_dm[?_DK090B+'A']='HELLO.<' 
                 +'MY NAME IS<'
                 +'ANJU.';
//           --------------- // 
_dk=_DK090B;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='BOOK?>' 
             +'ASK MY<'
             +'FRIEND ON<'
             +'WHALE ISL.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dk=_DK090C;
_dm[?_dk+'A']='ISNT THE<' 
             +'WEATHER<'
             +'BEAUTIFUL<'
             +'TODAY?';
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='ANJU WANTS<' 
             +'YOU TO<'
             +'HAVE THIS?>'
             +'TAKE IT!';
//           --------------- // 
_dm[?_dk+'C']='I HAVE<' 
             +'NOTHING<'
             +'ELSE TO<'
             +'GIVE YOU.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dk=_DK090E;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='BOULDER<' 
             +'CIRCLE?>'
             +'ASK THE<'
             +'WISE MEN.';
//           --------------- // 
//           --------------- // 
_dk=_DK0911; // Triforce Keeper
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='LOOK SOUTH<' 
             +'OF DEATH<'
             +'VALLEY FOR<'
             +string_upper(string_letters(STR_Dragmire))+'.';
//           --------------- // 
//           --------------- // 
//---------------// 
//---------------// 
//---------------// 
//---------------// 
//---------------// 
//______________________________________________\\
_dk=_DK0912; // Triforce Keeper. Quest 1.
_dm[?_dk+'A'+_DK_SKIP]=SkipType_TOEND;
switch(1){//______
case   1:{//\\\\\\| 
_dm[?_dk+'A']   //| 
="LINK, GO<"    //| 
+"TO ZELDA<"    //| 
+"WITH THE<"    //| 
+"TRIFORCE.";   //| 
break;}///////////| 
case   2:{//\\\\\\| 
_dm[?_dk+'A']   //| 
="TAKE THE<"    //| 
+"TRIFORCE<"    //| 
+"TO ZELDA!";   //| 
break;}///////////| 
case   3:{//\\\\\\| 
_dm[?_dk+'A']   //| 
="LINK, <"      //| 
+"TAKE THE<"    //| 
+"TRIFORCE<"    //| 
+"TO ZELDA!";   //| 
break;}///////////| 
}//^^^^^^^^^^^^^^^
//---------------// 
//---------------// 
//---------------// 
//---------------// 
//---------------// 
//______________________________________________\\
_dk=_DK0940;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='MY NAME<' 
             +'SCROBLIN.';
//           --------------- // 
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B']='OK. I OPEN<' 
             +'DOOR TO<' 
             +'TOWER FOR<' 
             +'YOU.';
//           --------------- // 
/*
_dm[?_dk+'B']='THIS DOOR<' 
             +'GO TO<' 
             +'TOWER.';
//           --------------- // 
*/
//______________________________________________\\
_dk=_DK0941;
_dm[?_dk+'A']='ZZZ...';                                       // 
_dm[?_dk+'B']='ZZZZZZ...';                                       // 
//_dm[?_dk+'A']="'''''";                                       // 
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C']='IM SLEEP!>' 
             +'SCROBLIN<' 
             +'KNOW WAY<' 
             +'TO TOWER.';
//           --------------- // 
/*
_dm[?_dk+'C']='IM SLEEP!>' 
             +'SAY TO<' 
             +'SCROBLIN:<' 
             +'AAAAAAAAA.';
//           --------------- // 
*/
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 












//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Minigame ---------------------------------------------
//______________________________________________\\
_dk=_DK0B00;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
//           --------------- // 
_dm[?_dk+'A']='-P TO<'
             +'PLAY<'
             +'TARGET<'
             +'GAME.';       // 
//           --------------- // 
/*
_dm[?_dk+'B']='NOT<'
             +'ENOUGH P?<'
             +'GET OUT<'
             +'CHEAPSKATE';  // 
//           --------------- // 
_dm[?_dk+'B']='YOU DONT<'
             +'HAVE<'
             +'ENOUGH!';    // 
//           --------------- // 
*/
_dm[?_dk+'B']='YOU DONT<'
             +'HAVE<'
             +'ENOUGH P!';  // 
//           --------------- // 
                          /*
_dm[?_dk+'C']='A NEW<'
             +'RECORD!<'
             +'TAKE THIS<'
             +'PRIZE.';      // 
//           --------------- // 
_dm[?_dk+'C']='AMAZING!<'
             +'HERE IS<'
             +'YOUR PRIZE'; // 
//           --------------- // 
*/
_dm[?_dk+'C']='WELL DONE!<'
             +'HERE IS<'
             +'YOUR PRIZE'; // 
//           --------------- // 
_dm[?_dk+'D']='BETTER<'
             +'LUCK NEXT<'
             +'TIME.';      // 
//           --------------- // 
_dm[?_dk+'E']='COME BACK<'
             +'ANY TIME!';
//           --------------- // 








_dk=_DK0B01;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
/*
_dm[?_dk+'A']='TRY TO<'
             +'MAKE IT TO<'
             +'THE TOP.<'
             +'-P.';       // 
//           --------------- // 
*/
_dm[?_dk+'A']='-P. TRY<'
             +'TO MAKE IT<'
             +'TO THE <'
             +'TOP.';       // 
//           --------------- // 
_dm[?_dk+'B']='YOU DONT<'
             +'HAVE<'
             +'ENOUGH P!';  // 
//           --------------- // 
_dm[?_dk+'C']='WELL DONE!<'
             +'COME<'
             +'COLLECT<'
             +'YOUR PRIZE'; // 
//           --------------- // 
/*
_dm[?_dk+'C']='WELL DONE!<'
             +'HERE IS<'
             +'YOUR PRIZE'; // 
//           --------------- // 
*/
_dm[?_dk+'D']='BETTER<'
             +'LUCK NEXT<'
             +'TIME.';      // 
//           --------------- // 
_dm[?_dk+'E']='COME BACK<'
             +'ANY TIME!';
//           --------------- // 
















//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Spell Sequence ---------------------------------------------
_str  = STR_THUNDER+'<' 
_str += STR_THUNDER+'<' 
_str += STR_THUNDER+'<' 
_str += STR_THUNDER;
_a   = $00;
_num = 1;
_dk1 = "0C_"
_dk2 = STR_Spell+STR_Sequence+STR_Dialogue+STR_Datakey;
//           --------------- // 
//  Tablet locking path to SHIELD ITEM
     _dk=_dk1+hex_str(_a++)+"_"; // "0C_00_"
_dm[?_dk2+hex_str(_num++)] = _dk;
_dm[?_dk+'A'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'A'+STR_Font] = spr_Font_Hyrulian;
_dm[?_dk+'A']          = _str;
_dm[?_dk+'B']          = _dm[?_dk+'A'];
//           --------------- // 
//           --------------- // 
//  Tablet locking path to NECKLACE ITEM
     _dk=_dk1+hex_str(_a++)+"_"; // "0C_01_"
_dm[?_dk2+hex_str(_num++)] = _dk;
_dm[?_dk+'A'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'A'+STR_Font] = spr_Font_Hyrulian;
_dm[?_dk+'A']          = _str;
_dm[?_dk+'B']          = _dm[?_dk+'A'];
//           --------------- // 
//           --------------- // 
// Kakusu011 in Kasuto Cemetery
     _dk=_dk1+hex_str(_a++)+"_"; // "0C_02_"
_dm[?_dk2+hex_str(_num++)] = _dk;
_dm[?_dk+'A'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP] = SkipType_TOEND;
_dm[?_dk+'A'+STR_Font] = spr_Font_Hyrulian;
_dm[?_dk+'A']          = _str;
_dm[?_dk+'B']          = _dm[?_dk+'A'];
//           --------------- // 
//           --------------- // 















//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Shop owner ---------------------------------------------
_dk=_DK0D00;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'F'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='GREAT DEAL<'
             +'FOR THIS<'
             +'MAP! ONLY<'
             +'-P.';
_dm[?_dk+'AA']=_dm[?_dk+'A']; // default
//           --------------- // 
/*
_dm[?_dk+'A']='GREAT DEAL<'
             +'FOR THIS<'
             +'MAP!<'
             +'-P.';       // 
//           --------------- // 
*/
/*
_dm[?_dk+'A']='-P TO<'
             +'PURCHASE<'
             +'WEIRD MAP<'
             +'I FOUND.';       // 
//           --------------- // 
*/
_dm[?_dk+'B']='YOU DONT<'
             +'HAVE<'
             +'ENOUGH P!';  // 
_dm[?_dk+'BB']=_dm[?_dk+'B']; // default
//           --------------- // 
_dm[?_dk+'C']='I HAVE<'
             +'NOTHING<'
             +'LEFT TO<'
             +'OFFER YOU.';  // 
_dm[?_dk+'CC']=_dm[?_dk+'C']; // default
//           --------------- // 
// for rando
_dm[?_dk+'D']='GREAT DEAL<'
             +'FOR THIS<'
             +'THING!<'
             +'-P.';
_dm[?_dk+'DD']=_dm[?_dk+'D']; // default
//           --------------- // 
_dm[?_dk+'E']='YOURE A<'
             +'TOUGH SELL>'
             +'HOW ABOUT<'
             +'-P?';
_dm[?_dk+'EE']=_dm[?_dk+'E']; // default
//           --------------- // 
_dm[?_dk+'F']='FINAL<'
             +'OFFER:>'
             +'-P';  // 
_dm[?_dk+'FF']=_dm[?_dk+'F']; // default
//           --------------- // 
// YOU JUST
// WONT BUDGE
// HUH? HOW
// ABOUT ..
//           --------------- // 
_dm[?_dk+'G']='I HAVE<'
             +'NOTHING<'
             +'LEFT TO<'
             +'OFFER YOU.';  // 
_dm[?_dk+'GG']=_dm[?_dk+'G']; // default
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dk=_DK0D01;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'B'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'C'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'D'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'E'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'F'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WANNA BUY<'
             +'THIS MAP<'
             +'I FOUND?<'
             +'-P';
_dm[?_dk+'AA']=_dm[?_dk+'A']; // default
//           --------------- // 
/*
_dm[?_dk+'A']='ILL SELL<'
             +'YOU A MAP<'
             +'I FOUND.<'
             +'-P';       // 
//           --------------- // 
*/
/*
_dm[?_dk+'A']='ILL SELL<'
             +'YOU THIS<'
             +'COOL MAP.<'
             +'-P';       // 
//           --------------- // 
*/
/*
_dm[?_dk+'A']='ILL SELL<'
             +'YOU THIS<'
             +'TREASURE<'
             +'MAP. -P';       // 
//           --------------- // 
*/
/*
_dm[?_dk+'A']='IM SELLING<'
             +'A TREASURE<'
             +'MAP.<'
             +'-P.';       // 
//           --------------- // 
*/
//           --------------- // 
_dm[?_dk+'B']='YOU DONT<'
             +'HAVE<'
             +'ENOUGH P!';  // 
_dm[?_dk+'BB']=_dm[?_dk+'B']; // default
//           --------------- // 
_dm[?_dk+'C']='WHAT? ITS<'
             +'ONLY HALF<'
             +'OF THE<'
             +'MAP?';  // 
_dm[?_dk+'CC']=_dm[?_dk+'C']; // default
//           --------------- // 
// for rando
_dm[?_dk+'D']='WANNA BUY<'
             +'THIS THING<'
             +'I FOUND?<'
             +'-P';
_dm[?_dk+'DD']=_dm[?_dk+'D']; // default
//           --------------- // 
_dm[?_dk+'E']='YOURE A<'
             +'TOUGH SELL>'
             +'HOW ABOUT<'
             +'-P?';
_dm[?_dk+'EE']=_dm[?_dk+'E']; // default
//           --------------- // 
_dm[?_dk+'F']='FINAL<'
             +'OFFER:>'
             +'-P';  // 
_dm[?_dk+'FF']=_dm[?_dk+'F']; // default
//           --------------- // 
_dm[?_dk+'G']='I HAVE<'
             +'NOTHING<'
             +'LEFT TO<'
             +'OFFER YOU.';  // 
_dm[?_dk+'GG']=_dm[?_dk+'G']; // default
//           --------------- // 









//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
//  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Zelda ---------------------------------------------
_dk=_DK0Z00;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_NONE;
/*
_dm[?_dk+'A']='YOU SAVED<' 
             +'HYRULE AND<' 
             +'YOU ARE A<' 
             +'TRUE HERO!';
//           --------------- // 
*/
_dm[?_dk+'A']='YOU SAVED<' 
             +'HYRULE AND<' 
             +'YOU ARE A<' 
             +'REAL HERO!';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
_dk=_DK0Z01;             _a=1;
_dm[?_dk+hex_str(_a)+_DK_SKIP]= SkipType_TOEND;
if (global.SWAP_LINK_NAME_WITH_SAVE_NAME)
{
    _dm[?_dk+hex_str(_a++)]=global.USE_PLAYER_NAME_INDICATOR+', BE BRAVE<' 
                           +'AND GOOD LUCK<' 
                           +'ON YOUR JOURNEY!';
    //           --------------- // 
}
else
{
    _dm[?_dk+hex_str(_a++)]='LINK, BE BRAVE<' 
                           +'AND GOOD LUCK<' 
                           +'ON YOUR JOURNEY!';
    //           --------------- // 
}
/*
_dm[?_dk+hex_str(_a++)]= 'BE BRAVE AND<' 
              +'GOOD LUCK ON<' 
              +'YOUR JOURNEY!';
//           --------------- // 
*/
_dm[?_dk+hex_str(_a)+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+hex_str(_a++)]='TAKE THIS AND<' 
                       +'DEFEAT DARK<' 
                       +'LINK ONCE AGAIN';
//           --------------- // 
/*
_dm[?_dk+hex_str(_a++)]= 'TAKE THIS AND<' 
              +'FILL IT WITH<' 
              +'DARK LINKS BLOOD';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'YOU MUST GO<' 
              +'DEFEAT DARK<' 
              +'LINK ONCE AGAIN';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'YOU MUST GO<' 
              +'DEFEAT YOUR<' 
              +'DARK SELF AGAIN';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'FILL THIS WITH<' 
              +'THE BLOOD OF<' 
              +'YOUR DARK SELF';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'THE BLOOD OF<' 
              +'DARK LINK CAN<' 
              +'REVIVE GANON';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'USE THIS BOTTLE<' 
              +'TO HOLD THE BLOOD<' 
              +'OF YOUR DARK SELF';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'USE THIS TO HOLD<' 
              + 'THE BLOOD OF<' 
              +'YOUR DARK SELF';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'FILL THIS BOTTLE<' 
              +'WITH THE BLOOD<' 
              +'OF YOUR DARK SELF.';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'TAKE THIS BOTTLE.<' 
              +'FILL IT WITH THE<' 
              +'BLOOD OF YOUR<' 
              +'DARK SELF.';
//           --------------- // 
_dm[?_dk+hex_str(_a++)]= 'LINK, FILL THIS<' 
              +'BOTTLE WITH THE<' 
              +'BLOOD OF YOUR<' 
              +'DARK SELF.';
//           --------------- // 
*/
















// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Sign Simple ---------------------------------------------
//           --------------- // 
//_dm[?_DK0000+'A']=' WELCOME<'+'__ TO<'+'_ RAURU';
_dk=_DK0050;
_dm[?STR_Halloween+_DK0000] = _dk;
_dm[?_dk+'A']='_ GHOST<'    // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ RAURU';     // 
//           --------------- // 
//_dm[?_DK0001+'A']='_ TOWN<'+'__ OF<'+'_ RUTO';
_dk=_DK0051;
_dm[?STR_Halloween+_DK0001] = _dk;
_dm[?_dk+'A']=' CURSED<'      // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ RUTO';      // 
//           --------------- // 
//_dm[?_DK0002+'A']='WATER TOWN<'+'___ OF<'+'_ SARIA';
_dk=_DK0052;
_dm[?STR_Halloween+_DK0002] = _dk;
_dm[?_dk+'A']=' BLOODY<'     // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ SARIA';     // 
//           --------------- // 
//_dm[?_DK0003+'A']=' HARBOR<'+'_ TOWN<'+'__ OF<'+'_ MIDO';
_dk=_DK0053;
_dm[?STR_Halloween+_DK0003] = _dk;
_dm[?_dk+'A']='_ DEAD<'     // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'_ MIDO';      // 
//           --------------- // 
//_dm[?_DK0004+'A']=' WELCOME<'+'__ TO<'+' NABOORU';
_dk=_DK0054;
_dm[?STR_Halloween+_DK0004] = _dk;
_dm[?_dk+'A']=' ROTTING<'    // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +' NABOORU';    // 
//           --------------- // 
//_dm[?_DK0005+'A']='MOUNTAIN<'+'TOWN OF<'+'DARUNIA';
_dk=_DK0055;
_dm[?STR_Halloween+_DK0005] = _dk;
_dm[?_dk+'A']=' UNDEAD<'    //  
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +'DARUNIA';     // 
//           --------------- // 
//_dm[?_DK0006+'A']=' HIDDEN<'+'_ TOWN<'+'__ OF<'+' KASUTO';
_dk=_DK0056;
_dm[?STR_Halloween+_DK0006] = _dk;
_dm[?_dk+'A']='_ EVIL<'     // 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +' KASUTO';     // 
//           --------------- // 
//_dm[?_DK0007+'A']='KASUTO.<'+'STRANGE...>'+'IT IS<'+'DESERTED.';
_dk=_DK0057;
_dm[?STR_Halloween+_DK0007] = _dk;
_dm[?_dk+'A']=' HAUNTED<' 
             +'_ TOWN<'      // 
             +'__ OF<'       // 
             +' KASUTO';     // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//_dm[?_DK0009+'A']='THERE IS<'+'SOMEONE<'+'BEHIND THE<'+'DOOR!';
_dk=_DK005A;
_dm[?STR_Halloween+_DK0009] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THERE IS<' 
             +'SCREAMING<' 
             +'BEHIND THE<' 
             +'DOOR!';
//           --------------- // 
//           --------------- // 
//______________________________________________\
// Idle Simple ---------------------------------------------
//           --------------- // 
//           --------------- // 
//_dm[?_DK0101+'A']='WITH BOOTS<'+'I COULD<'+'WALK ON<'+'THE WATER.';
_dk=_DK0150; //_DK0101
_dm[?STR_Halloween+_DK0101] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE DEAD<'
             +'ARE<'
             +'RESTLESS<'
             +'TONIGHT.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0102+'A']='GET CANDLE<'+'IN PARAPA<'+'PALACE.<'+'GO WEST.';
_dk=_DK0151; //_DK0102
_dm[?STR_Halloween+_DK0102] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='LIGHT 6<'
             +'CANDLES TO<'
             +'COMPLETE<'
             +'THE RITUAL';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0104+'A']='A POWERFUL<'+'KNIGHT<'+'LIVES IN<'+'THIS TOWN.';
_dk=_DK0152; //_DK0104
_dm[?STR_Halloween+_DK0104] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='HELP!<'
             +'ZOMBIES<'
             +'ATE MY<'
             +'NEIGHBOR!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0105+'A']='EACH TOWN<'+'HAS A WISE<'+'MAN. LEARN<'+'FROM HIM.';
_dk=_DK0153; //_DK0105
_dm[?STR_Halloween+_DK0105] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='ITS VERY<'
             +'SPOOKY IN<'
             +'THIS HOUSE';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0106+'A']='DO NOT GO<'+'SOUTH<'+'WITHOUT A<'+'CANDLE.';
_dk=_DK0154; //_DK0106
_dm[?STR_Halloween+_DK0106] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='GHASTLY<'
             +'GHOULS<'
             +'ROAM THE<'
             +'LANDS.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0107+'A']='THERES AN<'+'OLD WELL<'+'BACKSIDE<'+'OF TOWN.';
_dk=_DK0155; //_DK0107
_dm[?STR_Halloween+_DK0107] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WICKED<' 
             +'THINGS<' 
             +'WANT TO BE<' 
             +'KINGS.';    // 
//           --------------- // 
//           --------------- // 
//_dm[?_DK0109+'A']="RETURN THE<"+"CRYSTAL TO<"+"THE PALACE<"+"IN PARAPA.";
_dk=_DK0156; //_DK0109
_dm[?STR_Halloween+_DK0109] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']="A MONSTER<" 
             +"GROWLS TO<" 
             +"SING AN<" 
             +"EVIL SONG.";
//           --------------- // 
//           --------------- // 
//_dm[?_DK010A+'A']="LOOK AT<"+"YOUR MAP<"+"FOR AN<"+"AREAS NAME";
_dk=_DK0157; //_DK010A
_dm[?STR_Halloween+_DK010A] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']="HAVE YOU<"   //     \\
             +"HEARD THE<"
             +"SCREAMS OF<"
             +"A REDEAD?";
//           --------------- // 
//           --------------- // 
//_dm[?_DK010B+'A']='THERE IS<'+'A SECRET<'+'AT EDGE<'+'OF TOWN.';
_dk=_DK0158; //_DK010B
_dm[?STR_Halloween+_DK010B] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='DO YOU<'
             +'KNOW HOW<'
             +'TO CATCH<'
             +'A POE?';          // 
//           --------------- // 
//           --------------- // 
//_dm[?_DK0111+'A']="A HEART IS<"+"IN NORTH<"+"CASTLE<"+"FIELD.";
_dk=_DK0159; //_DK0111
_dm[?STR_Halloween+_DK0111] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']="I SAW A<"   //     \\
             +"BEATING<"
             +"HEART ON<"
             +"A TABLE.";         // 
//           --------------- // 
//           --------------- // 
//_dm[?_DK0114+'A']="IF ALL<"+"ELSE FAILS<"+"USE FIRE.";
_dk=_DK015A; //_DK0114
_dm[?STR_Halloween+_DK0114] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']="I SEE<"
             +"DEAD<"
             +"PEOPLE.";
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
// Walk Special ---------------------------------------------
//_dm[?_DK0300+'A']='FIND MAGIC<'+'IN A CAVE<'+'NEAR NORTH<'+'CASTLE.';
_dk=_DK0350; //_DK0300
_dm[?STR_Halloween+_DK0300] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='IM ON MY<' 
             +'WAY TO GO<' 
             +'WAKE THE<' 
             +'DEAD.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0301+'A']='THE ISLAND<'+'PALACE IN<'+'THE SOUTH<'+'HAS A RAFT';
_dk=_DK0351; //_DK0301
_dm[?STR_Halloween+_DK0301] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE LAST<' 
             +'HOUSE GAVE<' 
             +'A TON OF<' 
             +'CANDY!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0302+'A']='JUMP IN A<'+'HOLE IN<'+'THE PALACE<'+'IF YOU GO.';
_dk=_DK0352; //_DK0302
_dm[?STR_Halloween+_DK0302] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='CANDY CORN<' 
             +'IS MY<' 
             +'FAVORITE.';
/*
_dm[?_dk+'A']='JUMP IN A<'
             +'HOLE IN<'
             +'THE PALACE<'
             +'AND DIE!';
*/
//           --------------- // 
//           --------------- // 
//_dm[?_DK0303+'A']='THE PALACE<'+'ON THE SEA<'+'HAS A<'+'FALSE WALL';
_dk=_DK0353; //_DK0303
_dm[?STR_Halloween+_DK0303] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE PALACE<'
             +'ON THE SEA<'
             +'IS FULL OF<' 
             +'DEATH.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0304+'A']='CALL FOR<'+'HELP AT<'+'THE THREE<'+'EYE ROCKS.';
_dk=_DK0354; //_DK0304
_dm[?STR_Halloween+_DK0304] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='CALL FOR<'
             +'HELP. BUT<'
             +'NO ONE<'
             +'WILL HEAR.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0305+'A']='THE OLD<'+'MAN WHO<'+'REMAINS<'+'HAS MAGIC.';
_dk=_DK0355; //_DK0305
_dm[?STR_Halloween+_DK0305] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE OLD<'
             +'MAN IS AN<'
             +'EVIL<'
             +'WIZARD.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0306+'A']='NO. ITS<'+'PRONOUNCED>'+'RAURU.';
_dk=_DK0356; //_DK0306
_dm[?STR_Halloween+_DK0306] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE DEAD<'
             +'ARE COMING>'
             +'FOR ALL OF>'
             +'US.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0307+'A']='ONLY THE<'+'HAMMER CAN<'+'DESTROY A<'+'BOULDER.';
_dk=_DK0357; //_DK0307
_dm[?STR_Halloween+_DK0307] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='I CAN HEAR<'
             +'SCRATCHING<'
             +'UNDER MY<'
             +'BED.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0308+'A']='IT ONLY<'+'GROWS IN<'+'THE MORUGE<'+'SWAMP CAVE';
_dk=_DK0358; //_DK0308
_dm[?STR_Halloween+_DK0308] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='BLOOD WAS<'
             +'SEEPING<'
             +'FROM THE<'
             +'WALLS!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0309+'A']='THE RIVER<'+'MONSTER<'+'HATES<'+'NOISE.';
_dk=_DK0359; //_DK0309
_dm[?STR_Halloween+_DK0309] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THE RIVER<'
             +'MONSTER<'
             +'WILL EAT<'
             +'YOU.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK030B+'A']='FIND A<'+'HEART IN<'+'SOUTHERN<'+'PARAPA.';
_dk=_DK035A; //_DK030B
_dm[?STR_Halloween+_DK030B] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='THIS TOWN.>' 
             +'IT IS<' 
             +'HAUNTED.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK030C+'A']='A HEART IS<'+'HIDING IN<'+'MORUGE<'+'SWAMP.';
_dk=_DK035B; //_DK030C
_dm[?STR_Halloween+_DK030C] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='I GOT SO<' 
             +'MUCH CANDY<' 
             +'TONIGHT!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK030D+'A']='I HID SOME<'+'MAGIC IN<'+'MIDORO<'+'SWAMP.';
_dk=_DK035C; //_DK030D
_dm[?STR_Halloween+_DK030D] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='EVIL ACHE<' 
             +'HOVER OVER<' 
             +'THE TOWN.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK030E+'A']='THE<'+'HAMMER CAN<'+'CLEAR A<'+'FOREST.';
_dk=_DK035D; //_DK030E
_dm[?STR_Halloween+_DK030E] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='WOW! WHAT<' 
             +'A GREAT<' 
             +'COSTUME!';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
//______________________________________________\
// Traffic -----------------------------------
//_dm[?_DK0200+'A']='I AM MUCH<'+'TOO BUSY<'+'TO TALK TO<'+'A STRANGER.';
_dk=_DK0250;
_dm[?STR_Halloween+_DK0200] = _dk;
_dm[?_dk+'A']='WHAT A<' 
             +'HORRIBLE<' 
             +'NIGHT TO<' 
             +'BE CURSED.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0201+'A']='HELLO!';
_dk=_DK0251;
_dm[?STR_Halloween+_DK0201] = _dk;
_dm[?_dk+'A']='EYES..>' 
             +'OF....>' 
             +'GANON!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0202+'A']='HELLO<'+'YOUNG<'+'FELLOW.';
_dk=_DK0252;
_dm[?STR_Halloween+_DK0202] = _dk;
_dm[?_dk+'A']='...';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0203+'A']='SORRY.<'+'I KNOW<'+'NOTHING.';
_dk=_DK0253;
_dm[?STR_Halloween+_DK0203] = _dk;
_dm[?_dk+'A']='PLEASE.>' 
             +'GIVE ME..<' 
             +'YOUR<' 
             +'BRAINS!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0204+'A']='I KNOW<'+'NOTHING.';
_dk=_DK0254;
_dm[?STR_Halloween+_DK0204] = _dk;
_dm[?_dk+'A']='DO YOU<' 
             +'HEAR THE<' 
             +'SCREAMS?';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0205+'A']='PLEASE<'+'SAVE OUR<'+'TOWN!';
_dk=_DK0255;
_dm[?STR_Halloween+_DK0205] = _dk;
_dm[?_dk+'A']='UUHHNNG...';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0206+'A']='YOU MUST<'+'SAVE<'+'HYRULE!';
_dk=_DK0256;
_dm[?STR_Halloween+_DK0206] = _dk;
_dm[?_dk+'A']='PLEASE..>'
             +'DIE!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0207+'A']='I CAN NOT<'+'HELP YOU.';
_dk=_DK0257;
_dm[?STR_Halloween+_DK0207] = _dk;
_dm[?_dk+'A']='I THINK<'
             +'IVE BEEN<'
             +'POSSESSED';
//           --------------- // 
//           --------------- // 
//______________________________________________\
//______________________________________________\
//_dm[?_DK0400+'A']='PLEASE LET<'+'ME HELP<'+'YOU. COME<'+'INSIDE.';
//_dm[?_DK0400+'B']='I CAN<'+'RESTORE<'+'YOUR LIFE.';
//_dm[?_DK0401+'A']='STOP BY<'+'FOR A<'+'WHILE.';
//_dm[?_DK0401+'B']='REVIVED!';
_dk=_DK0450;
_dm[?STR_Halloween+_DK0400] = _dk;
_dm[?STR_Halloween+_DK0401] = _dk;
_dm[?_dk+'A']='I HAVE<'
             +'CANDY<'
             +'INSIDE.<'
             +'COME.';
//           --------------- // 
_dm[?_dk+'B']='I HOPE YOU<'
             +'LIKE CANDY<'
             +'CORN.';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0402+'A']='STOP AND<'+'REST HERE.';
//_dm[?_DK0402+'B']='I CAN GIVE<'+'YOU MAGIC.<'+'COME BACK<'+'ANYTIME.';
//_dm[?_DK0403+'A']='REST HERE.';
//_dm[?_DK0403+'B']='HOW ABOUT<'+'THAT? ITS<'+'MY SPECIAL<'+'MEDICINE.';
//_dm[?_DK0406+'A']='I HAVE<'+'SOMETHING<'+'TO RESTORE<'+'YOUR MAGIC';
//_dm[?_DK0406+'B']='ITS MAGIC<'+'SAUCE MADE<'+'FROM OUR<'+'TOWNS VINE';
_dk=_DK0451;
_dm[?STR_Halloween+_DK0402] = _dk;
_dm[?STR_Halloween+_DK0403] = _dk;
_dm[?STR_Halloween+_DK0406] = _dk;
_dm[?_dk+'A']='MY POTION<'
             +'BREW IS<'
             +'THE BEST.<'
             +'COME DRINK';
//           --------------- // 
_dm[?_dk+'B']='FEEL IT<'
             +'BUBBLE<'
             +'INSIDE<'
             +'YOU!';
//           --------------- // 
//           --------------- // 
//_dm[?_DK0404+'A']='ILL WRITE<'+'DOWN YOUR<'+'ADVENTURE.<'+'COME IN.';
//_dm[?_DK0404+'B']='YOUR<'+'ADVENTURE<'+'HAS BEEN<'+'RECORDED!';
//_dm[?_DK0405+'A']='COME IN<'+'AND TELL<'+'ME YOUR<'+'STORY.';
//_dm[?_DK0405+'B']='AMAZING!>'+'ILL NEVER<'+'FORGET<'+'THAT!';
_dk=_DK0452;
_dm[?STR_Halloween+_DK0404] = _dk;
_dm[?STR_Halloween+_DK0405] = _dk;
_dm[?_dk+'A'+_DK_SKIP]= SkipType_TOEND;
_dm[?_dk+'A']='I THINK MY<'
             +'HOUSE IS<'
             +'HAUNTED.<'
             +'COME LOOK.';
//           --------------- // 
_dm[?_dk+'B']='IM SO<'
             +'SCARED!';
/*
_dm[?_dk+'B']='DID YOU<'
             +'FEEL THE<'
             +'GHOST?!';
_dm[?_dk+'B']='THE GHOST<'
             +'REMEMBERS<'
             +'EVERYTHING';
*/
//           --------------- // 
//           --------------- // 
/*
//           --------------- // 
_dm[?_dk+'A']='IT IS<'
             +'NAPTIME.>'
             +'IN THE<'
             +'CEMETERY.';
//           --------------- // 
//           --------------- // 
//           --------------- // 
//           --------------- // 
*/
// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&















/* // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
ds_list_add(dl_ItemPool_A, STR_CANDLE);
ds_list_add(dl_ItemPool_A, STR_GLOVE);
ds_list_add(dl_ItemPool_A, STR_RAFT);
ds_list_add(dl_ItemPool_A, STR_BOOTS);
ds_list_add(dl_ItemPool_A, STR_FLUTE);
ds_list_add(dl_ItemPool_A, STR_CROSS);
ds_list_add(dl_ItemPool_A, STR_HAMMER);
ds_list_add(dl_ItemPool_A, STR_BRACELET);
ds_list_add(dl_ItemPool_A, STR_BOOK);
ds_list_add(dl_ItemPool_A, STR_RFAIRY); // Rescue Fairy is a prog item. Her friend gives a reward.
//                                                      //
ds_list_add(dl_ItemPool_A, STR_NOTE);
if(!KeyLocations_WILL_RANDOMIZE) ds_list_add(dl_ItemPool_A, STR_ALLKEY);
if (QUEST_NUM==2 && INCLUDE_BOTTLE_LOCATION) ds_list_add(dl_ItemPool_B, STR_BOTTLE);
//                                                      //
dm_spell_quest=ds_map_create();
//                                                                  //
                          _item_id=STR_TROPHY;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Ruto;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_MIRROR;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Saria;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_FLOWER;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Mido;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_CHILD;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Darunia;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
if (QUEST_NUM==2)
{                             _item_id=STR_MASK;
    dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Bulblin;
    ds_list_add(dl_ItemPool_A,_item_id);
}
//                                                                  //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
            dl_ItemPool_B = ds_list_create();
ds_list_add(dl_ItemPool_B, STR_MEAT);
ds_list_add(dl_ItemPool_B, STR_SHIELD);
ds_list_add(dl_ItemPool_B, STR_RING);
ds_list_add(dl_ItemPool_B, STR_PENDANT);
ds_list_add(dl_ItemPool_B, STR_SWORD);
ds_list_add(dl_ItemPool_B, STR_MAP1);
ds_list_add(dl_ItemPool_B, STR_MAP2);




g.dm_RandoHints=ds_map_create();
_dk=STR_Hint+hex_str(_a++);

_dk=STR_NPC+hex_str(++_a);
g.dm_RandoHints[?_dk+STR_Dialogue+STR_Datakey]=_DK0102;
g.dm_RandoHints[?_DK0102+STR_NPC+STR_Num]=_a;
g.dm_RandoHints[?_dk+STR_Area]=STR_Rauru;
g.dm_RandoHints[?_dk]

// NPCs that could give a hint:

_DK0102; // Rauru.          GET CANDLE IN PARAPA PALACE, GO WEST
_DK0105; // Rauru.          EACH TOWN HAS A WISE MAN. LEARN FROM HIM.
_DK0109; // Rauru.          RETURN THE CRYSTAL TO THE PALACE IN PARAPA.
_DK0111; // Rauru.          A HEART IS IN NORTH CASTLE FIELD.
_DK0114; // Rauru.          GOING OUT THERE ALL ALONE IS DANGEROUS
_DK0306; // Rauru.          NO. ITS PRONOUNCED RAURU.
_DK030B; // Rauru.          FIND A HEART IN SOUTHERN PARAPA.

_DK0018; // Ruto.           NORTH RUTO MOUNTAINS
_DK0106; // Ruto.           DO NOT GO SOUTH WITHOUT A CANDLE.
_DK010A; // Ruto.           SOMEONE IN RAURU KNOWS ABOUT A HEART.
_DK0300; // Ruto.           FIND MAGIC IN A CAVE NEAR NORTH CASTLE.
_DK0307; // Ruto.           ONLY THE HAMMER CAN DESTROY A BOULDER.
_DK0902; // Ruto.           SOUTH OF KINGS TOMB IN MIDO IS A TUNNEL.

_DK0103; // Saria.          EYES OF GANON ARE EVERYWHERE. BE CAREFUL.
_DK030C; // Saria.          A HEART IS HIDING IN MORGUE SWAMP.
_DK0905; // Saria.          LET ME BE! MASTER IS IN WOODS N OF RIVER

_DK0301; // Mido.           THE ISLAND PALACE IN THE SOUTH HAS A RAFT.
_DK0308; // Mido.           IT ONLY GROWS IN THE MORGUE SWAMP CAVE.
_DK030D; // Mido.           I HID SOME MAGIC IN MIDORO SWAMP.

_DK0101; // Nabooru.        WITH BOOTS I COULD WALK ON THE WATER
_DK0107; // Nabooru.        THERES AN OLD WELL BACKSIDE OF TOWN.
_DK0302; // Nabooru.        JUMP IN A HOLE IN THE PALACE IF YOU GO.
_DK0309; // Nabooru.        THE RIVER MONSTER HATES NOISE.
_DK0904; // Nabooru.        YOU ARE PERSISTENT FIND HEART OVER OCEAN.

_DK000B; // Darunia.        IT IS SAID A NABOORU SEASIDE CAVE HAS...
_DK0104; // Darunia.        A POWERFUL KNIGHT LIVES IN THIS TOWN.
_DK010F; // Darunia.        DO NOT GO IN THE BASEMENT.
_DK0303; // Darunia.        THE PALACE HAS A FALSE WALL.
_DK030E; // Darunia.        THE HAMMER CAN CLEAR A FOREST.

_DK000C; // New Kasuto.     SOMEWHERE IN THE SEASHORE DESERT..
_DK0108; // New Kasuto.     WE HAD TO FLEE KASUTO.
_DK010B; // New Kasuto.     THERE IS A SECRET AT EDGE OF TOWN
_DK0115; // New Kasuto.     A SKELETON KEY IS IN THE GREAT PALACE.
_DK0304; // New Kasuto.     CALL FOR HELP AT THE THREE EYE ROCKS.
_DK0305; // New Kasuto.     THE OLD MAN WHO REMAINS HAS MAGIC.
_DK030A; // New Kasuto.     THE HOLE IN PALACE IS ENDLESS TRAP.

_DK000C; // Old Kasuto.     THE POWER BRACELET.. TREASURE OF KASUTO.
_DK010E; // Old Kasuto.     THE TOWN IS DEAD. LOOK EAST IN WOODS.

_DK0140; // Bulblin.        WE NEED LINK BLOOD FOR GANON.
_DK0141; // Bulblin.        GANON WILL GIVE US MANY MEAT.
_DK0142; // Bulblin.        TOWER IS ON ISLAND BEHIND TOWN.
_DK0143; // Bulblin.        WHY NOT JUST FLY THERE?
_DK0340; // Bulblin.        LOOK INTO MY EYE AND COUNT TO...
_DK0341; // Bulblin.        THE WAY TO TOWER IS CLOSE BY.
_DK0342; // Bulblin.        GANON SOON BE AWAKE.

_DK000D; // Saria Cemetery. THE HERO ERDRICK RESTS HERE
_DK010C; // Kings Tomb.     THIS IS KINGS TOMB.
_DK010D; // Pendant Isl.    ITS A SECRET TO EVERYBODY.







Minigame. Saria or Darunia minigame
YOU MUST WIN THE CANDLE

Shop. Nabooru or New Kasuto map shops

Town. Any location in any town
FIND THE CANDLE IN A TOWN

Spell Rooms. Spell room checks; Ruto spell room, Mido spell room, Nabooru spell room

Island. Northern Islands or P3
THE CANDLE IS ON A SMALL ISLAND

Whale Isl

Waterfalls. Saria River, 

Lakes. Saria Lake BAIT location, Kasuto Lake, River Monster Lake

P5 Ocean Location. 
FIND CANDLE OVER OCEAN.

Desert locations.
FIND CANDLE IN A DESERT

Forest locations. Bagu, N.Castle Forest Tile, Saria River Forest location, Forest Tile near Kasuto Lake, New Kasuto locations
FIND CANDLE IN A FOREST

Sea Caves. Ruto Mts, Darunia, Nabooru Bay

Swamp Caves. Morgue Swamp, Kasuto Swamp, Sword Swamp

Maze Isl.

Old Kasuto check. 
FIND CANDLE IN A DEAD TOWN.

East Palaces. P4, P5, P6
THE CANDLE IS IN AN EASTERN PALACE

West Palaces. P1, P2, P3
""

Carocks. In P4 or dropped by Carock2
A MASTER WIZARD HOLDS THE CANDLE

Nabooru Well. Any check in Nabooru well
THE CANDLE FELL DOWN A WELL

Mountain. Darunia or Ruto Mtns
*/








ds_map_copy(dm_dialogue,_dm);
ds_map_destroy(_dm); _dm=undefined;




