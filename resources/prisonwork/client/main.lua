ESX = nil
local Keys = {
  ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246
}
--[[GET ESX OBJ DATA --VERY IMPORTANT]]
Citizen.CreateThread(function()
  while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
end
end)
--[[END GET ESX OBJ DATA]]
Citizen.CreateThread(function()
local vehicleList = { "Rusty Surfer", "Faggio", "Rusty Rebel", "Surfer", "Faggio Sport", "Faggio Mod", "Regina", "Youga Classic", "Ingot", "Picador", "Primo Custom", "Blista", "Asea", "Dilettante", "Futo", "Minivan", "Premier", "Stanier", "Stratum", "Primo", "Monkey Blista", "Rhapsody", "Rumpo", "Rumpo II", "Bodhi", "Taco Van", "Asterope", "Issi", "Panto", "Prairie", "Ratbike", "Rebel", "Sabre Turbo", "Rancher XL", "Intruder", "Youga", "Brioso R/A", "Blazer", "Blazer Sport", "Dune Buggy", "Glendale", "Sanchez", "Tornado", "Vigero", "Warrener", "Bobcat XL", "Fugitive", "Beejay XL", "Blista Compact", "Boxville", "Journey", "Penumbra", "Sabre GT", "Seminole", "Washington", "Issi Classic", "Buccaneer", "Vader", "Baller", "Bison", "Emperor", "Faction", "Granger", "Stretch", "Carbon RS", "Gaunlet", "Radius", "Buffalo", "Burrito", "Cavalcade", "Paradise", "Virgo", "Surge", "Dukes", "Fuslade", "Pigalle", "Akuma", "Hexer", "Bifta", "Clown Van", "Dominator", "Injection", "PCJ-600", "Buffalo S", "Manana", "Ruffian", "Sandking", "Nemesis", "Bagger", "Baller 2nd Gen", "XLS", "Daemon", "Rat Truck", "Landstalker", "Sovereign", "Tailgator", "Tampa", "Zion", "Double T", "Cheburek", "Custom Minivan", "Daemon DLC", "Gang Burrito", "Oracle", "Peyote", "Rocoto", "Schafter", "Zion Cabrio", "Lectro", "Oracle XS", "Custom Voodoo", "Enduro", "Sentinel", "Wolfsbane", "Esskey", "Custom Virgo", "Huntley S", "Sentinel XS", "Custom Faction", "Dubsta", "Jackal", "Mesa", "FCR1000", "Avarus", "Chino", "Cliffhanger", "Custom Moonbeam", "Super Diamond", "Tornado Custom", "Vortex", "Casco", "Chino Custom", "Diablous", "Exemplar", "Felon", "Hustler", "Kalahari", "Slamvan", "Sultan", "Nightblade", "FCR1000 Custom", "Alpha", "Blade", "Chimera", "Felon GT", "Furore GT", "Hotknife", "Innovation", "Windsor", "Bati 801", "Zombie Bobber", "Patriot", "Windsor Drop", "Tornado Hot Rod", "Cognoscenti Cabrio", "Zombie Chopper", "Tulip", "Diablous Custom", "Elegy", "F620", "Sentinel Classic", "Suiner", "Feltzer", "Gargoyle", "Surano", "Baller LE", "Bati 801RR", "Coquette Classic", "Hermes", "Lynx", "Romeo Hearse", "Rumpo3", "Schafter V12", "Slamvan Custom", "Banshee", "Coquette", "Rapid GT", "9F", "Comet", "Rapid GT Convertible", "9F Cabrio", "Baller LWB", "Comet Retro Custom", "Contender", "Guardian", "Spacedocker", "Raiden", "Schwartzer", "Bestia GTS", "Elegy Retro Custom", "Voltic", "Phoenix", "Carbonizzare", "Sprunk Buffalo", "Bullet", "Massacro", "Hakuchou", "Kamacho", "Raptor", "Verkierer", "Jester Classic", "Sultan RS", "Massacro (Racecar)", "Nightshade", "Specter V2", "Ellie", "Stinger", "Comet Safari", "Flash GT", "Karuma", "Itali GT", "ETRI", "Brawler", "Bubsta 6x6", "JB 700", "Omnis", "Stirling GT", "Stinger GT", "Toros", "Tropos", "Vapid Dominator GTX", "Vindicator", "Coquette BlackFin", "Tyrus", "Franken Strange", "Merryweather Mesa", "Infernus", "Roosevelt Valor", "Penetrator", "Drift Tampa", "Roosevelt Valor Custom", "Cheetah", "Sanctus", "Banshee 900R", "Z-Type", "Burgershot Stalion", "Cheetah Classic", "Rapid GT Classic", "Deluxo", "Manroe", "Entity XF", "Trophy Truck", "Hakuchou Drag", "Turismo R", "Zentorno", "Shotaro", "Pfister811", "Reaper", "FMJ", "XA 21", "Osiris", "Ruston", "Dune Truck", "T20", "Jester", "Vagner", "X80 Proto", "Jester (Racecar)", "Adder", "RE-7B", "Mamba", "American Dream", "American Dream V2", "Nero Custom", }

local active = true
local hammering_lib = "amb@world_human_hammering@male@base" -- hammering with base
local welding_lib = "amb@world_human_welding@male@base" -- welding with base
local electrocute_lib = "missminuteman_1ig_2" -- electrocute with tasered_2
local kneel_lib = "amb@medic@standing@tendtodead@idle_a" -- kneeling with idle_a
local knife = "WEAPON_KNIFE"
local wrench = "WEAPON_WRENCH"
local bottle = "WEAPON_BOTTLE"
local knuckle = "WEAPON_KNUCKLE"
local hammer = "WEAPON_HAMMER"
RequestAnimDict(hammering_lib)
RequestAnimDict(welding_lib)
RequestAnimDict(electrocute_lib)
RequestAnimDict(kneel_lib)
while not HasAnimDictLoaded(hammering_lib, welding_lib, electrocute_lib, kneel_lib) do --if library does not exist
  Citizen.Wait(100)
end
while true do --if library exists
  Citizen.Wait(0)
  local playerPed = GetPlayerPed(-1)
  local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords

  --RemoveWeaponFromPed(playerPed, "WEAPON_KNIFE")
  SetPedCanBeTargetted(playerPed, false);


  --[[MAINTENANCE JOB]]
  while (active = true) do
    distance = Vdist(x, y, z, 1629.76, 2563.87, 45.56)
    Wait(1)
    distance = math.ceil(distance)
    if distance <= 2 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, welding_lib, "base", 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, false)
        local chance = math.floor(math.random(1, 50))
        if chance <= 25 then
          TriggerServerEvent("prisonworkjob")
        elseif chance >= 26 then
          TaskPlayAnim(playerPed, electrocute_lib, "tasered_2", 8.0, 8.0, - 1, 50, 0, true, true, true)
          local currentHealth = GetEntityHealth(playerPed)
          SetEntityHealth(playerPed, currentHealth - 20)
          exports.pNotify:SendNotification({text = "You've been electrocuted, be careful.", type = "info", timeout = 8000, layout = "centerRight"})
        end --end if chance
        active = false
      end --end Key Press
    end -- end distance check
    if (active = false) then      
      Wait(1500) --wait 1.5 seconds to repeat job
        active = true -- reset active flag to true
    end
  end -- end while loop



  --[[LICENSE PLATE JOB]]
  while (active = true) do
    distance = Vdist(x, y, z, 1753.49, 2503.66, 45.57)
    Wait(1)
    distance = math.ceil(distance)
    if distance <= 2 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, hammering_lib, "base", 8.0, 8.0, - 1, 50, 0, true, true, true)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, false)
        ClearPedTasks(playerPed)
        local platenum = math.floor(math.random() * 100000 + 1)
        local chance = math.floor(math.random(1, 264))
        local vehicleName = vehicleList[chance]
        if chance <= 15 then
          exports.pNotify:SendNotification({text = "License Plate Created [ " .. platenum .. " ] for a " .. vehicleName .. ".", type = "info", timeout = 8000, layout = "centerRight"})
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
        elseif chance >= 16 then
          exports.pNotify:SendNotification({text = "Machine press is broken, wait 10 seconds for rebooting sequence..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Wait(10000)
        end --end if chance
        active = false
      end --end Key Press      
    end -- end distance check
    if (active = false) then      
      Wait(1500) --wait 1.5 seconds to repeat job
        active = true -- reset active flag to true
    end
  end -- end while loop




  --[[HIDDEN WEAPON]]
  while (active = true) do
    distance = Vdist(x, y, z, 1755.42, 2467.19, 55.14)
    Wait(1)
    distance = math.ceil(distance)
    if distance <= 1 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, kneel_lib, "idle_a", 8.0, 8.0, - 1, 50, 0, true, true, true)        
        local chance = math.floor(math.random(1, 50))
        if chance <= 10 then
          GiveWeaponToPed(playerPed, knife, 20, false, false)
          exports.pNotify:SendNotification({text = "You found a hidden knife..", type = "info", timeout = 8000, layout = "centerRight"})
        elseif (chance > 10 and <= 20) then
          GiveWeaponToPed(playerPed, bottle, 20, false, false)
          exports.pNotify:SendNotification({text = "You found a hidden knife..", type = "info", timeout = 8000, layout = "centerRight"})
        elseif (chance > 20 and <= 30) then
          GiveWeaponToPed(playerPed, knuckle, 20, false, false)
          exports.pNotify:SendNotification({text = "You found a hidden brass knuckle..", type = "info", timeout = 8000, layout = "centerRight"})
        elseif (chance > 30 and <= 40) then
          GiveWeaponToPed(playerPed, hammer, 20, false, false)
          exports.pNotify:SendNotification({text = "You found a hidden hammer..", type = "info", timeout = 8000, layout = "centerRight"})
        elseif chance > 40 then
          GiveWeaponToPed(playerPed, wrench, 20, false, false)
          exports.pNotify:SendNotification({text = "You found a hidden wrench..", type = "info", timeout = 8000, layout = "centerRight"})
        end --end if
        active = false
        ClearPedTasks(playerPed)       
      end --end Key Press
    end -- end distance check
    if (active = false) then      
      Wait(12000000) --wait 200 minutes to repeat job
        active = true -- reset active flag to true
    end
  end -- end while loop




end -- end while
end) --end function