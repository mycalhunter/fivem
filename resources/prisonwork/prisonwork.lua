
Citizen.CreateThread(function()
  local hammering_lib = "amb@world_human_hammering@male@base" -- hammering with base
  RequestAnimDict(hammering_lib)
  while not HasAnimDictLoaded(hammering_lib) do
    Citizen.Wait(100)
  end
  while true do
    Citizen.Wait(0)



    --[[
    local location = vector3(1697.97,2683.93,45.56) --location of marker
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped
    if location == pos.x, pos.y, pos.z then
      TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^2You've received $500 for making a license plate")
    end]]
    local areas = { {x = 1697.97, y = 2683.93, z = 45.56} }

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

    for k, v in pairs(areas) do
      distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
      Citizen.Wait(100)
      distance = math.ceil(distance)

      if distance <= 1 then
        --TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Distance is : " .. distance)
        local Keys = {
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
        if IsControlPressed(1, Keys["G"]) then
          TaskPlayAnim(GetPlayerPed(-1), hammering_lib, "base", 8.0, 8.0, - 1, 50, 0, true, true, true)
          Citizen.Wait(3000)
          ClearPedTasks(GetPlayerPed(-1)) --reset ped emote
          local platenum = math.floor(math.random() * 100000 + 1)
          local remaining = math.floor(math.random(1000, 9999))
          TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^3ACTION: ^0License Plate Created : ^2[ " .. platenum .. " ]. ^r^0" .. remaining .. " license plates remaining..")

          --[[
          ADD MONEY TO PLAYERS BANK ONCE JOB IS COMPLETED
          ]]
          TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^4SERVER: You've received $500 for making a license plate")
        else
          ClearPedTasks(GetPlayerPed(-1))
        end --end Key Press
      end -- end distance check
    end-- end for loop
  end -- end while
end) --end function