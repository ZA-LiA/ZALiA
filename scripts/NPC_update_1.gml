/// NPC_update_1()


if (is_talking)
{
    if (g.dialogue_source!=id)
    {
        is_talking = false;
    }
    else
    {   // 9AA0
        facing_dir   = dir_to_pc(id);
        global.pc.xScale = -facing_dir;
        update_EF11();
        return true;
    }
}


return false;




