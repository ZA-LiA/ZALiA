/// Aruroda_update()


// 9AAE
GO_update_cs();

Enemy_update_3(); // update vertical, adjClipFloor()


// 9AB1
if(!tmr_eye_open)
{
    update_EF11();
    update_body_hb_1a(); // Aruroda shld copies its body hb values
    GOB_shield_collision_1a();
}


if (tmr_eye_open)     tmr_eye_open--;
if (tmr_tail_forward) tmr_tail_forward--;


if (pc_sword_collided_solid_body 
&& !(f.items&ITM_SWRD) )            // lvl2 sword can pierce
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// --------------------------------------------------------------------------
// --------------------------------------------------------------
// 9AC5
GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();



GOB_update_1(cs&$4); // update hspdPB

GO_update_cs();

if!(cs&$3) updateX();

if!(g.counter1&$3F) facing_dir = dir_to_pc(id);


counter = (counter+1)&$FF;
hspd    = 0;
Enemy_update_2(); // set hspd



if!((g.dl_RandomOG[|1+update_idx]^$FF) &$FC) tmr_eye_open     = DUR_EYE_OPEN; // $20
if!( g.dl_RandomOG[|2+update_idx]      &$3F) tmr_tail_forward = DUR_TAIL_FORWARD; // $10

if (tmr_tail_forward == DUR_TAIL_FORWARD-8 
&&  ocsH2(id) // Return true if at least 8 (4 if ww == 8) pixels width w/in ocs area width
&&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
{
    // 9AFE.  Fireball1 pID $19
    GOC1_create(xl,yt, facing_dir, projectile,projectile_ver);
}




