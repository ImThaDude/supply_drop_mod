local itemcategory = {}

itemcategory.food_items = {
	["meat_dried"] = 3,
	["monstermeat"] = 3,
	["berries"] = 5,
	["tallbirdegg"] = 1
}

itemcategory.sanity_items = {
	["icecream"] = 1,
	["watermelonicle"] = 1,
	["taffy"] = 1,
	["pumpkincookie"] = 1,
	["cactus_meat_cooked"] = 1
}

itemcategory.combat_items = {
	["hambat"] = 3,
	["blowdart_pipe"] = 5,
	["blowdart_fire"] = 1,
	["blowdart_sleep"] = 1,
	["blowdart_yellow"] = 1,
	["boomerang"] = 3,
	["tentaclespike"] = 3,
	["firestaff"] = 1,
	["icestaff"] = 1
}

itemcategory.defense_items = {
	["footballhat"] = 5,
	["armorwood"] = 4,
	["armormarble"] = 1
}

itemcategory.heals_items = {
	["amulet"] = 2,
	["reviver"] = 4,
	["lifeinjector"] = 2,
	["spidergland"] = 1,
	["butterflywings"] = 1,
	["bandage"] = 2,
	["healingsalve"] = 2
}

itemcategory.random_items = {
	["houndstooth"] = 3,
	["silk"] = 10,
	["nightmarefuel"] = 6,
	["livinglog"] = 3,
	["panflute"] = 1,
	["tentaclespots"] = 1,
	["trinket_1"] = 1,
	["trinket_4"] = 1,
	["trinket_8"] = 1,
	["trinket_12"] = 1,
	["trinket_16"] = 1,
	["trinket_19"] = 1,
	["trinket_21"] = 1,
	["trinket_25"] = 1,
	["trinket_28"] = 1,
	["trinket_31"] = 1,
	["trinket_35"] = 1,
	["trinket_38"] = 1
}

itemcategory.main_items = {
	["flint"] = 1,
	["rocks"] = 2,
	["cutgrass"] = 2,
	["twigs"] = 2
}

itemcategory.mineral_items = {
	["marble"] = 3,
	["goldnugget"] = 4,
	["redgem"] = 3,
	["bluegem"] = 3,
	["purplegem"] = 1,
	["orangegem"] = 1,
	["yellowgem"] = 1,
	["greengem"] = 1
}

function itemcategory.ConvertToEfficientArray(configArray)
	local efficientArray = {}
	local count = 1
	for k,v in pairs(configArray)
	do
		for i = 0, v - 1, 1
		do
			efficientArray[count + i] = k
		end
		count = count + v
	end
	return efficientArray
end

return itemcategory