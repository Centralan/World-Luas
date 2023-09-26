local myWorld4 = World:new('creative');

--------
---AI---
---------

local mut4 = '&3[?] &bCAT&f: A player has made it day!'
local mut5 = '&3[?] &bCAT&f: A player has made it night'
local Message = ''



function c_broadcast(msg)
	myWorld4:broadcast(msg);
end

function c_broadcast_npc(npc, msg)
	a_broadcast('&f&c' .. npc .. '&6: &f' .. msg);
end

function c_whisper_npc(npc, msg, player)
	player:sendMessage('&f&c' .. npc .. '&f' .. msg);
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
	        c_broadcast(mut4, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myworld4:setTime(0);
	end
end

function cat_night(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "cat night") then
		local playerName = splitPlayerName(message, 16);
	        c_broadcast(mut5, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myworld4:setTime(14000);
	end
end

registerHook("CHAT_MESSAGE", "cat_day", "creative");
registerHook("CHAT_MESSAGE", "cat_night", "creative");
