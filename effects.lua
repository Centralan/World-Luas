local world = World:new('survival3');
local world2 = World:new('creative');
local soundblock = Location:new(world, 0, 0, 0);

-- PaperName,Effect,speed,amount,Height

--------------
--- EFFECTS ---
--------------

local effects = {
	{"Molten Spewing", "LAVA", 0.1, 5, 2},
	{"Touch of End", "PORTAL", 1, 50, 1},
	{"Emerald Charm", "HAPPY_VILLAGER", 10, 30, 1},
	{"Molten Touch", "FLAME", 0.05, 20, 1},
	{"Opal Projection", "FIREWORKS_SPARK", 0.05, 10, 1},
	{"Slime Spray", "SLIME", 10, 100, 1},
	{"Rain Cloud", "SPLASH", 10, 100, 5},
	{"Rain Cloud", "CLOUD", 0.05, 20, 5},
        {"Mad Moosic", "NOTE", 10, 1, 2.5},
	{"Mad Moosic", "FIREWORKS_SPARK", 0.05, 20, -0.1},
        {"Shine of Sparkle", "END_ROD", 0.05, 10, 1},
        {"Love Wins", "HEART", 2, 50, 2},
        {"Love Wins", "DAMAGE_INDICATOR", 1, 1, 1},
        {"Magical Touch", "ENCHANTMENT_TABLE", -1, 20, 1},
        {"Magical Touch", "PORTAL", -1, 20, 1},
        {"Magical Touch", "MAGIC_CRIT", 1, 1, 1},
        {"Black Magic", "INSTANT_SPELL", 1, 50, -0.1},
        {"Black Magic", "WITCH_MAGIC", 1, 50, -0.1},
	{"Black Magic", "SPELL", 10, 30, 0},
	{"Hot Head", "SMOKE", 10, 0.1, 2},
	{"Hot Head", "FLAME", 10, 0.1, 1.9},
	{"Hot Head", "LAVA", 0.1, 1.5, 1.8},
	{"Hot Head", "FLAME", 0.05, 2, 0},
	{"Emerald Rain", "CLOUD", 0.05, 20, 5},
	{"Emerald Rain", "TOTEM", 0.05, 2, 5},
	{"Emerald Rain", "HAPPY_VILLAGER", 50, 10, 5},
	{"Barrier", "BARRIER", 50, 10, 2.4},
	{"Barrier", "BARRIER", 50, 10, 0},
};

function fireTick()
	processPlayers({world:getPlayers()});
        processPlayers({world2:getPlayers()});
        processPlayers1({world:getPlayers()});
        processPlayers2({world:getPlayers()});
        processPlayers3({world:getPlayers()});
        processPlayers4({world:getPlayers()});
        processPlayersK({world:getPlayers()});

end

function processPlayers(players)
	for index, playerName in pairs(players) do
		for key, effect in pairs(effects) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§3Effect: Â§b" .. effect[1]) then
						local world, x, y, z = player:getLocation();
						local playerLoc = Location:new(world, x, y + effect[5], z);
						playerLoc:playEffect(effect[2], effect[3], effect[4], 20);
					end
				end
			end
		end
	end
end

function processPlayers1(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Hat") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'BLINDNESS', 1, 10);					
				end
			end
		end
	end
end



function processPlayers2(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Chestplate") then
                                          local world, x, y, z = player:getLocation();
                                          player:setVelocity(0, -0.5, 0);					
				end
			end
		end
	end
end


function processPlayers3(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Pants") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'SLOW_DIGGING', 1, 10);					
				end
			end
		end
	end
end


function processPlayers4(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'LEVITATION', 3, 1);
                                          player:setVelocity(0, 0.1, 0);				
				end
			end
		end
	end
end

registerHook("BLOCK_GAINS_CURRENT", "fireTick", "survival3", 19526.0, 64.0, -20787.0);
