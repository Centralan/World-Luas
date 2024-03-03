local world = World:new('survival3');
local world2 = World:new('creative');
local soundblock = Location:new(world, 0, 0, 0);

-- PaperName,Effect,speed,amount,Height

-----------------------------------
--- EFFECTS /  Suspicious Armour---
-----------------------------------
local effects = {
	{"Molten Spewing", "LAVA", 0.1, 5, 2},
	{"Touch of End", "PORTAL", 1, 50, 1},
	{"Emerald Charm", "HAPPY_VILLAGER", 10, 30, 1},
	{"Molten Touch", "FLAME", 0.05, 20, 1},
	{"Opal Projection", "FIREWORKS_SPARK", 0.05, 10, 1},
	{"Slime Spray", "SLIME", 10, 100, 1},
	{"Rain Cloud", "SPLASH", 10, 100, 5},
	{"Rain Cloud", "CLOUD", 0.05, 20, 5},
        {"Mad Moosic", "NOTE", 10, 1, 2.5},
	{"Mad Moosic", "FIREWORKS_SPARK", 0.05, 20, -0.1},
        {"Shine of Sparkle", "END_ROD", 0.05, 10, 1},
        {"Love Wins", "HEART", 2, 50, 2},
        {"Love Wins", "DAMAGE_INDICATOR", 1, 1, 1},
        {"Magical Touch", "ENCHANTMENT_TABLE", -1, 20, 1},
        {"Magical Touch", "PORTAL", -1, 20, 1},
        {"Magical Touch", "MAGIC_CRIT", 1, 1, 1},
        {"Black Magic", "INSTANT_SPELL", 1, 50, -0.1},
        {"Black Magic", "WITCH_MAGIC", 1, 50, -0.1},
	{"Black Magic", "SPELL", 10, 30, 0},
	{"Hot Head", "LARGE_SMOKE", 10, 0.1, 2},
	{"Hot Head", "FLAME", 10, 0.1, 1.9},
	{"Hot Head", "LAVA", 0.1, 1.5, 1.8},
	{"Hot Head", "FLAME", 0.05, 2, 0},
	{"Emerald Rain", "CLOUD", 0.05, 20, 5},
	{"Emerald Rain", "TOTEM", 0.05, 20, 5},
	{"Barrier", "BARRIER", 50, 10, 2.4},
	{"Barrier", "BARRIER", 50, 10, 0},
	{"The Over Thinker", "RED_DUST", 1, 5, 1.9},
	{"The Over Thinker", "RED_DUST", 1, 5, 1.9},
	{"The Over Thinker", "RED_DUST", 1, 5, 2.0},
	{"Airbender", "SWEEP_ATTACK", 4, 2, 1},
	{"Airbender", "SWEEP_ATTACK", 4, 2, 1},
	{"Airbender", "CLOUD", 0.05, 20, 0},
	{"Cursed Traveler", "FOOTSTEP", 0.80, 30, 0.2},
	{"Cursed Traveler", "TOWN_AURA", 0.80, 20, 2.0},
	{"Cursed Traveler", "TOWN_AURA", 0.80, 20, 2.0},
	{"Cursed Traveler", "TOWN_AURA", 0.80, 20, 2.0},
};

function fireTick()
	processPlayers({world:getPlayers()});
--        processPlayers({world2:getPlayers()});
        processPlayers1({world:getPlayers()});
        processPlayers2({world:getPlayers()});
        processPlayers3({world:getPlayers()});
        processPlayers4({world:getPlayers()});
end

function processPlayers(players)
	for index, playerName in pairs(players) do
		for key, effect in pairs(effects) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§3Effect: Â§b" .. effect[1]) then
						local world, x, y, z = player:getLocation();
						local playerLoc = Location:new(world, x, y + effect[5], z);
						playerLoc:playEffect(effect[2], effect[3], effect[4], 20);
					end
				end
			end
		end
	end
end

function processPlayers1(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Hat") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'BLINDNESS', 1, 10);					
				end
			end
		end
	end
end



function processPlayers2(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Chestplate") then
                                          local world, x, y, z = player:getLocation();
                                          player:setVelocity(0, -0.5, 0);					
				end
			end
		end
	end
end


function processPlayers3(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Pants") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'SLOW_DIGGING', 1, 10);					
				end
			end
		end
	end
end


function processPlayers4(players)
	for index, playerName in pairs(players) do
			if playerName ~= nil then
				local player = Player:new(playerName);
				if player ~= nil and player:isOnline() then
					if player:hasItemWithName("Â§5Suspicious Boots") then
                                          local world, x, y, z = player:getLocation();
                                          EventEngine.player.addPotionEffect(player.name, 'LEVITATION', 3, 1);
                                          player:setVelocity(0, 0.1, 0);				
				end
			end
		end
	end
end

registerHook("BLOCK_GAINS_CURRENT", "fireTick", "survival3", 19526.0, 64.0, -20787.0);

-----------------------------------
      --- Spawn Effects---
-----------------------------------
local EffectShopF = Location:new(world, 19574.5, 40.0, -20779.5);
local EffectShopF1 = Location:new(world, 19574.5, 41.0, -20779.5);
local EffectShopF2 = Location:new(world, 19574.5, 42.0, -20779.5);
local EffectShopF3 = Location:new(world, 19574.5, 43.0, -20779.5);
local EffectShopF4 = Location:new(world, 19574.5, 44.0, -20779.5);

function shop_fountain(effect, speed, particles, amount)
                  EffectShopF:playEffect('MOB_SPELL', 0.1, 100, 43)
                  EffectShopF:playEffect('LAVA', 5, 5, 43)
                  EffectShopF:playEffect('LARGE_SMOKE', 0.1, 0.1, 43)
                  EffectShopF1:playEffect('EXPLODE', 0.1, 0.1, 43)
                  EffectShopF2:playEffect('LARGE_SMOKE', 0.1, 0.1, 43)
                  EffectShopF3:playEffect('EXPLODE', 0.1, 0.1, 43)
                  EffectShopF4:playEffect('LARGE_SMOKE', 0.1, 0.1, 43)
end

registerHook("BLOCK_GAINS_CURRENT", "shop_fountain", "survival3", 19526.0, 64.0, -20787.0);

-----------------------------------
      --- EFFECTS Shop---
-----------------------------------
local MoltenSpewingE = Location:new(world, 19566.5, 39.0, -20779.5);
local TouchOfEndE = Location:new(world, 19566.5, 38.5, -20784.5);
local EmeraldCharmE = Location:new(world, 19567.5, 38.5, -20789.5);
local MoltenTouchE = Location:new(world, 19566.5, 38.5, -20794.5);
local OpalProjectionK = Location:new(world, 19582.5, 38.5, -20780.5);
local SlimeSprayK = Location:new(world, 19582.5, 38.5, -20785.5);
local RainCloudK1 = Location:new(world, 19582.5, 41.5, -20790.5);
local RainCloudK2 = Location:new(world, 19582.5, 40.5, -20790.5);
local EmeraldRainK1 = Location:new(world, 19582.5, 41.5, -20795.5);
local EmeraldRainK2 = Location:new(world, 19582.5, 40.5, -20795.5);
local EmeraldRainK3 = Location:new(world, 19582.5, 40.5, -20795.5);
local MadMoosicE1 = Location:new(world, 19566.5, 40.5, -20803.5);
local MadMoosicE2 = Location:new(world, 19566.5, 38.2, -20803.5);
local LoveWinsE1 = Location:new(world, 19566.5, 40.5, -20808.5);
local LoveWinsE2 = Location:new(world, 19566.5, 39.5, -20808.5);
local MagicalTouchE1 = Location:new(world, 19566.5, 39.5, -20813.5);
local MagicalTouchE2 = Location:new(world, 19566.5, 39.5, -20813.5);
local MagicalTouchE3 = Location:new(world, 19566.5, 39.5, -20813.5);
local BlackMagicE1 = Location:new(world, 19566.5, 38.0, -20818.5);
local BlackMagicE2 = Location:new(world, 19566.5, 38.0, -20818.5);
local BlackMagicE3 = Location:new(world, 19566.5, 38.0, -20818.5);
local HotHeadK1 = Location:new(world, 19582.5, 40.2, -20804.5);
local HotHeadK2 = Location:new(world, 19582.5, 40.0, -20804.5);
local HotHeadK3 = Location:new(world, 19582.5, 38.5, -20804.5);
local HotHeadK4 = Location:new(world, 19582.5, 38.0, -20804.5);
local TheOverThinkerK1 = Location:new(world, 19582.5, 40.2, -20809.5);
local TheOverThinkerK2 = Location:new(world, 19582.5, 40.0, -20809.5);
local TheOverThinkerK3 = Location:new(world, 19582.5, 38.5, -20809.5);
local AirbenderK1 = Location:new(world, 19582.5, 40.0, -20814.5);
local AirbenderK2 = Location:new(world, 19582.5, 40.0, -20814.5);
local AirbenderK3 = Location:new(world, 19582.5, 37.8, -20814.5);
local CursedTravelerK1 = Location:new(world, 19581.5, 38.5, -20819.5);
local CursedTravelerK2 = Location:new(world, 19582.5, 40.1, -20819.5);
local CursedTravelerK3 = Location:new(world, 19582.5, 40.1, -20819.5);


function MoltenSpewing(effect, speed, particles, amount)
              MoltenSpewingE:playEffect('LAVA', 0.1, 5, 8)
end

function TouchOfEnd(effect, speed, particles, amount)
              TouchOfEndE:playEffect('PORTAL', 1, 50, 8)
end

function EmeraldCharm(effect, speed, particles, amount)
              EmeraldCharmE:playEffect('HAPPY_VILLAGER', 10, 30, 8)
end

function MoltenTouch(effect, speed, particles, amount)
              MoltenTouchE:playEffect('FLAME', 0.05, 20, 8)
end

function OpalProjection(effect, speed, particles, amount)
              OpalProjectionK:playEffect('FIREWORKS_SPARK', 0.05, 10, 8)
end

function SlimeSpray(effect, speed, particles, amount)
              SlimeSprayK:playEffect('SLIME', 10, 100, 8)
end

function RainCloud(effect, speed, particles, amount)
              RainCloudK1:playEffect('CLOUD', 0.05, 20, 8)
              RainCloudK2:playEffect('SPLASH', 10, 100, 8)
end

function EmeraldRain(effect, speed, particles, amount)
              EmeraldRainK1:playEffect('CLOUD', 0.05, 20, 8)
              EmeraldRainK2:playEffect('TOTEM', 0.05, 20, 8)
end

function MadMoosic(effect, speed, particles, amount)
              MadMoosicE1:playEffect('NOTE', 10, 1, 8)
              MadMoosicE2:playEffect('FIREWORKS_SPARK', 0.05, 10, 8)
end

function LoveWins(effect, speed, particles, amount)
              LoveWinsE1:playEffect('HEART', 2, 50, 8)
              LoveWinsE2:playEffect('DAMAGE_INDICATOR', 1, 1, 8)
end

function MagicalTouch(effect, speed, particles, amount)
              MagicalTouchE1:playEffect('ENCHANTMENT_TABLE', -1, 20, 8)
              MagicalTouchE2:playEffect('PORTAL', -1, 20, 8)
              MagicalTouchE3:playEffect('MAGIC_CRIT', 1, 1, 8)
end

function BlackMagic(effect, speed, particles, amount)
              BlackMagicE1:playEffect('INSTANT_SPELL', 1, 50, 8)
              BlackMagicE2:playEffect('WITCH_MAGIC', 1, 50, 8)
              BlackMagicE3:playEffect('SPELL', 10, 30, 8)
end

function HotHead(effect, speed, particles, amount)
              HotHeadK1:playEffect('LARGE_SMOKE', 10, 0.1, 8)
              HotHeadK2:playEffect('FLAME', 10, 0.1, 8)
              HotHeadK3:playEffect('LAVA', 0.1, 1.5, 8)
              HotHeadK4:playEffect('FLAME', 0.05, 2, 8)
end

function TheOverThinker(effect, speed, particles, amount)
              TheOverThinkerK1:playEffect('RED_DUST', 1, 5, 8)
              TheOverThinkerK2:playEffect('RED_DUST', 1, 5, 8)
              TheOverThinkerK3:playEffect('RED_DUST', 1, 5, 8)
end

function Airbender(effect, speed, particles, amount)
              AirbenderK1:playEffect('SWEEP_ATTACK', 4, 2, 8)
              AirbenderK2:playEffect('SWEEP_ATTACK', 4, 2, 8)
              AirbenderK3:playEffect('CLOUD', 0.05, 20, 8)
end

function CursedTraveler(effect, speed, particles, amount)
              CursedTravelerK1:playEffect('FOOTSTEP', 0.80, 30, 8)
              CursedTravelerK2:playEffect('TOWN_AURA', 0.80, 20, 8)
              CursedTravelerK3:playEffect('TOWN_AURA', 0.80, 20, 8)
end

registerHook("BLOCK_GAINS_CURRENT", "MoltenSpewing", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "TouchOfEnd", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "EmeraldCharm", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "MoltenTouch", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "OpalProjection", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "SlimeSpray", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "RainCloud", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "EmeraldRain", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "MadMoosic", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "LoveWins", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "MagicalTouch", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "BlackMagic", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "HotHead", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "TheOverThinker", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "Airbender", "survival3", 19526.0, 64.0, -20787.0);
registerHook("BLOCK_GAINS_CURRENT", "CursedTraveler", "survival3", 19526.0, 64.0, -20787.0);
