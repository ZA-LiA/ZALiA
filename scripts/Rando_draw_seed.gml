/// Rando_draw_seed(base x, base y, seed, *sprite padding)


var _i, _idx, _x,_y;

                     _i=0;
var _X    = argument[_i++];
var _Y    = argument[_i++];
var _SEED = argument[_i++];

var                    _PAD = $04;
if (argument_count>_i) _PAD = argument[_i++];

pal_swap_set(global.palette_image, global.PI_MOB_ORG);
for(_i=g.RandoSeedChar_COUNT-1; _i>=0; _i--)
//for(_i=0; _i<RandoSeedChar_COUNT; _i++)
{
    _x   = $08+_PAD;
    _x  *= (g.RandoSeedChar_COUNT-1) - _i;
    //_x  *= _i;
    _x   = _X+_x;
    _y   = _Y;
    _idx = (_SEED>>(_i<<2)) &$F;
    draw_sprite_(g.dl_rando_seed_SPRITES[|_idx],0, _x,_y);
}
pal_swap_reset();




