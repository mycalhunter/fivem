--[[
CHOP LIST
- 100+ Vehicles to be selected
- Hidden location to receive order for randomly selected vehicle
- Hidden location to drop off order
- Payout is low % of retail price
-- Drop off checks if vehicle health is above/below threshold
-- Drop off checks if vehicle matches the vehicle on order
-- Drop off prompts player to return to first location for new order
]]

Citizen.CreateThread(function()
-----------------------------------------------------
------ VARIABLES THAT WILL NOT CHANGE DURING A JOB ------
-----------------------------------------------------
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
--[[DRAW TEXT ON MARKER]]
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
--[[CREATE PED TO STAND AT PICKUP LOCATION]]
local model = GetHashKey("a_m_y_mexthug_01")
RequestModel(model)
while not HasModelLoaded(model) do
  Wait(0)
end
local chopPed = CreatePed(26, model, - 93.28, 19.40, 71.48 - 1.0, 172.48, false, true)
while true do
  Citizen.Wait(0)
  -----------------------------------------------------
  ---- VARIABLES THAT WILL CHANGE DURING A JOB ----
  -----------------------------------------------------
  playerPed = GetPlayerPed(-1) --get player
  check = 0
  active = false
  vehicleList = {
    [1] = { vehicle = "Bison", payout = 30000 },
    [2] = { vehicle = "Seminole" payout = 25000 },
    [3] = { vehicle = "Rhapsody" payout = 12000 },
    [4] = { vehicle = "Cavalcade" payout = 35000 },
    [5] = { vehicle = "Emperor" payout = 30000 },
    [6] = { vehicle = "Adder", payout = 3000000 },
    [7] = { vehicle = "Dilettante", payout = 10000 },
    [8] = { vehicle = "Futo", payout = 10000 },
    [10] = { vehicle = "Panto", payout = 15000 },
    [11] = { vehicle = "Prairie", payout = 15000 },
    [12] = { vehicle = "Exemplar", payout = 95000 },
    [13] = { vehicle = "F620", payout = 115000 },
    [14] = { vehicle = "Felon", payout = 100000 },
    [15] = { vehicle = "Jackal", payout = 85000 },
    [16] = { vehicle = "Windsor", payout = 100000 },
    [17] = { vehicle = "Zion", payout = 60000 },
    [18] = { vehicle = "Alpha", payout = 100000 },
    [19] = { vehicle = "Banshee", payout = 130000 },
    [20] = { vehicle = "Buffalo", payout = 165000 },
    [21] = { vehicle = "Carbonizzare", payout = 160000 },
    [22] = { vehicle = "Coquette", payout = 130000 },
    [23] = { vehicle = "Flash GT", payout = 195000 },
    [24] = { vehicle = "Fusilade", payout = 40000 },
    [25] = { vehicle = "Jester", payout = 180000 },
    [26] = { vehicle = "Kuruma", payout = 195000 },
    [27] = { vehicle = "Lynx", payout = 125000 },
    [28] = { vehicle = "Massacro", payout = 170000 },
    [29] = { vehicle = "Omnis", payout = 200000 },
    [30] = { vehicle = "Penumbra", payout = 25000 },
    [31] = { vehicle = "Raiden", payout = 145000 },
    [32] = { vehicle = "Raptor", payout = 175000 },
    [33] = { vehicle = "Ruston", payout = 1950000 },
    [34] = { vehicle = "Schwartzer", payout = 145000 },
    [35] = { vehicle = "Specter", payout = 185000 },
    [36] = { vehicle = "Sultan", payout = 180000 },
    [37] = { vehicle = "Surano", payout = 120000 },
    [38] = { vehicle = "Tropos", payout = 210000 },
    [39] = { vehicle = "Casco", payout = 95000 },
    [40] = { vehicle = "Deluxo", payout = 400000 },
    [41] = { vehicle = "Mamba", payout = 4250000 },
    [42] = { vehicle = "Monroe", payout = 445000 },
    [43] = { vehicle = "Peyote", payout = 65000 },
    [44] = { vehicle = "Pigalle", payout = 40000 },
    [45] = { vehicle = "Stinger", payout = 190000 },
    [46] = { vehicle = "Bullet", payout = 170000 },
    [47] = { vehicle = "Cheetah", payout = 280000 },
    [48] = { vehicle = "FMJ", payout = 1750000 },
    [49] = { vehicle = "Infernus", payout = 230000 },
    [50] = { vehicle = "Nero", payout = 10000000 },
    [51] = { vehicle = "Osiris", payout = 1950000 },
    [52] = { vehicle = "Penetrator", payout = 255000 },
    [53] = { vehicle = "Reaper", payout = 1595000 },
    [54] = { vehicle = "T20", payout = 2200000 },
    [55] = { vehicle = "Tyrus", payout = 220000 },
    [56] = { vehicle = "Vacca", payout = 9999999 }, --get price
    [57] = { vehicle = "Vagner", payout = 2540000 },
    [58] = { vehicle = "Voltic", payout = 150000 },
    [59] = { vehicle = "Zentorno", payout = 725000 },
    [60] = { vehicle = "Blade", payout = 95200 },
    [61] = { vehicle = "Buccaneer", payout = 29000 },
    [62] = { vehicle = "Chino", payout = 90000 },
    [63] = { vehicle = "Dominator", payout = 210000 },
    [64] = { vehicle = "Dukes", payout = 40000 },
    [65] = { vehicle = "Ellie", payout = 190000 },
    [66] = { vehicle = "Faction", payout = 30000 },
    [67] = { vehicle = "Gauntlet", payout = 9999999 }, --get price
    [68] = { vehicle = "Hermes", payout = 125000 },
    [69] = { vehicle = "Hotknife", payout = 100000 },
    [70] = { vehicle = "Hustler", payout = 95000 },
    [71] = { vehicle = "Manana", payout = 50000 },
    [72] = { vehicle = "Nightshade", payout = 185000 },
    [73] = { vehicle = "Phoenix", payout = 155000 },
    [74] = { vehicle = "Picador", payout = 9000 },
    [75] = { vehicle = "Ruiner", payout = 115000 },
    [76] = { vehicle = "Slamvan", payout = 95000 },
    [77] = { vehicle = "Tampa", payout = 270000 },
    [78] = { vehicle = "Tornado", payout = 20000 },
    [79] = { vehicle = "Tulip", payout = 112000 },
    [80] = { vehicle = "Tulip", payout = 112000 },
    [81] = { vehicle = "Vigero", payout = 21000 },
    [82] = { vehicle = "Virgo", payout = 35000 },
    [83] = { vehicle = "Contender", payout = 145000 },
    [84] = { vehicle = "Guardian", payout = 145000 },
    [85] = { vehicle = "Kamacho", payout = 175000 },
    [86] = { vehicle = "Baller", payout = 145000 },
    [87] = { vehicle = "Dubsta", payout = 85000 },
    [88] = { vehicle = "Granger", payout = 30000 },
    [89] = { vehicle = "Landstalker", payout = 9999999 },
    [90] = { vehicle = "Patriot", payout = 58000 },
    [91] = { vehicle = "Rocoto", payout = 65000 },
    [92] = { vehicle = "Toros", payout = 210000 },
    [93] = { vehicle = "XLS", payout = 55000 },
    [94] = { vehicle = "Journey", payout = 25000 },
    [95] = { vehicle = "Minivan", payout = 10000 },
    [96] = { vehicle = "Moonbeam", payout = 9999999 }, --get price
    [97] = { vehicle = "Paradise", payout = 35000 },
    [98] = { vehicle = "Rumpo", payout = 125000 },
    [99] = { vehicle = "Surfer", payout = 5000 },
    [100] = { vehicle = "Youga", payout = 16000 },
    [101] = { vehicle = "Asea", payout = 10000 },
    [102] = { vehicle = "Asterope", payout = 15000 },
    [103] = { vehicle = "Fugitive", payout = 24000 },
    [104] = { vehicle = "Glendale", payout = 20000 },
    [105] = { vehicle = "Ingot", payout = 9000 },
    [106] = { vehicle = "Intruder", payout = 16000 },
    [107] = { vehicle = "Lurcher", payout = 9999999 }, --get price
    [108] = { vehicle = "Premier", payout = 10000 },
    [109] = { vehicle = "Primo", payout = 9500 },
    [110] = { vehicle = "Regina", payout = 8000 },
    [111] = { vehicle = "Stanier", payout = 10000 },
    [112] = { vehicle = "Stratum", payout = 10000 },
    [113] = { vehicle = "Stretch", payout = 30000 },
    [114] = { vehicle = "Surge", payout = 38000 },
    [115] = { vehicle = "Tailgater", payout = 60000 },
    [116] = { vehicle = "Warrener", payout = 22000 },
    [117] = { vehicle = "Washington", payout = 25000 },
    [118] = { vehicle = "Akuma", payout = 43000 },
    [119] = { vehicle = "Defiler", payout = 9999999 }, --get price
    [120] = { vehicle = "Diablous", payout = 95000 },
    [121] = { vehicle = "Esskey", payout = 78500 },
    [122] = { vehicle = "Hakuchou", payout = 175000 },
    [123] = { vehicle = "Lectro", payout = 70000 },
    [124] = { vehicle = "Nemesis", payout = 51000 },
    [125] = { vehicle = "Ruffian", payout = 50000 },
    [126] = { vehicle = "Shotaro", payout = 1200000 },
    [127] = { vehicle = "Thrust", payout = 9999999 }, --get price
    [128] = { vehicle = "Vader", payout = 29000 },
    [129] = { vehicle = "Vindicator", payout = 210000 },
    [130] = { vehicle = "Vortex", payout = 92000 },
    [131] = { vehicle = "Avarus", payout = 88000 },
    [132] = { vehicle = "Bagger", payout = 55000 },
    [133] = { vehicle = "Chimera", payout = 100000 },
    [134] = { vehicle = "Daemon", payout = 56000 },
    [135] = { vehicle = "Gargoyle", payout = 120000 },
    [136] = { vehicle = "Hexer", payout = 43000 },
    [137] = { vehicle = "Innovation", payout = 100000 },
    [138] = { vehicle = "Nightblade", payout = 95200 },
    [139] = { vehicle = "Sanctus", payout = 280000 },
    [140] = { vehicle = "Sovereign", payout = 60000 },
    [141] = { vehicle = "Wolfsbane", payout = 75000 },
    [142] = { vehicle = "BF400", payout = 9999999 }, --get price
    [143] = { vehicle = "Cliffhanger", payout = 90000 },
    [144] = { vehicle = "Enduro", payout = 75000 },
    [145] = { vehicle = "Manchez", payout = 9999999 }, --get price
    [146] = { vehicle = "BMX", payout = 800 },
    [147] = { vehicle = "Cruiser", payout = 950 },
    [148] = { vehicle = "Fixter", payout = 9999999 }, --get price
    [149] = { vehicle = "Scorcher", payout = 1000 }
  }
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
  handoff = "handposes-0" -- notepad lib
  RequestAnimDict(handoff) --request notepad lib
  timer = 10000 --timer between available jobs, 1000 = 1 sec
  veh = GetVehiclePedIsIn(playerPed, false) --get current vehicle player is in
  model = GetEntityModel(veh) --get model of vehicle
  displaytext = GetDisplayNameFromVehicleModel(model) --get display name of model
  name = GetLabelText(displaytext) --get label text of display name


  --[[ PICKUP ORDER FOR VEHICLE ]]
  if active == false then
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, 966.35, - 1698.94, 29.61, false) < 20.0) then
      DrawMarker(1, 966.35, - 1698.94, 29.61 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 255, 0, 0, 500, false, false, 2, false, false, false, false)
    end
    if (Vdist(x, y, z, 966.35, - 1698.94, 29.61, false) < 1) then
      drawText("Press ~y~E~s~ to get chop order from Vinny")
      if IsControlJustPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, handoff, "p_notepad_01_s-0", 8.0, 8.0, 15000, 1, 1, false, true, true)
        TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true)
        exports.pNotify:SendNotification({text = "Getting name of a wanted vehicle..", type = "info", timeout = 15000, layout = "centerRight"})
        Citizen.Wait(16000)
        ClearPedTasksImmediately(playerPed)
        chance = math.floor(math.random(1, #vehicleList)) --get random number from 1 to length of table
        amount = vehicleList[chance].payout * 0.10375 --multiply payout of randomly selected vehicle by 0.10375 (10.375% of Retail Price)
        if vehicleList[chance].payout >= 1000000 then
          TriggerEvent('chatMessage', 'Server', {255, 255, 255}, "Active Chop Order: " .. vehicleList[chance].vehicle .. ".")
          exports.pNotify:SendNotification({text = "~y~~h~**SPECIAL ORDER**~s~ Deliver a <font color='#FFFF00'>" .. vehicleList[chance].vehicle .. "</font> to the storage unit.", type = "info", timeout = 8000, layout = "centerRight"})
        elseif vehicleList[chance].payout < 1000000 then
          TriggerEvent('chatMessage', 'Server', {255, 255, 255}, "Active Chop Order: " .. vehicleList[chance].vehicle .. ".")
          exports.pNotify:SendNotification({text = "Deliver a <font color='#FFFF00'>" .. vehicleList[chance].vehicle .. "</font> to the storage unit.", type = "info", timeout = 8000, layout = "centerRight"})
        end -- end price check
        active = true
      end -- key press
    end -- distance check
  end --end active check

  --[[ ABILITY TO CANCEL CURRENT JOB ]]
  if active == true then
    if (Vdist(x, y, z, 965.35, - 1697.94, 29.61, false) < 20.0) then
      DrawMarker(1, 966.35, - 1698.94, 29.61 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0 + 0.5, 255, 0, 0, 500, false, false, 2, false, false, false, false)
    end
    if (Vdist(x, y, z, 965.35, - 1697.94, 29.61, false) < 1) then
      drawText("Press ~y~E~s~ to cancel chop order")
      if IsControlJustPressed(1, Keys["E"]) then
        active = false
      end
    end
  end

  --[[ DROP OFF AND VERIFY VEHICLE ]]
  if active == true then
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (Vdist(x, y, z, 946.99, - 1698.05, 30.09, false) < 100.0) then
      DrawMarker(1, 946.99, - 1698.05, 30.09 - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0 + 0.5, 255, 0, 0, 500, false, false, 2, false, false, false, false)
    end
    if (Vdist(x, y, z, 946.99, - 1698.05, 30.09, false) < 4) then
      if IsPedInVehicle(playerPed, veh, true) then -- check if ped is in vehicle
        drawText("Press ~y~E~s~ to deliver ~b~" .. name .. "~s~.")
        if IsControlJustPressed(1, Keys["E"]) then
          if name == vehicleList[chance].vehicle then -- check if name of vehicle matches name of vehicle on list
            if GetVehicleBodyHealth(veh) < 500.00 then -- check if body health is below 300 of 1000
              exports.pNotify:SendNotification({text = "Did you get this " .. name .. " from the junkyyard!? Go repair it!", type = "info", timeout = 5000, layout = "centerRight"})
            elseif GetVehicleBodyHealth(veh) >= 500.00 then -- check if body health is equal or above 300 of 1000
              exports.pNotify:SendNotification({text = "Good job, you have delivered a " .. name .. ".", type = "info", timeout = 5000, layout = "centerRight"})
              Wait(1000)
              TriggerServerEvent("choplistjob", amount) --pay for delivering correct vehicle
              TriggerEvent('chatMessage', 'Server', {255, 255, 255}, "Completed Chop Order: " .. vehicleList[chance].vehicle .. " for " .. amount .. ".")
              active = false
              -- AFTER GETTING PAID
              SetVehicleEngineOn(veh, false, false, true) --turn engine off
              SetVehicleDoorsLocked(veh, 2) --set doors locked so player cant get back in vehicle after delivery
              SetVehicleUndriveable(veh, true) --set vehicle to undriveable
              if (Vdist(x, y, z, 946.99, - 1698.05, 30.09, false) > 20) then --if player is more than 20 meters away, delete vehicle for immersion reasons
                SetEntityAsMissionEntity(veh) --give vehicle to game
                Wait(1000)
                DeleteEntity(veh) --delete vehicle
              end --end dropoff distance check
            end --end health check
          else -- if name does not match vehicle on list
            exports.pNotify:SendNotification({text = "Does this look like a <font color='#FFFF00'>" .. vehicleList[chance].vehicle .. "</font> to you? Get out of here.. ", type = "info", timeout = 8000, layout = "centerRight"})
          end -- end if
        end -- key press
      end -- is ped in vehicle
    end -- 4 distance check
  end --end active check



end -- end Citizen.CreateThread while loop
end) --end Citizen.CreateThread