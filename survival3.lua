local myWorld3 = World:new('survival3');
local myWorld6 = World:new('azuren');
local myWorld7 = World:new('survival3_end');
local survivalsound = Location:new(myWorld3, 0, 0, 0);;

--------
---AI---
--------

local mut = '&3[?] &bDOG&f: A player has purchased daytime. Praise the sun!'
local mut2 = '&3[?] &bDOG&f: A player has purchased nighttime. Praise the moon!'
local Message = ''



function s3_broadcast(msg)
	myWorld3:broadcast(msg);
end

function s3_whisper_npc(npc, msg, player)
	player:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

------------------------------------
-----------Spawn Gear-------------------
------------------------------------
local ig1 = Location:new(world, -611.0, 61.0, -71.0);
local ig2 = Location:new(world, -611.0, 61.0, -69.0);
local ig3 = Location:new(world, -611.0, 61.0, -67.0);
local ig4 = Location:new(world, -611.0, 61.0, -65.0);
local ig5 = Location:new(world, -611.0, 61.0, -63.0);

local ig1ChestPlayers = {};
local ig1ChestResetTimer = Timer:new("ig1_reset_chest", 200 * 200 * 500);
local ig1ChestResetTimerRunning = false;
local ig1ChestOpen = Location:new(world, -611.0, 61.0, -71.0);

local ig2ChestPlayers = {};
local ig2ChestResetTimer = Timer:new("ig2_reset_chest", 200 * 200 * 500);
local ig2ChestResetTimerRunning = false;
local ig2ChestOpen = Location:new(world, -611.0, 61.0, -69.0);

local ig3ChestPlayers = {};
local ig3ChestResetTimer = Timer:new("ig3_reset_chest", 200 * 200 * 500);
local ig3ChestResetTimerRunning = false;
local ig3ChestOpen = Location:new(world, -611.0, 61.0, -67.0);

local ig4ChestPlayers = {};
local ig4ChestResetTimer = Timer:new("ig2_reset_chest", 200 * 200 * 500);
local ig4ChestResetTimerRunning = false;
local ig4ChestOpen = Location:new(world, -611.0, 61.0, -65.0);

local ig5ChestPlayers = {};
local ig5ChestResetTimer = Timer:new("ig2_reset_chest", 200 * 200 * 500);
local ig5ChestResetTimerRunning = false;
local ig5ChestOpen = Location:new(world, -611.0, 61.0, -63.0);

function ig1(data)
        local player = Player:new(data.player);
        if not ig1ChestPlayers[player.name] then
                ig1:cloneChestToPlayer(player.name);
                player:closeInventory();
                ig1ChestPlayers[player.name] = true;

                if not ig1ChestResetTimerRunning then
                       ig1ChestResetTimerRunning = true;
                        ig1ChestResetTimer:start();
                end
        end
end

function ig1_reset_chest()
	ig1ChestPlayers = {};
	ig1ChestResetTimerRunning = false;
end

function ig2(data)
        local player = Player:new(data.player);
        if not ig2ChestPlayers[player.name] then
                ig2:cloneChestToPlayer(player.name);
                player:closeInventory();
                ig2ChestPlayers[player.name] = true;

                if not ig2ChestResetTimerRunning then
                       ig2ChestResetTimerRunning = true;
                        ig2ChestResetTimer:start();
                end
        end
end

function ig2_reset_chest()
	ig2ChestPlayers = {};
	ig2ChestResetTimerRunning = false;
end

function ig3(data)
        local player = Player:new(data.player);
        if not ig3ChestPlayers[player.name] then
                ig3:cloneChestToPlayer(player.name);
                player:closeInventory();
                ig3ChestPlayers[player.name] = true;

                if not ig3ChestResetTimerRunning then
                       ig3ChestResetTimerRunning = true;
                        ig3ChestResetTimer:start();
                end
        end
end

function ig3_reset_chest()
	ig3ChestPlayers = {};
	ig3ChestResetTimerRunning = false;
end

function ig4(data)
        local player = Player:new(data.player);
        if not ig4ChestPlayers[player.name] then
                ig4:cloneChestToPlayer(player.name);
                player:closeInventory();
                ig4ChestPlayers[player.name] = true;

                if not ig4ChestResetTimerRunning then
                       ig4ChestResetTimerRunning = true;
                        ig4ChestResetTimer:start();
                end
        end
end

function ig4_reset_chest()
	ig4ChestPlayers = {};
	ig4ChestResetTimerRunning = false;
end

function ig5(data)
        local player = Player:new(data.player);
        if not ig5ChestPlayers[player.name] then
                ig5:cloneChestToPlayer(player.name);
                player:closeInventory();
                ig5ChestPlayers[player.name] = true;

                if not ig5ChestResetTimerRunning then
                       ig5ChestResetTimerRunning = true;
                        ig5ChestResetTimer:start();
                end
        end
end

function ig5_reset_chest()
	ig5ChestPlayers = {};
	ig5ChestResetTimerRunning = false;
end

registerHook("INTERACT", "ig1", 143, "survival3", -612.0, 63.0, -68.0); 
registerHook("INTERACT", "ig2", 143, "survival3", -612.0, 63.0, -67.0); 
registerHook("INTERACT", "ig3", 143, "survival3", -612.0, 63.0, -66.0); 
registerHook("INTERACT", "ig4", 143, "survival3", -612.0, 63.0, -65.0); 
registerHook("INTERACT", "ig5", 143, "survival3", -612.0, 63.0, -64.0); 

------------------------------------
-----------Cheeves-------------------
------------------------------------

function lobby_easter_room(data)
          local p = Player:new(data["player"]);
          p:sendEvent("achievement.timecapsule");
         end 

registerHook("REGION_ENTER", "lobby_easter_room", "survival3-spawn_easter");
registerHook("REGION_ENTER", "lobby_easter_room", "survival3-belowspawn2");


function survival_smarts(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.survivalsmarts");
         end 

registerHook("INTERACT", "survival_smarts", 143, "survival3", -612.0, 64.0, -80.0); 



registerHook("REGION_ENTER", "tramp2", "survival3-tramp5");


--------------------------
-----zozael spawn---------
--------------------------

function snooping(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.snoopingaround");
         end 

function beworse(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.couldbeworse");
         end

function couldbe(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.wherecouldtheybe");
         end 

registerHook("REGION_ENTER", "snooping", "survival3-primarytunnel");
registerHook("REGION_ENTER", "beworse", "survival3-primarybasin");
registerHook("REGION_ENTER", "couldbe", "survival3-doorwaycontrols");

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
	        survivalsound:playSound('WOLF_BARK', 100, 1);
end

function nighttimeButtonClick(data)
	local player = Player:new(data.player);
		player:sendMessage("§aIt's now nighttime!");
		s3_broadcast(mut2, "§6" .. player.name .. " has purchased nighttime. Praise the moon!");
		myWorld3:setTime(1800);
	        survivalsound:playSound('WOLF_HOWL', 100, 1);
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
----------end------------------
----------------------------------
local endtp = Location:new(myWorld7, 0.0, 61.0, 0.0);
function end_enter(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(endtp);
end

registerHook("REGION_ENTER", "end_enter", "survival3-end_tp");

----------------------------------
----------Azuren------------------
----------------------------------
local azurentp = Location:new(myWorld6, 10000, 65.0, 1000.0);
function azuren_enter(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(azurentp);
end

registerHook("REGION_ENTER", "azuren_enter", "survival3-azuern_tp");

----------------------------------
---------max----------------------
----------------------------------
local maxtp = Location:new(myWorld3, -694.0, 169.0, -227.0);

function max_tp(data)
        local targetplayer = Player:new(data.player);
          targetplayer:teleport(maxtp);
end

registerHook("REGION_ENTER", "max_tp", "survival3-max_tp");

