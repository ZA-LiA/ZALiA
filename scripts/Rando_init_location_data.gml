/// Rando_init_location_data()


var _i,_j, _a, _val, _count;
var _num,_num1,_num2;
var _rm_name, _datakey, _data_num, _loc_num;
var _ALLKEY_RATING1=1;
var _ALLKEY_RATING2=2;
var _ALLKEY_RATING3=3;
var _ALLKEY_RATING4=4;
var _ALLKEY_RATING5=5;
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: Kakusu Reward Area; Cave
_loc_num = Rando_add_location(Area_EastA+'4A',$01, LocCatID_SCon01,3, 'PBag: Kakusu Reward Area; Cave', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP CAVE.";
//                                                  //
//                                                  //
//                                                  //
// Kakusu Reward Area; SWORD Location
_loc_num = Rando_add_location(Area_EastA+'48',$01, LocCatID_SCon01,3, 'Kakusu Reward Area; SWORD Location', STR_SWORD,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MIDDLE OF<A LAKE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS ON A<PEDASTAL.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<SWORD.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Nabooru Bay Cave Container Piece location
_loc_num = Rando_add_location(Area_EastA+'12',$01, LocCatID_Nabo01,0, 'Nabooru Bay Cave Container Piece location', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SEASIDE<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<WATERY<CAVE.";
//                                                  //
//                                                  //
//                                                  //
// P5 Sea Container Piece location
_loc_num = Rando_add_location(Area_EastA+'07',$01, LocCatID_Nabo01,0, 'P5 Sea Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS OUT IN<THE OCEAN.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS<SURROUNDED<BY WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Secret desert tile S of P5
_loc_num = Rando_add_location(Area_EastA+'21',$01, LocCatID_Nabo01,0, 'PBag: Secret desert tile S of P5', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<THE SEA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<LEEVERS<DANCE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Forest tile W of Nabooru
_loc_num = Rando_add_location(Area_EastA+'26',$01, LocCatID_Nabo01,0, 'PBag: Forest tile W of Nabooru', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<NABOORU<FIELD.";
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS WEST OF<NABOORU.";
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEAR<NABOORU.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Cave S of Nabooru
_loc_num = Rando_add_location(Area_EastA+'0A',$01, LocCatID_Nabo01,0, 'PBag: Cave S of Nabooru', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<DARK CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<NABOORU<FIELD.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<A RIVER<MONSTER.";
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEAR<NABOORU.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Nabooru quest cave system 2 (above last big vertical drop)
_loc_num = Rando_add_location(Area_EastA+'53',$01, LocCatID_Nabo01,1, 'PBag: Nabooru quest cave system 2 (above last big vertical drop)', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN AN<OLD WELL.";
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS UNDER<NABOORU.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Nabooru quest cave system 1 (right of well bottom)
_loc_num = Rando_add_location(Area_EastA+'5C',$01, LocCatID_Nabo01,0, 'PBag: Nabooru quest cave system 1 (right of well bottom)', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN AN<OLD WELL.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS AT THE<BOTTOM OF<A WELL.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: Sea cave N of Darunia
_loc_num = Rando_add_location(Area_EastA+'11',$01, LocCatID_Daru01,0, 'PBag: Sea cave N of Darunia', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SEASIDE<CAVE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Secret field tile E Darunia Field
_loc_num = Rando_add_location(Area_EastA+'1C',$01, LocCatID_Daru01,0, 'PBag: Secret field tile E Darunia Field', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<FIELD.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<MOUNTAIN<SIDE FIELD";
//                                                  //
//                                                  //
//                                                  //
// PBag: Nabooru Bay secret just S of Maze Isl Bridge
_loc_num = Rando_add_location(Area_EastA+'3A',$01, LocCatID_Daru01,0, 'PBag: Nabooru Bay secret just S of Maze Isl Bridge', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS ON A<SANDY<SHORE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR A<BROKEN<BRIDGE.";
//                                                  //
//                                                  //
// Pendant Isl Container Piece location
_loc_num = Rando_add_location(Area_EastA+'6B',$01, LocCatID_Daru01,0, 'Pendant Isl Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS A<SECRET TO<EVERYBODY.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS HIDDEN<IN A<FOREST.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HOUSE IN<THE WOODS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
//                                                  //
//                                                  //
//                                                  //
// Carock 2 location (PENDANT)
_loc_num = Rando_add_location(Area_EastA+'51',$01, LocCatID_Daru01,2, 'Carock 2 location (PENDANT)', STR_PENDANT,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS HELD<BY A DARK<WIZARD.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Shoals above P4
_loc_num = Rando_add_location(Area_MazIs+'0A',$01, LocCatID_Maze01,0, 'Shoals above P4', STR_1UP,$01, true);
//_loc_num = Rando_add_location(Area_MazIs+'40',$01, LocCatID_Maze01,0, 'Shoals above P4', STR_1UP,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS<SURROUNDED<BY WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEAR A<MAZE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<THE MAZE<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// CHILD location
_loc_num = Rando_add_location(Area_MazIs+'04',$01, LocCatID_Maze01,0, 'CHILD location', STR_CHILD,$01, true);
//_loc_num = Rando_add_location(Area_MazIs+'25',$01, LocCatID_Maze01,0, 'CHILD location', STR_CHILD,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<THE MAZE<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS HIDDEN<IN A MAZE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// Maze Isl Hole Container Piece location
_loc_num = Rando_add_location(Area_MazIs+'03',$01, LocCatID_Maze01,0, 'Maze Isl Hole Container Piece location', STR_MAGIC,$01, true);
//_loc_num = Rando_add_location(Area_MazIs+'24',$01, LocCatID_Maze01,0, 'Maze Isl Hole Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<THE MAZE<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "FALL DOWN<A HOLE FOR<THE<&.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS HIDDEN<IN A MAZE.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: Secret tile in VOD
_loc_num = Rando_add_location(Area_EastA+'3F',$01, LocCatID_VOD01,0, 'PBag: Secret tile in VOD', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES ON<HEATED<ROCK.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<SITS NEXT<TO LAVA.";
//                                                  //
//                                                  //
//                                                  //
// VOD Container Piece location
_loc_num = Rando_add_location(Area_EastA+'1F',$01, LocCatID_VOD01,0, 'VOD Container Piece location', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOT CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES ON<HEATED<ROCK.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<SITS NEXT<TO LAVA.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//if(!INCLUDE_PBAGS) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//                                                  //
//                                                  //
//                                                  //
// ===================================================
// ===================================================
// ===================================================
// ===================================================
//                                                  //
//                                                  //
//                                                  //
// BOTTLE item. North Castle Zelda room
if (INCLUDE_BOTTLE_LOCATION && QUEST_NUM==2) _loc_num = Rando_add_location(Area_WestA+'00',$01, LocCatID_West01,0, 'BOTTLE item. North Castle Zelda room', STR_BOTTLE,$01);
//                                                  //
//                                                  //
// PBag: Roof of North Castle East Exit
//_loc_num = Rando_add_location(Area_WestA+'03',$01, LocCatID_West01,0, 'PBag: Roof of North Castle East Exit', STR_PBAG,$01);
//                                                  //
//                                                  //
// PBag: Cave N of Midoro Swamp
_loc_num = Rando_add_location(Area_WestA+'0D',$01, LocCatID_West02,0, 'PBag: Cave N of Midoro Swamp', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<FIELD CAVE";
//                                                  //
//                                                  //
// Midoro Field Cave Container Piece location
_loc_num = Rando_add_location(Area_WestA+'11',$01, LocCatID_West02,0, 'Midoro Field Cave Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<FIELD CAVE";
//                                                  //
//                                                  //
// PBag: North Castle Lake west exit
_loc_num = Rando_add_location(Area_WestA+'1A',$01, LocCatID_West01,0, 'PBag: North Castle Lake west exit', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEXT TO<A LAKE.";
//                                                  //
//                                                  //
// PBag: Secret tile SW of Royal Cemetery
_loc_num = Rando_add_location(Area_WestA+'1F',$01, LocCatID_West02,0, 'PBag: Secret tile SW of Royal Cemetery', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEAR A<CEMETERY.";
//                                                  //
//                                                  //
// Saria Bay Container Piece location
_loc_num = Rando_add_location(Area_WestA+'20',$01, LocCatID_West02,0, 'Saria Bay Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CROSS A<BRIDGE TO<GET THE<&.";
//                                                  //
//                                                  //
// South Parapa Container Piece location
_loc_num = Rando_add_location(Area_WestA+'26',$01, LocCatID_West01,0, 'South Parapa Container Piece location', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<SOME OLD<RUINS.";
//                                                  //
//                                                  //
// North Castle Field Container Piece location
_loc_num = Rando_add_location(Area_WestA+'29',$01, LocCatID_West01,0, 'North Castle Field Container Piece location', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEXT TO<A LAKE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<SOME OLD<RUINS.";
//                                                  //
//                                                  //
// PBag: Secret tile above North Castle
_loc_num = Rando_add_location(Area_WestA+'29',$02, LocCatID_West01,0, 'PBag: Secret tile above North Castle', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<ROYAL<CASTLE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PLACE OF<ROYALTY.";
//                                                  //
//                                                  //
// PBag: Forest tile S of Tantari Desert
_loc_num = Rando_add_location(Area_WestA+'2B',$01, LocCatID_West01,0, 'PBag: Forest tile S of Tantari Desert', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEXT TO<A TREE<OF BATS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<NORTH<CASTLE.";
//                                                  //
//                                                  //
// Tantari Desert Container Piece location
_loc_num = Rando_add_location(Area_WestA+'2C',$01, LocCatID_West01,0, 'Tantari Desert Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<DESERT.";
//                                                  //
//                                                  //
// North Castle Cave Container Piece location
_loc_num = Rando_add_location(Area_WestA+'2D',$01, LocCatID_West01,0, 'North Castle Cave Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<CAVE NEAR<A LAKE.";
//                                                  //
//                                                  //
// PBag: Forest tile E of Saria
_loc_num = Rando_add_location(Area_WestA+'2E',$01, LocCatID_West02,0, 'PBag: Forest tile E of Saria', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS NEAR<SARIA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR<SARIA<RIVER.";
//                                                  //
//                                                  //
// Moruge Swamp Container Piece location
_loc_num = Rando_add_location(Area_WestA+'33',$01, LocCatID_West02,0, 'Moruge Swamp Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<MORUGE<SWAMP.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS RIGHT<NEXT TO A<BOULDER.";
//                                                  //
//                                                  //
// Midoro Swamp Container Piece location 
_loc_num = Rando_add_location(Area_WestA+'34',$01, LocCatID_West02,0, 'Midoro Swamp Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<MIDORO<SWAMP.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP.";
//                                                  //
//                                                  //
// TROPHY location
_loc_num = Rando_add_location(Area_WestA+'36',$01, LocCatID_West01,0, 'TROPHY location', STR_TROPHY,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<TANTARI<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<CAVE.";
//                                                  //
//                                                  //
// MIRROR location
_loc_num = Rando_add_location(Area_WestA+'37',$01, LocCatID_DMtn01,0, 'MIRROR location', STR_MIRROR,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CEMETERY.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<A HERO<RESTS.";
//                                                  //
//                                                  //
// Royal Cemetery Container Piece location
_loc_num = Rando_add_location(Area_WestA+'38',$01, LocCatID_West02,0, 'Royal Cemetery Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CEMETERY.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PLACE OF<ROYALTY.";
//                                                  //
//                                                  //
// PBag: Upper North Castle Hallway
_loc_num = Rando_add_location(Area_WestA+'3C',$01, LocCatID_West01,0, 'PBag: Upper North Castle Hallway', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS AT<NORTH<CASTLE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PLACE OF<ROYALTY.";
//                                                  //
//                                                  //
// Parapa Desert Shore Container Piece location
_loc_num = Rando_add_location(Area_WestA+'3F',$01, LocCatID_West01,0, 'Parapa Shore Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
// PBag: North Castle vertical climb challenge
_loc_num = Rando_add_location(Area_WestA+'42',$01, LocCatID_West01,0, 'PBag: North Castle vertical climb challenge', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS AT<NORTH<CASTLE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PLACE OF<ROYALTY.";
//                                                  //
//                                                  //
// PBag: Island between Death Mtn and Royal Cemetery
_loc_num = Rando_add_location(Area_WestA+'45',$01, LocCatID_DMtn01,0, 'PBag: Island between Death Mtn and Royal Cemetery', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS ON A<SANDY<ISLAND.";
//                                                  //
//                                                  //
// PBag: Secret tile Midoro Swamp near P2
_loc_num = Rando_add_location(Area_WestA+'47',$01, LocCatID_West02,0, 'PBag: Secret tile Midoro Swamp near P2', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<SWAMPY<RUINS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
// PBag: Cave ruins under North Castle Lake
_loc_num = Rando_add_location(Area_WestA+'48',$01, LocCatID_West01,0, 'PBag: Cave ruins under North Castle Lake', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<CAVE BELOW<A LAKE.";
//                                                  //
//                                                  //
// FLOWER location
_loc_num = Rando_add_location(Area_WestA+'5A',$01, LocCatID_West02,0, 'FLOWER location', STR_FLOWER,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<FLOWERS<GROW.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP CAVE";
//                                                  //
//                                                  //
// Bagu Item location (NOTE)
_loc_num = Rando_add_location(Area_TownA+'5F',$01, LocCatID_West02,0, 'Bagu Item location (NOTE)', STR_NOTE,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
//dm_LOCATIONS[?hex_str(val(dm_LOCATIONS[?STR_Location+STR_Count]))+STR_Datakey] = STR_Bagu+STR_Item;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HOUSE IN<THE WOODS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
//                                                  //
//                                                  //
// Under Kings Tomb location (SHIELD)
_loc_num = Rando_add_location(Area_WestA+'60',$01, LocCatID_West02,2, 'Under Kings Tomb location (SHIELD)', STR_SHIELD,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PLACE OF<ROYALTY.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<WAITS<UNDER A<TOMB.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Death Mtn Maze Container Piece location (MAGIC)
_loc_num = Rando_add_location(Area_DthMt+'09',$01, LocCatID_DMtn01,0, 'Death Mtn Maze Container Piece location (MAGIC)', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<A MAZE OF<CAVES.";
//                                                  //
//                                                  //
//                                                  //
// Death Mtn Maze Container Piece location (HEART)
_loc_num = Rando_add_location(Area_DthMt+'11',$01, LocCatID_DMtn01,0, 'Death Mtn Maze Container Piece location (HEART)', STR_HEART,$01, true);
//_loc_num = Rando_add_location(Area_DthMt+'0D',$01, LocCatID_DMtn01,0, 'Death Mtn Maze Container Piece location (HEART)', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<A MAZE OF<CAVES.";
//                                                  //
//                                                  //
//                                                  //
// Death Mtn Hole Container Piece location
_loc_num = Rando_add_location(Area_DthMt+'1A',$01, LocCatID_DMtn01,0, 'Death Mtn Hole Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS UNDER<A BOULDER.";
//                                                  //
//                                                  //
//                                                  //
// HAMMER location
_loc_num = Rando_add_location(Area_DthMt+'15',$01, LocCatID_DMtn01,0, 'HAMMER location', STR_HAMMER,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
//                                                  //
//                                                  //
//                                                  //
// Death Mtn Shoals Container Piece location
_loc_num = Rando_add_location(Area_DthMt+'24',$01, LocCatID_DMtn01,0, 'Death Mtn Shoals Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
//                                                  //
//                                                  //
//                                                  //
// Death Mtn 1up location
_loc_num = Rando_add_location(Area_DthMt+'22',$01, LocCatID_DMtn01,1, 'Death Mtn 1up location', STR_1UP,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
//                                                  //
//                                                  //
//                                                  //
// Boulder Circle Reward location (RING)
_loc_num = Rando_add_location(Area_DthMt+'30',$01, LocCatID_DMtn01,2, 'Boulder Circle Reward location (RING)', STR_RING,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<DEATH<MOUNTAIN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS UNDER A<CIRCLE OF<BOULDERS.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: West Saria River Waterfall
_loc_num = Rando_add_location(Area_WestA+'4D',$01, LocCatID_Sari01,1, 'PBag: West Saria River Waterfall', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS AT THE<TOP OF A<WATERFALL.";
//                                                  //
//                                                  //
//                                                  //
// MEAT location
_loc_num = Rando_add_location(Area_WestA+'54',$01, LocCatID_Sari01,1, 'MEAT location', STR_MEAT,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MIDDLE OF<A LAKE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES ON A<FALLEN<TREE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Forest above Saria Lake
_loc_num = Rando_add_location(Area_WestA+'55',$01, LocCatID_Sari01,1, 'PBag: Forest above Saria Lake', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<WATERY<FOREST.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: Island N of Tantari Desert
_loc_num = Rando_add_location(Area_WestA+'2F',$01, LocCatID_NIsl01,0, 'PBag: Island N of Tantari Desert', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<THE FAR<NORTH.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEXT TO<A TREE<OF BATS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS ON AN<ISLAND.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Sea Cave N end of Ruto Mtns
_loc_num = Rando_add_location(Area_WestA+'44',$01, LocCatID_NIsl01,0, 'PBag: Sea Cave N end of Ruto Mtns', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SEASIDE<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<WATERY<CAVE.";
//                                                  //
//                                                  //
//                                                  //
// North Isl Container Piece location
_loc_num = Rando_add_location(Area_EastA+'20',$01, LocCatID_NIsl01,0, 'North Isl Container Piece location', STR_HEART,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<THE FAR<NORTH.";
//                                                  //
//                                                  //
//                                                  //
// Whale Isl Item location (BOOK)
_loc_num = Rando_add_location(Area_EastA+'63',$01, LocCatID_NIsl01,1, 'Whale Isl Item location (BOOK)', STR_BOOK,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
//dm_LOCATIONS[?hex_str(val(dm_LOCATIONS[?STR_Location+STR_Count]))+STR_Datakey] = STR_Talo+STR_Item;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES IN<THE FAR<NORTH.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "ANJUS<FRIEND<HOLDS THE<&.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Ruto Mtn Container Piece location
_loc_num = Rando_add_location(Area_WestA+'FF',$01, LocCatID_RMtn01,0, 'Ruto Mtn Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN SOME<MOUNTAIN<RUINS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<RUTO<MOUNTAINS.";
//                                                  //
//                                                  //
//                                                  //
// PBag: N Ruto Mtn Ruins Plaforming Challenge
_loc_num = Rando_add_location(Area_WestA+'F4',$01, LocCatID_RMtn01,1, 'PBag: N Ruto Mtn Ruins Plaforming Challenge', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN SOME<MOUNTAIN<RUINS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<RUTO<MOUNTAINS.";
//                                                  //
//                                                  //
//                                                  //
// PBag: N Ruto Mtn Ruins Rocky Alcove
_loc_num = Rando_add_location(Area_WestA+'FE',$01, LocCatID_RMtn01,1, 'PBag: N Ruto Mtn Ruins Rocky Alcove', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN SOME<MOUNTAIN<RUINS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<RUTO<MOUNTAINS.";
//                                                  //
//                                                  //
//                                                  //
// RescueFairy Location
_loc_num = Rando_add_location(Area_WestA+'FA',$01, LocCatID_RMtn01,1, 'RescueFairy Location', STR_RFAIRY,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN SOME<MOUNTAIN<RUINS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<RUTO<MOUNTAINS.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// River Devil Lake Container Piece location
_loc_num = Rando_add_location(Area_EastA+'16',$01, LocCatID_Kasu01,0, 'River Devil Lake Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS ON A<LAKE NEAR<A SWAMP.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS ON A<LAKE ABOVE<A SWAMP.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Kasuto Swamp cave
_loc_num = Rando_add_location(Area_EastA+'0C',$01, LocCatID_Kasu01,0, 'PBag: Kasuto Swamp cave', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<CAVE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP CAVE";
//                                                  //
//                                                  //
//                                                  //
// PBag: Secret tile Kasuto Swamp
_loc_num = Rando_add_location(Area_EastA+'33',$01, LocCatID_Kasu01,0, 'PBag: Secret tile Kasuto Swamp', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<SWAMP.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Secret forest tile NE of P6
_loc_num = Rando_add_location(Area_EastA+'2C',$01, LocCatID_Kasu01,0, 'PBag: Secret forest tile NE of P6', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN SOME<RUINS IN<A FOREST.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR A<HIDDEN<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// Seashore-Desert Container-Piece location
_loc_num = Rando_add_location(Area_EastA+'34',$01, LocCatID_Kasu01,0, 'Seashore-Desert Container-Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS NEAR A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS CLOSE<TO A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// Kasuto-Lake shoals
//_loc_num = Rando_add_location(Area_EastA+'15',$01, LocCatID_Kasu01,0, 'Kasuto-Lake shoals', STR_1UP,$01, true);
_loc_num = Rando_add_location(Area_EastA+'15',$01, LocCatID_Kasu01,0, 'Kasuto-Lake shoals', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MIDDLE OF<A LAKE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS<SURROUNDED<BY WATER.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: Raft ride in the sea
if (QUEST_NUM==2){
_loc_num = Rando_add_location(Area_EastA+'76',$01, LocCatID_DragMr,2, 'PBag: Raft ride in the sea', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<LIES OVER<A ROUGH<SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS OUT IN<THE OCEAN.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS<SURROUNDED<BY WATER.";
}
//                                                  //
// PBag: Dragmire shoals location
if (QUEST_NUM==2){
_loc_num = Rando_add_location(Area_EastA+'90',$02, LocCatID_DragMr,3, 'PBag: Dragmire shoals location', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS ON THE<DRAGMIRE<SHOALS.";
}
//                                                  //
// MASK location
if (QUEST_NUM==2){
_loc_num = Rando_add_location(Area_EastA+'A8',$01, LocCatID_DragMr,3, 'MASK location', STR_MASK,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH SOME<STATUES<TO GET THE<&.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH<STATUES<AROUND FOR<&.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH SOME<STATUES<FOR THE<&.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH AROUND<STATUES<FOR THE<&.";
}
//                                                  //
// PBag: MASK room, bag 1
if (QUEST_NUM==2){
_loc_num = Rando_add_location(Area_EastA+'A8',$02, LocCatID_DragMr,3, 'PBag: MASK room, bag 1', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH SOME<STATUES<TO GET THE<&.";
}
//                                                  //
// PBag: MASK room, bag 2
if (QUEST_NUM==2){
_loc_num = Rando_add_location(Area_EastA+'A8',$03, LocCatID_DragMr,3, 'PBag: MASK room, bag 2', STR_PBAG,$02);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "PUSH SOME<STATUES<TO GET THE<&.";
}
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// JUMP spell room
_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, 'JUMP spell room', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<MOUNTAIN<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<MAGIC IS<TAUGHT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
/*switch(QUEST_NUM){// 1UP: JUMP spell room
case 1:{_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, '1UP: JUMP spell room',                   STR_1UP, $01); break;}
case 2:{_loc_num = Rando_add_location(Area_TownA+'61',$02, LocCatID_Town01,0, 'PBag: JUMP spell room (2ND QUEST PBAG)', STR_PBAG,$01); break;}
}*/
//_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, '1UP: JUMP spell room', STR_1UP, $01);
// PBag: JUMP spell room
//_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, 'PBag: JUMP spell room', STR_PBAG,$01);
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Target Minigame location
_loc_num = Rando_add_location(Area_TownA+'90',$01, LocCatID_Town01,0, 'Target Minigame location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<RIVER<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<CAN ONLY<BE WON.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: FAIRY spell room
_loc_num = Rando_add_location(Area_TownA+'63',$01, LocCatID_Town01,0, 'PBag: FAIRY spell room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<A HARBOR<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<MAGIC IS<TAUGHT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Nabooru MAP item location
_loc_num = Rando_add_location(Area_TownA+'89',$01, LocCatID_Town01,0, 'Nabooru MAP item location', STR_MAP1,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<CAN ONLY<BE BOUGHT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
// Nabooru Chimney PBag location
_loc_num = Rando_add_location(Area_TownA+'6E',$01, LocCatID_Town01,0, 'PBag: Nabooru Chimney PBag location', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GO DOWN A<CHIMNEY<FOR THE<&.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
// Mido Fairy Container Piece location
_loc_num = Rando_add_location(Area_TownA+'6F',$01, LocCatID_Town01,0, 'Mido Fairy Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDO.";
if(!TownLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<A HARBOR<TOWN.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS GIVEN<TO SAVIORS.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS A<FAIRYS<REWARD.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS A<RESCUERS<REWARD.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
// PBag: FIRE spell room
_loc_num = Rando_add_location(Area_TownA+'65',$01, LocCatID_Town01,1, 'PBag: FIRE spell room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<MAGIC IS<TAUGHT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Darunia Minigame Reward location
_loc_num = Rando_add_location(Area_TownA+'91',$01, LocCatID_Town01,0, 'Darunia Minigame Reward location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<MOUNTAIN<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<CAN ONLY<BE WON.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// BRACELET location
_loc_num = Rando_add_location(Area_TownA+'6A',$01, LocCatID_Town01,0, 'BRACELET location', STR_BRACELET,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<FOREST<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
// PBag: BRACELET room
_loc_num = Rando_add_location(Area_TownA+'6A',$02, LocCatID_Town01,0, 'PBag: BRACELET room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<FOREST<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
// New Kasuto Quest Reward location
_loc_num = Rando_add_location(Area_TownA+'68',$01, LocCatID_Town01,0, 'New Kasuto Quest Reward location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<FOREST<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<BASEMENT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
// New Kasuto MAP item location
_loc_num = Rando_add_location(Area_TownA+'88',$01, LocCatID_Town01,0, 'New Kasuto MAP item location', STR_MAP2,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<FOREST<TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<CAN ONLY<BE BOUGHT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Old Kasuto magic piece location
_loc_num = Rando_add_location(Area_TownA+'5C',$01, LocCatID_Town01,0, 'Old Kasuto magic piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS WHERE<GHOSTS<ROAM.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<HOUSE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<DEAD TOWN.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<TOWN.";
// Old Kasuto Container Piece location
//_loc_num = Rando_add_location(Area_TownA+'5C',$01, LocCatID_Town01,0, 'Old Kasuto Container Piece location', STR_HEART,$01);
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //




















// P1 Container Piece location
_loc_num = Rando_add_location(Area_PalcA+'00',$01, LocCatID_Dngn01,0, 'P1 Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PARAPA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<PARAPA<DESERT.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HORSEHEAD<STOLE THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P1 Item location
_loc_num = Rando_add_location(Area_PalcA+'08',$01, LocCatID_Dngn01,0, 'P1 Item location', STR_CANDLE,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PARAPA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<PARAPA<DESERT.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HORSEHEAD<STOLE THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P1 Key 1
_loc_num = Rando_add_location(Area_PalcA+'01',$01, LocCatID_Dngn01,0, 'P1 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PARAPA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<PARAPA<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HORSEHEAD<STOLE THE<&.";
// P1 Key 2
_loc_num = Rando_add_location(Area_PalcA+'02',$01, LocCatID_Dngn01,0, 'P1 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PARAPA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<PARAPA<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HORSEHEAD<STOLE THE<&.";
// P1 Key 3
_loc_num = Rando_add_location(Area_PalcA+'03',$01, LocCatID_Dngn01,0, 'P1 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PARAPA<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<PARAPA<DESERT.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HORSEHEAD<STOLE THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// PBag: P2 entrance
_loc_num = Rando_add_location(Area_PalcB+'00',$01, LocCatID_Dngn01,0, 'PBag: P2 entrance', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<WATERY<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P2 Container Piece location
_loc_num = Rando_add_location(Area_PalcB+'15',$01, LocCatID_Dngn01,0, 'P2 Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P2 Item location
_loc_num = Rando_add_location(Area_PalcB+'06',$01, LocCatID_Dngn01,0, 'P2 Item location', STR_GLOVE,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P2 1up location
_loc_num = Rando_add_location(Area_PalcB+'16',$01, LocCatID_Dngn01,0, 'P2 1up location', STR_1UP,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P2 Key 1
_loc_num = Rando_add_location(Area_PalcB+'03',$01, LocCatID_Dngn01,0, 'P2 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
// P2 Key 2
_loc_num = Rando_add_location(Area_PalcB+'09',$01, LocCatID_Dngn01,0, 'P2 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
// P2 Key 3
_loc_num = Rando_add_location(Area_PalcB+'0E',$01, LocCatID_Dngn01,0, 'P2 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
// P2 Key 4
_loc_num = Rando_add_location(Area_PalcB+'10',$01, LocCatID_Dngn01,0, 'P2 Key 4', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MIDORO<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<SWAMP<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "HELMETHEAD<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// P3 Container Piece location
_loc_num = Rando_add_location(Area_PalcC+'13',$01, LocCatID_Dngn01,0, 'P3 Container Piece location', STR_HEART,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P3 Item location
_loc_num = Rando_add_location(Area_PalcC+'12',$01, LocCatID_Dngn01,0, 'P3 Item location', STR_RAFT,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Under blocks next to key
_loc_num = Rando_add_location(Area_PalcC+'04',$02, LocCatID_Dngn01,0, 'PBag: P3 under blocks next to key', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Mau Spawner room
_loc_num = Rando_add_location(Area_PalcC+'07',$02, LocCatID_Dngn01,0, 'PBag: Mau Spawner room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Locked by upthrust
_loc_num = Rando_add_location(Area_PalcC+'08',$01, LocCatID_Dngn01,0, 'PBag: Locked by upthrust', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: On blocks on top of pillar
_loc_num = Rando_add_location(Area_PalcC+'0C',$01, LocCatID_Dngn01,0, 'PBag: On blocks on top of pillar', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room left of Rebonack
_loc_num = Rando_add_location(Area_PalcC+'0D',$01, LocCatID_Dngn01,0, 'PBag: Room left of Rebonack', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P3 Key 1
_loc_num = Rando_add_location(Area_PalcC+'04',$01, LocCatID_Dngn01,0, 'P3 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
// P3 Key 2
_loc_num = Rando_add_location(Area_PalcC+'06',$01, LocCatID_Dngn01,0, 'P3 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
// P3 Key 3
_loc_num = Rando_add_location(Area_PalcC+'07',$01, LocCatID_Dngn01,0, 'P3 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
// P3 Key 4
_loc_num = Rando_add_location(Area_PalcC+'0A',$01, LocCatID_Dngn01,0, 'P3 Key 4', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<ISLAND<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "REBONACK<HOVERS<OVER THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// P4 Item location
_loc_num = Rando_add_location(Area_PalcD+'10',$01, LocCatID_Dngn01,0, 'P4 Item location', STR_BOOTS,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P4 Container Piece location
_loc_num = Rando_add_location(Area_PalcD+'09',$01, LocCatID_Dngn01,0, 'P4 Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room with 2 Doomknockers and a key
_loc_num = Rando_add_location(Area_PalcD+'01',$02, LocCatID_Dngn01,0, 'PBag: 2 Doomknockers and a key', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room with 3 Stalfos and spiketraps
_loc_num = Rando_add_location(Area_PalcD+'04',$01, LocCatID_Dngn01,0, 'PBag: Room with 3 Stalfos and spiketraps', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room with blocks on top of pillars
_loc_num = Rando_add_location(Area_PalcD+'0B',$01, LocCatID_Dngn01,0, 'PBag: Room with blocks on top of pillars', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Pit room left of BOOTS
_loc_num = Rando_add_location(Area_PalcD+'0F',$01, LocCatID_Dngn01,0, 'PBag: Pit room left of BOOTS', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P4 Key 1
_loc_num = Rando_add_location(Area_PalcD+'01',$01, LocCatID_Dngn01,0, 'P4 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
// P4 Key 2
_loc_num = Rando_add_location(Area_PalcD+'02',$01, LocCatID_Dngn01,0, 'P4 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
// P4 Key 3
_loc_num = Rando_add_location(Area_PalcD+'07',$01, LocCatID_Dngn01,0, 'P4 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
// P4 Key 4
_loc_num = Rando_add_location(Area_PalcD+'0A',$01, LocCatID_Dngn01,0, 'P4 Key 4', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
// P4 Key 5
_loc_num = Rando_add_location(Area_PalcD+'11',$01, LocCatID_Dngn01,0, 'P4 Key 5', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
// P4 Key 6
_loc_num = Rando_add_location(Area_PalcD+'14',$01, LocCatID_Dngn01,0, 'P4 Key 6', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<MAZE ISL<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<MAZE<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<AN ISLAND.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "CAROCK<GUARDS THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// P5 Container Piece location
_loc_num = Rando_add_location(Area_PalcE+'0A',$01, LocCatID_Dngn01,0, 'P5 Container Piece location', STR_MAGIC,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P5 Item location
_loc_num = Rando_add_location(Area_PalcE+'1A',$01, LocCatID_Dngn01,1, 'P5 Item location', STR_FLUTE,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: P5 Entrance
_loc_num = Rando_add_location(Area_PalcE+'00',$01, LocCatID_Dngn01,0, 'PBag: P5 Entrance', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Locked by upthrust and GLOVE 1
_loc_num = Rando_add_location(Area_PalcE+'0B',$01, LocCatID_Dngn01,0, 'PBag: Locked by upthrust and GLOVE 1', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: JUMP locked above elevator
_loc_num = Rando_add_location(Area_PalcE+'0C',$01, LocCatID_Dngn01,0, 'PBag: JUMP locked above elevator', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: JUMP or STABUP locked on top of blocks
_loc_num = Rando_add_location(Area_PalcE+'12',$01, LocCatID_Dngn01,0, 'PBag: JUMP or STABUP locked on top of blocks', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING3;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Locked by upthrust and GLOVE 2
_loc_num = Rando_add_location(Area_PalcE+'13',$02, LocCatID_Dngn01,0, 'PBag: Locked by upthrust and GLOVE 2', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P5 Key 1
_loc_num = Rando_add_location(Area_PalcE+'02',$01, LocCatID_Dngn01,0, 'P5 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
// P5 Key 2
_loc_num = Rando_add_location(Area_PalcE+'08',$01, LocCatID_Dngn01,0, 'P5 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
// P5 Key 3
_loc_num = Rando_add_location(Area_PalcE+'0F',$01, LocCatID_Dngn01,1, 'P5 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
// P5 Key 4
_loc_num = Rando_add_location(Area_PalcE+'13',$01, LocCatID_Dngn01,0, 'P5 Key 4', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
// P5 Key 5
_loc_num = Rando_add_location(Area_PalcE+'1D',$01, LocCatID_Dngn01,1, 'P5 Key 5', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<PALACE ON<THE SEA.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE ON<THE SEA.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE IN<THE WATER.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "GOOMA SITS<ON THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// P6 Item location
_loc_num = Rando_add_location(Area_PalcF+'08',$01, LocCatID_Dngn01,0, 'P6 Item location', STR_CROSS,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: P6 Bottom room of pit to boss
_loc_num = Rando_add_location(Area_PalcF+'1A',$01, LocCatID_Dngn01,1, 'PBag: P6 Bottom room of pit to boss', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Container Piece location
//_loc_num = Rando_add_location(Area_PalcF+'1A',$01, LocCatID_Dngn01,0, 'P6 Container Piece location', STR_MAGIC,$01);
//                                                  //
//                                                  //
//                                                  //
// PBag: GLOVE locked 1
_loc_num = Rando_add_location(Area_PalcF+'01',$02, LocCatID_Dngn01,0, 'PBag: GLOVE locked 1', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: GLOVE and STABUP locked 1
_loc_num = Rando_add_location(Area_PalcF+'02',$01, LocCatID_Dngn01,0, 'PBag: GLOVE and STABUP locked 1', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: GLOVE locked 2
_loc_num = Rando_add_location(Area_PalcF+'06',$01, LocCatID_Dngn01,0, 'PBag: GLOVE locked 2', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room with Atta
_loc_num = Rando_add_location(Area_PalcF+'0A',$01, LocCatID_Dngn01,0, 'PBag: Room with Atta', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Endless pit 3
_loc_num = Rando_add_location(Area_PalcF+'0C',$01, LocCatID_Dngn01,0, 'PBag: Endless pit 3', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P6 Container Piece location
_loc_num = Rando_add_location(Area_PalcF+'12',$01, LocCatID_Dngn01,0, 'P6 Container Piece location', STR_MAGIC,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// PBag: Room with secret ceiling exit to Kakusu
//_loc_num = Rando_add_location(Area_PalcF+'12',$01, LocCatID_Dngn01,0, 'PBag: Room with secret ceiling exit to Kakusu', STR_PBAG,$01);
//                                                  //
//                                                  //
//                                                  //
// PBag: Falling key room
_loc_num = Rando_add_location(Area_PalcF+'13',$02, LocCatID_Dngn01,0, 'PBag: Falling key room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Under blocks with Mau Spawner
_loc_num = Rando_add_location(Area_PalcF+'17',$02, LocCatID_Dngn01,0, 'PBag: Under blocks with Mau Spawner', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING4;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room below Kakusu room
_loc_num = Rando_add_location(Area_PalcF+'1C',$01, LocCatID_Dngn01,0, 'PBag: Room below Kakusu room', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING2;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
// P6 Key 1
_loc_num = Rando_add_location(Area_PalcF+'01',$01, LocCatID_Dngn01,0, 'P6 Key 1', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Key 2
_loc_num = Rando_add_location(Area_PalcF+'09',$01, LocCatID_Dngn01,0, 'P6 Key 2', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Key 3
_loc_num = Rando_add_location(Area_PalcF+'0B',$01, LocCatID_Dngn01,0, 'P6 Key 3', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Key 4 (falling key)
FallingKey_RM_NAME=Area_PalcF+'13';
_loc_num = Rando_add_location(FallingKey_RM_NAME,$01, LocCatID_Dngn01,0, 'P6 Key 4 (falling key)', STR_KEY,$01); // falling key
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Key 5
_loc_num = Rando_add_location(Area_PalcF+'17',$01, LocCatID_Dngn01,0, 'P6 Key 5', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
// P6 Key 6
_loc_num = Rando_add_location(Area_PalcF+'1F',$01, LocCatID_Dngn01,0, 'P6 Key 6', STR_KEY,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN<3 EYE ROCK<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<DESERT<PALACE.";
if(!DungeonLocations_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<HIDDEN<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<TOOK THE<PLACE OF A<KEY.";
if(!DungeonBoss_WILL_RANDOMIZE) dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "BARBA<WATCHES<THE<&.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// Great Palace Item location (SKELETON KEY)
_loc_num = Rando_add_location(Area_PalcG+'3A',$01, LocCatID_Dngn01,3, 'Great Palace Item location (SKELETON KEY)', STR_ALLKEY,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING1;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN A<PALACE OF<GREATNESS.";
//                                                  //
//                                                  //
//                                                  //
switch(QUEST_NUM){// Great Palace 1up location
case 1:{
_loc_num = Rando_add_location(Area_PalcG+'29',$01, LocCatID_Dngn01,2, 'Great Palace 1up location',                  STR_1UP, $01);
break;}
case 2:{
_loc_num = Rando_add_location(Area_PalcG+'29',$03, LocCatID_Dngn01,2, 'Great Palace 1up location (2ND QUEST PBAG)', STR_PBAG,$02);
break;}
}
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
// PBag: Room with 1up doll
_loc_num = Rando_add_location(Area_PalcG+'29',$02, LocCatID_Dngn01,3, 'PBag: Room with 1up doll', STR_PBAG,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Dead end room right of 1st elevator
_loc_num = Rando_add_location(Area_PalcG+'04',$01, LocCatID_Dngn01,1, 'PBag: Dead end room right of 1st elevator', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING5;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room with 2 Fokkeru and a pit down under block bridge
_loc_num = Rando_add_location(Area_PalcG+'0B',$01, LocCatID_Dngn01,1, 'PBag: Room with 2 Fokkeru and a pit down under block bridge', STR_PBAG,$01);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING5;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: L7 room left side
_loc_num = Rando_add_location(Area_PalcG+'2D',$01, LocCatID_Dngn01,3, 'PBag: L7 room left side', STR_PBAG,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: L7 room right side
_loc_num = Rando_add_location(Area_PalcG+'2D',$02, LocCatID_Dngn01,2, 'PBag: Pit down room to Thunderbird path 2', STR_PBAG,$02);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Location right of L7 room
_loc_num = Rando_add_location(Area_PalcG+'2F',$01, LocCatID_Dngn01,2, 'PBag: Location right of L7 room', STR_PBAG,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Room below L7 room
_loc_num = Rando_add_location(Area_PalcG+'30',$01, LocCatID_Dngn01,2, 'PBag: Room below L7 room', STR_PBAG,$01, true);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Next to fast travel
_loc_num = Rando_add_location(Area_PalcG+'3C',$01, LocCatID_Dngn01,0, 'PBag: Next to fast travel', STR_PBAG,$01, true);
dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]=_ALLKEY_RATING5;
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
// PBag: Dead end room below top right falling blocks room
_loc_num = Rando_add_location(Area_PalcG+'42',$01, LocCatID_Dngn01,3, 'PBag: Dead end room below top right falling blocks room', STR_PBAG,$01);
_a=0;
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "&<IS IN THE<GREAT<PALACE.";
dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(++_a)] = "THE<&<IS IN A<PALACE.";
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
// SPELL/WISEMAN LOCATIONS ---------------------------------------------
                                                                      _datakey=STR_Spell+STR_Location;
// Wiseman Rauru spell                                                                                          //
_loc_num = Rando_add_location(Area_TownA+'60',$01, LocCatID_Town01,0, _datakey+STR_Rauru     , STR_Spell,$01);
// Wiseman Ruto spell                                                                                           //
_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, _datakey+STR_Ruto      , STR_Spell,$01);
// Wiseman Saria spell                                                                                          //
_loc_num = Rando_add_location(Area_TownA+'62',$01, LocCatID_Town01,0, _datakey+STR_Saria     , STR_Spell,$01);
// Wiseman Mido spell                                                                                           //
_loc_num = Rando_add_location(Area_TownA+'63',$01, LocCatID_Town01,0, _datakey+STR_Mido      , STR_Spell,$01);
// Wiseman Nabooru spell                                                                                        //
_loc_num = Rando_add_location(Area_TownA+'65',$01, LocCatID_Town01,0, _datakey+STR_Nabooru   , STR_Spell,$01);
// Wiseman Darunia spell                                                                                        //
_loc_num = Rando_add_location(Area_TownA+'66',$01, LocCatID_Town01,0, _datakey+STR_Darunia   , STR_Spell,$01);
// Wiseman New Kasuto spell                                                                                     //
_loc_num = Rando_add_location(Area_TownA+'69',$01, LocCatID_Town01,0, _datakey+STR_New_Kasuto, STR_Spell,$01);
// Wiseman Old Kasuto spell                                                                                     //
_loc_num = Rando_add_location(Area_TownA+'6B',$01, LocCatID_Town01,0, _datakey+STR_Old_Kasuto, STR_Spell,$01);
// Wiseman Bulblin spell                                                                                        //
if (QUEST_NUM==2) _loc_num = Rando_add_location(Area_TownB+'60',$01, LocCatID_Town01,0, _datakey+STR_Bulblin, STR_Spell,$01);
/*
// SPELL/WISEMAN LOCATIONS ---------------------------------------------
                                                           _datakey=STR_Spell+STR_Location;
// Wiseman Rauru spell                                                                                          //
_loc_num = Rando_add_location(Area_TownA+'60',$01, LocCatID_Town01,0, _datakey+STR_Rauru     , STR_Spell,$01, STR_Rauru);
// Wiseman Ruto spell                                                                                           //
_loc_num = Rando_add_location(Area_TownA+'61',$01, LocCatID_Town01,0, _datakey+STR_Ruto      , STR_Spell,$01, STR_Ruto);
// Wiseman Saria spell                                                                                          //
_loc_num = Rando_add_location(Area_TownA+'62',$01, LocCatID_Town01,0, _datakey+STR_Saria     , STR_Spell,$01, STR_Saria);
// Wiseman Mido spell                                                                                           //
_loc_num = Rando_add_location(Area_TownA+'63',$01, LocCatID_Town01,0, _datakey+STR_Mido      , STR_Spell,$01, STR_Mido);
// Wiseman Nabooru spell                                                                                        //
_loc_num = Rando_add_location(Area_TownA+'65',$01, LocCatID_Town01,0, _datakey+STR_Nabooru   , STR_Spell,$01, STR_Nabooru);
// Wiseman Darunia spell                                                                                        //
_loc_num = Rando_add_location(Area_TownA+'66',$01, LocCatID_Town01,0, _datakey+STR_Darunia   , STR_Spell,$01, STR_Darunia);
// Wiseman New Kasuto spell                                                                                     //
_loc_num = Rando_add_location(Area_TownA+'69',$01, LocCatID_Town01,0, _datakey+STR_New_Kasuto, STR_Spell,$01, STR_New_Kasuto);
// Wiseman Old Kasuto spell                                                                                     //
_loc_num = Rando_add_location(Area_TownA+'6B',$01, LocCatID_Town01,0, _datakey+STR_Old_Kasuto, STR_Spell,$01, STR_Old_Kasuto);
// Wiseman Bulblin spell                                                                                        //
if (QUEST_NUM==2) _loc_num = Rando_add_location(Area_TownB+'60',$01, LocCatID_Town01,0, _datakey+STR_Bulblin, STR_Spell,$01, STR_Bulblin);
*/
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
Location_COUNT      = val(dm_LOCATIONS[?STR_Total+STR_Location+STR_Count]);
dm_save_data[?                          STR_Total+STR_Location+STR_Count] = Location_COUNT;

ItemLocation_COUNT  = val(dm_LOCATIONS[?STR_Item +STR_Location+STR_Count]);
dm_save_data[?                          STR_Item +STR_Location+STR_Count] = ItemLocation_COUNT;

PBagLocation_COUNT  = val(dm_LOCATIONS[?STR_PBAG +STR_Location+STR_Count]);
dm_save_data[?                          STR_PBAG +STR_Location+STR_Count] = PBagLocation_COUNT;

SpellLocation_COUNT = val(dm_LOCATIONS[?STR_Spell+STR_Location+STR_Count]);
dm_save_data[?                          STR_Spell+STR_Location+STR_Count] = SpellLocation_COUNT;

KeyLocation_COUNT   = val(dm_LOCATIONS[?STR_Key  +STR_Location+STR_Count]);
dm_save_data[?                          STR_Key  +STR_Location+STR_Count] = KeyLocation_COUNT;

if (DEBUG){
sdm("Location_COUNT $"+hex_str(Location_COUNT)+", "+"ItemLocation_COUNT $"+hex_str(ItemLocation_COUNT)+", "+"PBagLocation_COUNT $"+hex_str(PBagLocation_COUNT)+", "+"SpellLocation_COUNT $"+hex_str(SpellLocation_COUNT)+", "+"KeyLocation_COUNT $"+hex_str(KeyLocation_COUNT));
sdm("");
}







// ******** FIND AND RECORD THE spawn_datakey EACH _loc_num ********
// =================================================================================
var _spawn_datakey, _item_type,_item_id, _obj,_obj_name;
var _dl_scenes = ds_list_create();
var _dl_multiple_locations_scenes = ds_list_create();

var          _total_location_COUNT = ds_list_size(dl_location_NUMS);
for(_i=0; _i<_total_location_COUNT; _i++)
{
    _loc_num = dl_location_NUMS[|_i];
    
    if (ds_list_find_index(dl_spell_location_NUMS,_loc_num)!=-1) continue;
    
    
    _rm_name   = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name],                  STR_Location+STR_Num+hex_str(_loc_num)+STR_Rm+STR_Name+" undefined");
    _item_type = val(dm_LOCATIONS[?hex_str(_loc_num)       +STR_Item+STR_Base+STR_Key], STR_Location+STR_Num+hex_str(_loc_num)+STR_Item+STR_Type+" undefined");
    _num1      = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Item+STR_Base+STR_Key+STR_Num]);
    
    
         if (ds_list_find_index(_dl_scenes,                   _rm_name)==-1)
    {        ds_list_add(       _dl_scenes,                   _rm_name);  }
    else if (ds_list_find_index(_dl_multiple_locations_scenes,_rm_name)==-1)
    {        ds_list_add(       _dl_multiple_locations_scenes,_rm_name);  }
    
    
    
    _num=0;      _count = val(g.dm_spawn[?get_spawn_datakey(_rm_name,STR_PRIO,-1)]);
    for(_j=0; _j<_count; _j++)
    {
        _spawn_datakey =                  get_spawn_datakey(_rm_name,STR_PRIO,_j);
            _obj = val(g.dm_spawn[?_spawn_datakey+STR_obj_idx], noone);
        if (_obj)
        {
            _datakey = g.dm_ITEM[?object_get_name(_obj)+STR_Item+STR_Type];
            if(!is_undefined(_datakey) 
            &&  _item_type== _datakey )
            {
                    _num++;
                if (_num==_num1)
                {
                    // Find and record the spawn_datakey for this _loc_num
                    dm_LOCATIONS[?hex_str(_loc_num)+STR_Spawn+STR_Datakey] = _spawn_datakey; // item_id's vanilla spawn_datakey
                    // The vanilla item_id for this _loc_num/_spawn_datakey
                    _item_id = val(g.dm_spawn[?_spawn_datakey+STR_Item+STR_ID], "undefined.. "+"g.dm_spawn[?"+"_spawn_datakey"+"+STR_Item+STR_ID]");
                    dm_LOCATIONS[?hex_str(_loc_num)+STR_Item+STR_ID]     = _item_id; // _loc_num's vanilla item_id
                    dm_LOCATIONS[?string(_item_id)+STR_Location+STR_Num] = _loc_num; // item_id's vanilla _loc_num
                    
                         if (ds_list_find_index(dl_item_location_NUMS,_loc_num)!=-1) ds_list_add(dl_ITEMS,_item_id);
                    else if (ds_list_find_index(dl_pbag_location_NUMS,_loc_num)!=-1) ds_list_add(dl_PBAGS,_item_id);
                    else if (ds_list_find_index(dl_key_location_NUMS, _loc_num)!=-1) ds_list_add(dl_KEYS, _item_id);
                    //sdm("_loc_num $"+hex_str(_loc_num)+", _spawn_datakey: "+_spawn_datakey+", _item_id: "+_item_id);
                    break;//_j
                }
            }
        }
    }
}





if(0)
{
    var _dl_1=ds_list_create();
    var _dl_2=ds_list_create();
    var _dl_3=ds_list_create();
    
    _count=ds_list_size(dl_location_NUMS);
    for(_i=0; _i<_count; _i++)
    {
        _loc_num = dl_location_NUMS[|_i];
        
        if (ds_list_find_index(dl_spell_location_NUMS,_loc_num)!=-1) continue;
        
        _val = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Obscure]);
        switch(_val){
        case 1:{ds_list_add(_dl_1,_loc_num); break;}
        case 2:{ds_list_add(_dl_2,_loc_num); break;}
        case 3:{ds_list_add(_dl_3,_loc_num); break;}
        }
    }
    
    
    sdm("");
    _count=ds_list_size(_dl_3);
    for(_i=0; _i<_count; _i++)
    {
        _loc_num = _dl_3[|_i];
        _rm_name = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
        _val     = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Description]);
        sdm("3 - "+string(_rm_name)+": "+string(_val));
    }
    
    sdm("");
    _count=ds_list_size(_dl_2);
    for(_i=0; _i<_count; _i++)
    {
        _loc_num = _dl_2[|_i];
        _rm_name = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
        _val     = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Description]);
        sdm("2 - "+string(_rm_name)+": "+string(_val));
    }
    
    sdm("");
    _count=ds_list_size(_dl_1);
    for(_i=0; _i<_count; _i++)
    {
        _loc_num = _dl_1[|_i];
        _rm_name = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
        _val     = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Description]);
        sdm("1 - "+string(_rm_name)+": "+string(_val));
    }
    sdm("");
    
    ds_list_destroy(_dl_1); _dl_1=undefined;
    ds_list_destroy(_dl_2); _dl_2=undefined;
    ds_list_destroy(_dl_3); _dl_3=undefined;
}






if(0){
ds_list_sort(dl_ITEMS,true);
var _size=ds_list_size(dl_ITEMS);
    for(_i=0; _i<_size; _i++){
    sdm("dl_ITEMS[|$"+hex_str(_i)+"] = "+dl_ITEMS[|_i]);
    if (_i && !(_i&$3)) sdm("");
    }
sdm("");

ds_list_sort(dl_PBAGS,true);
    _size=ds_list_size(dl_PBAGS);
    for(_i=0; _i<_size; _i++){
    sdm("dl_PBAGS[|$"+hex_str(_i)+"] = "+dl_PBAGS[|_i]);
    if (_i && !(_i&$3)) sdm("");
    }
sdm("");

ds_list_sort(dl_KEYS,true);
    _size=ds_list_size(dl_KEYS);
    for(_i=0; _i<_size; _i++){
    sdm("dl_KEYS[|$"+hex_str(_i)+"] = "+dl_KEYS[|_i]);
    if (_i && !(_i&$3)) sdm("");
    }
sdm("");
}


//_count = ds_list_size(_dl_multiple_locations_scenes);
//for(_i=0; _i<_count; _i++) sdm("_dl_multiple_locations_scenes[|$"+hex_str(_i)+"] = "+_dl_multiple_locations_scenes[|_i]);
ds_list_destroy(_dl_multiple_locations_scenes); _dl_multiple_locations_scenes=undefined;
ds_list_destroy(_dl_scenes); _dl_scenes=undefined;




//D598D3A7



/*
"THE<&<IS IN A<DESERT.";
"THE<&<IS IN A<SWAMP.";
"THE<&<IS IN A<CAVE.";
"THE<&<IS IN A<PALACE.";
"THE<&<IS IN A<TOWN.";
"THE<&<IS IN A<CEMETERY.";

"THE<&<IS IN A<DARK CAVE.";
"THE<&<IS IN A<FIELD CAVE";
"THE<&<IS IN A<SWAMP CAVE";
"&<IS IN A<DESERT<CAVE.";
"&<IS IN A<SEASIDE<CAVE.";
"&<IS IN A<WATERY<CAVE.";
"THE<&<IS NEXT TO<A LAKE.";
"THE<&<IS NEAR A<CEMETERY.";
"&<IS ON A<SANDY<ISLAND.";

"&<IS IN A<HOUSE IN<THE WOODS.";
"&<LIES IN<SWAMPY<RUINS.";
"THE<&<IS OUT IN<THE OCEAN.";
"&<IS<SURROUNDED<BY WATER.";
"&<IS IN THE<MIDDLE OF<A LAKE.";
"&<IS IN A<MOUNTAIN<SIDE FIELD";
"&<LIES IN<SOME OLD<RUINS.";
"&<IS IN A<CAVE NEAR<A LAKE.";
"&<LIES IN<THE FAR<NORTH.";
"THE<&<CAN ONLY<BE WON.";
"THE<&<CAN ONLY<BE BOUGHT.";
"FALL DOWN<A HOLE FOR<THE<&.";
"&<IS WHERE<GHOSTS<ROAM.";
"&<LIES ON<HEATED<ROCK.";
"THE<&<IS IN A<HOT CAVE.";
"THE<&<SITS NEXT<TO LAVA.";
"CROSS A<BRIDGE TO<GET THE<&.";
"&<IS NEAR A<BROKEN<BRIDGE.";
"&<IS IN AN<OLD WELL.";
"&<IS IN A<CAVE BELOW<A LAKE.";
"&<IS IN A<PLACE OF<ROYALTY.";
"&<IS IN A<WATERY<FOREST.";
"&<IS HIDDEN<IN A<FOREST.";
"&<TOOK THE<PLACE OF<A KEY.";
"THEN<&<IS HIDDEN<IN A MAZE.";
"&<IS RIGHT<NEXT TO A<BOULDER.";
"THE<&<IS UNDER<A BOULDER.";
"&<IS UNDER A<CIRCLE OF<BOULDERS.";
"&<IS IN<A MAZE OF<CAVES.";
"&<IS IN THE<RUTO<MOUNTAINS.";

"THE<&<WAITS<UNDER A<TOMB.";
"&<IS WHERE<LEEVERS<DANCE.";
"BECOME<SMALL TO<GET TO THE<&."
"&<LIES OVER<A ROUGH<SEA.";
"&<IS IN SOME<RUINS IN<A FOREST.";
"&<IS ON A<LAKE ABOVE<A SWAMP.";
"&<IS IN SOME<MOUNTAIN<RUINS.";
"&<LIES ON A<FALLEN<TREE.";
"&<IS AT THE<TOP OF A<WATERFALL.";
"&<IS WHERE<FLOWERS<GROW.";
"GO DOWN A<CHIMNEY<FOR THE<&.";
"&<IS IN A<ROYAL<CASTLE.";
"&<IS NEAR<NORTH<CASTLE.";
"&<IS NEXT TO<A TREE<OF BATS.";
"&<IS A<RESCUERS<REWARD.";
"&<IS WHERE<A HERO<RESTS.";
"&<IS A<SECRET TO<EVERYBODY.";
"&<IS HELD<BY A DARK<WIZARD.";
"ANJUS<FRIEND<HOLDS THE<&.";
"PUSH AROUND<STATUES<FOR THE<&.";
"&<IS IN A<WATERY<PALACE.";
"THE<&<IS IN A<BASEMENT.";
"THE<&<IS IN A<HOUSE.";
"THE<&<IS ON AN<ISLAND.";

"&<IS IN A<SWAMP<PALACE.";
"&<IS IN A<DESERT<PALACE.";
"&<IS IN THE<ISLAND<PALACE.";
"&<IS IN THE<MAZE<PALACE.";
"&<IS IN A<PALACE ON<THE SEA.";
"&<IS IN A<HIDDEN<PALACE.";
"&<IS IN A<GREAT<PALACE.";
"&<IS IN A<PALACE OF<GREATNESS.";
"&<IS ON THE<DRAGMIRE<SHOALS.";
"&<IS IN THE<PARAPA<DESERT.";
"&<IS IN<DEATH<MOUNTAIN.";
"&<IS NEAR<THE MAZE<PALACE.";
"&<IS NEAR<THE SEA<PALACE.";

"THE<&<IS NEAR<SARIA.";
"THE<&<IS WEST OF<NABOORU.";

"&<IS IN A<MOUNTAIN<TOWN.";
"&<IS IN A<RIVER<TOWN.";
"&<IS IN<A HARBOR<TOWN.";
"&<IS IN A<FOREST<TOWN.";
"&<IS WHERE<MAGIC IS<TAUGHT.";
*/
