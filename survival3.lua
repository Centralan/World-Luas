local myWorld = World:new('survival3');

function lobby_easter_room(data)
         function lobby_easter_room(data)
          p:sendEvent("achievement.welcometotheclub");
end

registerHook("REGION_ENTER", "lobby_easter_room", "survival3-spawn_easter");
