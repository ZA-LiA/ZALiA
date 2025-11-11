/// Cloud_1_step()


if(!can_move) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (hspd==0)  exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------------------
for(var _i=0; _i<CLOUD_COUNT; _i++)
{
    if(0){ // Trying for smoother movement. Slower cloud movement looks choppy.
             dg_cloud[#_i,3] -= 1*global.delta_multiplier; // 3:timer
        if ( dg_cloud[#_i,3] >= 0) continue; // 3:timer
        else dg_cloud[#_i,3]  = dg_cloud[#_i,2] + dg_cloud[#_i,3]; // 2:timer reset
    }else{
             dg_cloud[#_i,3]--; // 3: timer
        if ( dg_cloud[#_i,3]) continue; // 3: timer
        else dg_cloud[#_i,3] = dg_cloud[#_i,2]; // 2: timer reset
    }
    
    //if!(abs(hspd)) continue;
    
    
            dg_cloud[#_i,0] += hspd; // x
    // --------------------------------------------
    if (abs(dg_cloud[#_i,0]-dg_cloud[#_i,7]) >= DIST1) // if far enough from starting x
    {       dg_cloud[#_i,0] +=  -sign(hspd)  *  DIST1;  }
}




