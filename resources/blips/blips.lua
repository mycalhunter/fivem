--[[GET ESX OBJ DATA --VERY IMPORTANT]]
Citizen.CreateThread(function()
  while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
end
end)

local blips = {
-- Example {title="", colour=, id=, x=, y=, z=},
{title = "Prison Maintenance", colour = 1, id = 446, x = 1629.76, y = 2563.87, z = 45.56, display = 4, scale = 1.0, shortRange = true, MarkerType = 1, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 255}, prompt = "Press ~y~E~s~ to repair electric panel"}, --electric repair
{title = "Prison Maintenance", colour = 1, id = 446, x = 1753.49, y = 2503.66, z = 45.57, display = 4, scale = 1.0, shortRange = true, MarkerType = 1, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 255}, prompt = "Press ~y~E~s~ to make license plate"}, --license plate
{title = "Prison Maintenance", colour = 1, id = 446, x = 1755.42, y = 2467.19, z = 55.14, display = 4, scale = 1.0, shortRange = true, MarkerType = 1, DrawDistance = 100.0, MarkerSize = {x = 1, y = 1, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, MarkerColor = {r = 255, g = 0, b = 0, a = 255}, prompt = "Press ~y~E~s~ to search AC Unit"} --hidden knife
}

Citizen.CreateThread(function())

  --RENDER BLIP ON MAP
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
  end --end for

  --RENDER MARKER NEAR PLAYER
  for k, v in pairs(blips) do
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) --get player position
    local distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) --get distance between player and marker coords
    distance = math.ceil(distance)
    
    if distance < v.DrawDistance then
      DrawMarker(1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.MarkerSize.x, v.MarkerSize.y, v.MarkerSize.z, v.MarkerColor.r, v.MarkerColor.g, v.MarkerColor.b, 50, false, false, 2, false, false, false, false)
    end

    if GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) < v.MarkerSize.x / 2 then
      TriggerEvent('esx:showNotification', source, v.prompt)
    end
  end --end for




end) --end thread