local world = World:new('survival3');

function event_cleanup(data)
  local player = Player:new(data.player);
   player:removePermission("runsafe.warp.use.grave1");
   player:removePermission("runsafe.warp.use.grave2");
   player:removePermission("runsafe.warp.use.grave3");
   player:removePermission("runsafe.warp.use.grave4");
   player:removePermission("runsafe.warp.use.grave5");
   player:removePermission("runsafe.warp.use.grave6");
end

registerHook("REGION_ENTER", "event_cleanup", "survival3-spawn);

--Halloween 2023 Perms List
 --runsafe.warp.use.grave1
 --runsafe.warp.use.grave2
 --runsafe.warp.use.grave3
 --runsafe.warp.use.grave4
 --runsafe.warp.use.grave5
 --runsafe.warp.use.grave6

--Krimas Perms List
 --runsafe.event.trees
 --runsafe.event.emerald
 --runsafe.event.flower
 --runsafe.event.beacon
 --runsafe.event.feather
 --runsafe.event.dog
 --runsafe.event.city
 --runsafe.event.sky
 --runsafe.event.skally
 --runsafe.event.az
 --runsafe.event.igloo
 --runsafe.warp.use.krimas
 --runsafe.event.gift1
 --runsafe.event.gift2
 --runsafe.event.gift3
 --runsafe.event.gift4
 --runsafe.event.gift5
 --runsafe.event.gift6
 --runsafe.event.gift7
 --runsafe.event.gift8
 --runsafe.event.gift9
 --runsafe.event.gift10
 --runsafe.event.gift11
 --runsafe.event.gift12
 --runsafe.event.gift13
 --runsafe.event.gift14
 --runsafe.event.gift15
 --runsafe.event.gift16
 --runsafe.event.gift17
 --runsafe.event.gift18
 --runsafe.event.gift19
 --runsafe.event.lighthouse
 --runsafe.event.vt
 --runsafe.event.enchant
 --runsafe.event.boat
 --runsafe.event.weep
 --runsafe.event.weepd
 --runsafe.event.break
 --runsafe.event.pray
 --runsafe.event.1
 --runsafe.event.2
 --runsafe.event.3
 --runsafe.event.4
 --runsafe.event.5
 --runsafe.event.6
 --runsafe.event.7
 --runsafe.event.8
 --runsafe.event.9
 --runsafe.event.10
 
