/// Gooma_udp()


// BD75
can_draw_self = true;

// B5C7
palidx = palidx_def;


// ----------------------------------------------------
if (g.view_lock_boss 
&&  (hspd || attack_state) )
{   // B5D4
    if (counter&$7>=3 
    &&  counter&$7<=5 )
    {    GO_set_sprite(id,spr_Gooma_2b);  } // walk
    else GO_set_sprite(id,spr_Gooma_2a);    // walk
    
    // B5E7
    if(!pending_death 
    &&  attack_state )
    {
             if (attack_state==attack_state_SWING) GO_set_sprite(id,spr_Gooma_3a); // attack
        else if (g.counter1&$8)                    GO_set_sprite(id,spr_Gooma_1b); // twirl weapon
        else                                       GO_set_sprite(id,spr_Gooma_1a); // twirl weapon
    }
}
else
{
    GO_set_sprite(id,spr_Gooma_1a);
}


// ----------------------------------------------------
Weapon_Ball_sprite  = 0;
Weapon_Chain_sprite = 0;


if(!pending_death 
&&  attack_state ) // 1,2. draw, attack
{
    switch(attack_state)
    {   // -----------------------------------------------
        case attack_state_DRAWBACK:{
        Weapon_Ball_sprite = spr_Boss_Spike_ball_1a;
        
        var            _idx  = timer>>1;
                       _idx &= $7;
        if (facing_dir) _idx ^= $7;
        
        //  04 FC F8 FC   04 0C 10 0C
        var _data = "04FCF8FC" + "040C100C";
        SwordHB_xoff  = str_hex(_data, _idx);
        SwordHB_xoff -= ((SwordHB_xoff&$80)<<1);
        
        //  08 0C 14 1C   20 1C 14 0C
            _data = "080C141C" + "201C140C";
        SwordHB_yoff  = str_hex(_data, _idx);
        
        
        SwordHB_xoff += g.HB_ADJ_X;
        SwordHB_yoff += g.HB_ADJ_Y;
        break;}//case attack_state_DRAWBACK:{
        
        
        // -----------------------------------------------
        case attack_state_SWING:{ // B656. sprite_index is 24x48
        if (wINwAll(x-ww_-8,ww+8, viewXL(),viewW())) // if Gooma far enough away from camera edge
        {   // B69B
            var _DATA  = "24"+"28"+"2C"+"30"  +  "34"+"38"+"2C"+"20"; //  24 28 2C 30 34 38 2C 20
                _DATA += "E4"+"E0"+"DC"+"D8"  +  "D4"+"D0"+"DC"+"E8"; //  E4 E0 DC D8 D4 D0 DC E8
            
            var _DIFF  = str_hex(_DATA, ((g.counter1>>1)&$7) + ((!facing_dir)<<3));
                _DIFF -= ((_DIFF&$80)<<1);
            //
            if (xl+_DIFF >= viewXL() 
            &&  xl+_DIFF <= viewXR() )
            {   // B6C5
                Weapon_Ball_sprite  = spr_Boss_Spike_ball_1a;
                Weapon_Chain_sprite = spr_Boss_Spike_ball_Chain_1a;
                
                SwordHB_xoff = _DIFF;
                SwordHB_yoff = 18;
                
                var            _XOFF =  16;
                if (facing_dir) _XOFF = -24;
                
                Weapon_Chain_x  = xl + SwordHB_xoff + _XOFF;
                Weapon_Chain_x += (g.counter1&$1)<<3;
                Weapon_Chain_x += 4;
            }
        }
        break;}//case attack_state_SWING:{
    }//switch(attack_state)
    
    
    if (SwordHB_yoff != 0)
    {   SwordHB_yoff += 9;  }
    
    Weapon_Ball_x = xl + SwordHB_xoff + 8;
    Weapon_Ball_y = yt + SwordHB_yoff - 1;
    //if (attack_state==attack_state_DRAWBACK && timer&$1) sdm(", x-Weapon_Ball_x "+string(x-Weapon_Ball_x)+", y-Weapon_Ball_y "+string(y-Weapon_Ball_y));
    //if (attack_state==attack_state_DRAWBACK && timer&$1) sdm(", Weapon_Ball_x $"+hex_str(Weapon_Ball_x)+", Weapon_Ball_y $"+hex_str(Weapon_Ball_y));
}




