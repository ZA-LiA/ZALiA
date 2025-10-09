/// Snaraa_init2()


if (global.dg_solid[# (xl>>3)-1, yt>>3]&$FF == TID_SOLID1)
{    facing_dir =  1;  }
else facing_dir = -1;

if ( facing_dir) path_dir = $1; // 1: RGT
else            path_dir = $2; // 2: LFT


path_dist = Snaraa_update_1(x>>3);
Snaraa_update_2();


timer = $40;




