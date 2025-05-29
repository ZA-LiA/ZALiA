/// GO_set_prop_values()


var _OBJVER = object_get_name(object_index)+hex_str(ver);


brightness    = val(g.dm_go_prop[?_OBJVER+STR_Brightness], brightness);


BodyHB_IDX    = val(g.dm_go_prop[?_OBJVER+STR_BodyHB]);
BodyHB_idx    = BodyHB_IDX;

CS_OFF_IDX    = val(g.dm_go_prop[?_OBJVER+STR_CS_Off]);
cs_off_idx    = CS_OFF_IDX;

ATTACK_LEVEL  = val(g.dm_go_prop[?_OBJVER+dk_AttackLevel]);
attack_level  = ATTACK_LEVEL;

RESPAWN_TYPE  = val(g.dm_go_prop[?_OBJVER+STR_Respawn]);
respawn_type  = RESPAWN_TYPE;

DROP_BITS     = val(g.dm_go_prop[?_OBJVER+STR_Drop]);
drop_bits     = DROP_BITS;

REACT_SWORD   = val(g.dm_go_prop[?_OBJVER+dk_ReactSword]);
react_sword   = REACT_SWORD;

REACT_PROJ    = val(g.dm_go_prop[?_OBJVER+dk_ReactProj]);
react_proj    = REACT_PROJ;

REACT_THUNDER = val(g.dm_go_prop[?_OBJVER+dk_ReactThun]);
react_thunder = REACT_THUNDER;

REACT_SPELL   = val(g.dm_go_prop[?_OBJVER+dk_ReactEnigma]);
react_spell   = REACT_SPELL;

XP_DRAIN      = val(g.dm_go_prop[?_OBJVER+STR_XP_Drain]);
xp_drain      = XP_DRAIN;


HP_IDX        = val(g.dm_go_prop[?_OBJVER+STR_HP]);
hp            = g.dl_HP[|HP_IDX];

XP_IDX        = val(g.dm_go_prop[?_OBJVER+STR_XP]);
xp            = g.dl_XP[|XP_IDX];




// Typically for Projectile
REACT_BODY    = val(g.dm_go_prop[?_OBJVER+dk_ReactBody]);
react_body    = REACT_BODY;

REACT_SHIELD  = val(g.dm_go_prop[?_OBJVER+dk_ReactShield]);
react_shield  = REACT_SHIELD;



return _OBJVER;




