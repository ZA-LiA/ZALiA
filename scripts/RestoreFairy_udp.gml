/// RestoreFairy_udp()


// F0DD
//if !(ocs&$8)
can_draw_self = true;

// yoff for hover.  _data = "0102030403020100", 1,2,3,4,3,2,1,0
var _val = (g.counter1&$38)>>3; // leaves bits $7
if!(_val&$4) draw_yoff  = (_val&$3) +  1; // 1, 2, 3, 4
else         draw_yoff  = (_val&$3) ^ $3; // 3, 2, 1, 0
             draw_yoff += 8;
//
             draw_xoff  = 0;
//
GO_set_sprite(id,dl_sprites[|sign(g.counter1&$4)]);

facing_dir = 1;




