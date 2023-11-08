local world = World:new('survival3');
local world2 = World:new('Creative');
local world4 = World:new('mobarena');
local world5 = World:new('azuren');
local world6 = World:new('survival3_end');
local world7 = World:new('pvparena');
local world8 = World:new('wizardpvp');

---------------------------
----------messaging--------
---------------------------

function spawn_whisper(npc, msg, player)
	p:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

-----------------------------------------
------------Chat Commands--------------
-----------------------------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end

function hol_admin_setstairs(data)
	if data.player == "Centralan" or data.player == "Zozael" or data.player == "RainbowDeborah" then
		local player = Player:new(data.player);
		local message = data.message;
		if hasPrefix(message, "#holset") then
			local playerName = splitPlayerName(message, 16);
			   for index, key in ipairs(holblocks) do
                            key:setBlock(109, current);
			end
		end
	end
end

function hol_admin_setair(data)
	if data.player == "Centralan" or data.player == "Zozael" or data.player == "RainbowDeborah" then
		local player = Player:new(data.player);
		local message = data.message;
		if hasPrefix(message, "#holair") then
			local playerName = splitPlayerName(message, 16);
			   for index, key in ipairs(holblocks) do
                            key:setBlock(0, current);
			end
		end
	end
end

registerHook("CHAT_MESSAGE", "hol_admin_setstairs", "survival3");
registerHook("CHAT_MESSAGE", "hol_admin_setair", "survival3");

----------------------------------
----------Customer Service--------
----------------------------------

local buttonPlayers = {};
local buttonResetTimer = Timer:new("button_reset_chest", 20 * 60 * 5);
local buttonResetTimerRunning = false;

function helmet_reset_chest()
	buttonPlayers = {};
	buttonResetTimerRunning = false;
end

function shop_good(npc, msg, player)
	player:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

local dog = AI:new("DOG", "AI", "survival3");
local market = Location:new(world, 19474.0, 73.0, -20781);

function service_button(data)
	local player = Player:new(data.player);
	if not  buttonPlayers[player.name] then
	dog:speak( player.name .. " needs support in the market.");
	player:sendMessage("&aIf an Admin is available they will be here shortly.");
	market:playSound('ENTITY_PLAYER_LEVELUP', 100, 2);
	buttonPlayers[player.name] = true;
		
        if not buttonResetTimerRunning then
                        buttonResetTimerRunning = true;
                        buttonResetTimer:start();
                end
        end
end

registerHook("INTERACT", "service_button", 143, "survival3", 19474.0, 73.0, -20781);

-------------------
-----Sounds--------
-------------------

local stairs = Location:new(world, 19511.481, 72.0, -20795;
local stairs2 = Location:new(world, 19516. 70, -20771;

function stairs_spawn(data)
	local p = Player:new(data["player"]);
	p:sendMessage("&6A Staircase to the hall appears.");
	stairs:playSound('ITEM_TOTEM_USE', 1, 0.1);
end

registerHook("REGION_ENTER", "stairs_spawn", "survival3-hol_door");

function stair_mine(data)
	local p = Player:new(data["player"]);
	p:sendMessage("&6A staircase opens nearby..");
	stairs2:playSound('ENTITY_ILLUSION_ILLAGER_AMBIENT', 1, 1);
end

registerHook("INTERACT", "stairs_mine", 143, "survival3", 19517, 69, -20769);

--------------------
------gamemode check--
----------------------

function s_mode(data)
        local p = Player:new(data["player"]);
        p:setMode("SURVIVAL");
end

registerHook("REGION_ENTER", "s_mode", "survival3-spawn");

-------------------------
-----Lounge---------
-------------------------
		
local loungeE = Location:new(world, 19491.0, 87.0, -20779.0);
local lounge1 = Location:new(world, 19490.0, 84.0, -20778.0);

local catclubPlayers = {};
local catclubResetTimer = Timer:new("catclub_reset", 10 * 10 * 10);
local catclubResetTimerRunning = false;


function catclub_reset()
	catclubPlayers = {};
	catclubResetTimerRunning = false;
end
		
function lounge_welcome(data)
        local p = Player:new(data["player"]);
        player:sendMessage( player.name .. "&5The lounge reacts to you.");
	stairs:playSound('ITEM_BOTTLE_FILL_DRAGONBREATH', 1, 1);
end

function lounge_music1(data)
        local player = Player:new(data.player);
        if not  catclubPlayers[player.name] then
	lounge1:playSound('RECORD_STAL', 0.1, 1);
end

function lounge_music2(data)
        local player = Player:new(data.player);
        if not  catclubPlayers[player.name] then
	lounge1:playSound('RECORD_CHIRP', 0.1, 1);
end

if not catclubResetTimerRunning then
                        catclubResetTimerRunning = true;
                        catclubResetTimer:start();
                end
        end
end

registerHook("REGION_ENTER", "lounge_welcome", "survival3-lounge_enter");
registerHook("INTERACT", "lounge_music1", 143, "survival3", 19488.0, 83.0, -20780.0);
registerHook("INTERACT", "lounge_music2", 143, "survival3", 19488.0, 83.0, -20776.0);

------------------------------------
-----Lounge Security System---------
------------------------------------

local lounge1_strikeLocation1 = Location:new("survival3", 19488, 85, -20796);
local lounge2_strikeLocation2 = Location:new("survival3", 19488, 85, -20787);
		
function kill_ai(data)
	if data.player == "PapaPetes" then
		local player = Player:new(data.player);
		dog:speak( player.name .. " has broken into the lounge, exterminating. ");
		lounge1_strikeLocation1:lightningStrike();
                lounge2_strikeLocation2:lightningStrike();
                player:kill();
	end
end
				
registerHook("REGION_ENTER", "kill_ai", "survival3-lounge_leave");	
		
-------------------------
-----Lounge Fire---------
-------------------------
		
local world = "survival3";
local firecurrent = 0;
local firemaxData = 0;
local fireblocks = {
        Location:new(world, 19488.0, 86.0, -20796.0),
        Location:new(world, 19488.0, 86.0, -20795.0),
        Location:new(world, 19488.0, 86.0, -20794.0),
        Location:new(world, 19488.0, 86.0, -20793.0),
        Location:new(world, 19488.0, 86.0, -20792.0),
        Location:new(world, 19488.0, 86.0, -20791.0),
	Location:new(world, 19488.0, 86.0, -20790.0),
	Location:new(world, 19488.0, 86.0, -20789.0),
	Location:new(world, 19488.0, 86.0, -20788.0),
        Location:new(world, 19488.0, 86.0, -20787.0),

};
		

function lounge_enter(data)
        if firecurrent == firemaxData then
                firecurrent = 1;
        else
                firecurrent = firecurrent + 1;
        end
        lounge_leave();
end

function lounge_leave()
        for index, key in ipairs(fireblocks) do
                key:setBlock(0, firecurrent);
        end
end

function lounge_fire()
        for index, key in ipairs(fireblocks) do
                key:setBlock(51, firecurrent);
        end
end


registerHook("REGION_ENTER", "lounge_fire", "survival3-lounge_enter");
registerHook("REGION_ENTER", "lounge_fire", "survival3-lounge_leave");
registerHook("REGION_ENTER", "lounge_fire", "survival3-lounge_lights2");
registerHook("REGION_LEAVE", "lounge_leave", "survival3-lounge_leave");
registerHook("REGION_LEAVE", "lounge_leave", "survival3-lounge_leave2");

-------------------------
-----Lounge Redstone---------
-------------------------
		
local world = "survival3";
local redcurrent = 1;
local redmaxData = 1;
local redblocks = {
        Location:new(world, 19487.0, 90.0, -20776.0),
	Location:new(world, 19487.0, 90.0, -20782.0),
	Location:new(world, 19487.0, 90.0, -20802.0),
	Location:new(world, 19487.0, 90.0, -20807.0),
	Location:new(world, 19482.0, 90.0, -20776.0),
	Location:new(world, 19482.0, 90.0, -20782.0),
	Location:new(world, 19482.0, 90.0, -20787.0),
	Location:new(world, 19482.0, 90.0, -20792.0),
	Location:new(world, 19482.0, 90.0, -20797.0),
	Location:new(world, 19482.0, 90.0, -20802.0),
	Location:new(world, 19482.0, 90.0, -20807.0),
	Location:new(world, 19477.0, 90.0, -20776.0),
	Location:new(world, 19477.0, 90.0, -20782.0),
	Location:new(world, 19477.0, 90.0, -20787.0),
	Location:new(world, 19477.0, 90.0, -20792.0),
	Location:new(world, 19477.0, 90.0, -20797.0),
	Location:new(world, 19477.0, 90.0, -20802.0),
	
};

function lounge_enter2(data)
        if redcurrent == redmaxData then
                redcurrent = 1;
        else
                redcurrent = redcurrent + 1;
        end
        lounge_leave2();
end

function lounge_leave2()
        for index, key in ipairs(redblocks) do
                key:setBlock(123, redcurrent);
        end
end

function lounge_redstone()
        for index, key in ipairs(redblocks) do
                key:setBlock(169, redcurrent);
        end
end

registerHook("REGION_ENTER", "lounge_redstone", "survival3-lounge_lights");
registerHook("REGION_ENTER", "lounge_redstone", "survival3-lounge_leave");
registerHook("REGION_ENTER", "lounge_redstone", "survival3-lounge_lights2");
registerHook("REGION_LEAVE", "lounge_leave2", "survival3-lounge_leave");
registerHook("REGION_LEAVE", "lounge_leave2", "survival3-lounge_leave2");

----------------------
------Treehouse--
----------------------

local function Mob(position, mobType)
	local entity = Entity:new(position);
	entity:spawn(mobType);
	table.insert(entityList, entity);
end

local treehouse = Location:new(world, 19495.0, 96.0, -20846.4);
local treehouse2 = Location:new(world, 19495.0, 98.0, -20846.4);

function play_wait(data)
        local p = Player:new(data["player"]);
        treehouse:playSound('RECORD_WAIT', 1, 1);
	Mob(treehouse2, "PARROT");
end

registerHook("REGION_ENTER", "play_wait", "survival3-parrot");


-------------------
------Cheeves------
-------------------

function lobby_easter_room(data)
          local p = Player:new(data["player"]);
          p:sendEvent("achievement.timecapsule");
         end 

function survival_smarts(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.survivalsmarts");
         end 

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

function crawler(data)
         local p = Player:new(data["player"]);       
          p:sendEvent("achievement.dungeoncrawler");
         end 

registerHook("REGION_ENTER", "lobby_easter_room", "survival3-spawn_easter");
registerHook("REGION_ENTER", "lobby_easter_room", "survival3-belowspawn2");
registerHook("INTERACT", "survival_smarts", 143, "survival3", 19481.0, 73.0, -20825.0);
registerHook("REGION_ENTER", "snooping", "survival3-primarytunnel");
registerHook("REGION_ENTER", "beworse", "survival3-primarybasin");
registerHook("REGION_ENTER", "couldbe", "survival3-doorwaycontrols");
registerHook("REGION_ENTER", "crawler", "survival3-crawl");

-------------------
-----Shops---------
-------------------
local world = "survival3";
local current = 6;
local maxData = 6;
local blocks = {
        Location:new(world, 19491.0, 64.0, -20816.0),
        Location:new(world, 19491.0, 64.0, -20815.0),
        Location:new(world, 19491.0, 63.0, -20816.0),
        Location:new(world, 19491.0, 63.0, -20815.0),
        Location:new(world, 19491.0, 62.0, -20816.0),
        Location:new(world, 19491.0, 62.0, -20815.0),

};

function shop_secret(data)
        if current == maxData then
                current = 1;
        else
                current = current + 1;
        end
        shop_secret1();
end

function shop_secret1()
        for index, key in ipairs(blocks) do
                key:setBlock(0, current);
        end
end

function shop_secret2()
        for index, key in ipairs(blocks) do
                key:setBlock(1, current);
        end
end

registerHook("REGION_ENTER", "shop_secret1", "survival3-shop_secret_1");
registerHook("REGION_ENTER", "shop_secret2", "survival3-shop_secret_2");

-------------------
-----Free Gear-----
-------------------

local freegear = Location:new(world, 19542.0, 64.0, -20797.0);

local FreeGearChestPlayers = {};
local FreeGearChestResetTimer = Timer:new("free_reset_chest", 200 * 600 * 50);
local FreeGearChestResetTimerRunning = false;
local FreeGearChestOpen = Location:new(world, 19550.0, 64.0, -20797.0);


function free_reset_chest()
	FreeGearChestPlayers = {};
	FreeGearChestResetTimerRunning = false;
end


function free_1(data)
        local player = Player:new(data.player);
        if not  FreeGearChestPlayers[player.name] then
                freegear:cloneChestToPlayer(player.name);
                player:closeInventory();
                FreeGearChestPlayers[player.name] = true;
		player:sendMessage("&c You're been placed on a cooldown for this gear, better not lose it.");

                if not FreeGearChestResetTimerRunning then
                        FreeGearChestResetTimerRunning = true;
                        FreeGearChestResetTimer:start();
                end
        end
end


registerHook("REGION_ENTER", "free_1", "survival3-freegear1")
registerHook("REGION_ENTER", "free_1", "survival3-freegear2")
		
-------------------------------
---------Anvils---------------
------------------------------

local world = "survival3";
local current = 1;
local maxData = 1;
local blocks = {
        Location:new(world, 19483.0. 72.0, -20773.0),
        Location:new(world, 19477.0. 72.0, -20824.0),

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

registerHook("REGION_ENTER", "spawn_anvils", "survival3-market1");
registerHook("REGION_ENTER", "spawn_anvils", "survival3-market2");

------------------------------------------------------------
--------------Portals by:mortenn----------------------------
------------------------------------------------------------
		
-- spawn portals

local portal_blocks = {};
local portal_regions = {};

function spawn_portal(name, region, itemId, world, x, y, z)
        portal_blocks[x..','..y..','..z..'@'..world] = {
                Location:new(world, x-1.0, y-1.0, z-1.0),
                Location:new(world, x-1.0, y-1.0, z),
                Location:new(world, x-1.0, y-1.0, z+1.0),
                Location:new(world, x-2.0, y-1.0, z-2.0),
                Location:new(world, x-2.0, y-1.0, z-1.0),
                Location:new(world, x-2.0, y-1.0, z),
                Location:new(world, x-2.0, y-1.0, z+1.0),
                Location:new(world, x-2.0, y-1.0, z+2.0),
                Location:new(world, x-3.0, y-1.0, z-2.0),
                Location:new(world, x-3.0, y-1.0, z-1.0),
                Location:new(world, x-3.0, y-1.0, z),
                Location:new(world, x-3.0, y-1.0, z+1.0),
                Location:new(world, x-3.0, y-1.0, z+2.0),
                Location:new(world, x-4.0, y-1.0, z-2.0),
                Location:new(world, x-4.0, y-1.0, z-1.0),
                Location:new(world, x-4.0, y-1.0, z),
                Location:new(world, x-4.0, y-1.0, z+1.0),
                Location:new(world, x-4.0, y-1.0, z+2.0),
                Location:new(world, x-5.0, y-1.0, z-1.0),
                Location:new(world, x-5.0, y-1.0, z),
                Location:new(world, x-5.0, y-1.0, z+1.0),
        };
        portal_regions[world .. '-' .. region] = x .. ',' .. y .. ',' .. z .. '@' .. world;
        registerHook("INTERACT", 'spawn_portal_open', itemId, world, x, y, z);
        registerHook("REGION_LEAVE", 'spawn_portal_close', world .. "-" .. region);
end

function spawn_portal_open(data)
        EventEngine.debug.fine("Opening portal");
        EventEngine.debug.fine(dump(data));
        local name = data.x .. ',' .. data.y .. ',' .. data.z .. '@' .. data.world;
        EventEngine.debug.fine("Portal name " .. name);
        for index, key in ipairs(portal_blocks[name]) do
                key:setBlock(0,0);
        end
end

function spawn_portal_close(data)
        EventEngine.debug.fine("Closing portal");
        EventEngine.debug.fine(dump(data));
        local name = portal_regions[data.world .. '-' .. data.region];
        EventEngine.debug.fine("Closing portal " .. name);
        for index, key in ipairs(portal_blocks[name]) do
                key:setBlock(20,0);
        end
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

--pve portal

spawn_portal("pve", "pve_tp", 143, "survival3", 19561, 72, -20772);

--creative portal

spawn_portal("creative", "cr_tp", 143, "survival3", 19569, 72, -20791);

--pkr portal

spawn_portal("pkr", "pkr_tp", 143, "survival3", 19561, 72, -20810);

--spleef portal

spawn_portal("spleef", "spleef_tp", 143, "survival3", 19567, 72, -20801);

--ER portal

spawn_portal("er", "er_tp", 143, "survival3", 19553, 72, -20817);

--pvp portal

spawn_portal("pvp", "pvp_tp", 143, "survival3", 19567, 72, -20781);

--wpvp portal

spawn_portal("wpvp", "wpvp_tp1", 143, "survival3", 19553, 72, -20765);

------------------Unused Portal Warps

local world = World:new('survival3');
local world2 = World:new('Creative');
local world4 = World:new('mobarena');
local world5 = World:new('azuren');
local world6 = World:new('survival3_end');
local world7 = World:new('pvparena');
local world8 = World:new('wizardpvp');
local world9 = World:new('survival3_nether');

local creativetp = Location:new(world2, -14.190, 67.0, -13.673);
creativetp:setYaw(-51.3);
creativetp:setPitch(-24.3);

local pvptp = Location:new(world7, -1039.491, 4.0, 466.538);
pvptp:setYaw(-179.1);
pvptp:setPitch(1.5);

local wpvptp = Location:new(world8, 1029.194, 5.0, 4.199);
wpvptp:setYaw(-2.2);
wpvptp:setPitch(13.3);

local spleeftp = Location:new(world2, -347.353, 95.0, 207.66);
spleeftp:setYaw(0.0);
spleeftp:setPitch(0.0);

local pkrtp = Location:new(world2, -1407.420, 71.0, 5653.615);
pkrtp:setYaw(0.0);
pkrtp:setPitch(0.6);

local ertp = Location:new(world2, -1621.546, 64.0, 5817.491);
ertp:setYaw(-90.7);
ertp:setPitch(-0.0);

local pvetp = Location:new(world4, 837.441, 97.0, 149.280);
pvetp:setYaw(-1.2);
pvetp:setPitch(5.1);

local nethertp = Location:new(world9, 1.087, 65.0, -0.122);
nethertp:setYaw(0.7);
nethertp:setPitch(1.8);

local endtp = Location:new(world6, 72.930, 59.0, -25.591);
endtp:setYaw(73.5);
endtp:setPitch(-6.6);

local aztp = Location:new(world5, 10000.856, 65.0, 9998.979);
aztp:setYaw(-3.0);
aztp:setPitch(-0.6);

function tp_creative(data)
             local player = Player:new(data.player);
             player:teleport(creativetp);

      end
function tp_pvp(data)
             local player = Player:new(data.player);
             player:teleport(pvptp);

      end

function tp_wpvp(data)
             local player = Player:new(data.player);
             player:teleport(wpvptp);

      end

function tp_spleef(data)
             local player = Player:new(data.player);
             player:teleport(spleeftp);

      end

function tp_pkr(data)
             local player = Player:new(data.player);
             player:teleport(pkrtp);

      end

function tp_ertp(data)
             local player = Player:new(data.player);
             player:teleport(ertp);

      end

function tp_pve(data)
             local player = Player:new(data.player);
             player:teleport(pvptp);

      end

function tp_end(data)
             local player = Player:new(data.player);
             player:teleport(endtp);

      end

function tp_nether(data)
             local player = Player:new(data.player);
             player:teleport(nethertp);

      end

function tp_az(data)
             local player = Player:new(data.player);
             player:teleport(aztp);

      end

--registerHook("REGION_ENTER", "tp_creative", "survival3-cr_tp");
--registerHook("REGION_ENTER", "tp_pvp", "survival3-pvp_tp");
--registerHook("REGION_ENTER", "tp_wpvp", "survival3-wpvp_tp1");
--registerHook("REGION_ENTER", "tp_spleef", "survival3-spleef_tp");
--registerHook("REGION_ENTER", "tp_pkr", "survival3-pkr_tp");
--registerHook("REGION_ENTER", "tp_ertp", "survival3-er_tp");
--registerHook("REGION_ENTER", "tp_pve", "survival3-pve_tp");
--registerHook("REGION_ENTER", "tp_end", "survival3-end_tp");
--registerHook("REGION_ENTER", "tp_nether", "survival3-nether_tp");
--registerHook("REGION_ENTER", "tp_az", "survival3-azu_tp");


------------------------------------------------
----------------hol-----------------
------------------------------------------------

local world = "survival3";
local current = 1;
local maxData = 1;
local blocks = {
        Location:new(world, 19499, 81, -20788),
        Location:new(world, 19499, 81, -20789),
        Location:new(world, 19499, 81, -20790),
        Location:new(world, 19499, 81, -20791),
        Location:new(world, 19499, 81, -20792),
        Location:new(world, 19499, 81, -20793),
        Location:new(world, 19499, 81, -20794),
	Location:new(world, 19500, 80, -20788),
        Location:new(world, 19500, 80, -20789),
        Location:new(world, 19500, 80, -20790),
        Location:new(world, 19500, 80, -20791),
        Location:new(world, 19500, 80, -20792),
        Location:new(world, 19500, 80, -20793),
        Location:new(world, 19500, 80, -20794),
	Location:new(world, 19501, 79, -20788),
        Location:new(world, 19501, 79, -20789),
        Location:new(world, 19501, 79, -20790),
        Location:new(world, 19501, 79, -20791),
        Location:new(world, 19501, 79, -20792),
        Location:new(world, 19501, 79, -20793),
        Location:new(world, 19501, 79, -20794),
	Location:new(world, 19502, 78, -20788),
        Location:new(world, 19502, 78, -20789),
        Location:new(world, 19502, 78, -20790),
        Location:new(world, 19502, 78, -20791),
        Location:new(world, 19502, 78, -20792),
        Location:new(world, 19502, 78, -20793),
        Location:new(world, 19502, 78, -20794),
	Location:new(world, 19503, 77, -20788),
        Location:new(world, 19503, 77, -20789),
        Location:new(world, 19503, 77, -20790),
        Location:new(world, 19503, 77, -20791),
        Location:new(world, 19503, 77, -20792),
        Location:new(world, 19503, 77, -20793),
        Location:new(world, 19503, 77, -20794),
	Location:new(world, 19504, 76, -20788),
        Location:new(world, 19504, 76, -20789),
        Location:new(world, 19504, 76, -20790),
        Location:new(world, 19504, 76, -20791),
        Location:new(world, 19504, 76, -20792),
        Location:new(world, 19504, 76, -20793),
        Location:new(world, 19504, 76, -20794),
	Location:new(world, 19505, 75, -20788),
        Location:new(world, 19505, 75, -20789),
        Location:new(world, 19505, 75, -20790),
        Location:new(world, 19505, 75, -20791),
        Location:new(world, 19505, 75, -20792),
        Location:new(world, 19505, 75, -20793),
        Location:new(world, 19505, 75, -20794),
	Location:new(world, 19506, 74, -20788),
        Location:new(world, 19506, 74, -20789),
        Location:new(world, 19506, 74, -20790),
        Location:new(world, 19506, 74, -20791),
        Location:new(world, 19506, 74, -20792),
        Location:new(world, 19506, 74, -20793),
        Location:new(world, 19506, 74, -20794),
	Location:new(world, 19507, 73, -20788),
        Location:new(world, 19507, 73, -20789),
        Location:new(world, 19507, 73, -20790),
        Location:new(world, 19507, 73, -20791),
        Location:new(world, 19507, 73, -20792),
        Location:new(world, 19507, 73, -20793),
        Location:new(world, 19507, 73, -20794),
	Location:new(world, 19508, 72, -20788),
        Location:new(world, 19508, 72, -20789),
        Location:new(world, 19508, 72, -20790),
        Location:new(world, 19508, 72, -20791),
        Location:new(world, 19508, 72, -20792),
        Location:new(world, 19508, 72, -20793),
        Location:new(world, 19508, 72, -20794),
        

};

function spawn_hol(data)
        if current == maxData then
                current = 1;
        else
                current = current + 1;
        end
        spawn_setAir7();
end

function spawn_setAir7()
        for index, key in ipairs(blocks) do
                key:setBlock(0, current);
        end
end

function spawn_setstairs()
        for index, key in ipairs(blocks) do
                key:setBlock(109, current);
        end
end
		
registerHook("REGION_ENTER", "spawn_setAir7", "survival3-hol_door");
registerHook("REGION_ENTER", "spawn_setstairs", "survival3-hol_stairs");
		
------------------------------------------------
----------------mine-----------------
------------------------------------------------

local world = "survival3";
local current = 1;
local maxData = 1;
local blocks = {
        Location:new(world, 19528, 68, -20770),
        Location:new(world, 19527, 68, -20770),
        Location:new(world, 19526, 68, -20770),
        Location:new(world, 19528, 68, -20769),
        Location:new(world, 19527, 68, -20769),
        Location:new(world, 19526, 68, -20769),
        Location:new(world, 19528, 68, -20768),
        Location:new(world, 19527, 68, -20768),
        Location:new(world, 19526, 68, -20768),
        Location:new(world, 19528, 68, -20767),
        Location:new(world, 19527, 68, -20767),
        Location:new(world, 19526, 68, -20767),


};

function spawn_mine(data)
        if current == maxData then
                current = 1;
        else
                current = current + 1;
        end
        spawn_setAir8();
end

function spawn_setAir8()
        for index, key in ipairs(blocks) do
                key:setBlock(0, current);
        end
end

function spawn_setstone()
        for index, key in ipairs(blocks) do
                key:setBlock(98, current);
        end
end
		
registerHook("REGION_ENTER", "spawn_setAir8", "survival3-mine_door");
registerHook("INTERACT", "spawn_setAir8", 143, "survival3", 19517, 69, -20769);
		
