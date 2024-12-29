/// NPC_draw_door()


if(!state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if (object_index!=NPC_4   // Healer, Saver
&&  object_index!=NPC_5 ) // Quest
{
           exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (door_draw_state!=door_draw_state_CLOSE)
{
    var _xl = door_draw_x - (DOOR_W>>1);
    var _yt = door_draw_y - (DOOR_H>>1);
    
    var                 _PI = DOOR_PI;
    if (DOOR_PI_PERMUT) _PI = get_pi(DOOR_PI, DOOR_PI_PERMUT);
    
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, DOOR_W,DOOR_H, get_pal_color(_PI,3));
    
    
    if (door_draw_state==door_draw_state_OPEN1) //  half open
    {
        pal_swap_set(p.palette_image, _PI);
        draw_sprite_part(g.TownDoor1_SPR,0, 0,0, DOOR_W>>1,DOOR_H, _xl+8,_yt);
        pal_swap_reset();
    }
}


if (g.DevTools_state 
&&  g.can_draw_hb 
&&  DoorHB_can_draw )
{
    draw_rect_(p.C_ORG2, DoorHB_XL,DoorHB_YT, DOOR_W,DOOR_H, .7);
}




