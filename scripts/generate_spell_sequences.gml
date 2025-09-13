/// generate_spell_sequences(spell count)


var _i,_j, _count;
var _dk, _dk1,_dk2,_dk3,_dk4, _dk_dialogue;
var _str, _str1,_str2;
var _dbstr;

var _arg=0;
var _CAST_SPELL_COUNT = clamp(argument[_arg++], 1,4);


/*
SPL_SHLD
SPL_JUMP
SPL_LIFE
SPL_FARY
SPL_FIRE
SPL_RFLC
SPL_SPEL
SPL_THUN
SPL_SUMM

SPL_SHLD, SPL_JUMP, SPL_FIRE
SPL_LIFE, SPL_FARY, 
SPL_RFLC, SPL_SPEL, 
*/

// Each group is a tier of spells. 
// 2024/08/31. These were tiered from my judgement but don't remember what 
// points I considered when rating them. Ratings were probably based on 
// cast cost and when you acquire them.
var         _dl_group1 = ds_list_create();
ds_list_add(_dl_group1, SPL_PRTC,SPL_JUMP,SPL_FIRE);

var         _dl_group2 = ds_list_create();
ds_list_add(_dl_group2, SPL_LIFE,SPL_FARY);

var         _dl_group3 = ds_list_create();
ds_list_add(_dl_group3, SPL_RFLC,SPL_SPEL);

var _dl_seq = ds_list_create();
var _dm_1 = ds_map_create();

_dk2 = STR_Spell+STR_Sequence;



_i=0;
while (true)
{
    _dk_dialogue = g.DIALOGUE_WINDOW.dm_dialogue[?_dk2+STR_Dialogue+STR_Datakey+hex_str(_i+1)];
    if (is_undefined(_dk_dialogue)) break;//while (true)
    _i++;
}

var _SPELL_SEQUENCE_COUNT = _i; // Kings Tomb, Carock 2, Kasuto Cemetery Kakusu




show_debug_message("");

for(_i=0; _i<_SPELL_SEQUENCE_COUNT; _i++)
{
    _dk_dialogue = g.DIALOGUE_WINDOW.dm_dialogue[?_dk2+STR_Dialogue+STR_Datakey+hex_str(_i+1)];
    if(!is_undefined(_dk_dialogue))
    {
        _dk3 = _dk2+hex_str(_i+1); // _dk2 = STR_Spell+STR_Sequence
        
        ds_list_shuffle(_dl_group1);
        ds_list_shuffle(_dl_group2);
        ds_list_shuffle(_dl_group3);
        
        ds_list_clear(_dl_seq);
        switch(_i){
        case 0:{ds_list_add(_dl_seq,SPL_RFLC); break;} // Kings Tomb
        case 1:{ds_list_add(_dl_seq,SPL_SPEL); break;} // Carock 2
        case 2:{ds_list_add(_dl_seq,SPL_SPEL); break;} // Kasuto Cemetery Kakusu
        }
        
        if (_CAST_SPELL_COUNT>1) ds_list_add(_dl_seq,_dl_group1[|0]);
        if (_CAST_SPELL_COUNT>2) ds_list_add(_dl_seq,_dl_group2[|0]);
        
        if (_CAST_SPELL_COUNT>3)
        {
            switch(_i){
            case 0:{ds_list_add(_dl_seq,_dl_group1[|1]); break;} // Kings Tomb
            case 1:{ds_list_add(_dl_seq,_dl_group1[|1]); break;} // Carock 2
            case 2:{ds_list_add(_dl_seq,_dl_group3[|0]); break;} // Kasuto Cemetery Kakusu
            }
        }
        
        ds_list_shuffle(_dl_seq);
        /*
        switch(_i){
        case 0:{ds_list_add(_dl_seq, SPL_RFLC,_dl_group1[|0],_dl_group2[|0],_dl_group1[|1]); break;} // Kings Tomb
        case 1:{ds_list_add(_dl_seq, SPL_SPEL,_dl_group1[|0],_dl_group2[|0],_dl_group1[|1]); break;} // Carock 2
        case 2:{ds_list_add(_dl_seq, SPL_SPEL,_dl_group1[|0],_dl_group2[|0],_dl_group3[|0]); break;} // Kasuto Cemetery Kakusu
        }
        ds_list_shuffle(_dl_seq);
        */
        
        
        _count = ds_list_size(_dl_seq);
            _str   = "";
            _str2  = "";
        for(_j=0; _j<_count; _j++)
        {
            _str1  = hex_str(_dl_seq[|_j]); // spell bit as string
            _str2 += _str1; // string of spell bits
            
            _str  += string_letters(val(g.dm_Spell[?_str1+STR_Name], STR_THUNDER));
            //_dm_1[?_dk_dialogue+"A"+
            if (_j==_count-1) break;//_j
            _str  += g.CHAR_END_LINE1;
        }
        _str1 = get_random_lorem_dlg(_count,true);
        
        
        // _dk2 = STR_Spell+STR_Sequence
        // _dk3 = STR_Spell+STR_Sequence+hex_str(_i)
        _dk4 = _dk2+STR_Dialogue+STR_Count;
        
        _dm_1[?_dk4] = val(_dm_1[?_dk4])+1;
        _dm_1[?_dk3+STR_Dialogue+STR_Datakey] = _dk_dialogue;
        _dm_1[?_dk_dialogue+"A"]  = _str1; // Hylian
        _dm_1[?_dk_dialogue+"B"]  = _str;  // Hylian Translated
        _dm_1[?_dk_dialogue+_dk2] = _str2; // string representing spells as spell bits. Example: "01"+"08"+"04"+"40"
        
        f.dm_quests[?_dk4] = val(f.dm_quests[?_dk4])+1;
        f.dm_quests[?_dk3+STR_Dialogue+STR_Hylian] = _str1; // Hylian
        f.dm_quests[?_dk3+STR_Dialogue]            = _str;  // Hylian Translated
        f.dm_quests[?_dk3]                         = _str2; // string representing spells as spell bits. Example: "01"+"08"+"04"+"40"
        
        g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+"A"]  = _str1; // Hylian
        g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+"B"]  = _str;  // Hylian Translated
        g.DIALOGUE_WINDOW.dm_dialogue[?_dk_dialogue+_dk2] = _str2; // string representing spells as spell bits. Example: "01"+"08"+"04"+"40"
        
        if(DEV && true){
        //if(_DEBUG1){
        _dbstr  = _dk_dialogue+"A: "+_str1+", ";
        _dbstr += _dk_dialogue+"B: "+_str+", ";
        _dbstr += _dk_dialogue+_dk2+": "+_str2;
        show_debug_message(_dbstr);
        }
    }
}
show_debug_message("");




ds_list_destroy(_dl_group1); _dl_group1=undefined;
ds_list_destroy(_dl_group2); _dl_group2=undefined;
ds_list_destroy(_dl_group3); _dl_group3=undefined;
ds_list_destroy(_dl_seq); _dl_seq=undefined;




var                     _return = undefined;
if (ds_map_size(_dm_1)) _return = json_encode(_dm_1);
ds_map_destroy( _dm_1); _dm_1=undefined;


return _return;




