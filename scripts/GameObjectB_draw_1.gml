/// GameObjectB_draw_1()


// Explosion & Rising XP
GOB_draw_death_explosions();
GOB_draw_rising_xp();


//  -----------------------------------------------------------
//  Debug draw
if (state)
{
    GameObjectB_debug_draw_1a(); // 'N' & 'M'. body, shield, sword, cs
    GameObjectB_debug_draw_2a(); // 'B' & 'V'. eID & HP
}




