local myWorld3 = World:new('survival3');
local myWorld4 = World:new('creative');
local survivalsound = Location:new(myWorld3, 0, 0, 0);
local creativesound = Location:new(myWorld4, 0, 0, 0);

-- AI

local dog = AI:new("DOG", "AI", "survival3");
local cat = AI:new("CAT", "AI", "creative");

-------------------
-------dog-----------
---------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end

function dog_smite(data)
	       local player = Player:new(data.player);
	       local message = data.message;
               if hasPrefix(message, "dog smite") then
	       local playerName = splitPlayerName(message, 16);
	            dog:speak("May you have mercy on their soul.");
		          survivalsound:playSound('ENTITY_LIGHTNING_THUNDER', 100, 1);
		          creativesound:playSound('ENTITY_LIGHTNING_THUNDER', 100, 1);
     end		
end

function dog_whine(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "pets dog") then
                local playerName = splitPlayerName(message, 16);
                     dog:speak("&erolls over");
                     creativesound:playSound('ENTITY_WOLF_WHINE', 100, 1);
                     survivalsound:playSound('ENTITY_WOLF_WHINE', 100, 1);

        end
end

registerHook("CHAT_MESSAGE", "dog_whine", "creative");
registerHook("CHAT_MESSAGE", "dog_whine", "survival3");
registerHook("CHAT_MESSAGE", "dog_smite", "survival3");
registerHook("CHAT_MESSAGE", "dog_smite", "creative");

-------------------
-------cat-----------
----------------------

local function hasPrefix(subject, prefix)
	return string.sub(subject, 1, string.len(prefix)) == prefix;
end

local function splitPlayerName(message, len)
	return string.sub(message, len, string.len(message));
end


 function cat_meow(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "cat hi") then
                local playerName = splitPlayerName(message, 16);
                cat:speak("meow.");
                creativesound:playSound('CAT_MEOW', 100, 1);
                survivalsound:playSound('CAT_MEOW', 100, 1);

        end
end

function cat_meow2(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "hi cat") then
                local playerName = splitPlayerName(message, 16);
                cat:speak("meow.");
                creativesound:playSound('ENTITY_CAT_AMBIENT', 100, 1);
                survivalsound:playSound('ENTITY_CAT_AMBIENT', 100, 1);

        end
end

function cat_purr(data)
         local player = Player:new(data.player);
                local message = data.message;
                if hasPrefix(message, "pets cat") then
                local playerName = splitPlayerName(message, 16);
                cat:speak("&erolls over");
                creativesound:playSound('ENTITY_CAT_PURR', 100, 1);
                survivalsound:playSound('ENTITY_CAT_PURR', 100, 1);

        end
end

function cat_day(data)
	 local player = Player:new(data.player);
		local message = data.message;
                if hasPrefix(message, "cat day") then
		            local playerName = splitPlayerName(message, 16);
		            creativesound:playSound('ENTITY_CAT_PURREOW', 100, 1);
		            myWorld4:setTime(0);
	end	
end

function cat_night(data)
	 local player = Player:new(data.player);
		local message = data.message;
            if hasPrefix(message, "cat night") then
		        local playerName = splitPlayerName(message, 16);
                        creativesound:playSound('ENTITY_CAT_PURREOW', 100, 1);
		        myWorld4:setTime(14000);
	end	
end

registerHook("CHAT_MESSAGE", "cat_day", "creative");
registerHook("CHAT_MESSAGE", "cat_night", "creative");
registerHook("CHAT_MESSAGE", "cat_purr", "creative");
registerHook("CHAT_MESSAGE", "cat_purr", "survival3");
registerHook("CHAT_MESSAGE", "cat_meow", "creative");
registerHook("CHAT_MESSAGE", "cat_meow2", "creative");
registerHook("CHAT_MESSAGE", "cat_meow", "survival3");
registerHook("CHAT_MESSAGE", "cat_meow2", "survival3");
