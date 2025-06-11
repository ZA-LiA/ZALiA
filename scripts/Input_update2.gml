/// Input_update2()


// C132
heldPrev = held; // store what was held previous frame

// Button checks. Right, Left, Down, Up, Start, Select, B, A
Input_update2a();

// held, heldV, heldH, heldHV, heldS, heldB, heldSB
Input_update2b();

// pressed, pressedV, pressedH, pressedHV, pressedS, pressedB, pressedSB
Input_update2c();

// released, releasedV, releasedH, releasedHV, releasedS, releasedB, releasedSB
Input_update2d();


if (pressedHV 
&& !heldHV_first )
{
    if (pressedHV&$3) heldHV_first = pressedHV&$3; // right/left
    else              heldHV_first = pressedHV&$C; // down/up
}
else if(!heldHV)      heldHV_first = 0;


// held_0 is set to held in PC_spawn()
if (g.ChangeRoom_timer>0) held_0 = 0;
else if (held_0)          held_0 = held;




if (g.room_type=="C" 
&&  g.ChangeRoom_timer<=0 
&&  g.gui_state==g.gui_state_NONE )
{
    if (Pause_pressed)
    //if (Pause_held     // Start button is being held
    //&& !(heldPrev&S) ) // Start button was NOT held last frame
    {
        g.overworld_paused = !g.overworld_paused;
        if (g.overworld_paused) aud_play_sound(global.OVERWORLD.Pause_SOUND1);
        else                    aud_play_sound(global.OVERWORLD.Pause_SOUND2);
    }
}
else
{
    g.overworld_paused = false;
}




