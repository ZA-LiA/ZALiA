/// NPC_catch_item()


      Item_SPAWN_DATAKEY   = undefined;
      Item_OBJ             = noone;
      Item_VER             =  1;
      //Item_CONTAINER_ID    = -1;
      //Item_PBAG_NUM        = -1;
      Item_ITEM_ID         = undefined;
with( Item){
if(!state) break;
other.Item_SPAWN_DATAKEY   = dk_spawn;
other.Item_OBJ             = object_index;
other.Item_VER             = ver;
//other.Item_CONTAINER_ID    = cont_id;
//other.Item_PBAG_NUM        = pbag_num;
other.Item_ITEM_ID         = ITEM_ID;
state = 0; // NPC will spawn after dialogue.
break; // just in case more than one item spawns in the room
}

//if (Item_OBJ) show_debug_message(object_get_name(object_index)+" caught "+object_get_name(Item_OBJ)+"!");




