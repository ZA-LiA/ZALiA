/// init_vars_draw_1a()


can_draw_self = false;
// `can_draw_self` is set false every frame and must be refreshed every frame by its object.
// Setting `can_draw_self_exception` = true means the instance's `can_draw_self` will not be set false every frame.
can_draw_self_exception = false;


GO_depth_init(DEPTH_BASE); // sets depth & depth_def

DRAW_XOFF = 0; // default draw XOff
DRAW_YOFF = 0; // default draw YOff. 
draw_xoff = 0;
draw_yoff = 0;
drawX     = 0;
drawY     = 0;
xScale    = 1; // pc: 009F
yScale    = 1;
//image_xscale = xScale; // pc: 009F

pal_flash_time = 0;

palidx_def    = global.PI_MOB_ORG;
palidx_base   = palidx_def;
palidx_permut = 0; // permutation (0-5)
palidx        = palidx_def;
GO_init_palidx( palidx_def); // PI_MOB1: orange


// *** These are set in GO_sprite_init()
sprite_index_xoff = 0; // sprite_index xoffset
sprite_index_yoff = 0; // sprite_index yoffset

/* sprite: Contains the sprite that gets drawn
   with GameObject, sprite_index is used as a 
   placement so xl, yt, ogX, ogY are acurate.  */
sprite = 0;
dl_sprites = ds_list_create();
GO_sprite_init(spr_Placement_16x16);




