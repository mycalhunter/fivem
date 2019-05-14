Citizen.CreateThread(function()
  while true do
  Citizen.Wait(100)
  playerPed = GetPlayerPed(-1)
  veh = GetVehiclePedIsIn(playerPed, false)
  if IsPedInVehicle(playerPed, veh, false) then
    SendNUIMessage({
      speed = GetVehicleDashboardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)),
      mph = math.floor(GetVehicleDashboardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))),
      gear = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false)),
      gearamount = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false)),
      fuelamount = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false)),
      fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    })
  else
    -- no nothing
  end
  SendNUIMessage({
    show = IsPauseMenuActive(),
    armor = GetPedArmour(GetPlayerPed(-1)),
    health = (GetEntityHealth(GetPlayerPed(-1)) - 100),
    time = GetClockHours() .. ":" .. GetClockMinutes()
  })
  end
end)
