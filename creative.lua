local myWorld4 = World:new('creative');
local creativesound = Location:new(myWorld4, 0, 0, 0);

--------
-----AI---
----------

local mut4 = '&3[?] &bCAT&f: A player has made it day!'
local mut5 = '&3[?] &bCAT&f: A player has made it night'
local Message = ''



function c_broadcast(msg)
	myWorld4:broadcast(msg);
end

----------------------------------
--------------Time Control--------
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
	        player:sendMessage("Â§aIt's now daytime!");
                c_broadcast(mut4, "Â§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('ENTITY_CAT_PURREOW', 100, 1);
		myWorld4:setTime(0);
	end	
end

function cat_night(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "cat night") then
		local playerName = splitPlayerName(message, 16);
	        player:sendMessage("Â§aIt's now nighttime!");
                c_broadcast(mut5, "Â§6" .. player.name .. " has purchased daytime. Praise the sun!");
                creativesound:playSound('ENTITY_CAT_PURREOW', 100, 1);
		myWorld4:setTime(14000);
	end	
end

registerHook("CHAT_MESSAGE", "cat_day", "creative");
registerHook("CHAT_MESSAGE", "cat_night", "creative");

-----------------------------------
----------pkr----------------------
-----------------------------------

function pkr_mode(data)
        local p = Player:new(data["player"]);
        p:setMode("ADVENTURE");
end

registerHook("REGION_ENTER", "pkr_mode", "creative-centralan_7");

--------pkr_desert--------

local pkr_d = Location:new(myWorld4, -1393.531, 71.0, 5653.0);
pkr_d:setYaw(-90.4);
pkr_d:setPitch(6.6);

function pkr_d_respawn(data)
	local player = Player:new(data["player"]);
	player:teleport(pkr_d);
end

registerHook("REGION_ENTER", "pkr_d_respawn", "creative-pkr_d_1");
registerHook("REGION_ENTER", "pkr_d_respawn", "creative-pkr_d_2");

--------pkr_plains--------

local pkr_p = Location:new(myWorld4, -1407.279, 71.0, 5666.0);
pkr_p:setYaw(1.2);
pkr_p:setPitch(3.6);

function pkr_p_respawn(data)
	local player = Player:new(data["player"]);
	player:teleport(pkr_p);
end

registerHook("REGION_ENTER", "pkr_p_respawn", "creative-pkr_p_1");
registerHook("REGION_ENTER", "pkr_p_respawn", "creative-pkr_p_2");
registerHook("REGION_ENTER", "pkr_p_respawn", "creative-pkr_p_3");
registerHook("REGION_ENTER", "pkr_p_respawn", "creative-pkr_p_4");

