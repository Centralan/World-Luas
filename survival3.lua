local myWorld3 = World:new('survival3');
local myWorld2 = World:new('spawn2');
local myWorld4 = World:new('creative');
local survivalsound = Location:new(myWorld3, 0, 0, 0);
local creativesound = Location:new(myWorld4, 0, 0, 0);

--------
---AI---
--------

local mut = '&3[?] &bDOG&f: A player has purchased daytime. Praise the sun!'
local mut2 = '&3[?] &bDOG&f: A player has purchased nighttime. Praise the moon!'
local mut3 = '&3[?] &bDOG&f: May you have mercy on their soul.'
local Message = ''



function s3_broadcast(msg)
	myWorld3:broadcast(msg);
end

function s3_broadcast2(msg)
	myWorld2:broadcast(msg);
end

function s3_broadcast3(msg)
	myWorld4:broadcast(msg);
end

function s3_whisper_npc(npc, msg, player)
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


function dog_smite(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "dog smite me") then
		local playerName = splitPlayerName(message, 16);
	        s3_broadcast(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		s3_broadcast2(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
                s3_broadcast3(mut3, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		survivalsound:playSound('AMBIENCE_THUNDER', 100, 1);
		creativesound:playSound('AMBIENCE_THUNDER', 100, 1);
		
end

registerHook("CHAT_MESSAGE", "dog_smite", "survival3");
	
------------------------------------
------------spawn-------------------
------------------------------------

function lobby_easter_room(data)
          local p = Player:new(data["player"]);
          p:sendEvent("achievement.timecapsule");
         end 

registerHook("REGION_ENTER", "lobby_easter_room", "survival3-spawn_easter");


function survival_smarts(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.survivalsmarts");
         end 

registerHook("INTERACT", "survival_smarts", 143, "survival3", -612.0, 64.0, -80.0); 

function tramp(data)
	local player = Player:new(data.player);
	player:setVelocity(0, 3, 0);
end

function tramp2(data)
	local player = Player:new(data.player);
	player:setVelocity(0, 10, 0);
end

registerHook("REGION_ENTER", "tramp", "survival3-tramp1");
registerHook("REGION_ENTER", "tramp", "survival3-tramp2");
registerHook("REGION_ENTER", "tramp", "survival3-tramp3");
registerHook("REGION_ENTER", "tramp", "survival3-tramp4");
registerHook("REGION_ENTER", "tramp2", "survival3-tramp5");

-----------------------------
---------time control----
-----------------------------

local totimeshop = Location:new(myWorld3, -609.0, 56.0, -77.0);
local exittimeshop = Location:new(myWorld3, -639.0, 61.0, -65.0);

function daytimeButtonClick(data)
	local player = Player:new(data.player);
		player:sendMessage("§aIt's now daytime!");
	        s3_broadcast(mut, "§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myWorld3:setTime(600);
end

function nighttimeButtonClick(data)
	local player = Player:new(data.player);
		player:sendMessage("§aIt's now nighttime!");
		s3_broadcast(mut2, "§6" .. player.name .. " has purchased nighttime. Praise the moon!");
		myWorld3:setTime(1800);
end

function time_enter(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(totimeshop);
end

function time_exit(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(exittimeshop);
end


registerHook("INTERACT", "daytimeButtonClick", 143, "survival3", -607.0, 56.0, -79.0); 
registerHook("INTERACT", "nighttimeButtonClick", 143, "survival3", -607.0, 56.0, -77.0); 
registerHook("REGION_ENTER", "time_enter", "survival3-timeshop1");
registerHook("REGION_ENTER", "time_exit", "survival3-timeshop2");

----------------------------------
---------max----------------------
----------------------------------
local maxtp = Location:new(myWorld3, -694.0, 169.0, -227.0);

function max_tp(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(maxtp);
end

registerHook("REGION_ENTER", "max_tp", "survival3-max_tp");

