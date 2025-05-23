/// qual_fall_scene()


return (is_exiting_rm() && g.FallScene_timer==g.FallScene_INACTIVE && get_fall_scene_type() && (is_undefined(g.pc.colliding_elevator) || !instance_exists(g.pc.colliding_elevator))) 
    || (is_exiting_ow() && g.FallScene_timer==g.FallScene_INACTIVE && get_fall_scene_type() &&  is_undefined(global.OVERWORLD.enc_reen));
//return (is_exiting_rm() && g.fall_scene_tmr==g.FALL_SCENE_INACTIVE && get_fs_type() && !g.pc.colliding_elevator) 
//    || (is_exiting_ow() && g.fall_scene_tmr==g.FALL_SCENE_INACTIVE && get_fs_type() && is_undefined(g.ow.enc_reen));
//
//return (g.fall_scene_tmr==g.FALL_SCENE_INACTIVE && is_exiting_rm() && get_fs_type() && !g.pc.colliding_elevator) 
//    || (g.fall_scene_tmr==g.FALL_SCENE_INACTIVE && is_exiting_ow() && get_fs_type());
//



