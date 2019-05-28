-- TODO: ADD SPOT TO RETURN SUBMERSIBLE, SET ACTIVESUB BACK TO FALSE 
local subHash = GetHashKey("SUBMERSIBLE")
local subStart = {
	marker = {x = 3854.92, y = 4459.69, z = 1.85},
	spawn = {x = 3873.45, y = 4451.17, z = -0.47, heading = 308.37}
}
local subEnd = {
	marker = {x = 3856.99, y = 4472.80, z = 0.00}
}
local pointsOfInterest = {
	[1] = {x = 4233.06, y = 3594.94, z = -46.46},
	[2] = {x = 3888.78, y = 3056.02, z = -25.40},
	[3] = {x = 3311.96, y = -416.09, z = -123.73},
	[4] = {x = 2659.56, y = -1426.59, z = -21.96},
	[5] = {x = 1851.92, y = -2937.70, z = -46.55},
	[6] = {x = 460.30, y = -2373.75, z = -11.76},
	[7] = {x = -328.90, y = -2300.02, z = -12.53},
	[8] = {x = -276.81, y = -2896.12, z = -17.83},
	[9] = {x = -2847.14, y = -414.80, z = -24.64},
	[10] = {x = -3181.74, y = 3047.80, z = -36.36},
	[11] = {x = -3262.50, y = 3665.76, z = -22.23},
	[12] = {x = -1016.75, y = 6501.45, z = -21.90},
	[13] = {x = 2662.49, y = 6648.11, z = -23.19},
}
local pointsOfInterestBlips = {}
local mining = false
local mtime = 0
local mduration = 15000
local activeSub = false
local purchased = false
RequestModel(subHash)
while not HasModelLoaded(subHash) do
	Citizen.Wait(0)
end
function drawText(text)
	SetTextFont(0)
  SetTextProportional(0)
  SetTextScale(0.32, 0.32)
  SetTextColour(0, 255, 255, 255)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(1)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.475, 0.88)
end
function rentvehicle()
	if (purchased) then
  	TriggerServerEvent("bms:jobs:shipwreck:rentvehicle")	
		purchased = false
	end
end
function returnvehicle()
	if (activeSub) then
  	TriggerServerEvent("bms:jobs:shipwreck:returnvehicle")	
		activeSub = false
	end
end
RegisterNetEvent("bms:jobs:shipwreck:rentvehiclecomplete")
AddEventHandler("bms:jobs:shipwreck:rentvehiclecomplete", function(rentalCost, success)    
    if (success) then
      exports.pnotify:SendNotification({text = string.format("You have rented a submersible for <font color='skyblue'>$%s</font>", rentalCost)})
			print("submersible rented")
    else
      exports.pnotify:SendNotification({text = string.format("You do not have enough money on your person to rent a submersible")})
    end
end)
RegisterNetEvent("bms:jobs:shipwreck:returnvehiclecomplete")
AddEventHandler("bms:jobs:shipwreck:returnvehiclecomplete", function(rentalDeposit, success)    
    if (success) then
      exports.pnotify:SendNotification({text = string.format("You have returned a submersible and received a <font color='skyblue'>$%s</font> deposit", rentalDeposit)})
			print("submersible returned")
    else
      exports.pnotify:SendNotification({text = string.format("You must return the submersible to receive a deposit.")})
    end
end)
RegisterNetEvent("bms:jobs:shipwreck:salvageComplete")
AddEventHandler("bms:jobs:shipwreck:salvageComplete", function()
  mining = false
  mtime = 0
end)
-- WHEN PURCHASED, ACTIVATE THIS THREAD
Citizen.CreateThread(function()
  while true do
    Wait(100)
    if (purchased) then
      rentvehicle()
    end
  end
end)
-- WHILE MINING, ACTIVATE THIS THREAD
Citizen.CreateThread(function()
  while true do
    Wait(0)
		if (mining) then
			drawText("Searching wreckage for artifacts..")
		end 
  end
end)
-- WHEN DONE MINING, ACTIVATE THIS THREAD
Citizen.CreateThread(function()
  while true do
    Wait(1000)
    if (mining) then
      mtime = mtime + 1000
      if (mtime == mduration) then
        TriggerServerEvent("bms:jobs:shipwreck:finishSalvaging")
      end
    end
  end
end)
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		playerPed = PlayerPedId()
		pos = GetEntityCoords(playerPed, true)
		local currentVeh = GetVehiclePedIsIn(playerPed, false)	
		local dist = Vdist(pos.x, pos.y, pos.z, subStart.marker.x, subStart.marker.y, subStart.marker.z)
		--Spawn Submersible	
		if dist < 1.0 then
			drawText("Press ~b~E~s~ to rent a submersible")
			
			
			if IsControlJustPressed(1, 38) then --press E to spawn vehicle
				purchased = true -- pays for sub
				activeSub = true -- ignore until return marker is added
				
				
				if (activeSub) then
					rentvehicle()
					DrawMarker(1, subEnd.marker.x, subEnd.marker.y, subEnd.marker.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 1.5, 255, 0, 0, 800, false, false, 2, false, false, false, false) -- show return marker					
					local subVeh = CreateVehicle(subHash, subStart.spawn.x, subStart.spawn.y, subStart.spawn.z, subStart.spawn.heading, true, true)
					SetPedIntoVehicle(playerPed, subVeh, -1)
					
					
					-- Return Vehicle
					local distReturn = Vdist(pos.x, pos.y, pos.z, subEnd.marker.x, subEnd.marker.y, subEnd.marker.z)
					if distReturn < 10.0 then
						drawText("Press ~b~E~s~ to return submersible")
						if IsControlJustPressed(1, 38) then --press E to spawn vehicle
							SetEntityAsMissionEntity(subVeh, true, true)
							DeleteEntity(subVeh)
							SetEntityCoords(playerPed, subStart.marker.x, subStart.marker.y, subStart.marker.z, 1, 0, 0, 1)
							Wait(1000)
							returnvehicle()
						end
					end
					
					
					-- Load location blips on map if job is active
					if (#pointsOfInterestBlips == 0) then
						for i = 1, #pointsOfInterest do
							local blip = AddBlipForCoord(pointsOfInterest[i].x, pointsOfInterest[i].y, pointsOfInterest[i].z)
							SetBlipSprite(blip, 308)
							SetBlipDisplay(blip, 4)
							SetBlipScale(blip, 1.0)
					    SetBlipColour(blip, 3)
							SetBlipAsShortRange(blip, true)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString("Salvage")
							EndTextCommandSetBlipName(blip)					
							table.insert(pointsOfInterestBlips, blip)
						end --end forloop
					end --end if blip{} == 0
					
					
					--Points of Interest
					for _,v in pairs(pointsOfInterest) do
						local searchDist =  Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z)
						if searchDist < 50.0 then
							DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 2.0 + 0.5, 66, 176, 244, 255, false, false, 2, false, false, false, false)
						end --end dist check
						if searchDist < 5.0 then			
							if (not mining) then 
								drawText("Press ~y~E~s~ to salvage wreckage")
								if IsControlJustPressed(1, 38) then --press E to spawn vehicle
									mining = true					
								end --end E key
							end --end mining check
						end --end dist check
					end --end forloop					
					
				end --end activeSub check
				
			end -- end E key
			
		end -- end start dist	
			
	end --end while true loop
end) --end Citizen.CreateThread