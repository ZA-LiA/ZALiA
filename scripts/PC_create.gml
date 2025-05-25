/// PC_create(object_index, x, y)

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("PC_create() START");
}




with(instance_create(argument1, argument2, argument0))
{
    g.pc = id;
    PC_init();
}




if (DEV)
{
    sdm("PC_create() END. "+string(current_time-_START_TIME));
    sdm("");
}




