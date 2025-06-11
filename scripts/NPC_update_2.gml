/// NPC_update_2()

// collision, start dlg, enter restore house


if (g.DevTools_state) update_body_hb_1a(); // So that bodyhb still draws even if it doesn't make it to the collision check.



// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
if(!Input.Attack_pressed 
&& !Input.Up_held )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if (is_talking)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
/*
if (g.gui_state 
||  is_talking )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/

if (g.pc.state!=g.pc.state_NORMAL  // MOD
||  g.pc.HoldItem_timer            // MOD
||  g.EnterRoom_control_timer )    // MOD
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// 99B9
GOB_body_collide_pc_body_1a();

if!(cs&CS_BD1)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// ----------------------------------------------------------
// RESTORE HOUSE DIALOGUE -----------------------
if (object_index==NPC_4  // 4: Healer, Saver
&&  pc_can_enter )       // NPC waiting in house for UP held
{
    if (Input.Up_held 
    &&  g.gui_state==g.gui_state_NONE 
    && !g.pc.ogr 
    &&  pointInRect(g.pc.cp1X,g.pc.cp1Y, DoorHB_XL,DoorHB_YT, DOOR_W,DOOR_H) )
    {   // 99D4. Start dialogue
        g.gui_state       = g.gui_state_DIALOGUE2;
        g.dialogue_source = id;
        
        g.pc.in_restore_house = true;
        g.pc_lock             = PC_LOCK_ALL; // Lock all
        
        is_talking   = true; // 05C3[eIndex]++;
        pc_can_enter = false;
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ----------------------------------------------------------
// STANDARD DIALOGUE ---------------------------
if (Input.Attack_pressed 
&&  counter==0 ) // Is pacing/waiting for input
{
    var _qualifies = false;
    
    if (object_index==NPC_4   // 4: healer, saver
    ||  object_index==NPC_5 ) // 5: quest
    {
        if(!g.pc.ogr              // PC on ground
        &&  abs(x-DOOR_XC)>=$14 ) // spr at least 4 away from door
        {
            _qualifies = true;
        }
    }
    else if (is_ver(id,NPC_9,4) // Ache NPC
         ||  is_ver(id,NPC_8,1) // Fairy NPC
         ||  sprite_datakey==STR_Ache )
    {
        _qualifies = true;
    }
    else // For anyone else, PC must be on ground
    {
        _qualifies = !g.pc.ogr; // !g.pc.ogr: PC on ground
    }
    
    
    
    if (_qualifies 
    &&  g.gui_state!=g.gui_state_NONE )
    {
        _qualifies = false;
        
        // Give a chance for higher priority NPC to 
        // interupt a dialogue that was started this frame.
        if (g.gui_state==g.gui_state_DIALOGUE1 
        &&  g.dialogue_started_this_frame 
        &&  g.dialogue_source )
        {
            if (object_index==NPC_3   // 3: special walker
            ||  object_index==NPC_4   // 4: healer, saver
            ||  object_index==NPC_5 ) // 5: quest
            {
                if (g.dialogue_source.object_index==NPC_2   // 2: traffic
                ||  g.dialogue_source.object_index==NPC_3 ) // 3: special walker
                {
                    if (g.dialogue_source.object_index==NPC_2  // 2: traffic
                    ||  object_index==NPC_4   // 4: healer, saver
                    ||  object_index==NPC_5 ) // 5: quest
                    {
                        g.dialogue_source.is_talking = false;
                        g.dialogue_source.talked_to_count--;
                        _qualifies = true;
                    }
                }
            }
        }
    }
    
    if (_qualifies)
    {   // 99D4. Start dialogue.
        NPC_activate_dialogue();
    }
}




