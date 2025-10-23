/// TorchA_init1()


GameObjectB_init();
can_draw_self_exception = true;

GO_sprite_init(spr_Torch_1a);

FIRE_SPR    = spr_Flame1;
FIRE_PI     = global.PI_MOB_ORG;
FIRE_YOFF   = -(hh_ + (sprite_get_height(FIRE_SPR)>>1));
FIRE_YOFF--;
fire_xscale = 1;


is_lit      = false;
brightness  = 0;


FireSound_DUR = $14;
FireSound_tmr = 0;




