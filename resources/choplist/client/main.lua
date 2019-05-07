Citizen.CreateThread(function()
  local playerPed = GetPlayerPed(-1)
  --[[BLIP FOR JOB START -- HIDE IN PRODUCTION]]
  info = AddBlipForCoord(-93.28, 19.40, 71.48)
  SetBlipSprite(info, 238)
  SetBlipDisplay(info, 4)
  SetBlipScale(info, 1.0)
  SetBlipColour(info, 21)
  SetBlipAsShortRange(info, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Chop List")
  EndTextCommandSetBlipName(info)
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
  local vehicleList = {
    [1] = { vehicle = "Bison" },
    [2] = { vehicle = "Seminole" },
    [3] = { vehicle = "Rhapsody" },
    [4] = { vehicle = "Cavalcade" },
    [5] = { vehicle = "Emperor" },
    [6] = { vehicle = "Adder"}
  }
  local dropoff = { { x = 946.99, y = -1698.05, z = 30.09 } }
  local start = { { x = -93.28, y = 19.40, z = 71.48 } }
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
  local model = GetHashKey("a_m_y_mexthug_01")
  RequestModel(model)
  while not HasModelLoaded(model) do
    Wait(0)
  end
  local chopPed = CreatePed(26, model, - 93.28, 19.40, 71.48 - 1.0, 172.48, false, true)


  while true do
    Citizen.Wait(0)
    check = 0
    local veh = GetVehiclePedIsIn(playerPed, false)
    local model = GetEntityModel(veh)
    local displaytext = GetDisplayNameFromVehicleModel(model)
    local name = GetLabelText(displaytext)
    local timer = 10000 --timer between available jobs
    local handoff = "handposes-0" -- hammering with base
    local notepad = "p_notepad_01_s-0" --notepad prop
    local tod = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"
    RequestAnimDict(handoff) --hammer lib


    --[[ PICKUP ORDER FOR VEHICLE ]]
    for _, v in pairs(start) do
      local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
      if (Vdist(x, y, z, v.x, v.y, v.z, false) < 20.0) then
        DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 255, 0, 0, 500, false, false, 2, false, false, false, false)
      end
      if (Vdist(x, y, z, v.x, v.y, v.z, false) < 1) then
        drawText("Press ~y~E~s~ to get chop list")
        if IsControlJustPressed(1, Keys["E"]) then
          TaskPlayAnim(playerPed, handoff, notepad, 8.0, 8.0, 15000, 1, 1, false, true, true)
          TaskStartScenarioInPlace(playerPed, tod, 0, true)
          exports.pNotify:SendNotification({text = "Getting name of a wanted vehicle..", type = "info", timeout = 15000, layout = "centerRight"})
          Citizen.Wait(16000)
          ClearPedTasksImmediately(playerPed)
          chance = math.floor(math.random(1, #vehicleList))
          exports.pNotify:SendNotification({text = "Deliver a <font color='#FFFF00'>" .. vehicleList[chance].vehicle .. "</font> to the storage unit.", type = "info", timeout = 8000, layout = "centerRight"})
          Citizen.Wait(timer) -- wait 60 seconds until next vehicle is available for selection
        end
      end
      if IsPedInAnyVehicle(PlayerPedId(), false) then
        if (name == vehicleList[chance].vehicle) then
          if check == 0 then
            exports.pNotify:SendNotification({text = "This vehicle is <font color='#ff0000'>wanted</font>..", type = "info", timeout = 15000, layout = "centerRight"})
            Citizen.Wait(1000)
            check = 1
          end
        else
          check = 0
        end
      end
    end


    --[[ DROP OFF AND VERIFY VEHICLE ]]
    for _, v in pairs(dropoff) do
      local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
      if (Vdist(x, y, z, v.x, v.y, v.z, false) < 100.0) then
        DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0 + 0.5, 255, 0, 0, 500, false, false, 2, false, false, false, false)
      end
      if (Vdist(x, y, z, v.x, v.y, v.z, false) < 4) then
        if IsPedInVehicle(playerPed, veh, true) then -- check if ped is in vehicle
          drawText("Press ~y~E~s~ to deliver ~b~" .. name .. "~s~.")
          if IsControlJustPressed(1, Keys["E"]) then
            if name == vehicleList[chance].vehicle then
              exports.pNotify:SendNotification({text = "You have delivered an " .. name .. ".", type = "info", timeout = 8000, layout = "centerRight"})
              SetEntityAsMissionEntity(veh)
              Wait(1000)
              DeleteEntity(veh)
              Wait(1000)
              TriggerServerEvent("choplistjob")
            else
              exports.pNotify:SendNotification({text = "Does this look like a <font color='#FFFF00'>" .. vehicleList[chance].vehicle .. "</font> to you? Get out here.. ", type = "info", timeout = 8000, layout = "centerRight"})
            end -- end for loop
          end -- key press
        end -- is ped in vehicle
      end -- 4 distance check
    end -- for loop




  end
end)