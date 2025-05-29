/// data_go_prop2(objver, *palette idx, *body hb id, *cs off id, *hp idx, *atk lvl, *xp idx, *respawn, *drop id, *react sword, *react proj, *react THUNDER, *react SPELL, *xp drain)


var                    _arg=0;
var _OBJVER = argument[_arg++];
// _OBJVER example: "MoblA01"
// "MoblA"01 is the resource object name.
// "Mobl"A01 is the "Moblin" enemy. 
// Mobl"A"01 is the type of "Moblin". 
// MoblA"01" is the version of that type


var                      _PALIDX   = -1; // The palette index
if (argument_count>_arg) _PALIDX   = argument[_arg++];
//                                                      //
var                      _BODY_HB  = -1; // The clm of g.dg_BODY_HB
if (argument_count>_arg) _BODY_HB  = argument[_arg++];
//                                                      //
var                      _CS_OFF   = -1; // 0, 1, 2... Which set of cs offsets to use
if (argument_count>_arg) _CS_OFF   = argument[_arg++];
//                                                      //
var                      _HP_IDX   = -1; // index of g.dl_HP
if (argument_count>_arg) _HP_IDX   = argument[_arg++];
//                                                      //
var                      _ATK_LVL  = -1; // The row of g.dg_enemy_atk_dmg
if (argument_count>_arg) _ATK_LVL  = argument[_arg++];
//                                                      //
var                      _XP_IDX   = -1; // The index of g.dl_xp
if (argument_count>_arg) _XP_IDX   = argument[_arg++];
//                                                      //
var                      _RESPAWN  = -1; // 0: never, 1: refresh area, 2: unlim, 3: refresh rm
if (argument_count>_arg) _RESPAWN  = argument[_arg++];
//                                                      //
var                      _DROP_ID  = -1; // 0: none, 1: small, 2: big
if (argument_count>_arg) _DROP_ID  = argument[_arg++];
//                                                      //
var                      _REACT_SW = -1; // Which PC sword attack can dmg. Bits - 0: none, 1: High, 2: Low, 4: DThrust, 8: UThrust, 
if (argument_count>_arg) _REACT_SW = argument[_arg++];
//                                                      //
var                      _REACT_PR = -1; // Which PC projtile attack can dmg. Bits - 0: none, 1: Beam, 2: FIRE, 4: , 8: , 
if (argument_count>_arg) _REACT_PR = argument[_arg++];
//                                                      //
var                      _REACT_TH = -1; // THUNDER dmg id. 0: none, 1: All hp, 2: $32, 3: $02, 4: $, 
if (argument_count>_arg) _REACT_TH = argument[_arg++];
//                                                      //
var                      _REACT_SP = -1; // Reaction to SPELL. 0: none, 1: Turn to Bot, 2: Turn to Ache, 3: Turn to fairy
if (argument_count>_arg) _REACT_SP = argument[_arg++];
//                                                      //
var                      _XPDRAIN  = -1; // 0: none, 1: 10, 2: 20
if (argument_count>_arg) _XPDRAIN  = argument[_arg++];
//                                                      //
var                      _BRIGHT   = -1; // 0: none, 1: 10, 2: 20
if (argument_count>_arg) _BRIGHT   = argument[_arg++];
//                                                      //



if (_PALIDX  >=0) g.dm_go_prop[?_OBJVER+STR_pal_idx]     = _PALIDX;
if (_BODY_HB >=0) g.dm_go_prop[?_OBJVER+STR_BodyHB]     = _BODY_HB;
if (_CS_OFF  >=0) g.dm_go_prop[?_OBJVER+STR_CS_Off]      = _CS_OFF;
if (_HP_IDX  >=0) g.dm_go_prop[?_OBJVER+STR_HP]          = _HP_IDX;
if (_ATK_LVL >=0) g.dm_go_prop[?_OBJVER+dk_AttackLevel]     = _ATK_LVL;
if (_XP_IDX  >=0) g.dm_go_prop[?_OBJVER+STR_XP]          = _XP_IDX;
if (_RESPAWN >=0) g.dm_go_prop[?_OBJVER+STR_Respawn]     = _RESPAWN;
if (_DROP_ID >=0) g.dm_go_prop[?_OBJVER+STR_Drop]        = _DROP_ID;
if (_REACT_SW>=0) g.dm_go_prop[?_OBJVER+dk_ReactSword]   = _REACT_SW;
if (_REACT_PR>=0) g.dm_go_prop[?_OBJVER+dk_ReactProj]    = _REACT_PR;
if (_REACT_TH>=0) g.dm_go_prop[?_OBJVER+dk_ReactThun]    = _REACT_TH;
if (_REACT_SP>=0) g.dm_go_prop[?_OBJVER+dk_ReactEnigma]  = _REACT_SP;
if (_XPDRAIN >=0) g.dm_go_prop[?_OBJVER+STR_XP_Drain]    = _XPDRAIN;
if (_BRIGHT  >=0) g.dm_go_prop[?_OBJVER+STR_Brightness]  = _BRIGHT;





var             _OBJ = val(g.dm_go_prop[?_OBJVER+STR_Object+STR_Idx], noone);
if (            _OBJ 
&&  is_ancestor(_OBJ,Enemy) 
&& !is_ancestor(_OBJ,Boss) 
&& !is_ancestor(_OBJ,Kakusu) 
&&  ds_list_find_index(g.dl_Enemy_OBJVER,_OBJVER)==-1)
{   ds_list_add(       g.dl_Enemy_OBJVER,_OBJVER);  }




