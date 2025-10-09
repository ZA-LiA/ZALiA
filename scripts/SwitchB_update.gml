/// SwitchB_update()


if (complete) pressed = true;


update_EF11();


if (complete) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ------------------------------------------------------------------
update_body_hb_2a();

// *** yt is 8 ABOVE the ground.


if (global.dg_solid[# xl>>3,    yt>>3]&$FF == TID_SOLID1  // if solid tile on top
||  global.dg_solid[#(xl>>3)+1, yt>>3]&$FF == TID_SOLID1  // if solid tile on top
||  collide_solid_inst(x,y-1) 
//|| (global.pc.cs&CS_BTM && pointInRect(global.pc.x,global.pc.y+global.pc.hh_, xx+2,GROUND_Y,$C,3)) ) // if PC on top
|| (global.pc.cs&CS_BTM && pointInRect(global.pc.cp1X,global.pc.cp1Y, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h)) ) // if PC on top
{
    if(!pressed)
    {
        pressed_count++;
        aud_play_sound(snd_press);
    }
    
    pressed = true;
}
else
{
    if (pressed)
    {
        aud_play_sound(snd_press);
    }
    
    pressed = false;
}




