/// NPC_D_init2()

// Shop NPC


var _i, _a, _val, _x,_y, _count;
var _datakey;


sprite_datakey = STR_Jack; // STR_Jack: Fat man,   STR_Bill: Skinny man
Product1_OBJ   = 0;
Product2_OBJ   = 0;
Product3_OBJ   = 0;
Product1_COST  = 10;
Product1_COST2 = Product1_COST >>1;
Product1_COST3 = Product1_COST2>>1;
Product1_cost  = Product1_COST;
Product2_COST  = 10;
Product3_COST  = 10;

switch(ver)
{
    case 1:{
    Product1_OBJ  = val(g.dm_ITEM[?hex_str(ITM_MAP2)+STR_Object],ItmK9); // MAP2
    Product1_COST = MAP2_PRICE;
    
    if (val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]))
    {
        Product1_COST = val(f.dm_rando[?STR_Map+"2"+STR_Cost], Product1_COST);
    }
    break;}
    
    case 2:{
    Product1_OBJ  = val(g.dm_ITEM[?hex_str(ITM_MAP1)+STR_Object],ItmK8); // MAP1
    Product1_COST = MAP1_PRICE;
    
    if (val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]))
    {
        Product1_COST = val(f.dm_rando[?STR_Map+"1"+STR_Cost], Product1_COST);
    }
    break;}
}

// Bargaining costs
_val = 20;
Product1_COST2 = max(_val,    Product1_COST >>1);
Product1_COST3 = max(_val>>1, Product1_COST2>>1);
Product1_cost  = Product1_COST;

Bargaining_ENABLED = true;
//Bargaining_ENABLED = false;




GO_sprite_init(NPC_get_init_sprite(id));
update_body_hb_1a();


                   _a=1;
SUB_STATE_IDLE1  = _a++;
SUB_STATE_IDLE2  = _a++; // After sale completed
SUB_STATE_OFFER  = _a++;
SUB_STATE_LOWP   = _a++;
SUB_STATE_UNLOCK = _a++;
sub_state        = SUB_STATE_IDLE1;


hspd = 0;


//DLG_KEY_A = dialogue_datakey+"A";
//var _DATAKEY  = DLG_KEY_A;
//DIALOGUE_BASE = g.DIALOGUE_WINDOW.dm_dialogue[?_DATAKEY];


ITEM_BIT =  val(g.dm_ITEM[?object_get_name(Product1_OBJ)+STR_Bit]);


Merchant_NUM = val(g.dm_spawn[?dk_spawn+STR_Merchant+STR_Num]);
// Because dk_spawn can change while in dev, 
// why not check by g.rm_name..
for(_i=val(g.dm_spawn[?STR_Merchant+STR_Count]); _i>=1; _i--)
{
    if(!is_undefined(g.dm_spawn[?STR_Merchant+hex_str(_i)+STR_Rm+STR_Name]) 
    &&  g.rm_name == g.dm_spawn[?STR_Merchant+hex_str(_i)+STR_Rm+STR_Name] )
    {
        Merchant_NUM = _i;
        break;
    }
}



_datakey = STR_Merchant+hex_str(Merchant_NUM);
OfferDeclined_DATAKEY = _datakey+"_OfferDeclined";

Paid_DATAKEY = _datakey+"01"+STR_Paid;

if (val(f.dm_quests[?Paid_DATAKEY])) // if already paid
{
    timer     = 0;
    sub_state = SUB_STATE_IDLE2;
}
else
{
    var _CLM = $25;
    var _ROW = g.rm_row0+$16;
    _x = (_CLM<<3)+4;
    _y =  _ROW<<3;
    GameObject_create(_x,_y, LoDoA,3);
}




