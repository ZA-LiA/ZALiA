/// Eyenocc_udp()


can_draw_self = true;


xScale = 1;

//if (Jiggle_timer)



switch(Eye_state){
default:                   {GO_set_sprite(id,sprite_OPEN_FULL); break;}
case   Eye_state_OPEN_HALF:{GO_set_sprite(id,sprite_OPEN_HALF); break;}
case   Eye_state_CLOSED:   {GO_set_sprite(id,sprite_CLOSED);    break;}
}//switch(Eye_state)

Pupil_can_draw=false;
switch(sprite)
{
    case sprite_OPEN_FULL:{
    Pupil_can_draw=true;
    Pupil_xl=drawX-1;
    Pupil_yt=drawY-1;
    Pupil_h=2;
    break;}//case sprite_OPEN_FULL
    
    
    case sprite_OPEN_HALF:{
    Pupil_can_draw=true;
    Pupil_xl=drawX-1;
    Pupil_yt=drawY-0;
    Pupil_h=1;
         if (global.pc.x<x-8) Pupil_xl--;
    else if (global.pc.x>x+7) Pupil_xl++;
    break;}//case sprite_OPEN_HALF
}//switch(sprite)




