/// NextLifeScreen_Step()


// Triggers update_change_room() to change the room
with(g)
{
    if (counter1!=other.ROOM_CHANGE_CUE)
    {
        break;//with(g)
    }
    
    
    ChangeRoom_timer = ChangeRoom_ENTER_DURATION1;
    ChangeRoom_timer++; // because this frame will decrement 1
    update_change_room_1a();
}




