/// update_NIAO()

// NIAO: Non-Interactable Animated Object


for(var _i=ds_list_size(g.dl_niao)-1; _i>=0; _i--)
{
    if (g.dl_niao[|_i])
    {
        with(g.dl_niao[|_i])
        {
            if(!state) break;//_i
            
            if(!is_undefined(  scr_update))
            {   script_execute(scr_update);  }
            
            if(!is_undefined(  scr_udp))
            {   script_execute(scr_udp);  }
        }
    }
}




//if (keyboard_check_pressed(vk_f7)) global.Rain_is_active = !global.Rain_is_active; // testing
if (global.Rain_is_active)
{
    global.Rain_pi = global.PI_MOB_BLU;
    
    global.Rain_xoff %= global.Rain1_LOOP_SIZE;
    global.Rain_xoff += global.Rain_speed_x * global.Rain_direction_x;
    
    global.Rain_yoff %= global.Rain1_LOOP_SIZE;
    global.Rain_yoff += global.Rain_speed_y * global.Rain_direction_y;
    
    
    global.Rain_xl  = abs(viewXC()) div global.Rain1_LOOP_SIZE_; // num of `global.Rain1_LOOP_SIZE_` away from left room edge (0)
    global.Rain_xl += global.Rain_xl&$1;                         // round up if odd
    global.Rain_xl *= global.Rain1_LOOP_SIZE_;
    global.Rain_xl *= sign_(viewXC());                           // rain xc. rounded to nearest `global.Rain1_LOOP_SIZE`
    global.Rain_xl -= surface_get_width( global.Rain1_srf)>>1;   // rain home xl
    global.Rain_xl += floor(global.Rain_xoff);                   // rain xl
    
    global.Rain_yt  = abs(viewYC()) div global.Rain1_LOOP_SIZE_; // num of `global.Rain1_LOOP_SIZE_` away from top room edge (0)
    global.Rain_yt += global.Rain_yt&$1;                         // round up if odd
    global.Rain_yt *= global.Rain1_LOOP_SIZE_;
    global.Rain_yt *= sign_(viewYC());                           // rain yc. rounded to nearest `global.Rain1_LOOP_SIZE`
    global.Rain_yt -= surface_get_height(global.Rain1_srf)>>1;   // rain home yt
    global.Rain_yt += floor(global.Rain_yoff);                   // rain yt
}
//if (keyboard_check_pressed(vk_f7)) sdm("-49.25 & 1 = "+string(-49.25 & 1));
//if (keyboard_check_pressed(vk_f7)) sdm("floor(-1.25)="+string(floor(-1.25))+", -21.25%20="+string(-21.25%20.0)+", -21.25/20="+string(-21.25/20.0)+", floor(-21.25/20)="+string(floor(-21.25/20.0))+", -19.75/20="+string(-19.75/20.0)+", floor(-19.75/20.0)="+string(floor(-19.75/20.0))+", -21.25 div 20="+string(-21.25 div 20.0)+", -21.25 mod 20="+string(-21.25 mod 20.0)+", -19.75 div 20="+string(-19.75 div 20.0)+", -19.75 mod 20="+string(-19.75 mod 20.0));
//floor(-1.25)=-2, -21.25%20=-1.25, -21.25/20=-1.0625, floor(-21.25/20)=-2, -19.75/20=-0.9875, floor(-19.75/20.0)=-1, -21.25 div 20=-1, -21.25 mod 20=-1.25, -19.75 div 20=0, -19.75 mod 20=-19.75




