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

registerHook("INTERACT", "survival_smarts", 143, "survival3", -6120.0, 70.0, -84.0);

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

--------------------------
----Free Gear---------
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

---------------------------
-------Jail----------------
---------------------------
local jail = Location:new(myWorld3, -644.844, 50.0, -83.719);

function respawn_jail(data)
	 if players:hasPermission("runsafe.warp.use.troll") then
             local player = Player:new(data.player);
             player:setHealth(20);
             player:teleport(jail);
      end

registerHook("PLAYER_DEATH", "respawn_jail", "survival3");


--------------------------
----------Shops-----------
--------------------------
local shopt = Location:new(myWorld3, -615.469, 68.0, -80.699);
shopt:setYaw(179.4);
shopt:setPitch(4.2);

local shopb = Location:new(myWorld3, -615.469, 63.0, -80.699);
shopb:setYaw(87.9);
shopb:setPitch(1.5);

function shop_t(data)
             local player = Player:new(data.player);
             player:teleport(shopt);

      end

function shop_b(data)
             local player = Player:new(data.player);
             player:teleport(shopb);

      end

registerHook("REGION_ENTER", "shop_b", "survival3-shop_t");
registerHook("REGION_ENTER", "shop_t", "survival3-shop_b");

-------------------------------
---------Anvils---------------
------------------------------
local myWorld3 = "survival3";
local current = 1;
local maxData = 1;
local blocks = {
        Location:new(myWorld3, -611.0, 64.0, -54.0),
        Location:new(myWorld3, -611.0, 64.0, -50.0),

};

function spawn_anvils(data)
        if current == maxData then
                current = 1;
        else
                current = current + 1;
        end
        spawn_setAnvils();
end

function spawn_setAnvils()
        for index, key in ipairs(blocks) do
                key:setBlock(145, current);
        end
end

registerHook("REGION_ENTER", "spawn_anvils", "survival3-spawn_anvils");

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

