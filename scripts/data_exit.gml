/// data_exit(exit name data, exit type, open, exit clm, exit row, exit w, exit h, pc clm, pc row, goto exit, *door graphic id, *palette idx)


var _i, _val, _num, _count;
var _clm,_row;
var _dk;

var                            _arg=0;
var _EXIT_NAME_DATA = argument[_arg++]; // int, exit number.        
var _EXIT_TYPE      = argument[_arg++]; // int, exit type.          a code to indicate the type of exit
var _OPEN           = argument[_arg++]; // bol, interactable.       true: interactable, false: non-interactable
var _exit_clm       = argument[_arg++]; // int, grid x.             the exit's x coord in units of 8
var _EXIT_ROW       = argument[_arg++]; // int, grid y.             the exit's y coord in units of 8
var _EXIT_W         = argument[_arg++]; // int, width.              the exit's width, in units of 8
var _EXIT_H         = argument[_arg++]; // int, height.             the exit's height, in units of 8
var _pc_clm         = argument[_arg++]; // int, grid x.             PC's spawn x in units of 8
var _PC_ROW         = argument[_arg++]; // int, grid y.             PC's spawn y in units of 8

var _VIEW_DATA = val(g.dm_rm[?rm_name+STR_View+STR_Data]);
var _PAGES_X   = rm_get_wh(rm_name,0)>>8;
var _PAGES_Y   = rm_get_wh(rm_name,1)>>8;


var _EXIT_NAME = REEN_DEFAULT;
if (is_string(_EXIT_NAME_DATA)) 
{   // _EXIT_NAME_DATA: passed as string full exit name
    // This allows for in-game temporary-Exit creation so 
    // the map data can be deleted right after the Exit is contructed.
    _EXIT_NAME = _EXIT_NAME_DATA;  
} 
else                            
{   // _EXIT_NAME_DATA: passed as int representing exit num
    _EXIT_NAME = area+hex_str(rm_num)+hex_str(_EXIT_NAME_DATA);  
}



var _RM_NAME  =         string_copy(_EXIT_NAME,1,RmName_LEN);
var _EXIT_NUM = str_hex(string_copy(_EXIT_NAME,ExitName_LEN-1,2));

if (_EXIT_NUM&g.EXIT_DIR_RIGHT)
{
    _exit_clm = (_exit_clm&$1F) + ( _PAGES_X    <<5);
      _pc_clm = (  _pc_clm&$1F) + ((_PAGES_X-1) <<5);
}


// Because 16 pixels on each side of the room will 
// be cut off w/ 2 page-wide rooms:
if (_PAGES_X==2 
&&  _EXIT_NUM & (g.EXIT_DIR_RIGHT|g.EXIT_DIR_LEFT) )
{
    _val = $02 * -sign_(_EXIT_NUM&g.EXIT_DIR_RIGHT);
    _exit_clm += _val;
      _pc_clm += _val;
}






// ------------------------------------------------------------------------
if (is_undefined(g.dm_rm[?_EXIT_NAME+STR_Num])) // true if data has NOT yet created for this exit
{
    _dk = _RM_NAME+STR_Exit+STR_Count; // This rm's exit count
    _count = val(g.dm_rm[?_dk]) + 1;
    g.dm_rm[?_dk] = _count;
    g.dm_rm[?_RM_NAME+STR_Exit+hex_str(_count)+STR_Name] = _EXIT_NAME;
    g.dm_rm[?_EXIT_NAME+STR_Exit+STR_Num+STR_Rm]         = _count;
    
    _dk = area+STR_Exit+STR_Count; // This area's exit count
    _count = val(g.dm_rm[?_dk]) + 1;
    g.dm_rm[?_dk] = _count;
    g.dm_rm[?area+STR_Exit+hex_str(_count)+STR_Name] = _EXIT_NAME;
    g.dm_rm[?_EXIT_NAME+STR_Exit+STR_Num+STR_Area]   = _count;
    
    
    _dk = STR_Exit+STR_Count; // Game exit count
    _count = val(g.dm_rm[?_dk]) + 1;
    g.dm_rm[?_dk] = _count;
    g.dm_rm[?STR_Exit+hex_str(_count)+STR_Name]    = _EXIT_NAME;
    g.dm_rm[?_EXIT_NAME+STR_Exit+STR_Num+STR_Game] = _count;
}





// ------------------------------------------------------------------------
if (_EXIT_NUM&$C0) _clm =   _pc_clm;
else               _clm = _exit_clm;
                   _row =   _PC_ROW;
//
var _PAGE_X = clamp(_clm>>5, 0, _PAGES_X-1);
var _PAGE_Y = clamp(_row>>5, 0, _PAGES_Y-1);
//
g.dm_rm[?_EXIT_NAME+STR_Page+"_x"] =  _PAGE_X;
g.dm_rm[?_EXIT_NAME+STR_Page+"_y"] =  _PAGE_Y;
g.dm_rm[?_EXIT_NAME+STR_Page]      = (_PAGE_Y*_PAGES_X) + _PAGE_X;

g.dm_rm[?_EXIT_NAME+STR_Num]     = _EXIT_NUM;
g.dm_rm[?_EXIT_NAME+STR_Type]    = _EXIT_TYPE;
g.dm_rm[?_EXIT_NAME+STR_Open]    = _OPEN;
g.dm_rm[?_EXIT_NAME+STR_Exit_x]  = _exit_clm;
g.dm_rm[?_EXIT_NAME+STR_Exit_y]  = _EXIT_ROW;
g.dm_rm[?_EXIT_NAME+STR_Width]   = _EXIT_W;
g.dm_rm[?_EXIT_NAME+STR_Height]  = _EXIT_H;
g.dm_rm[?_EXIT_NAME+STR_Spawn_x] = _pc_clm;
g.dm_rm[?_EXIT_NAME+STR_Spawn_y] = _PC_ROW;







// ------------------------------------------------------------------------
// !! NOTE: if this exit goes to ow, init_data_overworld() created the goto reen data already.
// passing 0 means exit goes to ow
var                                                        _GOTO_EXIT = argument[_arg++];
if (is_string(_GOTO_EXIT) && string_length(_GOTO_EXIT)==4) _GOTO_EXIT = area+_GOTO_EXIT;

if (is_string(_GOTO_EXIT)) g.dm_rm[?_EXIT_NAME+STR_goto_reen] = _GOTO_EXIT; // rm exit
//if (is_string(_GOTO_EXIT)) g.dm_rm[?_EXIT_NAME+STR_GoTo+STR_Rm] = string_copy(_GOTO_EXIT, 1,RmName_LEN); // 

if (is_string(_GOTO_EXIT)) var _GOTO_AREA = string_copy(_GOTO_EXIT,1,AreaID_LEN); // 
else                       var _GOTO_AREA = Area_OvrwA;

// For ow encounter rm && testing rm's like vertical scrolling test
if(!is_string(_GOTO_EXIT))
{
    if (         val(g.dm_rm[?   rm_name+STR_Enc_Type])    // 0: No enc, "01": Weak, "02": Strong, "03": FAIRY
    ||  is_undefined(g.dm_rm[?_EXIT_NAME+STR_goto_reen]) ) // init_data_overworld() didn't make data for some reason, maybe this is a test rm
    {
        var _OWRC = g.OWRC_NO_EXIT_DATA;
        //var _OWRC = val(g.overworld.dm[?MK_OWRC_NPAL1],OWRC_DFL) + $10;
        
        //global.OVERWORLD.dm[?_EXIT_NAME+STR_OWRC]   = _OWRC; // goto owrc
        g.dm_rm[?_EXIT_NAME+STR_OWRC]        = _OWRC; // goto owrc
        //global.OVERWORLD.dm[?_EXIT_NAME+STR_ow_dir] = $1;    // goto ow facing dir
        g.dm_rm[?_EXIT_NAME+STR_ow_dir]      = $1;    // goto ow facing dir
        g.dm_rm[?_EXIT_NAME+STR_goto_reen]   = Area_OvrwA+hex_str(_OWRC); // goto ow exit
        //g.dm_rm[?_EXIT_NAME+STR_GoTo+STR_Rm] = Area_OvrwA;
    }
}


// ------------------------------------------------------------------------
// For dungeon scene exits that go to a diff area/overworld.
// Dungeon maps use this data for dungeon exit arrows.
if(!is_undefined(g.dm_dungeon[?STR_Dungeon+area+STR_Name]) 
//if (area_is_dungeon(area) 
&&  _GOTO_AREA!=area ) // goto exit goes to diff area
{
    _dk = area+STR_Entrance+STR_Count;
    g.dm_rm[?_dk] = val(g.dm_rm[?_dk]) + 1;
    _count        = val(g.dm_rm[?_dk]);
    
    g.dm_rm[?area+STR_Entrance+hex_str(_count)] = _EXIT_NAME;
}







// ------------------------------------------------------------------------
var                      _DOOR_ID = -1;               // What kind of door graphic to draw, if any.
if (argument_count>_arg) _DOOR_ID = argument[_arg++]; // 

var                      _PAL_IDX = global.PI_BGR1;         // Palette idx for door graphic
if (argument_count>_arg) _PAL_IDX = argument[_arg++]; // 

g.dm_rm[?_EXIT_NAME+STR_Door+STR_ID]     = _DOOR_ID;
g.dm_rm[?_EXIT_NAME+STR_Palette+STR_Idx] = _PAL_IDX;




// ------------------------------------------------------------------------
if (ds_list_find_index(dl_exit,_EXIT_NAME)==-1) ds_list_add(dl_exit,_EXIT_NAME);




// ------------------------------------------------------------------------
switch(_EXIT_NUM&$F0)
{   // -------------------------------
    case $00:{ // Doorway Exits
    switch(_EXIT_NUM&$0F){
    case $00:{exit_name_m0=_EXIT_NAME; break;}
    case $01:{exit_name_m1=_EXIT_NAME; break;}
    case $02:{exit_name_m2=_EXIT_NAME; break;}
    case $03:{exit_name_m3=_EXIT_NAME; break;}
    }
    break;}
    // -------------------------------
    case $10:{ // Right Exits
    switch(_EXIT_NUM&$0F){
    case $00:{exit_name_r0=_EXIT_NAME; break;}
    case $01:{exit_name_r1=_EXIT_NAME; break;}
    case $02:{exit_name_r2=_EXIT_NAME; break;}
    case $03:{exit_name_r3=_EXIT_NAME; break;}
    }
    break;}
    // -------------------------------
    case $20:{ // Left Exits
    switch(_EXIT_NUM&$0F){
    case $00:{exit_name_l0=_EXIT_NAME; break;}
    case $01:{exit_name_l1=_EXIT_NAME; break;}
    case $02:{exit_name_l2=_EXIT_NAME; break;}
    case $03:{exit_name_l3=_EXIT_NAME; break;}
    }
    break;}
    // -------------------------------
    case $40:{ // Down Exits
    switch(_EXIT_NUM&$0F){
    case $00:{exit_name_d0=_EXIT_NAME; break;}
    case $01:{exit_name_d1=_EXIT_NAME; break;}
    case $02:{exit_name_d2=_EXIT_NAME; break;}
    case $03:{exit_name_d3=_EXIT_NAME; break;}
    }
    break;}
    // -------------------------------
    case $80:{ // Up Exits
    switch(_EXIT_NUM&$0F){
    case $00:{exit_name_u0=_EXIT_NAME; break;}
    case $01:{exit_name_u1=_EXIT_NAME; break;}
    case $02:{exit_name_u2=_EXIT_NAME; break;}
    case $03:{exit_name_u3=_EXIT_NAME; break;}
    }
    break;}
}


// ------------------------------------------------------------------------
return _EXIT_NAME;
// ------------------------------------------------------------------------




