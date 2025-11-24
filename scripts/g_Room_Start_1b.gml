/// g_Room_Start_1b(object)


var _OBJECT = argument[0];


if (_OBJECT 
&& !is_ancestor_(_OBJECT,Item,Torch) )
{
    if (is_ancestor_(_OBJECT,Spawner_Boggnipp,SpDrA,Spawner_FallingBlock,SpawnerStab) 
    ||  is_ancestor_(_OBJECT,ElevA,LoDoA,ReFaA,BlckB,SpikeTrap,Switch,PushA,Blooby,Eyenocc,SmasherTrap) 
    ||  is_ancestor_(_OBJECT,Bagin01,Balshot01,Boggnipp01,MagnA,Snaraa,) )
    {
        return true;
    }
}


return false;




