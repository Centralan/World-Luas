local world = World:new('tracergames');

--------------------------------
------gamemode check/messaging--
--------------------------------

function a_mode(data)
        local player = Player:new(data.player);
        if player:hasPermission("runsafe.toybox.mode") then
           player:sendMessage("&7Gamemode check ignored.");
        else
           local player = Player:new(data.player);
                 player:setMode("ADVENTURE");
end
end

registerHook("REGION_ENTER", "a_mode", "tracergames-tracermazes_mainhub1");
