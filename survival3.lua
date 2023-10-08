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
------------Cheeves-------------------
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

--------------------------
----spawn---------
--------------------------

local helmet = Location:new(myWorld3, -611.0, 61.0, -71.0);
local chest = Location:new(myWorld3, -611.0, 61.0, -69.0);
local legs = Location:new(myWorld3, -611.0, 61.0, -67.0);
local boots = Location:new(myWorld3, -611.0, 61.0, -65.0);
local sword = Location:new(myWorld3, -611.0, 61.0, -63.0);

local helmetChestPlayers = {};
local helmetChestResetTimer = Timer:new("helmet_reset_chest", 200 * 600 * 50);
local helmetChestResetTimerRunning = false;
local helmetChestOpen = Location:new(myWorld3, -611.0, 61.0, -71.0);

local chestChestPlayers = {};
local chestChestResetTimer = Timer:new("chest_reset_chest", 200 * 600 * 50);
local chestChestResetTimerRunning = false;
local chesttChestOpen = Location:new(myWorld3, -611.0, 61.0, -69.0);

local legsChestPlayers = {};
local legsChestResetTimer = Timer:new("legs_reset_chest", 200 * 600 * 50);
local legsChestResetTimerRunning = false;
local legsChestOpen = Location:new(myWorld3, -611.0, 61.0, -67.0);

local bootsChestPlayers = {};
local bootsChestResetTimer = Timer:new("boots_reset_chest", 200 * 600 * 50);
local bootsChestResetTimerRunning = false;
local bootsChestOpen = Location:new(myWorld3, -611.0, 61.0, -65.0);

local swordChestPlayers = {};
local swordChestResetTimer = Timer:new("sword_reset_chest", 200 * 600 * 50);
local swordChestResetTimerRunning = false;
local swordChestOpen = Location:new(myWorld3, -611.0, 61.0, -63.0);

function helmet_reset_chest()
	helmetChestPlayers = {};
	helmetChestResetTimerRunning = false;
end

function chest_reset_chest()
	chestChestPlayers = {};
	chestChestResetTimerRunning = false;
end

function legs_reset_chest()
	legsChestPlayers = {};
	bootsChestResetTimerRunning = false;
end

function legs_reset_chest()
	legsChestPlayers = {};
	legsChestResetTimerRunning = false;
end

function sword_reset_chest()
	swordChestPlayers = {};
	swordChestResetTimerRunning = false;
end

function helmet_1(data)
        local player = Player:new(data.player);
        if not  helmetChestPlayers[player.name] then
                helmet:cloneChestToPlayer(player.name);
                player:closeInventory();
                helmetChestPlayers[player.name] = true;
		player:sendMessage("&a Free helment purchased!");
		player:sendMessage("&c You're been placed on a cooldown for this armour, better not lose it.");

                if not helmetChestResetTimerRunning then
                        helmetChestResetTimerRunning = true;
                        helmetChestResetTimer:start();
                end
        end
end

function chest_1(data)
        local player = Player:new(data.player);
        if not  chestChestPlayers[player.name] then
                chest:cloneChestToPlayer(player.name);
                player:closeInventory();
                chestChestPlayers[player.name] = true;
		player:sendMessage("&a Free chestplate purchased!");
		player:sendMessage("&c You're been placed on a cooldown for this armour, better not lose it.");

                if not chestChestResetTimerRunning then
                        chestChestResetTimerRunning = true;
                        chestChestResetTimer:start();
                end
        end
end

function legs_1(data)
        local player = Player:new(data.player);
        if not  legsChestPlayers[player.name] then
                legs:cloneChestToPlayer(player.name);
                player:closeInventory();
                legsChestPlayers[player.name] = true;
		player:sendMessage("&a Free leggings purchased!");
		player:sendMessage("&c You're been placed on a cooldown for this armour, better not lose it.");

                if not legsChestResetTimerRunning then
                        legsChestResetTimerRunning = true;
                        legsChestResetTimer:start();
                end
        end
end

function boots_1(data)
        local player = Player:new(data.player);
        if not  bootsChestPlayers[player.name] then
                boots:cloneChestToPlayer(player.name);
                player:closeInventory();
                bootsChestPlayers[player.name] = true;
		player:sendMessage("&a Free boots purchased!");
		player:sendMessage("&c You're been placed on a cooldown for this armour, better not lose it.");

                if not bootsChestResetTimerRunning then
                        bootsChestResetTimerRunning = true;
                        bootsChestResetTimer:start();
                end
        end
end

function sword_1(data)
        local player = Player:new(data.player);
        if not  swordChestPlayers[player.name] then
                sword:cloneChestToPlayer(player.name);
                player:closeInventory();
                swordChestPlayers[player.name] = true;
		player:sendMessage("&a Free sword purchased!");
		player:sendMessage("&c You're been placed on a cooldown for this weapon, better not lose it.");

                if not swordChestResetTimerRunning then
                        swordChestResetTimerRunning = true;
                        swordChestResetTimer:start();
                end
        end
end
registerHook("INTERACT", "helmet_1", 143, "survival3", -612, 63, -68);
registerHook("INTERACT", "chest_1", 143, "survival3", -612, 63, -67);
registerHook("INTERACT", "legs_1", 143, "survival3", -612, 63, -66);
registerHook("INTERACT", "boots_1", 143, "survival3", -612, 63, -65);
registerHook("INTERACT", "sword_1", 143, "survival3", -612, 63, -64);

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

