/// Barrier_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i,_j,_k, _x,_y, _dir, _pi;
var _count1,_count2;
var _IDX = (g.counter1>>2)&$3;


// BARRIER  -------------------------------------------------------------
var _c1=false;
var _x1;
//var _Y_OFF = (g.timer0>>Anim_TIMING1)&$7;
var _Y  = spawn_y;
    //_Y += -((!!_DIR)<<3);
    //_Y += _Y_OFF*_DIR;
var _rows=0;
_pi = get_pi(p.dg_PI_SEQ[#dg_PI_SEQ_IDX,_IDX], _IDX==2);
pal_swap_set(p.palette_image, _pi);

for(_i=0; _i<BARRIER_COUNT; _i++) // each barrier/crystal
{
    if(!dg_barrier[#_i+1,3])    continue; // barrier can draw
    if (dg_barrier[#_i+1,0]==3) continue; // if state is Raise Completed
        dg_barrier[#_i+1,3] = false;
    //
    _c1 = Anim_VER && dg_barrier[#_i+1,0]<2;
    _x1 = spawn_x + ((BARRIER_W+BARRIER_PAD) * _i);
    
    _rows  = dg_barrier[#_i+1,2];
    _rows += _c1;
    for(_j=_rows-1; _j>=0; _j--) // each row
    {
        for(_k=(BARRIER_W>>3)-1;  _k>=0; _k--) // BARRIER_W = $02<<3
        {
            _x  = _x1;
            _x += _k<<3;
            if (Anim_VER)
            {
                //_x -= (_k&$1); // micro adj. Barrier 1 thinner
                //_x -= !(_k&$1); // micro adj. Barrier 1 wider
            }
            
            _y  = _Y+(_j<<3);
            if (_c1)
            {
                if (Anim_VER==2) _dir=sign_(_k&$1);
                else             _dir=-1;
                _y += -((_dir==1)<<3);
                _y += Anim_yoff*_dir;
            }
            draw_sprite_(dl_sprites[|_j&1],0, _x,_y, -1, xScale,yScale);
        }
    }
}
pal_swap_reset();




var _Y1 = spawn_y-8;
var _Y2 = _Y1 + ((ROWS_DEF+$02)<<3);
_pi = PI_BGR_2;
for(_i=0; _i<BARRIER_COUNT; _i++) // each barrier
{
    _x  = spawn_x + ((BARRIER_W+BARRIER_PAD) * _i);
    _x += 8;
    draw_sprite_(g.Block2_SPR1,0, _x,_Y1, _pi);
    draw_sprite_(g.Block2_SPR1,0, _x,_Y2, _pi);
}


// CRYSTALS  -----------------------------------------------------------
_Y = spawn_y-8;
var _spr = CRYSTAL_SPR_1B;
for(_i=0; _i<BARRIER_COUNT; _i++) // each barrier/crystal
{
    if (dg_barrier[#_i+1,0]     // if crystal state > 0
    &&  f.crystals & ($1<<_i) ) // if crystal has been placed in its palace.
    {    _spr  = CRYSTAL_SPR_1A;  }
    else _spr  = CRYSTAL_SPR_1B;
    
    if ( _spr == CRYSTAL_SPR_1A)
    {    _pi  = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];  } // changes color every 2 frames
    else _pi  = PI_GUI_1;
    
    _x  = spawn_x + ((BARRIER_W+BARRIER_PAD) * _i);
    _x += 8; // horizontal center of this barrier
    _y  = _Y;
    draw_sprite_(_spr,0, _x,_y, _pi);
}




