/obj/item/gun/ballistic/automatic/ar/modular/m44a
	name = "\improper NT M44A Pulse Rifle"
	desc = "A specialized Nanotrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package."
	icon_state = "m44a"
	inhand_icon_state = "m44a"
	icon = 'modular_skyrat/modules/marines/icons/m44a.dmi'
	righthand_file = 'modular_skyrat/modules/marines/icons/m44a_r.dmi'
	lefthand_file = 'modular_skyrat/modules/marines/icons/m44a_l.dmi'
	fire_sound = 'modular_skyrat/modules/marines/sound/m44a.ogg'
	fire_delay = 1
	burst_size = 3
	spread = 6
	pin = /obj/item/firing_pin/implant/mindshield
	can_suppress = FALSE
	can_bayonet = FALSE
	mag_display = TRUE
	mag_display_ammo = FALSE
	mag_type = /obj/item/ammo_box/magazine/m44a
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT
	company_flag = COMPANY_NANOTRASEN

/obj/item/ammo_box/magazine/m44a
	name = "m44a magazine (.300 compressed)"
	desc = "This magazine uses a bluespace compression chamber to hold a maximum of ninety-nine .300 caliber caseless rounds for the M44A pulse rifle."
	icon = 'modular_skyrat/modules/marines/icons/m44a.dmi'
	icon_state = "300compressed"
	max_ammo = 99
	multiple_sprites = AMMO_BOX_FULL_EMPTY_BASIC
	ammo_type = /obj/item/ammo_casing/caseless/c300
	caliber = "300comp"

/obj/item/ammo_casing/caseless/c300
	name = ".300 caseless round"
	desc = "A .300 caseless round for proprietary Nanotrasen firearms."
	caliber = "300comp"
	projectile_type = /obj/projectile/bullet/a300

/obj/projectile/bullet/a300
	name = ".300 caseless bullet"
	damage = 28
	armour_penetration = 30 //gonna actually kill the brit that made this var require a U in armor
	embedding = null
	shrapnel_type = null

/obj/item/gun/ballistic/automatic/ar/modular/m44a/scoped
	name = "\improper NT M44AS Pulse Rifle"
	desc = "A specialized Nanotrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. This one's fitted with a long-range scope."
	icon_state = "m44a_s"
	inhand_icon_state = "m44a_s"

/obj/item/gun/ballistic/automatic/ar/modular/m44a/scoped/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2.2)

/obj/item/gun/ballistic/shotgun/automatic/as2/ubsg
	name = "\improper M2 auto-shotgun underbarrel"
	desc = "This shouldn't be heeere!"
	can_suppress = FALSE
	has_gun_safety = FALSE
	mag_type = /obj/item/ammo_box/magazine/internal/shot/as2/ubsg

/obj/item/ammo_box/magazine/internal/shot/as2/ubsg
	max_ammo = 3
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot

/obj/item/gun/ballistic/automatic/ar/modular/m44a/shotgun
	name = "\improper NT M44ASG Pulse Rifle"
	desc = "A specialized Nanotrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. This one's fitted with a two-round semi-automatic underbarrel 12 gauge shotgun."
	icon_state = "m44a_sg"
	inhand_icon_state = "m44a_sg"
	/// Reference to the underbarrel shotgun
	var/obj/item/gun/ballistic/shotgun/automatic/as2/ubsg/underbarrel

/obj/item/gun/ballistic/automatic/ar/modular/m44a/shotgun/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/shotgun/automatic/as2/ubsg(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/ar/modular/m44a/shotgun/afterattack_secondary(atom/target, mob/living/user, flag, params)
	underbarrel.afterattack(target, user, flag, params)
	return SECONDARY_ATTACK_CONTINUE_CHAIN

/obj/item/gun/ballistic/automatic/ar/modular/m44a/shotgun/attackby(obj/item/attacking_item, mob/user, params)
	if(!istype(attacking_item, /obj/item/ammo_casing))
		..()
	if(istype(attacking_item, underbarrel.magazine.ammo_type))
		underbarrel.attack_self(user)
		underbarrel.attackby(attacking_item, user, params)

/obj/item/gun/ballistic/automatic/ar/modular/m44a/grenadelauncher
	name = "\improper NT M44AGL Pulse Rifle"
	desc = "A specialized Nanotrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. This one's fitted with an underbarrel grenade launcher, and a red dot scope to help align it. Compensating for something?"
	icon_state = "m44a_gl"
	inhand_icon_state = "m44a_gl"
	/// Underbarrel grenade launcher reference
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel

/obj/item/gun/ballistic/automatic/ar/modular/m44a/grenadelauncher/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/ar/modular/m44a/grenadelauncher/afterattack_secondary(atom/target, mob/living/user, flag, params)
	underbarrel.afterattack(target, user, flag, params)
	return SECONDARY_ATTACK_CONTINUE_CHAIN

/obj/item/gun/ballistic/automatic/ar/modular/m44a/grenadelauncher/attackby(obj/item/attacking_item, mob/user, params)
	if(!istype(attacking_item, /obj/item/ammo_casing))
		..()
	if(istype(attacking_item, underbarrel.magazine.ammo_type))
		underbarrel.attack_self(user)
		underbarrel.attackby(attacking_item, user, params)
