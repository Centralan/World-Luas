local world = World:new('survival3');
local world2 = World:new('creative');
local soundblock = Location:new(world, 0, 0, 0);
local portalcompass = Location:new(world, -30866, 17, 34836);

-----------------------------------
---       Player Proccessing    ---
-----------------------------------

function fireTick2()
	processPlayers({world:getPlayers()});
--        processPlayers({world2:getPlayers()});
        processPlayers1({world:getPlayers()});
        processPlayers2({world:getPlayers()});
        processPlayers3({world:getPlayers()});
        processPlayers4({world:getPlayers()});
        processPlayers5({world:getPlayers()});
        processPlayers6({world:getPlayers()});

end

-----------------------------------
---       Suspicious Armour     ---
-----------------------------------

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

-----------------------------------
---       Suspicious Items      ---
-----------------------------------

function processPlayers5(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Compass") then
                                          local world, x, y, z = player:getLocation();
                                          player:setCompassTarget(portalcompass);				
				end
			end
		end
	end
end

function processPlayers6(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§aOddly Bright Torch") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'NIGHT_VISION', 5, 60);				
				end
			end
		end
	end
end

-----------------------------------
---      Redstone Clock Hook    ---
-----------------------------------

registerHook("BLOCK_GAINS_CURRENT", "fireTick2", "survival3", -12781.0, 12.0, -12931.0);
