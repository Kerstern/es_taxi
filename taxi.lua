-- Configure the coordinates where the taxi cabs should be placed.
local cabs = {
   { hash=0xC703DB5F, x=918.592, y=-166.732, z=74.250, a=100.938 },
   { hash=0xC703DB5F, x=917.207, y=-171.100, z=74.489, a=85.422 },
  }

	-- Configure the coordinates where the taxi cabs should be placed.
local peds = {
  {type=4, hash=0xe52e126c, x=894.422, y=-182.196, z=74.700, a=269.449},
  {type=4, hash=0xe52e126c, x=895.422, y=-180.234, z=74.700, a=260.402},
  {type=4, hash=0xe52e126c, x=900.742, y=-174.138, z=73.936, a=265.213},
  }

AddEventHandler('onClientMapStart', function()
RequestModel(0xC703DB5F)
while not HasModelLoaded(0xC703DB5F) do
	Wait(1)
end

RequestModel(0xe52e126c)
while not HasModelLoaded(0xe52e126c) do
	Wait(1)
end

-- Set a blip on the map for Downtown Cab
downtownc = AddBlipForCoord(900.461, -181.466, 73.89)
SetBlipSprite(downtownc, 50)
SetBlipDisplay(downtownc, 3)
SetBlipNameFromTextFile(downtownc, "TXM_BLIP")

-- Spawn the taxi cab to DownTown Cab
for _, item in pairs(cabs) do
	cab =  CreateVehicle(item.hash, item.x, item.y, item.z, item.a, false, false)
	SetVehicleOnGroundProperly(cab)
end

-- Spawn the gang members to the coordinates (testing)
for _, item in pairs(peds) do
	ped = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
	GiveWeaponToPed(ped, 0x1B06D571, 2800, false, true)
	SetPedCombatAttributes(ped, 46, true)
	SetPedFleeAttributes(ped, 0, 0)
	SetPedArmour(ped, 100)
	SetPedMaxHealth(ped, 100)
	SetPedRelationshipGroupHash(ped, GetHashKey("GANG_1"))
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_PATROL", 0, true)
	SetPedCanRagdoll(ped, false)
	SetPedDiesWhenInjured(ped, false)
	end

end)
