-- Get balloon damage from mod configuration
local day_amt = GetModConfigData("day_interval")
local food_amt = GetModConfigData("food_amt")
local armor_amt = GetModConfigData("armor_amt")
local hambat_amt = GetModConfigData("hambat_amt")
local lives_amt = GetModConfigData("lives_amt")
local range = 4
day_count = 0
announced1 = false;
announced2 = false;
announced3 = false;
announced4 = false;

local function DropSupplyCrate(inst)
	if GLOBAL.TheWorld.state.isnight then
		if day_count % day_amt == 0 then
			
			day_count = day_count + 1			

			if GLOBAL.GetClosestInstWithTag("campfire", inst, 10) == nil then
				
				local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
				local all_nearby_players = GLOBAL.FindPlayersInRange(pos.x, pos.y, pos.z, 5, true)
				local playerNum = table.getn(all_nearby_players)
				
				if playerNum > 0 then
					if not announced1 then
						GLOBAL.TheNet:Announce(all_nearby_players[math.random(1, playerNum)]:GetDisplayName() .. " calls out for yo boi Thingymajigger. Thingymajigger gave you some of that good stuff in yo pit. Get em boi.")
						announced1 = true
						end
				
					local amta = math.random(0, playerNum * food_amt)
					local amtb = math.random(0, playerNum * armor_amt)
					local amtc = math.random(0, playerNum * hambat_amt)
					local amtd = math.random(0, playerNum * lives_amt)
				
					for i = 0, amta, 1
					do
						local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
						local offset = (GLOBAL.FindWalkableOffset(pos,math.random()*GLOBAL.PI*2, range, false))
						if offset == nil then
						       	return
							end
						pos=pos+offset
						local unit1= GLOBAL.SpawnPrefab("meat_dried")
						unit1.Transform:SetPosition(pos:Get())
						end
				
					for i = 1, amtb, 1
					do
						local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
						local offset = (GLOBAL.FindWalkableOffset(pos,math.random()*GLOBAL.PI*2, range, false))
						if offset == nil then
			       				return
							end
						pos=pos+offset
						local unit2= GLOBAL.SpawnPrefab("footballhat")
						unit2.Transform:SetPosition(pos:Get())
						end
				
					for i = 1, amtc, 1
					do
						local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
						local offset = (GLOBAL.FindWalkableOffset(pos,math.random()*GLOBAL.PI*2, range, false))
						if offset == nil then
						       	return
							end
						pos=pos+offset
						local unit3= GLOBAL.SpawnPrefab("hambat")
						unit3.Transform:SetPosition(pos:Get())
						end
				
					for i = 1, amtd, 1
					do
						local pos = GLOBAL.Vector3(inst.Transform:GetWorldPosition())
						local offset = (GLOBAL.FindWalkableOffset(pos,math.random()*GLOBAL.PI*2, range, false))
						if offset == nil then
						       	return
							end
						pos=pos+offset
						local unit4= GLOBAL.SpawnPrefab("amulet")
						unit4.Transform:SetPosition(pos:Get())
						end
				else
					if not announced1 then
						GLOBAL.TheNet:Announce("Thingymajigger was alone. Nobody went to the party. Then he cri.")
						announced1 = true
						end
					end
			else
				if not announced2 then
					GLOBAL.TheNet:Announce("Yo boi Thingymajigger don't like the double firepit you got there. Git outta here with that weak shit.")
					announced2 = true
					end
				end
		elseif day_count + 1 % day_amt == 0 then
			if not announced4 then
				GLOBAL.TheNet:Announce("Yo boi Thingymajigger likes what you guys are up to. Gather around the fire t'morow night.")
				announced4 = true
				end
			day_count = day_count + 1
		else
			day_count = day_count + 1
			end
	elseif GLOBAL.TheWorld.state.isdusk then
		if day_count + 1 % day_amt == 0 then
			if not announced3 then
				GLOBAL.TheNet:Announce("Yo boi Thingymajigger wants to know if you bois are meeting at the pit tonite.")
				announced3 = true
				end
			end
	elseif GLOBAL.TheWorld.state.isday then
		announced1 = false
		announced2 = false
		announced3 = false
		announced4 = false
		end
	end

-- Function that applies the new damage to the combat component of the balloon
function AddSupplyDropEvent(inst)
	inst:WatchWorldState("phase", DropSupplyCrate)
end

-- Function that runs the function ChangeDamage on the prefab named "balloon"
-- which are Wes' balloons when they spawn
day_count = 0
AddPrefabPostInit("firepit", AddSupplyDropEvent)