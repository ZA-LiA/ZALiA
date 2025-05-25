/// qual_fall_scene()


return (is_exiting_rm() && g.FallScene_timer==g.FallScene_INACTIVE && get_fall_scene_type() && (is_undefined(g.pc.colliding_elevator) || !instance_exists(g.pc.colliding_elevator))) 
    || (is_exiting_ow() && g.FallScene_timer==g.FallScene_INACTIVE && get_fall_scene_type() &&  is_undefined(global.OVERWORLD.enc_reen));
//




