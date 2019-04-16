function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, - 1)
end

local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
  {title = "Prison Maintenance", colour = 4, id = 446, x = 1629.76, y = 2563.87, z = 45.56, display = 4, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 2, y = 2, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 255, g = 0, b = 255, a = 100}, prompt = "Press ~y~E~s~ to repair electric panel"}, --electric repair
  {title = "Prison Maintenance", colour = 4, id = 446, x = 1753.49, y = 2503.66, z = 45.57, display = 4, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 2, y = 2, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 255, g = 0, b = 255, a = 100}, prompt = "Press ~y~E~s~ to make license plate"}, --license plate
  {title = "Prison Maintenance", colour = 4, id = 446, x = 1755.42, y = 2467.19, z = 55.14, display = 4, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 2, y = 2, z = 2}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 255, g = 0, b = 255, a = 100}, prompt = "Press ~y~E~s~ to search AC Unit"} --hidden knife
}

--RENDER BLIP ON MAP
Citizen.CreateThread(function()
  while (true) do
    Wait(1) --1 gametick
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
  end --end while
end) --end thread

--RENDER MARKER AT LOCATION
Citizen.CreateThread(function()
  while (true) do
    Wait(1) --1 gametick
    for _, v in ipairs(blips) do
    local x, y, z = GetEntityCoords(GetPlayerPed(-1)) --get player position
    local distance = Vdist(x, y, z, v.x, v.y, v.z) --get distance between player and marker coords
        if (distance < v.drawdistance) then --if distance between player and marker coords is less than 100
          DrawMarker(1, v.x, v.y, v.z + 2.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 0, 50, false, true, 2, nil, nil, false)
        end
        if (distance <= 1) then --if distance between player and marker is less than 1 meter/unit
          HelpText(v.prompt)
        end
      end --end for
    end --end while
end) --end thread