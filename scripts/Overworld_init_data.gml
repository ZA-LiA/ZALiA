/// Overworld_init_data()

show_debug_message("Overworld_init_data()");


switch(OVERWORLD_INIT_METHOD)
{   // ----------------------------------------------------------------------------------
    case 1:{ // Code automation will not happen in Overworld_init_data_1() if OVERWORLD_INIT_METHOD==1
    Overworld_init_data_1();
    break;}//case 1
    
    
    // ----------------------------------------------------------------------------------
    case 2:{
    if (false)
    {   // This will print the code for Overworld_init_data_2(). Run it whenever a change is made to the overworld.
        Overworld_init_data_1();
    }
    else
    {   // Paste the code printed from Overworld_init_data_1() in Overworld_init_data_2()
        Overworld_init_data_2();
        if (g.anarkhyaOverworld_MAIN) Overworld_init_data_anarkhya();
    }
    break;}//case 2
}//switch(OVERWORLD_INIT_METHOD)




