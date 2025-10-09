/// Magnot_udp()


can_draw_self = true;


spikes_spr = SPR_SPIKES_A;



if (point_distance(x,y,global.pc.x,global.pc.y) <= $C0)
//if (point_distance(x,y,global.pc.x,global.pc.y) <= $80)
//if (point_distance(x,y,global.pc.x,global.pc.y) <= $68)
{
    // 8 diff dir pupil can point.
    // a circle w/ 8 equal sections gives each section's angle 45* (360/8)
    // 0*, 45*, 90*, 135*, 180*, 225*, 270*, 315*
    var    _val  = point_direction(x,y, global.pc.x,global.pc.y);
           _val += 22.5; // offset by 1/16th. 45/2 = 22.5 = 360/16
           _val  = _val mod 360; // in case adding offset went past 359
           _val  = _val div 45;   // Determine the section index(0-7) of the angle
    switch(_val){
    case 0:{pupil_xoff= 1; pupil_yoff= 0; break;} // RT   .   0 -  44
    case 1:{pupil_xoff= 1; pupil_yoff=-1; break;} // RT UP.  45 -  89
    case 2:{pupil_xoff= 0; pupil_yoff=-1; break;} // UP   .  90 - 134
    case 3:{pupil_xoff=-1; pupil_yoff=-1; break;} // UP LF. 135 - 179
    case 4:{pupil_xoff=-1; pupil_yoff= 0; break;} // LF   . 180 - 224
    case 5:{pupil_xoff=-1; pupil_yoff= 1; break;} // DW LF. 225 - 269
    case 6:{pupil_xoff= 0; pupil_yoff= 1; break;} // DW   . 270 - 314
    case 7:{pupil_xoff= 1; pupil_yoff= 1; break;} // DW RT. 315 - 359
    }
}
else        pupil_xoff= 0; pupil_yoff= 0;





