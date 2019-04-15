--[[GET ESX OBJ DATA --VERY IMPORTANT]]
Citizen.CreateThread(function()
  while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
end
end)

local blips = {
-- Example {title="", colour=, id=, x=, y=, z=},
{title = "Prison Maintenance", colour = 1, id = 446, x = 1629.76, y = 2563.87, z = 45.56, display = 4, scale = 1.0, shortRange = true, MarkerType = 99, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 25}, prompt = "Press ~y~E~s~ to repair electric panel"}, --electric repair
{title = "Prison Maintenance", colour = 1, id = 446, x = 1753.49, y = 2503.66, z = 45.57, display = 4, scale = 1.0, shortRange = true, MarkerType = 99, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 25}, prompt = "Press ~y~E~s~ to make license plate"}, --license plate
{title = "Prison Maintenance", colour = 1, id = 446, x = 1755.42, y = 2467.19, z = 55.14, display = 4, scale = 1.0, shortRange = true, MarkerType = 99, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 25}, prompt = "Press ~y~E~s~ to search AC Unit"} --hidden knife
}

Citizen.CreateThread(function()
  local playerx, playery, playerz = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, info.display)
    SetBlipScale(info.blip, info.scale)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, info.shortRange)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
    --DrawMarker(1, info.x, info.y, info.z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)

    --[[DRAW MARKER IF PLAYER IS WITHIN DRAWDISTANCE]]
    if (GetDistanceBetweenCoords(x, y, z, info.blip, false) < info.DrawDistance) then
      DrawMarker(info.MarkerType, info.x, info.y, info.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, info.MarkerSize.x, info.MarkerSize.y, info.MarkerSize.z - 0.0, info.MarkerColor.r, info.MarkerColor.g, info.MarkerColor.b, info.MarkerColor.a, 50, false, true, 2, false, false, false, false)
    end
    --[[DRAW MESSAGE IF PLAYER IS WITHIN MARKERSIZE.X]]
    if (GetDistanceBetweenCoords(x, y, z, info.blip, false) < info.MarkerSize.x) then
      TriggerEvent('esx:showNotification', s, info.prompt)
    end
  end
end)