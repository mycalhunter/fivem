-- TODO: ADD SPOT TO RETURN SUBMERSIBLE, SET ACTIVESUB BACK TO FALSE 

local vehicle = GetHashKey("submersible")
subStart = {
	marker = {x = 3854.92, y = 4459.69, z = 1.85},
	spawn = {x = 3873.45, y = 4451.17, z = -0.47}
}
subEnd = {
	marker = {x = 3856.99, y = 4472.80, z = 0.00}
}
pointsOfInterest = {
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
local poiblips = {}
local mining = false
local mtime = 0
local mduration = 15000
local activeSub = false
RequestModel(vehicle)
while not HasModelLoaded(vehicle) do
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

function finishMining()
  TriggerServerEvent("bms:jobs:shipwreck:finishMining")
end


RegisterNetEvent("bms:jobs:shipwreck:miningComplete")
AddEventHandler("bms:jobs:shipwreck:miningComplete", function()
  local ped = GetPlayerPed(-1)  

  mining = false
  mtime = 0
  --exports.management:animatorendsequence()

  ClearPedTasks(ped)
end)


-- Mining thread
Citizen.CreateThread(function()
  while true do
    Wait(1000)
		
    if (mining) then
      mtime = mtime + 1000

      if (mtime == mduration) then
        finishMining()
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
		
		if (mining) then
			drawText("Searching wreckage..")
		end 
		
  end
end)

Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
	playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed, true)
	local currentVeh = GetVehiclePedIsIn(playerPed, false)	
	local dist = Vdist(pos.x, pos.y, pos.z, subStart.marker.x, subStart.marker.y, subStart.marker.z) 
	--[[if IsControlJustPressed(1, 38) then --press R to spawn vehicle
		local subVeh = CreateVehicle(vehicle, pos.x, pos.y, pos.z, 308.37, true, true)
		SetPedIntoVehicle(playerPed, subVeh, -1)		
	end]]	
	
	--Spawn Submersible	
	if dist < 1.0 and (not activeSub) then
		drawText("Press ~b~E~s~ to get submersible")
		
		if IsControlJustPressed(1, 38) then --press R to spawn vehicle
			activeSub = true
			DrawMarker(1, subEnd.marker.x, subEnd.marker.y, subEnd.marker.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 1.5, 255, 0, 0, 800, false, false, 2, false, false, false, false)
			local subVeh = CreateVehicle(vehicle, subStart.spawn.x, subStart.spawn.y, subStart.spawn.z, 308.37, true, true)
			SetPedIntoVehicle(playerPed, subVeh, -1)				
			Wait(100)
			
			if (#poiblips == 0) then
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
					table.insert(poiblips, blip)
				end -- end for POI
			end -- end blip if
			
		end -- end key
		
	end -- end start dist
	
	
	
	--Points of Interest
	for _,v in pairs(pointsOfInterest) do
		DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 2.0 + 0.5, 66, 176, 244, 255, false, false, 2, false, false, false, false)
		local searchDist =  Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) 
		if searchDist < 5 then			
			if (not mining) then 
				drawText("Press ~y~E~s~ to search wreckage")
				if IsControlJustPressed(1, 38) then --press E to spawn vehicle
					mining = true					
				end
			end
		end
	end
		
	


end
end)
