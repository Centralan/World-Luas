-- This is a fix for the creative -> spawn inventory bug.
-- Do not remove it and do not remove the associated region.

local timer = Timer:new("forceMode", 1);
local timerClean = Timer:new("worldClean", 2);
local world = World:new("survival3");
local knownPlayers = {};
local sendSpot = Location:new(world, -1602, 84, -348); --New spawn coords, dnd_exploit_fix_region (whole spawn)

function forceMode()
	local players = {world:getPlayers()};

	for index, playerName in pairs(players) do
		if knownPlayers[playerName] == nil then
			local player = Player:new(playerName);
			player:teleport(sendSpot);
			knownPlayers[playerName] = true;
		end
	end
end

function worldClean()
	local worldPlayers = {world:getPlayers()};
	local players = {};

	for index, playerName in ipairs(worldPlayers) do
		players[playerName] = true;
	end

	for playerName, value in ipairs(knownPlayers) do
		if players[playerName] == nil then
			knownPlayers[playerName] = nil;
		end
	end
end

timer:startRepeating();
timerClean:startRepeating();

local nether = World:new("survival3_nether");
local world = World:new("survival3");
local netherroof = Location:new(world, 19503.0, 72.0, -20790.0);
netherroof:setYaw(-90.6);
netherroof:setPitch(-11.6);

function nether_roof(data)
             local player = Player:new(data.player);
             player:teleport(netherroof);
end

registerHook("REGION_ENTER", "nether_roof", "survival3_nether-nether_roof");
