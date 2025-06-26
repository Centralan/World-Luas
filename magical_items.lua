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
	processPlayersTide({world:getPlayers()});
	processPlayersBark({world:getPlayers()});
	processPlayersSuper({world:getPlayers()});
	processPlayersAlex({world:getPlayers()});
	processPlayersBudder({world:getPlayers()});
	processPlayersKaos({world:getPlayers()});

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
---         Tide Turner         ---
-----------------------------------

function processPlayersTide(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§bÂ§lTide Turner Helmet") then
					if player:hasItemWithName("Â§bÂ§lTide Turner Chestplate") then
					if player:hasItemWithName("Â§bÂ§lTide Turner Leggings") then
					if player:hasItemWithName("Â§bÂ§lTide Turner Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'WATER_BREATHING', 1, 10);	
                                            end
                                        end
                                     end				
				end
			end
		end
	end
end

-----------------------------------
---          Barkbound          ---
-----------------------------------

function processPlayersBark(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§2Â§lBarkbound Helmet") then
					if player:hasItemWithName("Â§2Â§lBarkbound Chestplate") then
					if player:hasItemWithName("Â§2Â§lBarkbound Leggings") then
					if player:hasItemWithName("Â§2Â§lBarkbound Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'DAMAGE_RESISTANCE', 1, 10);	
                                            end
                                        end
                                     end				
				end
			end
		end
	end
end

-----------------------------------
---         Super Steve         ---
-----------------------------------

function processPlayersSuper(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§aÂ§lSuper Steve Helmet") then
					if player:hasItemWithName("Â§aÂ§lSuper Steve Shirt") then
					if player:hasItemWithName("Â§aÂ§lSuper Steve Pants") then
					if player:hasItemWithName("Â§aÂ§lSuper Steve Shoes") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'ABSORPTION', 1, 10);	
                                            end
                                        end
                                     end				
				end
			end
		end
	end
end


-----------------------------------
---         Archer Alex         ---
-----------------------------------

function processPlayersAlex(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§aÂ§lArcher Alex Cap") then
					if player:hasItemWithName("Â§aÂ§lArcher Alex Shirt") then
					if player:hasItemWithName("Â§aÂ§lArcher Alex Pants") then
					if player:hasItemWithName("Â§aÂ§lArcher Alex Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'INCREASE_DAMAGE', 1, 10);
                                            end
                                        end
                                     end					
				end
			end
		end
	end
end

-----------------------------------
---        Better Budder        ---
-----------------------------------

function processPlayersBudder(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§eÂ§lBetter Budder Helmet") then
					if player:hasItemWithName("Â§eÂ§lBetter Budder Chestplate") then
					if player:hasItemWithName("Â§eÂ§lBetter Budder Leggings") then
					if player:hasItemWithName("Â§eÂ§lBetter Budder Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'SATURATION', 1, 10);	
                                            end
                                        end
                                     end				
				end
			end
		end
	end
end

-----------------------------------
---         Kaos Knight         ---
-----------------------------------

function processPlayersKaos(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§cÂ§lKaos Knight Helmet") then
					if player:hasItemWithName("Â§cÂ§lKaos Knight Chestplate") then
					if player:hasItemWithName("Â§cÂ§lKaos Knight Leggings") then
					if player:hasItemWithName("Â§cÂ§lKaos Knight Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'FIRE_RESISTANCE', 1, 10);	
                                            end
                                        end
                                     end				
				end
			end
		end
	end
end

-----------------------------------
---      Redstone Clock Hook    ---
-----------------------------------

registerHook("BLOCK_GAINS_CURRENT", "fireTick2", "survival3", -12781.0, 12.0, -12931.0);
