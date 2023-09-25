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

registerHook("REGION_ENTER", "tramp", "survival3-tramp1");
registerHook("REGION_ENTER", "tramp", "survival3-tramp2");
registerHook("REGION_ENTER", "tramp", "survival3-tramp3");
registerHook("REGION_ENTER", "tramp", "survival3-tramp4");

----------------------------------
---------max----------------------
----------------------------------
local maxtp = Location:new(myWorld, -694.0, 169.0, -227.0);

function max_tp(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(maxtp);
end

registerHook("REGION_ENTER", "max_tp", "survival3-max_tp");

