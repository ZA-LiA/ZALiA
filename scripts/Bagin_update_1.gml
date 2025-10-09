/// Bagin_update_1()


if (state!=state_NORMAL 
&& !hp )
{
    with(GameObject_create(spawn_xl,spawn_yt, object_index,ver, dk_spawn))
    {
        set_xlyt(id, xl,other.y_dive);
        GO_depth_init(other.depth_def); // just in case this spawn has a unique depth
        //hp=1;
        
        sub_state = ST_SUB1_RESF;
        timer = other.timer + $FF; // resurface delay
    }
}




