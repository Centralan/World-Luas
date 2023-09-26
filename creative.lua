local myWorld4 = World:new('creative');

--------
---AI---
--------

local mut4 = '&3[?] &bDOG&f: A Player has made it day!'
local mut5 = '&3[?] &bDOG&f: A Player has made it night'
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


function cr_day(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "dog day") then
		local playerName = splitPlayerName(message, 16);
	        player:sendMessage("§aIt's now daytime!");
	        c_broadcast(mut4, "§6" .. player.name .. " has made it day!");
		      myworld4:setTime(0);
	end
end

  function cr_night(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "dog night") then
		local playerName = splitPlayerName(message, 16);
	        player:sendMessage("§aIt's now nighttime!");
		      c_broadcast(mut5, "§6" .. player.name .. " has made it night!");
		      myworld4:setTime(14000);
	end
end

registerHook("CHAT_MESSAGE", "cr_day", "creative");
registerHook("CHAT_MESSAGE", "cr_night", "creative");
