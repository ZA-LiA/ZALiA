/// Overworld_init_data()

show_debug_message("Overworld_init_data()");


if (OVERWORLD_INIT_METHOD==1)
{
    // Code automation will not happen in Overworld_init_data_1() if OVERWORLD_INIT_METHOD==1
    Overworld_init_data_1();
}
else
{
    var _REINITIALIZING = false; // *** SET true WHEN ANY OF THIS DATA HAS CHANGED ***
    if (_REINITIALIZING)
    {   // This will print the code for Overworld_init_data_2(). Run it whenever a change is made to the overworld.
        Overworld_init_data_1();
    }
    else
    {   // Paste the code printed from Overworld_init_data_1() in Overworld_init_data_2()
        Overworld_init_data_2();
        if (g.anarkhyaOverworld_MAIN) Overworld_init_data_anarkhya();
    }
}




