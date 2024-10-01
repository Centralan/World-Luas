local world = World:new('survival3');
local world2 = World:new('Creative');
local world4 = World:new('mobarena');
local world5 = World:new('azuren');
local world6 = World:new('survival3_end');

---------------------------
------------messaging--------
-----------------------------

function spawn_whisper(npc, msg, player)
	p:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

local dog = AI:new("DOG", "AI", "survival3");

----------------------------------
----------Customer Service--------
----------------------------------

function customer_service(data)
	local player = Player:new(data.player);
	player:sendTitle("", "&eThe customer is frequently &c&lwrong&e.");
	player:playSound('ENTITY_ENDEREYE_DEATH', 1, 0.1);
end

function moral_support(data)
	local player = Player:new(data.player);
	player:sendTitle("", "&eYou &c&lCan't &eDo It.");
	player:playSound('ENTITY_VILLAGER_NO', 1, 1);
end

function tech_support(data)
	local player = Player:new(data.player);
	player:sendTitle("", "&4&l/kill");
	player:playSound('ENTITY_LIGHTNING_IMPACT', 1, 1);
end

function ghast_support(data)
	local player = Player:new(data.player);
        player:sendTitle("", "&eA &c&lghast &ereachs for you across &4&ldimensions&e.");
	EventEngine.player.addPotionEffect(player.name, 'BLINDNESS', 100, 4);
	player:playSound('ENTITY_GHAST_WARN', 1, 0.5);
	player:setHealth(2);
        player:playSound('ENTITY_GHAST_SHOOT', 1, 0.5);
end

function ghast_support2(data)
	local player = Player:new(data.player);
	player:setHealth(20);
        player:sendTitle("", "&eThe &c&lghast &eshow restraint.");
end


registerHook("INTERACT", "customer_service", 77, "survival3", 19475.0, 73.0, -20780.0);
registerHook("INTERACT", "moral_support", 77, "survival3", 19474.0, 73.0, -20785.0);
registerHook("INTERACT", "tech_support", 77, "survival3", 19474.0, 73.0, -20775.0);
registerHook("REGION_ENTER", "ghast_support", "survival3-centralan_easter");
registerHook("REGION_LEAVE", "ghast_support2", "survival3-centralan_easter");

--------------------------
-------spawn catch--------
--------------------------


local spawn_catch = Location:new(world, 19549.456, 72.0, -20790.600);
spawn_catch:setYaw(90.2);
spawn_catch:setPitch(0.4);

local troll1 = Location:new(world, 19474.491, 71.0, -20767.451);
troll1:setYaw(179.4);
troll1:setPitch(3.3);

function spawn_floor_catch(data)
	local player = Player:new(data.player);
           if player:hasPermission("runsafe.toybox.mode") then
         else
             player:teleport(spawn_catch);
             player:sendTitle("", "&4&k0&cNobody likes a nosy player :] &4&k0&c");
	     player:playSound('ENTITY_SHULKER_AMBIENT', 1, 0.1);
	end
end

function spawn_flight_no(data)
	local player = Player:new(data.player);
           if player:hasPermission("runsafe.toybox.mode") then
         else
             player:teleport(spawn_catch);
	end
end


function spawn_hole(data)
	local player = Player:new(data.player);
             player:teleport(troll1);
	     player:playSound('ENTITY_SHULKER_AMBIENT', 1, 0.1);
end

registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch2");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch3");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch4");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch5");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch6");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch7");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch8");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch9");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch10");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_catch11");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison1");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison2");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison3");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison4");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison5");
registerHook("REGION_ENTER", "spawn_floor_catch", "survival3-spawn_prison6");
registerHook("REGION_ENTER", "spawn_hole", "survival3-troll1");
registerHook("REGION_ENTER", "spawn_flight_no", "survival3-anti-flight");

--------------------------
-------hol message--------
--------------------------

local stairs = Location:new(world, 19511.481, 72.0, -20795);
local stairs2 = Location:new(world, 19516, 70, -20771);

function hol_sound(data)
	local player = Player:new(data.player);
        player:sendTitle("", "&eA Staircase To The &6Hall &eAppears");
	player:playSound('ITEM_TOTEM_USE', 1, 0.1);
end

registerHook("REGION_ENTER", "hol_sound", "survival3-hol_stairs");

--------------------------------
------gamemode check/messaging--
--------------------------------

function s_mode(data)
        local player = Player:new(data.player);
        if player:hasPermission("runsafe.toybox.mode") then
           player:sendMessage("&7Gamemode check ignored.");
        else
           local player = Player:new(data.player);
                 player:setMode("SURVIVAL");
end
end

function world_check(data)
        local player = Player:new(data.player);
        if player:hasPermission("runsafe.toybox.mode") then
           player:sendMessage("&7Gamemode check ignored.");
        else
           local player = Player:new(data.player);
                 player:setMode("SURVIVAL");
end
end


function spawn_leave2(data)
        local player = Player:new(data.player);
        player:sendMessage("&3>> &bLeaving Spawn &3<<");
end

function spawn_enter(data)
        local player = Player:new(data.player);
        player:sendMessage("&3>> &bEntering Spawn &3<<");
end


function old_spawn_warning(data)
        local player = Player:new(data.player);
        player:sendMessage("&4>> &cEntering PvP/Damage Enabled Zone &4<<");
end




registerHook("REGION_ENTER", "s_mode", "survival3-spawn");
registerHook("REGION_ENTER", "s_mode", "survival3-__global__");
registerHook("REGION_ENTER", "s_mode", "survival3-newspawn");
registerHook("REGION_ENTER", "world_check", "survival3-dnd_exploit_fix_region");
registerHook("REGION_LEAVE", "spawn_leave2", "survival3-spawn1");
registerHook("REGION_LEAVE", "spawn_leave2", "survival3-spawn2");
registerHook("REGION_LEAVE", "spawn_leave2", "survival3-spawn3");
registerHook("REGION_LEAVE", "spawn_leave2", "survival3-spawn4");
registerHook("REGION_ENTER", "old_spawn_warning", "survival3-survivalspawn");


--------------------
------auto anvil--
----------------------

local world = "survival3";
local a1current = 1;
local a1maxData = 1;
local a1blocks = {
        Location:new(world, 19487.0, 72.0, -20781.0),
};

function anvil_spawn(data)
        if a1current == a1maxData then
                a1current = 1;
        else
                a1current = a1current + 1;
        end
        anvil_spawn_set();
end
		
function anvil_spawn_set()
        for index, key in ipairs(a1blocks) do
                key:setBlock(145, a1current);
end
end

registerHook("REGION_ENTER", "anvil_spawn_set", "survival3-autoanvil");

local world = "survival3";
local a2current = 1;
local a2maxData = 1;
local a2blocks = {
        Location:new(world, -12756.0, 63.0, -13011.0),
};

function anvil_spawn2(data)
        if a2current == a2maxData then
                a2current = 1;
        else
                a2current = a2current + 1;
        end
        anvil_spawn_set2();
end
		
function anvil_spawn_set2()
        for index, key in ipairs(a2blocks) do
                key:setBlock(145, a2current);
end
end

registerHook("REGION_ENTER", "anvil_spawn_set2", "survival3-auto_anvil2");


-------------------------
-------Lounge---------
---------------------------

local loungeE = Location:new(world, 19491.0, 87.0, -20779.0);
local lounge1 = Location:new(world, 19490.0, 84.0, -20778.0);
local loungeTP = Location:new(world, 19476.300, 86.0, -20801.300);
local loungeTP2 = Location:new(world, 19601.621, 138.0, -20790.469);
local lounge1_strikeLocation1 = Location:new("survival3", 19488, 85, -20796);
local lounge2_strikeLocation2 = Location:new("survival3", 19488, 85, -20787);

local catclubPlayers = {};
local catclubResetTimer = Timer:new("catclub_reset", 100 * 10 * 10);
local catclubResetTimerRunning = false;

function catclub_reset()
	catclubPlayers = {};
	catclubResetTimerRunning = false;
end
		
function lounge_check(data)
        local player = Player:new(data.player);
        if player:hasPermission("runsafe.warp.use.lounge") then
        else
           local player = Player:new(data.player);
                dog:speak( player.name .. " has broken into the lounge, exterminating. ");
                lounge1_strikeLocation1:lightningStrike();
                lounge2_strikeLocation2:lightningStrike();
                player:kill();
end
end

function lounge_welcome(data)
        local player = Player:new(data["player"]);
        player:sendMessage( "&5The lounge reacts to you.");
        loungeE:playSound('ITEM_BOTTLE_FILL_DRAGONBREATH', 1, 1);
end

function lounge_tp2(data)
        local player = Player:new(data["player"]);
        player:teleport(loungeTP2);
end

function lounge_music1(data)
        local player = Player:new(data.player);
        if not  catclubPlayers[player.name] then
	lounge1:playSound('RECORD_STAL', 0.5, 1);
end

function lounge_music2(data)
        local player = Player:new(data.player);
        if not  catclubPlayers[player.name] then
	lounge1:playSound('RECORD_CHIRP', 0.5, 1);
end

if not catclubResetTimerRunning then
                        catclubResetTimerRunning = true;
                        catclubResetTimer:start();
                end
        end
end

registerHook("REGION_ENTER", "lounge_welcome", "survival3-lounge_welcome");
registerHook("REGION_ENTER", "lounge_check", "survival3-lounge_kill");
registerHook("INTERACT", "lounge_music1", 143, "survival3", 19488.0, 83.0, -20780.0);
registerHook("INTERACT", "lounge_music2", 143, "survival3", 19488.0, 83.0, -20776.0);
registerHook("INTERACT", "lounge_tp2", 143, "survival3", 19487.0, 88.0, -20786.0);

-------------------------
-------Lounge Fire---------
---------------------------

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

registerHook("REGION_ENTER", "lounge_fire", "survival3-lounge_lights");
registerHook("REGION_LEAVE", "lounge_leave", "survival3-lounge_lights");
registerHook("REGION_ENTER", "lounge_fire", "survival3-lounge_lswitch");

-------------------------
-------Lounge Redstone---------
---------------------------

local world = "survival3";
local redcurrent = 1;
local redmaxData = 1;
local redblocks = {
        Location:new(world, 19489.0, 90.0, -20775.0),
	Location:new(world, 19489.0, 90.0, -20779.0),
	Location:new(world, 19489.0, 90.0, -20783.0),
	Location:new(world, 19489.0, 90.0, -20803.0),
	Location:new(world, 19489.0, 90.0, -20807.0),
	Location:new(world, 19485.0, 90.0, -20775.0),
	Location:new(world, 19485.0, 90.0, -20779.0),
	Location:new(world, 19485.0, 90.0, -20783.0),
	Location:new(world, 19485.0, 90.0, -20787.0),
	Location:new(world, 19485.0, 90.0, -20791.0),
	Location:new(world, 19485.0, 90.0, -20795.0),
	Location:new(world, 19485.0, 90.0, -20799.0),
	Location:new(world, 19485.0, 90.0, -20803.0),
	Location:new(world, 19485.0, 90.0, -20807.0),
	Location:new(world, 19485.0, 90.0, -20775.0),
	Location:new(world, 19485.0, 90.0, -20779.0),
	Location:new(world, 19485.0, 90.0, -20783.0),
	Location:new(world, 19481.0, 90.0, -20775.0),
	Location:new(world, 19481.0, 90.0, -20779.0),
	Location:new(world, 19481.0, 90.0, -20783.0),
	Location:new(world, 19481.0, 90.0, -20787.0),
	Location:new(world, 19481.0, 90.0, -20791.0),
	Location:new(world, 19481.0, 90.0, -20795.0),
	Location:new(world, 19481.0, 90.0, -20799.0),
	Location:new(world, 19481.0, 90.0, -20803.0),
	Location:new(world, 19481.0, 90.0, -20807.0),
	Location:new(world, 19481.0, 90.0, -20775.0),
	Location:new(world, 19481.0, 90.0, -20779.0),
	Location:new(world, 19477.0, 90.0, -20783.0),
	Location:new(world, 19477.0, 90.0, -20775.0),
	Location:new(world, 19477.0, 90.0, -20779.0),
	Location:new(world, 19477.0, 90.0, -20783.0),
	Location:new(world, 19477.0, 90.0, -20787.0),
	Location:new(world, 19477.0, 90.0, -20791.0),
	Location:new(world, 19477.0, 90.0, -20795.0),
	Location:new(world, 19477.0, 90.0, -20799.0),
	
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
registerHook("REGION_LEAVE", "lounge_leave2", "survival3-lounge_lights");
registerHook("REGION_ENTER", "lounge_redstone", "survival3-lounge_lswitch");

-------------------
--------Cheeves------
---------------------

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
--registerHook("REGION_ENTER", "lobby_easter_room", "survival3-belowspawn2");
--registerHook("INTERACT", "survival_smarts", 143, "survival3", 19481.0, 73.0, -20825.0);
--registerHook("REGION_ENTER", "snooping", "survival3-primarytunnel");
--registerHook("REGION_ENTER", "beworse", "survival3-primarybasin");
--registerHook("REGION_ENTER", "couldbe", "survival3-doorwaycontrols");
registerHook("REGION_ENTER", "crawler", "survival3-crawl");

--------------------------
-------Secret Shop---------
--------------------------

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

local effecttp = Location:new(world, 19574.500, 38.0, -20819.500);
effecttp:setYaw(-0.2);
effecttp:setPitch(0.5);

function effect_shop_e(data)
	 local player = Player:new(data.player);
	       if player:hasItemWithName("Â§6Voucher") then
		  player:teleport(effecttp);
		  player:sendTitle("", "&4&k0&6The Wizards Welcome You.&4&k0&c");
	       else
		  player:teleport(spawn_catch);
		  player:sendTitle("", "&4&k0&cYou've yet to solve the mystery.&4&k0&c");
	end
end
	    
registerHook("REGION_ENTER", "effect_shop_e", "survival3-effect_shop_enter");

----------------------------------
---------   Moosic Store   -------
----------------------------------

local moosictp = Location:new(world, 19575.512, 16.0, -20790.517);
moosictp:setYaw(90.4);
moosictp:setPitch(-3.3);

local moosicexit = Location:new(world, 19585.439, 69.0, -20739.540);
moosicexit:setYaw(90.0);
moosicexit:setPitch(-21.9);

function moosic_enter(data)
	local player = Player:new(data.player);
	player:teleport(moosictp);
	player:playSound('ENTITY_EVOCATION_ILLAGER_CAST_SPELL', 1, 0.5);				
end

function moosic_exit(data)
	local player = Player:new(data.player);
	player:teleport(moosicexit);
	player:playSound('ENTITY_EVOCATION_ILLAGER_CAST_SPELL', 1, 0.5);				
end

function moosic_blocks(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_BLOCKS', 1, 1);				
end

function moosic_cat(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_CAT', 1, 1);				
end

function moosic_chirp(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_CHIRP', 1, 1);				
end

function moosic_far(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_FAR', 1, 1);				
end

function moosic_mall(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_MALL', 1, 1);				
end

function moosic_mellohi(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_MELLOHI', 1, 1);				
end

function moosic_stal(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_STAL', 1, 1);				
end

function moosic_strad(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_STRAD', 1, 1);				
end

function moosic_wait(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_WAIT', 1, 1);				
end

function moosic_ward(data)
	local player = Player:new(data.player);
	player:playSound('RECORD_WARD', 1, 1);				
end

registerHook("REGION_ENTER", "moosic_enter", "survival3-moosic_tp");
registerHook("REGION_ENTER", "moosic_exit", "survival3-moosic_tp2");

registerHook("INTERACT", "moosic_blocks", 143, "survival3", 19557.0, 18.0, -20806.0)
registerHook("INTERACT", "moosic_cat", 143, "survival3", 19536.0, 16.0, -20806.0)
registerHook("INTERACT", "moosic_ward", 143, "survival3", 19535.0, 16.0, -20791.0)
registerHook("INTERACT", "moosic_chirp", 143, "survival3", 19536.0, 16.0, -20776.0)
registerHook("INTERACT", "moosic_far", 143, "survival3", 19557.0, 18.0, -20776.0)
registerHook("INTERACT", "moosic_mall", 143, "survival3", 19576.0, 16.0, -20782.0)
registerHook("INTERACT", "moosic_mellohi", 143, "survival3", 19576.0, 16.0, -20800.0)
registerHook("INTERACT", "moosic_stal", 143, "survival3", 19533.0, 17.0, -20783.0)
registerHook("INTERACT", "moosic_strad", 143, "survival3", 19533.0, 17.0, -20799.0)
registerHook("INTERACT", "moosic_wait", 143, "survival3", 19575.0, 17.0, -20789.0)

-------------------
-------Free Gear-----
---------------------

local freegear = Location:new(world, 19530.0, 64.0, -20805.0);

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
		player:sendMessage("&c You have been placed on a cooldown for this gear, better not lose it.");

                if not FreeGearChestResetTimerRunning then
                        FreeGearChestResetTimerRunning = true;
                        FreeGearChestResetTimer:start();
                end
        end
end

registerHook("INTERACT", "free_1", 143, "survival3", 19537.0, 71.0, -20733.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19536.0, 71.0, -20733.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19535.0, 71.0, -20733.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19534.0, 71.0, -20733.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19533.0, 71.0, -20733.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19537.0, 71.0, -20849.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19536.0, 71.0, -20849.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19535.0, 71.0, -20849.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19534.0, 71.0, -20849.0);
registerHook("INTERACT", "free_1", 143, "survival3", 19533.0, 71.0, -20849.0);

--registerHook("REGION_ENTER", "free_1", "survival3-freegear1")
--registerHook("REGION_ENTER", "free_1", "survival3-freegear2")
