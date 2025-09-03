/// Rando_can_traverse_RauruPass()


switch(global.Rando_RauruPass_VER)
{
    case 1:{
    if (Rando_is_attainable(STR_HAMMER))
    {
        return true;
    }
    break;}
    
    case 2:{
    if (Rando_is_attainable(STR_FLUTE))
    {
        return true;
    }
    break;}
    
    case 3:{
    if (Rando_is_attainable(STR_GLOVE,STR_BRACELET))
    {
        return true;
    }
    break;}
}


return false;




