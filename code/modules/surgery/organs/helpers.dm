/**
 * Get the organ object from the mob matching the passed in typepath
 *
 * Arguments:
 * * typepath The typepath of the organ to get
 */
/mob/proc/getorgan(typepath)
	return

/**
 * Get organ objects by zone
 *
 * This will return a list of all the organs that are relevant to the zone that is passedin
 *
 * Arguments:
 * * zone [a BODY_ZONE_X define](https://github.com/DaedalusDock/Gameserver/blob/master/code/__DEFINES/combat.dm#L187-L200)
 */
/mob/proc/getorganszone(zone)
	return
/**
 * Returns a list of all organs in specified slot
 *
 * Arguments:
 * * slot Slot to get the organs from
 */
/mob/proc/getorganslot(slot)
	return

/mob/living/carbon/getorgan(typepath)
	return (locate(typepath) in internal_organs + external_organs)


/mob/living/carbon/getorganszone(zone, subzones = FALSE, externals = FALSE)
	var/list/returnorg = list()
	if(subzones)
		// Include subzones - groin for chest, eyes and mouth for head
		if(zone == BODY_ZONE_HEAD)
			returnorg = getorganszone(BODY_ZONE_PRECISE_EYES, FALSE, externals) + getorganszone(BODY_ZONE_PRECISE_MOUTH, FALSE, externals)
		if(zone == BODY_ZONE_CHEST)
			returnorg = getorganszone(BODY_ZONE_PRECISE_GROIN, FALSE, externals)

	for(var/obj/item/organ/organ as anything in (externals ? internal_organs + external_organs : internal_organs))
		if(zone == organ.zone)
			returnorg += organ
	return returnorg

/mob/living/carbon/getorganslot(slot)
	. = internal_organs_slot[slot]
	if(!.)
		return external_organs_slot[slot]

