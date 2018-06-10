local require = GLOBAL.require

local day_amt = GetModConfigData("day_interval")
local food_amt = GetModConfigData("food_amt")

local sanity_amt = GetModConfigData("sanity_amt")
local combat_amt = GetModConfigData("combat_amt")
local defense_amt = GetModConfigData("defense_amt")
local heals_amt = GetModConfigData("heals_amt")
local random_amt = GetModConfigData("random_amt")
local main_amt = GetModConfigData("main_amt")
local minerals_amt = GetModConfigData("minerals_amt")

local sanity_chance = GetModConfigData("sanity_chance")
local combat_chance = GetModConfigData("combat_chance")
local defense_chance = GetModConfigData("defense_chance")
local heals_chance = GetModConfigData("heals_chance")
local random_chance = GetModConfigData("random_chance")
local main_chance = GetModConfigData("main_chance")
local minerals_chance = GetModConfigData("minerals_chance")

local range = GetModConfigData("drop_range")
local category_amt = GetModConfigData("category_amt")
local pit_distance = GetModConfigData("pit_distance")

local itemcategory = require "itemcategory"
local itemdistribution = require "itemdistribution"

foodCategory = itemcategory.ConvertToEfficientArray(itemcategory.food_items)
sanityCategory = itemcategory.ConvertToEfficientArray(itemcategory.sanity_items)
combatCategory = itemcategory.ConvertToEfficientArray(itemcategory.combat_items)
defenseCategory = itemcategory.ConvertToEfficientArray(itemcategory.defense_items)
healsCategory = itemcategory.ConvertToEfficientArray(itemcategory.heals_items)
randomCategory = itemcategory.ConvertToEfficientArray(itemcategory.random_items)
mainCategory = itemcategory.ConvertToEfficientArray(itemcategory.main_items)
mineralsCategory = itemcategory.ConvertToEfficientArray(itemcategory.mineral_items)

Categories = {
	["sanity"] = sanityCategory,
	["combat"] = combatCategory,
	["defense"] = defenseCategory,
	["heals"] = healsCategory,
	["random"] = randomCategory,
	["main"] = mainCategory,
	["minerals"] = mineralsCategory
}

CategoryNumber = {
	["sanity"] = sanity_chance,
	["combat"] = combat_chance,
	["defense"] = defense_chance,
	["heals"] = heals_chance,
	["random"] = random_chance,
	["main"] = main_chance,
	["minerals"] = minerals_chance,
}

CategoryAmount = {
	["sanity"] = sanity_amt,
	["combat"] = combat_amt,
	["defense"] = defense_amt,
	["heals"] = heals_amt,
	["random"] = random_amt,
	["main"] = main_amt,
	["minerals"] = minerals_amt,
}

EfficientCategory = itemcategory.ConvertToEfficientArray(CategoryNumber)
day_count = 0

local function DropItemsFromArray(inst, randomItemArray)
	for i = 1, table.getn(randomItemArray), 1
	do
		local k = randomItemArray[i]
		local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
		local offset = (GLOBAL.FindWalkableOffset(pos,math.random()*GLOBAL.PI*2, (math.random() * (range - 2)) + 2, false))
		if offset == nil then
	       	return
		end
		pos = pos+offset
		local unit1 = GLOBAL.SpawnPrefab(k)
		unit1.Transform:SetPosition(pos:Get())
	end
end

local function CreateDrops(inst, user_amt)
	local pulledCategories = itemdistribution.CreateRandomItemArray(user_amt * category_amt, EfficientCategory)
	for i = 1, table.getn(pulledCategories), 1
	do
		local k = pulledCategories[i]
		local pulledItems = itemdistribution.CreateRandomItemArray(math.random(0, user_amt * CategoryAmount[k]), Categories[k])
		DropItemsFromArray(inst, pulledItems)
	end
end

local function DropFood(inst, user_amt)
	local pulledItems = itemdistribution.CreateRandomItemArray(math.random(0, user_amt * food_amt), foodCategory)
	DropItemsFromArray(inst, pulledItems)
end

local function DropSupplyCrate(inst)
	local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
	local all_nearby_players = GLOBAL.FindPlayersInRange(pos.x, pos.y, pos.z, pit_distance, true)
	local playerNum = table.getn(all_nearby_players)
	if playerNum > 0 then
		if GLOBAL.GetClosestInstWithTag("campfire", inst, pit_distance * 2) == nil then
			GLOBAL.TheNet:Announce(all_nearby_players[math.random(1, playerNum)]:GetDisplayName() .. " calls out for yo boi Thingymajigger. Thingymajigger gave you some of that good stuff in yo pit. Get em boi.")
			DropFood(inst, playerNum)
			CreateDrops(inst, playerNum)
		else
			GLOBAL.TheNet:Announce("Yo boi Mike Wallace don't like the double firepit you got there. Git outta here with that weak shit.")
		end
	end
end

-- Function that applies the new damage to the combat component of the balloon
function AddSupplyDropEvent(inst)
	inst:WatchWorldState("startday", DropSupplyCrate)
end

-- Function that runs the function ChangeDamage on the prefab named "balloon"
-- which are Wes' balloons when they spawn
day_count = 0
AddPrefabPostInit("firepit", AddSupplyDropEvent)