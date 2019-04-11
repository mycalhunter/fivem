ESX = nil
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83,
  ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40,
  ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20,
  ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108,
  ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
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
  local welding_lib = "amb@world_human_welding@male@base" -- welding with base
  local electrocute_lib = "facials@p_m_zero@variations@electrocuted" -- welding with base
  RequestAnimDict(welding_lib) --get animation library from game
  RequestAnimDict(electrocute_lib) --get animation library from game
  while not HasAnimDictLoaded(welding_lib, electrocute_lib) do --if library does not exist
    Citizen.Wait(100)
  end
  while true do --if library exists
    Citizen.Wait(0)
    --[[PLAYER COORDS]]
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) --set ped x,y,z coords
    --[[JOB COORDS]]
    local fm_coords = { {x = 1697.71, y = 2684.01, z = 45.56} } --set 'fix machine' marker x,y,z coords
    local lp_coords = { {x = 1705.00, y = 1680.00, z = 45.56} } --set 'license plate' marker x,y,z coords

    --[[MAINTENANCE JOB]]
    for k, v in pairs(fm_coords) do
      distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true) --get distance between ped coords and marker coords
      Citizen.Wait(100)
      distance = math.ceil(distance) --round up distance to whole int
      if distance <= 1 then --check if distance between ped and marker is less than or equal to 1
        --TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Distance is : " .. distance) --for debug
        if IsControlPressed(1, Keys["G"]) then --press G to start job
          Citizen.Wait(0) --wait to get data
          TaskPlayAnim(GetPlayerPed(-1), welding_lib, "base", 8.0, 8.0, - 1, 50, 0, true, true, true) --hammering emote with locked movement
          Citizen.Wait(3000) --wait before clearing emote from ped
          ClearPedTasks(GetPlayerPed(-1)) --reset ped emote
          local chance = math.random(1, 5) --get random number between 1-5
          if chance = 1 or chance = 2 or chance = 3 then
            TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION: ^0Electrical wires have been fixed")
            TriggerServerEvent("prisonworkjob") --payout
            TriggerServerEvent('bank:getbank')
            Citizen.Wait(1000) --wait before clearing emote from ped
          elseif chance = 4 or chance = 5 then
            TaskPlayAnim(GetPlayerPed(-1), electrocute_lib, "electrocuted_1", 8.0, 8.0, - 1, 50, 0, false, false, false) --electrocuted emote with unlocked movement
            Citizen.Wait(3000) --wait before clearing emote from ped
            local currentHealth = GetEntityHealth(GetPlayerPed(-1))
            SetEntityHealth(GetPlayerPed(-1), currentHealth - 5)
            TriggerEvent('esx:showNotification', s, '~y~WATCH OUT!~s~')
          else
            TriggerEvent('esx:showNotification', s, 'Contact Admin: Number was outside of range')
            ClearPedTasks(GetPlayerPed(-1))
          end --end if chance
        end --end Key Press
      end -- end distance check
    end-- end for loop

    --[[LICENSE PLATE JOB]]
    for k, v in pairs(lp_coords) do
      distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true) --get distance between ped coords and marker coords
      Citizen.Wait(100)
      distance = math.ceil(distance) --round up distance to whole int
      if distance <= 1 then --check if distance between ped and marker is less than or equal to 1
        --TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Distance is : " .. distance) --for debug
        if IsControlPressed(1, Keys["G"]) then --press G to start job
          Citizen.Wait(0) --wait to get data
          TaskPlayAnim(GetPlayerPed(-1), welding_lib, "base", 8.0, 8.0, - 1, 50, 0, true, true, true) --hammering emote with locked movement
          Citizen.Wait(3000) --wait before clearing emote from ped
          ClearPedTasks(GetPlayerPed(-1)) --reset ped emote

          local platenum = math.floor(math.random() * 100000 + 1) --generate random 5 digit number for license plate
          local remaining = math.floor(math.random(1000, 9999)) --generate random number between 1000 and 9999
          local chance = math.random(1, 5) --get random number between 1-5

          if chance = 1 or chance = 2 or chance = 3 then
            TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0License Plate Created : ^4[ " .. platenum .. " ]. ^r^0" .. remaining .. " license plates remaining..")
            TriggerServerEvent("prisonworkjob") --payout
            Citizen.Wait(1000) --wait before clearing emote from ped
            ClearPedTasks(GetPlayerPed(-1))
          elseif chance = 4 or chance = 5 then
            TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION:^r ^0Machine press is broken, wait 30 seconds for rebooting sequence..")
            Citizen.Wait(30000) --wait 30 seconds if machine is broken
            ClearPedTasks(GetPlayerPed(-1))
          else
            TriggerEvent('esx:showNotification', s, 'Contact Admin: Number was outside of range')
            ClearPedTasks(GetPlayerPed(-1))
          end --end if chance
        end --end Key Press
      end -- end distance check
    end-- end for loop
  end -- end while
end) --end function