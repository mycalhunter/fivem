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
while (true) do --if library exists
Wait(1)
local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1))) --set ped x,y,z coords
local distance = Vdist(0.0, 0.0, 0.0, 0.0, 0.0, 0.0) --preset distance var
local pickup_coords = { {x = 1429.76, y = 2763.87, z = 45.56} } --set 'pickup fish' marker x,y,z coords
local fish1_coords = { {x = 1629.76, y = 2563.87, z = 45.56} } --set 'deliver fish' marker x,y,z coords
local vehicleName = 'pounder'
local jobLocations = {
  {title = "Aquatic Delivery Spot", colour = 1, id = 446, x = 1629.76, y = 2563.87, z = 45.56, display = 2, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 1.5, y = 1.5, z = 2.0}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 66, g = 176, b = 244, a = 500}, prompt = "Press ~y~E~s~ deliver product"}, --electric repair
}
local jobDistance = GetPedWaypointDistance(GetPlayerPed(-1))








--[[SHOW MARKER & PROMPT]]
for _, v in pairs(jobLocations) do
  distance = Vdist(x, y, z, v.x, v.y, v.z) --get distance between player and marker coords
  if (distance < v.drawdistance) then
    DrawMarker(v.markertype, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.markersize.x, v.markersize.y, v.markersize.z + 0.5, v.markercolor.r, v.markercolor.g, v.markercolor.b, v.markercolor.a, false, false, 2, false, false, false, false)
  end
  if (distance <= 1) then --if distance between player and marker is less than 1 meter/unit
    HelpText(v.prompt)
  end
end --end for




--[[START JOB WHEN KEY IS PRESSED AT MARKER]]
for k, v in pairs(pickup_coords) do
distance = Vdist(x, y, z, v.x, v.y, v.z) --get distance between ped coords and marker coords
Citizen.Wait(100)
distance = math.ceil(distance) --round up distance to whole int
  if distance <= 2 then --check if distance between ped and marker is less than or equal to 1
    --TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Distance is : " .. distance) --for debug
    if IsControlPressed(1, Keys["E"]) then --press G to start job
      Citizen.Wait(0) --wait to get data
      
      if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chatMessage', '', { 0, 0, 0 }, 'An error has occured, please contact an administrator.')
      end
      -- load the model
      RequestModel(vehicleName)
      -- wait for the model to load
      while not HasModelLoaded(vehicleName) do
      Wait(500) -- often you'll also see Citizen.Wait
      end
      -- get the player's position
      local playerPed = PlayerPedId() -- get the local player ped
      local pos = GetEntityCoords(playerPed) -- get the position of the local player ped
      
      -- create the vehicle
      local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
      
      -- set the player ped into the vehicle's driver seat
      SetPedIntoVehicle(playerPed, vehicle, - 1)
      
      -- give the vehicle back to the game (this'll make the game decide when to despawn the vehicle)
      --SetEntityAsNoLongerNeeded(vehicle)
      
      -- release the model
      --SetModelAsNoLongerNeeded(vehicleName)  
      
      SetNewWaypoint(1629.76, 2563.87)
      TriggerEvent("chatMessage", "", { 0, 0, 0 }, "^*^Requested delivery is " .. jobDistance .. " miles away.")
    end --end Key Press
  end -- end distance check
end-- end for loop




--[[CLEAR JOB WHEN KEY PRESSED]]
for k, v in pairs(fish1_coords) do
distance = Vdist(x, y, z, v.x, v.y, v.z) --get distance between ped coords and marker coords
Citizen.Wait(100)
distance = math.ceil(distance) --round up distance to whole int
  if distance <= 2 then --check if distance between ped and marker is less than or equal to 1
    --TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Distance is : " .. distance) --for debug
    if IsControlPressed(1, Keys["E"]) then --press G to start job
      Citizen.Wait(0) --wait to get data
      TriggerServerEvent("fish_delivery") --payout
      SetWaypointOff()
    end --end Key Press
  end -- end distance check
end-- end for loop





end -- end while
end) --end function