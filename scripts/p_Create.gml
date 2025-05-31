/// p_Create()

if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("p_Create() START");
}


//Initilize System and add palettes
//This should be done before any drawing takes place 
//in a managing object that will persist through the entire game.
//Notice I've set it to persistent.  

//First Init the System, specify the name of the pal swap shader in 
// case you've changed it for some reason.
if (global.use_pal_swap) pal_swap_init_system(shd_pal_swapper);

p_init();




if (DEV)
{
    show_debug_message("p_Create() END. "+string(current_time-_START_TIME));
    repeat(1) show_debug_message("");
}




