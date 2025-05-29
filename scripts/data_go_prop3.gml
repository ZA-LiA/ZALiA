/// data_go_prop3(objver, *react PC Body, *react PC shield)


var                    _arg=0;
var _OBJVER = argument[_arg++];
// _OBJVER example: "MoblA01"
// "MoblA"01 is the resource object name.
// "Mobl"A01 is the "Moblin" enemy. 
// Mobl"A"01 is the type of "Moblin". 
// MoblA"01" is the version of that type

var                      _REACT_BODY   = -1; // 0: none/passive, 1: die/explode/disintegrate
if (argument_count>_arg) _REACT_BODY   = argument[_arg++];
//                                       //
var                      _REACT_SHIELD = -1; // Shield reaction
if (argument_count>_arg) _REACT_SHIELD = argument[_arg++];
//                                       //

if (_REACT_BODY>=0)   g.dm_go_prop[?_OBJVER+dk_ReactBody]   = _REACT_BODY;
if (_REACT_SHIELD>=0) g.dm_go_prop[?_OBJVER+dk_ReactShield] = _REACT_SHIELD;




