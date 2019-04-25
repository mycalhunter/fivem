ESX = nil
local Keys = { ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246 }
--[[GET ESX OBJ DATA --VERY IMPORTANT]]
Citizen.CreateThread(function()
  while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
  end
end)
--[[END GET ESX OBJ DATA]]
Citizen.CreateThread(function()
--variables

local vehicleList = { "Rusty Surfer", "Faggio", "Rusty Rebel", "Surfer", "Faggio Sport", "Faggio Mod", "Regina", "Youga Classic", "Ingot", "Picador", "Primo Custom", "Blista", "Asea", "Dilettante", "Futo", "Minivan", "Premier", "Stanier", "Stratum", "Primo", "Monkey Blista", "Rhapsody", "Rumpo", "Rumpo II", "Bodhi", "Taco Van", "Asterope", "Issi", "Panto", "Prairie", "Ratbike", "Rebel", "Sabre Turbo", "Rancher XL", "Intruder", "Youga", "Brioso R/A", "Blazer", "Blazer Sport", "Dune Buggy", "Glendale", "Sanchez", "Tornado", "Vigero", "Warrener", "Bobcat XL", "Fugitive", "Beejay XL", "Blista Compact", "Boxville", "Journey", "Penumbra", "Sabre GT", "Seminole", "Washington", "Issi Classic", "Buccaneer", "Vader", "Baller", "Bison", "Emperor", "Faction", "Granger", "Stretch", "Carbon RS", "Gaunlet", "Radius", "Buffalo", "Burrito", "Cavalcade", "Paradise", "Virgo", "Surge", "Dukes", "Fuslade", "Pigalle", "Akuma", "Hexer", "Bifta", "Clown Van", "Dominator", "Injection", "PCJ-600", "Buffalo S", "Manana", "Ruffian", "Sandking", "Nemesis", "Bagger", "Baller 2nd Gen", "XLS", "Daemon", "Rat Truck", "Landstalker", "Sovereign", "Tailgator", "Tampa", "Zion", "Double T", "Cheburek", "Custom Minivan", "Daemon DLC", "Gang Burrito", "Oracle", "Peyote", "Rocoto", "Schafter", "Zion Cabrio", "Lectro", "Oracle XS", "Custom Voodoo", "Enduro", "Sentinel", "Wolfsbane", "Esskey", "Custom Virgo", "Huntley S", "Sentinel XS", "Custom Faction", "Dubsta", "Jackal", "Mesa", "FCR1000", "Avarus", "Chino", "Cliffhanger", "Custom Moonbeam", "Super Diamond", "Tornado Custom", "Vortex", "Casco", "Chino Custom", "Diablous", "Exemplar", "Felon", "Hustler", "Kalahari", "Slamvan", "Sultan", "Nightblade", "FCR1000 Custom", "Alpha", "Blade", "Chimera", "Felon GT", "Furore GT", "Hotknife", "Innovation", "Windsor", "Bati 801", "Zombie Bobber", "Patriot", "Windsor Drop", "Tornado Hot Rod", "Cognoscenti Cabrio", "Zombie Chopper", "Tulip", "Diablous Custom", "Elegy", "F620", "Sentinel Classic", "Suiner", "Feltzer", "Gargoyle", "Surano", "Baller LE", "Bati 801RR", "Coquette Classic", "Hermes", "Lynx", "Romeo Hearse", "Rumpo3", "Schafter V12", "Slamvan Custom", "Banshee", "Coquette", "Rapid GT", "9F", "Comet", "Rapid GT Convertible", "9F Cabrio", "Baller LWB", "Comet Retro Custom", "Contender", "Guardian", "Spacedocker", "Raiden", "Schwartzer", "Bestia GTS", "Elegy Retro Custom", "Voltic", "Phoenix", "Carbonizzare", "Sprunk Buffalo", "Bullet", "Massacro", "Hakuchou", "Kamacho", "Raptor", "Verkierer", "Jester Classic", "Sultan RS", "Massacro (Racecar)", "Nightshade", "Specter V2", "Ellie", "Stinger", "Comet Safari", "Flash GT", "Karuma", "Itali GT", "ETRI", "Brawler", "Bubsta 6x6", "JB 700", "Omnis", "Stirling GT", "Stinger GT", "Toros", "Tropos", "Vapid Dominator GTX", "Vindicator", "Coquette BlackFin", "Tyrus", "Franken Strange", "Merryweather Mesa", "Infernus", "Roosevelt Valor", "Penetrator", "Drift Tampa", "Roosevelt Valor Custom", "Cheetah", "Sanctus", "Banshee 900R", "Z-Type", "Burgershot Stalion", "Cheetah Classic", "Rapid GT Classic", "Deluxo", "Manroe", "Entity XF", "Trophy Truck", "Hakuchou Drag", "Turismo R", "Zentorno", "Shotaro", "Pfister811", "Reaper", "FMJ", "XA 21", "Osiris", "Ruston", "Dune Truck", "T20", "Jester", "Vagner", "X80 Proto", "Jester (Racecar)", "Adder", "RE-7B", "Mamba", "American Dream", "American Dream V2", "Nero Custom" }
local playerPed = GetPlayerPed(-1)
local hl = "amb@world_human_hammering@male@base" -- hammering with base
local wl = "amb@world_human_welding@male@base" -- welding with base
local el = "missminuteman_1ig_2" -- electrocute with tasered_2
local kl = "amb@medic@standing@tendtodead@idle_a" -- kneeling with idle_a
local hl_a = "base"
local wl_a = "base"
local el_a = "tasered_2"
local kl_a = "idle_a"
local knife = "WEAPON_KNIFE"
local wrench = "WEAPON_WRENCH"
local bottle = "WEAPON_BOTTLE"
local knuckle = "WEAPON_KNUCKLE"
local hammer = "WEAPON_HAMMER"
local welding_prop = "WORLD_HUMAN_WELDING"
local hammer_prop = "WORLD_HUMAN_HAMMERING"
local active = 0
local chance = 0
local vehicleChance = 0
local currentHealth = 0
local platenum = 0
local vehicleName = ""
local ep_loc = { { x = 1629.76, y = 2563.87, z = 45.56 } }
local lp_loc = { { x = 1628.30, y = 2651.11, z = 45.82 } }
local h_loc = { { x = 1591.72, y = 2559.50, z = 55.19 } }

local info = AddBlipForCoord(1629.76, 2563.87, 45.56)
SetBlipSprite(info, 446)
SetBlipDisplay(info, 2)
SetBlipScale(info, 1.0)
SetBlipColour(info, 1)
SetBlipAsShortRange(info, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Electrical Repair")
EndTextCommandSetBlipName(info)

local info2 = AddBlipForCoord(1628.30, 2651.11, 45.82)
SetBlipSprite(info2, 446)
SetBlipDisplay(info2, 2)
SetBlipScale(info2, 1.0)
SetBlipColour(info2, 49)
SetBlipAsShortRange(info2, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("License Plate")
EndTextCommandSetBlipName(info2)

--REQUEST ANIMATION LIBRARIES
RequestAnimDict(hl) --hammer lib
RequestAnimDict(wl) --welding lib
RequestAnimDict(el) --electrocute lib
RequestAnimDict(kl) --kneel lib
while not HasAnimDictLoaded(hl, wl, el, kl) do --if library does not exist
  Citizen.Wait(100)
end
while true do --if library exists
  Citizen.Wait(0)


  --[[MAINTENANCE JOB]]
  for k, v in pairs(ep_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (GetDistanceBetweenCoords(x, y, z, 1629.76, 2563.87, 45.56, false) < 200.0) then
      DrawMarker(1, 1629.76, 2563.87, 45.56 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      SetTextFont(0)
      SetTextProportional(1)
      SetTextScale(0.0, 0.6)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(0, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      AddTextComponentString("Press ~y~E~s~ to repair electric panel")
      DrawText(0.35, 0.85)
      if IsControlJustPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, wl, wl_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, welding_prop, 0, false)
        chance = math.floor(math.random(1, 50))
        if chance <= 25 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "Electric panel has been repaired.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance >= 26 then
          TaskPlayAnim(playerPed, el, el_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
          Citizen.Wait(7500)
          currentHealth = GetEntityHealth(playerPed)
          SetEntityHealth(playerPed, currentHealth - 20)
          exports.pNotify:SendNotification({text = "You've been shocked, rest for a few seconds..", type = "info", timeout = 3500, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        end --end if chance
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[LICENSE PLATE JOB]]
  for k, v in pairs(lp_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (GetDistanceBetweenCoords(x, y, z, 1628.30, 2651.11, 45.82, false) < 200.0) then
      DrawMarker(1, 1628.30, 2651.11, 45.82 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      SetTextFont(0)
      SetTextProportional(1)
      SetTextScale(0.0, 0.6)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(0, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      AddTextComponentString("Press ~y~E~s~ to make license plate")
      DrawText(0.35, 0.85)
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, hl, hl_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        vehicleChance = math.floor(math.random(1, 264))
        vehicleName = vehicleList[vehicleChance]
        if chance <= 2 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "License Plate created for a <font color='#FFFF00'>" .. vehicleName .. "</font>.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance == 3 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "Machine press is broken, wait <font color='#FF2F2F'>10</font> seconds for rebooting sequence..", type = "info", timeout = 9000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end --end if chance
        ClearPedTasks(playerPed)
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[HIDDEN WEAPON]]
    for k, v in pairs(h_loc) do
      local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
      if (GetDistanceBetweenCoords(x, y, z, 1591.72, 2559.50, 55.19, false) < 200.0) then
        DrawMarker(1, 1591.72, 2559.50, 55.19 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 244, 66, 66, 500, false, false, 2, false, false, false, false)
      end
      distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
      distance = math.ceil(distance)
      if distance <= 1 then
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.6)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString("Press ~y~E~s~ to search AC Unit")
        DrawText(0.35, 0.85)


        if (IsControlPressed(1, Keys["E"]) and active < 1) then
          TaskPlayAnim(playerPed, kl, kl_a, 8.0, 8.0, - 1, 50, 0, true, true, true)
          Wait(3500)
          ClearPedTasks(playerPed)
          chance = math.floor(math.random(1, 50))
          if (chance <= 5 ) then
            exports.pNotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
          elseif (chance > 5 and chance <= 10) then
            GiveWeaponToPed(playerPed, knife, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden knife..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 10 and chance <= 20) then
            GiveWeaponToPed(playerPed, bottle, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden bottle..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 20 and chance <= 30) then
            GiveWeaponToPed(playerPed, knuckle, 20, false, false)
            exports.pNotify:SendNotification({text = "You found hidden brass knuckles..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 30 and chance <= 40) then
            GiveWeaponToPed(playerPed, hammer, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden hammer..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif chance > 40 then
            GiveWeaponToPed(playerPed, wrench, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden wrench..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          end --end if
        end --end Key Press
        if (IsControlPressed(1, Keys["E"]) and active > 0) then
          TaskPlayAnim(playerPed, kl, kl_a, 8.0, 8.0, - 1, 50, 0, true, true, true)
          Citizen.Wait(3500)
          exports.pNotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
        end --end if
      end -- end distance check
    end -- for loop



end -- end Citizen.CreateThread while loop
end) --end Citizen.CreateThread