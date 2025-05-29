/// NPC_4_update()

// NPC_4 Healer, Saver
// NPC_5 Quest


// 97D4: JSR 9A9B
if (is_talking)
{
    if (g.dialogue_source==id)
    {
        if (g.gui_state == g.gui_state_DIALOGUE1   // Regular dlg state
        &&  counter != -1 )
        {
            switch(object_index)
            {
                // --------------------------------------------------
                case NPC_4:{
                // Delay face toward door
                if (timer_a1) // timer set to 6 at frame of dlg initiate in scr_NPC_2d()
                {
                        timer_a1--;
                    if(!timer_a1)
                    {
                        facingDir = sign_(DOOR_XC-x); // face torwards door
                        counter = -1; // Indicates move torwards door to enter house
                    }
                }
                break;}
                
                
                
                // --------------------------------------------------
                case NPC_5:{
                if(!is_undefined(dk_spawn) 
                &&  quest_is_complete(val(g.dm_spawn[?dk_spawn+STR_Quest+STR_ID], STR_undefined)) )
                {
                    counter = -1; // Indicates move torwards door to enter house
                }
                break;}
            }
        }
        
        
        
        
        
        hspd = 0;
        
        
        // g.GWIN_D2(restore house dlg) doesn't draw PC nor NPC
        if (g.gui_state == g.gui_state_DIALOGUE1)
        {
            g.pc.xScale = sign_(x-g.pc.x); // Face PC torwards NPC
            update_EF11();
        }
        
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else
    {
        is_talking = false;
        // DO NOT exit script here bc this is the 
        // first frame of MOVING TORWARDS DOOR(counter == -1)
    }
}








// ----------------------------------------------------------------------------------
// MOVING TORWARDS DOOR to enter house ----------------------------------------
if (counter==-1)
{   
    facingDir = sign_(DOOR_XC-x);    // face door
    hspd = (hspd_PACE*facingDir) &$FF; // set hspd toward door
    updateX();
    
    update_EF11();
    GO_update_cs();
    
    if (hspd&$80) var _X=csLft2X;
    else          var _X=csRgt2X;
    if (wINw(_X,1, DoorHB_XL,DOOR_W)) counter = 1;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------------------
// ENTERING house ------------------------------------------------
if (counter 
&&  counter<$80 )
{   
    NPC_update_2(); // collision, enter restore house, start dlg
    
    
    // 98BC
    // c: condition
    var _C0 = counter==$01;
    var _C1 = counter==$10;
    var _C2 = counter==$20;
    var _C3 = counter>=$21 && counter<=$3F;
    var _C4 = counter==$40;
    var _C5 = counter==$70;
    var _C6 = counter==$7E;
    
    
         if (_C0) door_draw_state = door_draw_state_CLOSE; // $01. FULL CLOSED.   Making sure door is closed
    else if (_C1) door_draw_state = door_draw_state_OPEN1; // $10. HALF OPEN. Start open.
    else if (_C2) door_draw_state = door_draw_state_OPEN2; // $20. FULL OPEN
    else if (_C5) door_draw_state = door_draw_state_OPEN1; // $70. HALF OPEN. Start close
    else if (_C6) door_draw_state = door_draw_state_CLOSE; // $7E. FULL CLOSED
    
    
    
    // Making sure facing the correct dir
    if (_C0) facingDir = sign_(DOOR_XC-x); // face door
    
    if(!_C3) hspd = 0; // So walk spr doesn't draw while not moving
    
    if (counter<$40) update_EF11();
    
    
    
    if (_C3)        // $20-$3F. IS MOVING & Stepping up stairs
    {
        if(!isVal(sprite_datakey, STR_Moa,STR_Girubokku) 
        &&  counter&$F == $7) 
        {   set_xy(id, x,y-4);  } // Take 1 step
        
        
        hspd = (hspd_PACE*facingDir) &$FF; // set hspd toward door
        updateX();
    }
    else if (_C4)   // $40. INSIDE HOUSE
    {
        pc_can_enter = true; // PC CAN now enter house.
        if (door_exit_inst) door_exit_inst.open = true;
    }
    else if (_C6)   // $7E. INSIDE HOUSE. END entering house process
    {
        counter  = $80;  // Indicate waiting to exit house.
        timer_a1 = $FF;  // Timer to exit house.
        
        pc_can_enter = false; // PC CANNOT enter house anymore.
        if (door_exit_inst) door_exit_inst.open = false;
        
        // exit so counter stays at $80
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    counter++;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// ----------------------------------------------------------------------------------
// --------------------------------------------------------------------
// Keep Quest NPCs waiting in house if too far away (instead of despawning)
if (object_index==NPC_5  // Quest
&&  counter!=$80 )
{
    if (in_despawn_dist(id))
    {
        counter  = $80;  // Indicate waiting to exit house.
        timer_a1 = $FF;  // timer to exit house
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




// WAITING TO LEAVE house ----------------------------------
// ------------------------------------------------------------------
if (counter==$80) 
{
    if (timer_a1) timer_a1--;
    
    if(!timer_a1 
    &&  abs(g.pc.x-x)<$60 )
    {   // 97F5
        GO_update_cs();
        
        if (isVal(sprite_datakey, STR_Moa,STR_Girubokku))
        {    set_xlyt(id, DOOR_XC-ww_, DOOR_YT+8);  }
        else set_xlyt(id, DOOR_XC-ww_, GROUND_Y-8-hh);
        
        //sdm(sprite_datakey+" hh $"+hex_str(hh)+", GROUND_Y $"+hex_str(GROUND_Y>>3)+", DOOR_YB $"+hex_str(DOOR_YB>>3));
        
        if (object_index==NPC_5) facingDir = dir_to_pc(id);
        hspd = 0;
        
        door_draw_state = door_draw_state_OPEN1; // OPENING. Half open
        counter++;
    }
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------------------
// LEAVING house ------------------------------------------------------------
if (counter>$80)
{   
    counter++;
    
    // Opening and closing door ----------------------------------
         if (counter==$82) door_draw_state = door_draw_state_OPEN1; // OPENING. Half open
    else if (counter==$90) door_draw_state = door_draw_state_OPEN2; // OPENING. Full open
    else if (counter==$A0) door_draw_state = door_draw_state_OPEN1; // CLOSING. Half closed
    else if (counter==$B0) door_draw_state = door_draw_state_CLOSE; // CLOSING. Full closed
    
    
    
    // Stepping down stairs -----------------------------------
    if (counter>$B0) 
    {
        // NPC doesn't start moving until frame after door fully closed
        if (counter==$B1) hspd = (hspd_PACE*facingDir) &$FF; // set hspd toward(away from?) door
        
        updateX();
        
        
        if!(g.counter1&$F)
        {
            if (isVal(sprite_datakey, STR_Moa,STR_Girubokku))
            {
                if (counter>$C0) counter = 0; // END LEAVING house process
            }
            else
            {
                var _y = GROUND_Y-hh;
                if (yt<_y)
                {
                    set_xlyt(id, xl, min(yt+4, _y)); // Step down 1 step
                    if (yt>=_y) counter = 0; // END LEAVING house process
                }
            }
        }
    }
    
    
    
    // Start drawing the frame after door is fully open.
    if (counter>$90 
    ||  counter==0 )
    {   update_EF11();  }
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// PACING IN FRONT OF HOUSE ----------------------------------------
if (counter==0)
{
    // 9851
    var _DIFF = x - DOOR_XC;
    var _C1  = abs( _DIFF) >= $28;
        _C1 &= sign(_DIFF) == facingDir; // if facing away from door
    
    if (_C1 
    && !timer_a1 )
    {   timer_a1 = $40;  } // Stand still duration
    
    
    if (timer_a1) hspd = 0;
    else          hspd = (hspd_PACE*facingDir) &$FF; // set hspd toward door
    
    if (timer_a1) // Stand still, waiting to turn around.
    {
            timer_a1--;
        if(!timer_a1) facingDir = sign_(DOOR_XC-x); // face door
    }
    
    updateX();
    update_EF11();
    NPC_update_2(); // collision, enter restore house, start dlg
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




