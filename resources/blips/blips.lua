function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, - 1)
end

local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
  {title = "Aquatic Delivery Pickup", colour = 1, id = 446, x = 1429.76, y = 2763.87, z = 45.56, display = 2, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 4, y = 4, z = 2.0}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 66, g = 176, b = 244, a = 500}, prompt = "Press ~y~E~s~ to start job"}, --electric repair
  {title = "Electrical Repair", colour = 1, id = 446, x = 1629.76, y = 2563.87, z = 45.56, display = 2, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 1.5, y = 1.5, z = 2.0}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 66, g = 176, b = 244, a = 500}, prompt = "Press ~y~E~s~ to repair electric panel"}, --electric repair
  {title = "License Plate", colour = 49, id = 446, x = 1753.35, y = 2502.90, z = 45.58, display = 2, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 1.5, y = 1.5, z = 2.0}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 66, g = 176, b = 244, a = 500}, prompt = "Press ~y~E~s~ to make license plate"}, --license plate
  {title = "Hidden", colour = 1, id = 446, x = 1755.42, y = 2467.19, z = 55.14, display = 1, scale = 1.0, shortRange = true, markertype = 1, drawdistance = 200.0, markersize = {x = 1.5, y = 1.5, z = 2.0}, BlipSprite = 446, EnterExitDelay = 0, EnterExitDelayMax = 600, markercolor = {r = 244, g = 66, b = 66, a = 500}, prompt = "Press ~y~E~s~ to search AC Unit"} --hidden knife
}

Citizen.CreateThread(function()
  local i = 0
  while (true and i < #blips) do
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
    i = i + 1 --add to iteration count
  end --end while
end) --end thread

Citizen.CreateThread(function()
  while (true) do
    Wait(1) --1 gametick
    for _, v in pairs(blips) do
      local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) --get player position
      local distance = Vdist(x, y, z, v.x, v.y, v.z) --get distance between player and marker coords
      if (GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) < v.drawdistance) then
        DrawMarker(v.markertype, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.markersize.x, v.markersize.y, v.markersize.z + 0.5, v.markercolor.r, v.markercolor.g, v.markercolor.b, v.markercolor.a, false, false, 2, false, false, false, false)
      end
      if (distance <= 1) then --if distance between player and marker is less than 1 meter/unit
        HelpText(v.prompt)
        --[[exports.pNotify:SendNotification({
            text = v.prompt, 
            type = "info", 
            timeout = math.random(1000, 10000), 
            layout = "bottomCenter", 
            queue = "left"
        })]]
      end
    end --end for
  end --end while
end) --end thread