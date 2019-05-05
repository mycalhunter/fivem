ep_loc = {
  [1] = { x = 1629.76, y = 2563.87, z = 45.56 },
  [2] = { x = 1652.60, y = 2563.72, z = 45.56 },
  [3] = { x = 1699.61, y = 2475.06, z = 45.56 },
  [4] = { x = 1680.12, y = 2480.85, z = 45.56 },
  [5] = { x = 1643.87, y = 2491.48, z = 45.56 },
  [6] = { x = 1623.08, y = 2507.83, z = 45.56 },
  [7] = { x = 1610.27, y = 2540.30, z = 45.56 },
  [8] = { x = 1609.78, y = 2566.49, z = 45.56 },
  [9] = { x = 1623.86, y = 2577.37, z = 45.56 },
  [10] = { x = 1759.75, y = 2519.30, z = 45.56 },
  [11] = { x = 1737.49, y = 2505.39, z = 45.56 },
  [12] = { x = 1605.44, y = 2642.21, z = 45.56 },
  [13] = { x = 1605.36, y = 2620.94, z = 45.56 },
  [14] = { x = 1718.54, y = 2527.89, z = 45.56 },
}
lp_loc = { { x = 1649.97, y = 2656.52, z = 45.71 } }
const_loc = {
  { x = 1625.17, y = 2651.56, z = 45.56 },
  { x = 1628.36, y = 2648.71, z = 45.56 }
}
h_loc = {
  { x = 1591.72, y = 2559.50, z = 55.19 },
  { x = 1602.91, y = 2483.52, z = 55.19 },
  { x = 1696.53, y = 2445.95, z = 55.16 },
  { x = 1779.01, y = 2488.27, z = 55.14 },
  { x = 1688.47, y = 2528.70, z = 55.88 },
}
playerPed = GetPlayerPed(-1)
i = 1
vehicleList = { "Rusty Surfer", "Faggio", "Rusty Rebel", "Surfer", "Faggio Sport", "Faggio Mod", "Regina", "Youga Classic", "Ingot", "Picador", "Primo Custom", "Blista", "Asea", "Dilettante", "Futo", "Minivan", "Premier", "Stanier", "Stratum", "Primo", "Monkey Blista", "Rhapsody", "Rumpo", "Rumpo II", "Bodhi", "Taco Van", "Asterope", "Issi", "Panto", "Prairie", "Ratbike", "Rebel", "Sabre Turbo", "Rancher XL", "Intruder", "Youga", "Brioso R/A", "Blazer", "Blazer Sport", "Dune Buggy", "Glendale", "Sanchez", "Tornado", "Vigero", "Warrener", "Bobcat XL", "Fugitive", "Beejay XL", "Blista Compact", "Boxville", "Journey", "Penumbra", "Sabre GT", "Seminole", "Washington", "Issi Classic", "Buccaneer", "Vader", "Baller", "Bison", "Emperor", "Faction", "Granger", "Stretch", "Carbon RS", "Gaunlet", "Radius", "Buffalo", "Burrito", "Cavalcade", "Paradise", "Virgo", "Surge", "Dukes", "Fuslade", "Pigalle", "Akuma", "Hexer", "Bifta", "Clown Van", "Dominator", "Injection", "PCJ-600", "Buffalo S", "Manana", "Ruffian", "Sandking", "Nemesis", "Bagger", "Baller 2nd Gen", "XLS", "Daemon", "Rat Truck", "Landstalker", "Sovereign", "Tailgator", "Tampa", "Zion", "Double T", "Cheburek", "Custom Minivan", "Daemon DLC", "Gang Burrito", "Oracle", "Peyote", "Rocoto", "Schafter", "Zion Cabrio", "Lectro", "Oracle XS", "Custom Voodoo", "Enduro", "Sentinel", "Wolfsbane", "Esskey", "Custom Virgo", "Huntley S", "Sentinel XS", "Custom Faction", "Dubsta", "Jackal", "Mesa", "FCR1000", "Avarus", "Chino", "Cliffhanger", "Custom Moonbeam", "Super Diamond", "Tornado Custom", "Vortex", "Casco", "Chino Custom", "Diablous", "Exemplar", "Felon", "Hustler", "Kalahari", "Slamvan", "Sultan", "Nightblade", "FCR1000 Custom", "Alpha", "Blade", "Chimera", "Felon GT", "Furore GT", "Hotknife", "Innovation", "Windsor", "Bati 801", "Zombie Bobber", "Patriot", "Windsor Drop", "Tornado Hot Rod", "Cognoscenti Cabrio", "Zombie Chopper", "Tulip", "Diablous Custom", "Elegy", "F620", "Sentinel Classic", "Suiner", "Feltzer", "Gargoyle", "Surano", "Baller LE", "Bati 801RR", "Coquette Classic", "Hermes", "Lynx", "Romeo Hearse", "Rumpo3", "Schafter V12", "Slamvan Custom", "Banshee", "Coquette", "Rapid GT", "9F", "Comet", "Rapid GT Convertible", "9F Cabrio", "Baller LWB", "Comet Retro Custom", "Contender", "Guardian", "Spacedocker", "Raiden", "Schwartzer", "Bestia GTS", "Elegy Retro Custom", "Voltic", "Phoenix", "Carbonizzare", "Sprunk Buffalo", "Bullet", "Massacro", "Hakuchou", "Kamacho", "Raptor", "Verkierer", "Jester Classic", "Sultan RS", "Massacro (Racecar)", "Nightshade", "Specter V2", "Ellie", "Stinger", "Comet Safari", "Flash GT", "Karuma", "Itali GT", "ETRI", "Brawler", "Bubsta 6x6", "JB 700", "Omnis", "Stirling GT", "Stinger GT", "Toros", "Tropos", "Vapid Dominator GTX", "Vindicator", "Coquette BlackFin", "Tyrus", "Franken Strange", "Merryweather Mesa", "Infernus", "Roosevelt Valor", "Penetrator", "Drift Tampa", "Roosevelt Valor Custom", "Cheetah", "Sanctus", "Banshee 900R", "Z-Type", "Burgershot Stalion", "Cheetah Classic", "Rapid GT Classic", "Deluxo", "Manroe", "Entity XF", "Trophy Truck", "Hakuchou Drag", "Turismo R", "Zentorno", "Shotaro", "Pfister811", "Reaper", "FMJ", "XA 21", "Osiris", "Ruston", "Dune Truck", "T20", "Jester", "Vagner", "X80 Proto", "Jester (Racecar)", "Adder", "RE-7B", "Mamba", "American Dream", "American Dream V2", "Nero Custom" }
Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
 furnitureList = { "Bookshelf", "Office Desk", "Rocking Chair", "Dining Table", "Filing Cabinet", "Birdhouse", "Dining Chair" }
 hl = "amb@world_human_hammering@male@base" -- hammering with base
 wl = "amb@world_human_welding@male@base" -- welding with base
 el = "missminuteman_1ig_2" -- electrocute with tasered_2
 kl = "amb@medic@standing@tendtodead@idle_a" -- kneeling with idle_a
 hl_a = "base"
 wl_a = "base"
 el_a = "tasered_2"
 kl_a = "idle_a"
 knife = "WEAPON_KNIFE"
 wrench = "WEAPON_WRENCH"
 bottle = "WEAPON_BOTTLE"
 knuckle = "WEAPON_KNUCKLE"
 hammer = "WEAPON_HAMMER"
 welding_prop = "WORLD_HUMAN_WELDING"
 hammer_prop = "WORLD_HUMAN_HAMMERING"
 active = 0
 chance = 0
 vehicleChance = 0
 currentHealth = 0
 vehicleName = ""

--[[ELECTRIC JOB BLIP]]
info = AddBlipForCoord(1629.76, 2563.87, 45.56)
SetBlipSprite(info, 354)
SetBlipDisplay(info, 4)
SetBlipScale(info, 1.5)
SetBlipColour(info, 5)
SetBlipAsShortRange(info, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Electrical Repair")
EndTextCommandSetBlipName(info)

--[[lICENSE PLATE JOB BLIP]]
info2 = AddBlipForCoord(1649.97, 2656.52, 45.71)
SetBlipSprite(info2, 225)
SetBlipDisplay(info2, 4)
SetBlipScale(info2, 1.0)
SetBlipColour(info2, 3)
SetBlipAsShortRange(info2, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("License Plate")
EndTextCommandSetBlipName(info2)

--[[CONSTRUCTION JOB BLIP]]
info3 = AddBlipForCoord(1625.17, 2651.56, 45.56)
SetBlipSprite(info3, 238)
SetBlipDisplay(info3, 4)
SetBlipScale(info3, 1.0)
SetBlipColour(info3, 21)
SetBlipAsShortRange(info3, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Construction Shop")
EndTextCommandSetBlipName(info3)

Citizen.CreateThread(function()

--DRAW TEXT ON MARKER
function drawText(text)
  SetTextFont(0)
  SetTextProportional(1)
  SetTextScale(0.0, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(0, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.35, 0.85) --position
end

--REQUEST ANIMATION LIBRARIES
RequestAnimDict(hl) --hammer lib
RequestAnimDict(wl) --welding lib
RequestAnimDict(el) --electrocute lib
RequestAnimDict(kl) --kneel lib
while true do --if library exists
  Citizen.Wait(0)

  --[[MAINTENANCE JOB]]
  if i == i then
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, ep_loc[i].x, ep_loc[i].y, ep_loc[i].z) < 10.0) then
      DrawMarker(1, ep_loc[i].x, ep_loc[i].y, ep_loc[i].z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    local distance = Vdist(x, y, z, ep_loc[i].x, ep_loc[i].y, ep_loc[i].z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      drawText("Press ~y~E~s~ to repair electric panel")
      if IsControlJustPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, wl, wl_a, 8.0, 8.0, 10000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, welding_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        if chance <= 2 then
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Electric panel has been repaired.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
          i = i + 1
        elseif chance == 3 then
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
    if i > 1 and distance < 300 then
      SetNewWaypoint(ep_loc[i].x, ep_loc[i].y)
    else i = 1 or distance > 300
      ClearGpsPlayerWaypoint()
    end
  end -- if




  --[[LICENSE PLATE JOB]]
  for k, v in pairs(lp_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, v.x, v.y, v.z, false) < 10.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = Vdist(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      drawText("Press ~y~E~s~ to make license plate")
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, hl, hl_a, 8.0, 8.0, 10000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        vehicleChance = math.floor(math.random(1, 264))
        vehicleName = vehicleList[vehicleChance]
        if chance <= 2 then
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "License Plate created for a <font color='#FFFF00'>" .. vehicleName .. "</font>.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance == 3 then
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Machine press is broken, wait <font color='#FF2F2F'>10</font> seconds for rebooting sequence..", type = "info", timeout = 9000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end --end if chance
        ClearPedTasks(playerPed)
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[CONSTRUCTION JOB]]
  for k, v in pairs(const_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, v.x, v.y, v.z, false) < 10.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = Vdist(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1.5 then
      drawText("Press ~y~E~s~ to do wood work")
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, hl, hl_a, 8.0, 8.0, 10000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        furnitureChance = math.floor(math.random(1, 7))
        furnitureName = furnitureList[furnitureChance]
        if chance <= 2 then
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "A <font color='#FFFF00'>" .. furnitureName .. "</font> has been built.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance == 3 then
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Warped wood is bad good. Take a few seconds and get a new piece..", type = "info", timeout = 3000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(3000)
          exports.pNotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end --end if chance
        ClearPedTasks(playerPed)
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[HIDDEN WEAPON]]
  for k, v in pairs(h_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, v.x, v.y, v.z, false) < 10.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 244, 66, 66, 500, false, false, 2, false, false, false, false)
    end
    distance = Vdist(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      drawText("Press ~y~E~s~ to search AC Unit")
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