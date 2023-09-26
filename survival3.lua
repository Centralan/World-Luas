------------------------------------
------------spawn-------------------
------------------------------------

local myWorld = World:new('survival3');

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

local totimeshop = Location:new(myWorld, -609.0, 56.0, -77.0);
local exittimeshop = Location:new(myWorld, -639.0, 61.0, -65.0);

function daytimeButtonClick(data)
	local player = Player:new(data.player);
		player:sendMessage("§aIt's now daytime!");
		myworld:broadcast("§6" .. player.name .. " has purchased daytime. Praise the sun!");
		myworld:setTime(600);
end

function nighttimeButtonClick(data)
	local player = Player:new(data.player);
		player:sendMessage("§aIt's now nighttime!");
		myworld:broadcast("§6" .. player.name .. " has purchased night time. Praise the moon!");
		myworld:setTime(1800);
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
local maxtp = Location:new(myWorld, -694.0, 169.0, -227.0);

function max_tp(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(maxtp);
end

registerHook("REGION_ENTER", "max_tp", "survival3-max_tp");

