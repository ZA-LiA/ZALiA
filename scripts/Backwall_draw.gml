/// Backwall_draw()


var _i, _val, _count;
var _x,_y;


switch(ver)
{
    // --------------------------------------------------------
    case 1:{
    var _DIR=1;
    var _X  = viewXL();
    if (_DIR) _X -= 8;
    _X += ((g.counter0>>3)&$7)*_DIR;
    _y=y;
    _count  = viewW()>>3;
    _count += sign(abs(_DIR));
    pal_swap_set(p.palette_image, palidx);
    for(_i=_count-1; _i>=0; _i--)
    {
        _x=_X+(_i<<3);
        draw_background_part(ts_Natural_1a_WRB, $0<<3,$F<<3, 8,8, _x,_y);
        draw_background_part(ts_Natural_1a_WRB, $8<<3,$F<<3, 8,8, _x,_y+8);
    }
    pal_swap_reset();
    
    _x  = _X;
    _y  = y;
    _y += $2<<3;
    draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _count<<3,(viewYB()+8)-_y, get_pal_color(palidx,2));
    //draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _count<<3,(viewYB()+8)-_y, p.C_RED0);
    break;}//case 1
    
    
    
    
    
    // --------------------------------------------------------
    case 2:{
    
    break;}//case 2
}//switch(ver)




