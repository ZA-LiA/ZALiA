/// FileSelect_RandoStateOTHER_update()


var _InputConfirm_pressed2 = InputConfirm_pressed || Input.pressedH;



var _val;


// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
/*
if (InputBack_pressed 
||  (RandoOTHER_MAIN_cursor==RandoOTHER_MAIN_cursor_BACK && InputConfirm_pressed) )
{
    aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
    RandoState = RandoState_MAIN;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/


switch(RandoOTHER_state){
case   RandoOTHER_state_MAIN:   {FileSelect_RandoOTHER_MAIN_update(); break;}//case RandoOTHER_state_MAIN:
case   RandoOTHER_state_ITEMS:  {FileSelect_RandoOTHER_ITEMS_update(); break;}//case RandoOTHER_state_ITEMS:
case   RandoOTHER_state_SPELLS: {FileSelect_RandoOTHER_SPELLS_update(); break;}//case RandoOTHER_state_SPELLS:
case   RandoOTHER_state_SKILLS: {FileSelect_RandoOTHER_SKILLS_update(); break;}//case RandoOTHER_state_SKILLS:
case   RandoOTHER_state_REQUIRE:{FileSelect_RandoOTHER_REQUIRE_update(); break;}//case RandoOTHER_state_REQUIRE:
}//switch(RandoOTHER_state)




