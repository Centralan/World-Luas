local myWorld4 = World:new('creative');
local creativesound = Location:new(myWorld4, 0, 0, 0);



---------
---AI---
---------

local mut4 = '&3[?] &bCAT&f: A player has made it day!'
local mut5 = '&3[?] &bCAT&f: A player has made it night'
local Message = ''



function c_broadcast(msg)
	myWorld4:broadcast(msg);
end

----------------------------------
------------chat mon--------------
----------------------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end


function cat_day(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "cat day") then
		local playerName = splitPlayerName(message, 16);
		player:sendMessage("§aIt's now daytime!");
	        c_broadcast(mut4, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myworld4:setTime(0);
	end
end

function cat_night(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "cat night") then
		local playerName = splitPlayerName(message, 16);
		player:sendMessage("§aIt's now nighttime!");
	        c_broadcast(mut5, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myworld4:setTime(14000);
	end
end


function cat_meow(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "cat hi") then
                local playerName = splitPlayerName(message, 16);
                c_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast2(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast3(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_MEOW', 100, 1);
                survivalsound:playSound('CAT_MEOW', 100, 1);

        end
end

function cat_meow2(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "hi cat") then
                local playerName = splitPlayerName(message, 16);
                c_broadcast(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast2(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast3(mut6, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_MEOW', 100, 1);
                survivalsound:playSound('CAT_MEOW', 100, 1);

        end
end

function cat_purr(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "pets cat") then
                local playerName = splitPlayerName(message, 16);
                c_broadcast(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast2(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                c_broadcast3(mut7, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('CAT_PURR', 100, 1);
                survivalsound:playSound('CAT_PURR', 100, 1);

        end
end

registerHook("CHAT_MESSAGE", "cat_purr", "creative");
registerHook("CHAT_MESSAGE", "cat_purr", "survival3");
registerHook("CHAT_MESSAGE", "cat_day", "creative");
registerHook("CHAT_MESSAGE", "cat_night", "creative");
registerHook("CHAT_MESSAGE", "cat_meow", "creative");
registerHook("CHAT_MESSAGE", "cat_meow2", "creative");
registerHook("CHAT_MESSAGE", "cat_meow", "survival3");
registerHook("CHAT_MESSAGE", "cat_meow2", "survival3");


