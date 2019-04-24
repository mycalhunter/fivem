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
local hammering_lib = "amb@world_human_hammering@male@base" -- welding with base
local welding_lib = "amb@world_human_welding@male@base" -- welding with base
local electrocute_lib = "missminuteman_1ig_2" -- welding with base
local kneel_lib = "amb@medic@standing@tendtodead@idle_a" -- welding with base
RequestAnimDict(hammering_lib)
RequestAnimDict(welding_lib)
RequestAnimDict(electrocute_lib)
RequestAnimDict(kneel_lib)
while not HasAnimDictLoaded(hammering_lib, welding_lib, electrocute_lib, kneel_lib) do --if library does not exist
  Citizen.Wait(100)
end
while true do --if library exists
  Citizen.Wait(0)
  local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) --set ped x,y,z coords
  local fm_coords = { {x = 1629.76, y = 2563.87, z = 45.56} } --set 'fix machine' marker x,y,z coords
  local lp_coords = { {x = 1753.49, y = 2503.66, z = 45.57} } --set 'license plate' marker x,y,z coords
  local k_coords = { {x = 1755.42, y = 2467.19, z = 55.14} } --set 'license plate' marker x,y,z coords

  --RemoveWeaponFromPed(GetPlayerPed(-1), "WEAPON_KNIFE")
  SetPedCanBeTargetted(GetPlayerPed(-1), false);


  --[[MAINTENANCE JOB]]
  for k, v in pairs(fm_coords) do
    distance = Vdist(x, y, z, v.x, v.y, v.z)
    Citizen.Wait(1)
    distance = math.ceil(distance)
    if distance <= 2 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(GetPlayerPed(-1), welding_lib, "base", 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, false)
        Citizen.Wait(3000)
        ClearPedTasks(GetPlayerPed(-1))
        local chance = math.floor(math.random(1, 50))
        if chance <= 25 then
          TriggerServerEvent("prisonworkjob")
        elseif chance >= 26 then
          TaskPlayAnim(GetPlayerPed(-1), electrocute_lib, "tasered_2", 8.0, 8.0, - 1, 50, 0, true, true, true)
          local currentHealth = GetEntityHealth(GetPlayerPed(-1))
          SetEntityHealth(GetPlayerPed(-1), currentHealth - 20)
          TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^1ACTION: ^0You\'ve been ^1ELECTROCUTED^0, be careful.")
          Citizen.Wait(5000)
          ClearPedTasks(GetPlayerPed(-1))
        end --end if chance
      end --end Key Press
    end -- end distance check
  end-- end for loop



  --[[LICENSE PLATE JOB]]
  for k, v in pairs(lp_coords) do
    distance = Vdist(x, y, z, v.x, v.y, v.z)
    Citizen.Wait(1)
    distance = math.ceil(distance)
    if distance <= 1 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(GetPlayerPed(-1), hammering_lib, "base", 8.0, 8.0, - 1, 50, 0, true, true, true)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_HAMMERING", 0, false)
        Citizen.Wait(3000)
        ClearPedTasks(GetPlayerPed(-1))

        local platenum = math.floor(math.random() * 100000 + 1)
        local remaining = math.floor(math.random(1000, 9999))
        local chance = math.floor(math.random(1, 50))

        if chance <= 25 then
          TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0License Plate Created : ^4[ " .. platenum .. " ].")
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(GetPlayerPed(-1))
        elseif chance >= 26 then
          TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0Machine press is broken, wait 10 seconds for rebooting sequence..")
          Citizen.Wait(10000)
          ClearPedTasks(GetPlayerPed(-1))
        end --end if chance
      end --end Key Press
    end -- end distance check
  end-- end for loop


  --[[HIDDEN KNIFE]]
  for k, v in pairs(k_coords) do
    distance = Vdist(x, y, z, v.x, v.y, v.z)
    Citizen.Wait(1)
    distance = math.ceil(distance)
    if distance <= 1 then
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(GetPlayerPed(-1), kneel_lib, "idle_a", 8.0, 8.0, - 1, 50, 0, true, true, true)
        Citizen.Wait(3000)
        GiveWeaponToPed(GetPlayerPed(-1), "WEAPON_KNIFE", 20, false, false)
        ClearPedTasks(GetPlayerPed(-1))
      end --end Key Press
    end -- end distance check
  end-- end for loop


end -- end while
end) --end function