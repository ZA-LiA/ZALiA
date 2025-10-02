/// RebonackA_udp()


can_draw_self = phase==1 || phase==2; // 3 is off screen, 4 is reboB dead


// var _data = "00"+"FE"+"FC"+"FA" + "F8" + "FA"+"FC"+"FE" 
//           + "00"+"02"+"04"+"06" + "08" + "06"+"04"+"02"; // B398-B3A7
// var _data = "00FEFCFAF8FAFCFE" + "0002040608060402"; // B398-B3A7

// B3A8. sprite (Horse front: spr_Rebonack_1a)
var                             _idx  = Turn_timer>>2;
if(!facing_dir)                  _idx += 8;
Front_xoff  = str_hex(XOFF_DATA,_idx);
Front_xoff -= ((Front_xoff&$80)<<1);

// B3DC. Back_sprite & Rider_sprite
                               _idx  = Turn_timer>>2;
if (facing_dir)                 _idx += 8;
Back_xoff  = str_hex(XOFF_DATA,_idx);
Back_xoff -= ((Back_xoff&$80)<<1);
// -----------------------------------------------------



if (behavior) Back_sprite = Back_SPRITE2;
else          Back_sprite = Back_SPRITE1;

if (behavior) Rider_sprite = 0;
else          Rider_sprite = Rider_SPRITE;

// B418
Rider_yoff = (g.counter1&$10)>>4;
// -----------------------------------------------------


                                      _idx  = Turn_timer>>2;
if(!facing_dir)                        _idx += 8;
    SwordHB_xoff  = str_hex(XOFF_DATA,_idx);
    SwordHB_xoff -= (SwordHB_xoff&$80)<<1;
if (facing_dir)
{   SwordHB_xoff += 15;  }
    SwordHB_xoff += g.HB_ADJ_X;
//
SwordHB_yoff = 16 + 9 + g.HB_ADJ_Y;





// -----------------------------------------------------
/*
var _str, _spaces;
_str = "";
_spaces = "    ";

if (Turn_timer 
&&  byte(g.pc.xl) < $80 ) // go to left half of mp to output
{
    if (Turn_timer == $1F) 
    {
        show_debug_message("");
        show_debug_message("");
        show_debug_message("");
    }
    
    _str += "facing_dir ";
    if (facing_dir) _str += " 1";
    else           _str += "-1";
    _str += ", ";
    _str += "Turn_timer: $" + hex_str(Turn_timer) + ".  ";
    
    
                    _idx = Turn_timer >> 2;
    if (!facing_dir) _idx += 8;
    
    _str += "Front_xoff: ";
    _str += string_copy(_spaces, 1, string_length(_spaces) - string_length(string(Front_xoff)));
    _str += string(Front_xoff);
    _str += " - $";
    _str += hex_str(str_hex(_data, _idx));
    _str += ",  ";
    
    
    
    
                    _idx = Turn_timer >> 2;
    if ( facing_dir) _idx += 8;
    
    _str += "Back_xoff: ";
    _str += string_copy(_spaces, 1, string_length(_spaces) - string_length(string(Back_xoff)));
    _str += string(Back_xoff);
    _str += " - $";
    _str += hex_str(str_hex(_data, _idx));
    _str += ",  ";
    
    show_debug_message(_str);
    
    
    
    if (Turn_timer == $10) 
    {
        show_debug_message("");
    }
    
    if (Turn_timer == $01) 
    {
        show_debug_message("");
        show_debug_message("");
        show_debug_message("");
    }
}
*/




