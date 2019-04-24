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
local vehicleList = {
  "Adder",
  "Zentorno",
  "Asea",
  "Baller",
  "Bati",
  "Blista",
  "Buffalo",
  "Bison",
  "Carbonizzare",
  "Carbon RS",
  "Cheetah",
  "Cheetah Classic",
  "Coquette",
  "Daemon",
  "Dilettante",
  "Dubsta",
  "Faggio",
  "Futo",
  "Granger",
  "Ingot",
  "Mesa",
  "Patriot",
  "Rebel",
  "Sandking XL",
  "Sentinel",
  "Vacca",
  "Voltic",
  "Z-Type",
  "Nero",
  "Nero Custom",
}
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
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^1ACTION: ^0You\'ve been ^1ELECTROCUTED^0, be careful.")          
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
        local chance = math.floor(math.random(1, 30))
        local vehicleName = vehicleList[chance]
        if chance <= 15 then
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0License Plate Created ^4[ " .. platenum .. " ]^0 for a ^3" .. vehicleName .. "^0.")
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
        elseif chance >= 16 then
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0Machine press is broken, wait 10 seconds for rebooting sequence..")
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
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0You found a hidden knife..")
        elseif (chance > 10 and <= 20) then
          GiveWeaponToPed(playerPed, bottle, 20, false, false)
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0You found a hidden bottle..")
        elseif (chance > 20 and <= 30) then
          GiveWeaponToPed(playerPed, knuckle, 20, false, false)
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0You found a hidden brass knuckle..")
        elseif (chance > 30 and <= 40) then
          GiveWeaponToPed(playerPed, hammer, 20, false, false)
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0You found a hidden hammer..")
        elseif chance > 40 then
          GiveWeaponToPed(playerPed, wrench, 20, false, false)
          TriggerEvent("chat:addMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0You found a hidden wrench..")
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