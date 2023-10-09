local world = World:new('spawn2');
local world2 = World:new('survival3');
local enter1 = Location:new(world, -193.0, 71.0, -558.0);
local enter2 = Location:new(world2, -639.0, 61.0, -65.0);

----------------------
--Events---------------
---------------------

function enter1_h2023(data)
         local player = Player:new(data.player);
         player:teleport(enter1);
end

registerHook("REGION_ENTER", "enter1_h2023", "spawn2-h2023_enter1");
registerHook("REGION_ENTER", "enter1_h2023", "survival3-eventtp");

---------------
--effects--
---------------


function applySpawnSpeed(data)
        local player = Player:new(data.player);
        EventEngine.player.addPotionEffect(player.name, 'SPEED', 10, 30);
end

function revertSpawnSpeed(data)
        local player = Player:new(data.player);
        player:removePotionEffects();
end

local worldPre = "spawn2-";
local applyFunction = "applySpawnSpeed";
local revertFunction = "revertSpawnSpeed";

registerHook("REGION_ENTER", applyFunction, worldPre .. "creative_speed");
registerHook("REGION_LEAVE", revertFunction, worldPre .. "creative_speed");

registerHook("REGION_ENTER", applyFunction, worldPre .. "Minigames_Speed");
registerHook("REGION_LEAVE", revertFunction, worldPre .. "Minigames_Speed");

registerHook("REGION_ENTER", applyFunction, worldPre .. "Survival_Speed");
registerHook("REGION_LEAVE", revertFunction, worldPre .. "Survival_Speed");

registerHook("REGION_ENTER", applyFunction, worldPre .. "Info_Speed");
registerHook("REGION_LEAVE", revertFunction, worldPre .. "Info_Speed");


function tramp_low(data)
        local player = Player:new(data.player);
        player:setVelocity(0, 3, 0);
end

registerHook("REGION_ENTER", "tramp_low", "spawn2-tramp_hol");
registerHook("REGION_ENTER", "tramp_low", "spawn2-tramp_bank");
registerHook("REGION_ENTER", "tramp_low", "spawn2-tramp_market");
registerHook("REGION_ENTER", "tramp_low", "spawn2-tramp_event");

--------------------------
--------portals-----------
--------------------------
function survival_spawn(data)
         local player = Player:new(data.player);
         player:teleport(enter2);
end

registerHook("REGION_ENTER", "survival_spawn", "spawn2-survival_spawn_tp");
