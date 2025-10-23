/// NPC_init1()


init_vars_go_A();
init_vars_NPC();

if (is_ancestor_(object_index,NPC_0)) can_draw_self_exception = true;

DRAW_YOFF = 1; // +1 for 1 pixel in ground

GO_depth_init(DEPTH_NPC);

scr_step = GameObjectB_step;




