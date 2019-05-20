local currJob = 1
local n = 0
local pauseJobStatus = true
local active = 0
local weaponChance = 0
local ep_loc = {
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
local lp_loc = {
[1] = { x = 1649.97, y = 2656.52, z = 45.71 } }
local const_loc = {
  [1] = { x = 1625.17, y = 2651.56, z = 45.56 },
  [2] = { x = 1628.36, y = 2648.71, z = 45.56 }
}
local h_loc = {
  { x = 1591.72, y = 2559.50, z = 55.19 },
  { x = 1602.91, y = 2483.52, z = 55.19 },
  { x = 1696.53, y = 2445.95, z = 55.16 },
  { x = 1779.01, y = 2488.27, z = 55.14 },
  { x = 1688.47, y = 2528.70, z = 55.88 },
}
local prisonworkblip_coords = {
  { x = 1629.76, y = 2563.87, z = 45.56 },
  { x = 1649.97, y = 2656.52, z = 45.71 },
  { x = 1625.17, y = 2651.56, z = 45.56 },
}
local default_locs = {
  { x = 1629.76, y = 2563.87, z = 45.56 },
  { x = 1649.97, y = 2656.52, z = 45.71 },
  { x = 1625.17, y = 2651.56, z = 45.56 },
}
local licenseVehList = {
  [1] = { veh = "Blisa" },
  [2] = { veh = "Brioso R/A" },
  [3] = { veh = "Dilettantec" },
  [4] = { veh = "Futo" },
  [5] = { veh = "Issi" },
  [6] = { veh = "Panto" },
  [7] = { veh = "Rhapsody" },
  [8] = { veh = "Cognoscenti Cabrio" },
  [9] = { veh = "F620" },
  [10] = { veh = "Felon GT" },
  [11] = { veh = "Oracle XS" },
  [12] = { veh = "Sentinel XS" },
  [13] = { veh = "Windsor" },
  [14] = { veh = "Windsor Drop" },
  [15] = { veh = "Zion" },
  [16] = { veh = "9F" },
  [17] = { veh = "Alpha" },
  [18] = { veh = "Banshee" },
  [19] = { veh = "Buffalo S" },
  [20] = { veh = "Carbonizzare" },
  [21] = { veh = "Comet SR" },
  [22] = { veh = "Elegy RH8" },
  [23] = { veh = "Flash GT" },
  [24] = { veh = "Kuruma" },
  [25] = { veh = "Revolter" },
  [26] = { veh = "Schwartzer" },
  [27] = { veh = "Sultan" },
  [28] = { veh = "Verlierer" },
  [29] = { veh = "Casco" },
  [30] = { veh = "Cheburek" },
  [31] = { veh = "Mamba" },
  [32] = { veh = "Stinger GT" },
  [33] = { veh = "Stirling GT" },
  [34] = { veh = "Z-Type" },
  [35] = { veh = "Coquette Classic" },
  [36] = { veh = "Adder" },
  [37] = { veh = "ETR1" },
  [38] = { veh = "Nero" },
  [39] = { veh = "T20" },
  [40] = { veh = "Vacca" },
  [41] = { veh = "X80 Proto" },
  [42] = { veh = "Ellie" },
  [43] = { veh = "Hermes" },
  [44] = { veh = "Sabre Turbo" },
  [45] = { veh = "Bison" },
  [46] = { veh = "Contender" },
  [47] = { veh = "Kamacho" },
  [48] = { veh = "Baller LE LWB" },
  [49] = { veh = "Mesa" },
  [50] = { veh = "Surfer" }
}
local furnitureList = {
  [1] = { wooditem = "Dining Room Table" },
  [2] = { wooditem = "Rocking Chair" },
  [3] = { wooditem = "End Table" },
  [4] = { wooditem = "Coffee Table" },
  [5] = { wooditem = "Bookcase" },
  [6] = { wooditem = "Nightstand" },
  [7] = { wooditem = "Coat Rack" },
  [8] = { wooditem = "Cabinet" },
  [9] = { wooditem = "Birdhouse" },
  [10] = { wooditem = "Pallet" }
}
function prisonWorkBlips(blipX, blipY, blipZ, blipSprite, blipScale, blipName)
  blip = AddBlipForCoord(blipX, blipY, blipZ)
  SetBlipSprite(blip, blipSprite)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, blipScale)
  SetBlipColour(blip, 4)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(blipName)
  EndTextCommandSetBlipName(blip)
end
prisonWorkBlips(lp_loc[currJob].x, lp_loc[currJob].y, lp_loc[currJob].z, 225, 1.0, "License Plate")
prisonWorkBlips(const_loc[currJob].x, const_loc[currJob].y, const_loc[currJob].z, 238, 1.0, "Construction Shop")
prisonWorkBlips(ep_loc[currJob].x, ep_loc[currJob].y, ep_loc[currJob].z, 354, 1.25, "Electrical Repair")
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
function getRandomChance()
  math.randomseed(GetGameTimer())
  randomChance = math.ceil(math.random(1, 3))
end
function getRandomWeaponChance()
  math.randomseed(GetGameTimer())
  weaponChance = math.ceil(math.random(1, 50))
end
Citizen.CreateThread(function()
  while true do --if library exists
  Citizen.Wait(0)
  playerPed = PlayerPedId()
  anim_hammering = "amb@world_human_hammering@male@base" -- hammering with base
  anim_welding = "amb@world_human_welding@male@base" -- welding with base
  anim_electrocute = "missminuteman_1ig_2" -- electrocute with tasered_2
  anim_kneeling = "amb@medic@standing@tendtodead@idle_a" -- kneeling with idle_a
  step_anim_hammering = "base"
  step_anim_welding = "base"
  step_anim_electrocute = "tasered_2"
  step_anim_kneeling = "idle_a"
  knife = "WEAPON_KNIFE"
  wrench = "WEAPON_WRENCH"
  bottle = "WEAPON_BOTTLE"
  knuckle = "WEAPON_KNUCKLE"
  hammer = "WEAPON_HAMMER"
  welding_prop = "WORLD_HUMAN_WELDING"
  hammer_prop = "WORLD_HUMAN_HAMMERING"
  randomChance = 0
  currentHealth = 0

  --REQUEST ANIMATION LIBRARIES
  RequestAnimDict(anim_hammering)
  RequestAnimDict(anim_welding)
  RequestAnimDict(anim_electrocute)
  RequestAnimDict(anim_kneeling)

  --[[MAINTENANCE JOB]]
  local pos = GetEntityCoords(playerPed, true)
  if (Vdist(pos.x, pos.y, pos.z, ep_loc[currJob].x, ep_loc[currJob].y, ep_loc[currJob].z) < 50.0) then
    DrawMarker(1, ep_loc[currJob].x, ep_loc[currJob].y, ep_loc[currJob].z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
  end
  local distance = Vdist(pos.x, pos.y, pos.z, ep_loc[currJob].x, ep_loc[currJob].y, ep_loc[currJob].z)
  distance = math.ceil(distance)
  if distance <= 1 then
    drawText("Press ~y~E~s~ to repair electric panel")
    if IsControlJustPressed(1, 38) then -- 38 = "E"
      TaskPlayAnim(playerPed, anim_welding, step_anim_welding, 8.0, 8.0, 10000, 1, 1, true, true, true)
      TaskStartScenarioInPlace(playerPed, welding_prop, 0, false)
      Wait(10000)
      getRandomChance()
      randomChance = math.floor(math.random(1, 3))
      if randomChance <= 2 then
        exports.pnotify:SendNotification({text = "Electric panel has been repaired.", type = "info", timeout = 5000, layout = "centerRight"})
        Wait(1500)
        TriggerServerEvent("prisonwork:maintjobCompleted")
        ClearPedTasks(playerPed)
        currJob = currJob + 1
        if currJob > 14 then
          n = 1
          currJob = 1
        end
      elseif randomChance == 3 then
        TaskPlayAnim(playerPed, anim_electrocute, step_anim_electrocute, 8.0, 8.0, 5000, 1, 1, true, true, true)
        currentHealth = GetEntityHealth(playerPed)
        SetEntityHealth(playerPed, currentHealth - 5)
        exports.pnotify:SendNotification({text = "You've been shocked, rest for a few seconds..", type = "info", timeout = 3500, layout = "centerRight"})
        Wait(3500)
        ClearPedTasks(playerPed)
      end
    end
  end
  if (currJob > 1 and distance < 200 and n == 0) or (n == 1) then
    SetBlipCoords(blip, ep_loc[currJob].x, ep_loc[currJob].y, ep_loc[currJob].z)
    SetBlipFlashes(blip, true)
    SetBlipFlashInterval(blip, 750)
  elseif distance > 150 then
    SetBlipFlashes(blip, false)
  end


  --[[LICENSE PLATE JOB]]
  for _, v in pairs(lp_loc) do
    local pos = GetEntityCoords(playerPed, true)
    if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z, false) < 50.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z)
    distance = math.ceil(distance)
    if distance <= 1 then
      drawText("Press ~y~E~s~ to make license plate")
      if IsControlPressed(1, 38) then -- 38 = "E"
        TaskPlayAnim(playerPed, anim_hammering, step_anim_hammering, 8.0, 8.0, 10000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        Citizen.Wait(10000)
        getRandomChance()
        randVeh = math.random(1, #licenseVehList)
        vehicleName = licenseVehList[randVeh].veh
        print("Number of options:" .. #licenseVehList)
        print("Success randomChance:" .. randomChance)
        print("Vehicle Number:" .. randVeh)
        if randomChance == 1 or randomChance == 2 then
          exports.pnotify:SendNotification({text = "License Plate created for a <font color='#FFFF00'> " .. vehicleName .. "</font>.", type = "info", timeout = 5000, layout = "centerRight"})
          TriggerServerEvent("prisonwork:licensejobCompleted")
          ClearPedTasks(playerPed)
        elseif randomChance == 3 then
          exports.pnotify:SendNotification({text = "Machine press is broken, wait <font color='#FF2F2F'>10</font> seconds for rebooting sequence..", type = "info", timeout = 10000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(10000)
          exports.pnotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end
        ClearPedTasks(playerPed)
      end
    end
  end



  --[[CONSTRUCTION JOB]]
  for _, v in pairs(const_loc) do
    local pos = GetEntityCoords(playerPed, true)
    if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z, false) < 50.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z)
    distance = math.ceil(distance)
    if distance <= 1.5 then
      drawText("Press ~y~E~s~ to do wood work")
      if IsControlPressed(1, 38) then -- 38 = "E"
        TaskPlayAnim(playerPed, anim_hammering, step_anim_hammering, 8.0, 8.0, 10000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        getRandomChance()
        local furnitureChance = math.random(1, 7)
        if randomChance <= 2 then
          Citizen.Wait(10000)
          exports.pnotify:SendNotification({text = "A <font color='#FFFF00'>" .. furnitureList[furnitureChance].wooditem .. "</font> has been built.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonwork:constructionjobCompleted")
          ClearPedTasks(playerPed)
        elseif randomChance == 3 then
          Citizen.Wait(10000)
          exports.pnotify:SendNotification({text = "Warped wood is bad good. Take a few seconds and get a new piece..", type = "info", timeout = 3000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(3000)
          exports.pnotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end
        ClearPedTasks(playerPed)
      end
    end
  end



  --[[HIDDEN WEAPON]]
  for _, v in pairs(h_loc) do
    local pos = GetEntityCoords(playerPed, true)
    --[[if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z, false) < 10.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 244, 66, 66, 500, false, false, 2, false, false, false, false)
    end]]
    distance = Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z)
    distance = math.ceil(distance)
    if distance <= 1 then
      drawText("Press ~y~E~s~ to search AC Unit")
      if (IsControlPressed(1, 38) and active == 0) then -- 38 = "E"
        TaskPlayAnim(playerPed, anim_kneeling, step_anim_kneeling, 8.0, 8.0, - 1, 50, 0, true, true, true)
        Wait(3500)
        ClearPedTasks(playerPed)
        getRandomWeaponChance()
        print("Chance:" .. weaponChance .. " and Active:" .. active)
        if (weaponChance <= 5 ) then
          exports.pnotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
        elseif (weaponChance > 5 and weaponChance <= 10) then
          GiveWeaponToPed(playerPed, knife, 20, false, false)
          exports.pnotify:SendNotification({text = "You found a hidden knife..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          active = 1
        elseif (weaponChance > 10 and weaponChance <= 20) then
          GiveWeaponToPed(playerPed, bottle, 20, false, false)
          exports.pnotify:SendNotification({text = "You found a hidden bottle..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          active = 1
        elseif (weaponChance > 20 and weaponChance <= 30) then
          GiveWeaponToPed(playerPed, knuckle, 20, false, false)
          exports.pnotify:SendNotification({text = "You found hidden brass knuckles..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          active = 1
        elseif (weaponChance > 30 and weaponChance <= 40) then
          GiveWeaponToPed(playerPed, hammer, 20, false, false)
          exports.pnotify:SendNotification({text = "You found a hidden hammer..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          active = 1
        elseif weaponChance > 40 then
          GiveWeaponToPed(playerPed, wrench, 20, false, false)
          exports.pnotify:SendNotification({text = "You found a hidden wrench..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          active = 1
        end
      end
      if (IsControlPressed(1, 38) and active == 1) then -- 38 = "E"
        TaskPlayAnim(playerPed, anim_kneeling, step_anim_kneeling, 8.0, 8.0, - 1, 50, 0, true, true, true)
        Wait(3500)
        exports.pnotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
        ClearPedTasks(playerPed)
      end
    end
  end

end
end)