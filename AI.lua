local myWorld3 = World:new('survival3');
local myWorld2 = World:new('spawn2');
local myWorld4 = World:new('creative');
local survivalsound = Location:new(myWorld3, 0, 0, 0);
local creativesound = Location:new(myWorld4, 0, 0, 0);

------------------
---MUT Protocal---
------------------
--mut is in survival.lua (Time Control)
--mut2 is in survival.lua (Time Control)
local mut3 = '&3[?] &bDOG&f: May you have mercy on their soul.'
--mut4 is in creative.lua (Time Control)
--mut5 is in creative.lua (Time Control)
local mut6 = '&3[?] &bCAT&f: meow.'
local mut7 = '&3[?] &bCAT&f: &erolls over'
local mut8 = '&3[?] &bDOG&f: &erolls over'
local Message = ''

function survival_broadcast(msg)
	myWorld3:broadcast(msg);
end

function spawn2_broadcast(msg)
	myWorld2:broadcast(msg);
end

function creative_broadcast(msg)
	myWorld4:broadcast(msg);
end

-------------------
-----dog-----------
-------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end


function dog_smite(data)
	       local player = Player:new(data.player);
		     local message = data.message;
         if hasPrefix(message, "dog smite") then
		    local playerName = splitPlayerName(message, 16);
	            survival_broadcast(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
	            spawn2_broadcast(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                    creative_broadcast(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		    survivalsound:playSound('AMBIENCE_THUNDER', 100, 1);
		    creativesound:playSound('AMBIENCE_THUNDER', 100, 1);
	end
end
	
function dog_whine(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "pets dog") then
                local playerName = splitPlayerName(message, 16);
                survival_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                spawn2_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creative_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('WOLF_WHINE', 100, 1);
                survivalsound:playSound('WOLF_WHINE', 100, 1);

        end
end

function dog_glow(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "Glowstone Grief") then
                local playerName = splitPlayerName(message, 16);
                     survival_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                     spawn2_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                     creative_broadcast(mut8, "§6" .. player.name .. " has purchased daytime. Praise the sun!");

        end
end

registerHook("CHAT_MESSAGE", "dog_whine", "creative");
registerHook("CHAT_MESSAGE", "dog_whine", "survival3");
registerHook("CHAT_MESSAGE", "dog_smite", "survival3");
registerHook("CHAT_MESSAGE", "dog_smite", "creative");
registerHook("CHAT_MESSAGE", "dog_glow", "creative");
registerHook("CHAT_MESSAGE", "dog_glow", "survival3");



-------------------
-----cat-----------
-------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end

  function cat_meow(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "cat hi") then
                local playerName = splitPlayerName(message, 16);
                survival_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creative_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                spawn2_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_MEOW', 100, 1);
                survivalsound:playSound('CAT_MEOW', 100, 1);

        end
end

function cat_meow2(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "hi cat") then
                local playerName = splitPlayerName(message, 16);
                survival_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creative_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                spawn2_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_MEOW', 100, 1);
                survivalsound:playSound('CAT_MEOW', 100, 1);

        end
end

function cat_purr(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "pets cat") then
                local playerName = splitPlayerName(message, 16);
                survival_broadcast(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creative_broadcast(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                spawn2_broadcast(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_PURR', 100, 1);
                survivalsound:playSound('CAT_PURR', 100, 1);

        end
end
  
registerHook("CHAT_MESSAGE", "cat_purr", "creative");
registerHook("CHAT_MESSAGE", "cat_purr", "survival3");
registerHook("CHAT_MESSAGE", "cat_meow", "creative");
registerHook("CHAT_MESSAGE", "cat_meow2", "creative");
registerHook("CHAT_MESSAGE", "cat_meow", "survival3");
registerHook("CHAT_MESSAGE", "cat_meow2", "survival3");
  

