local casingDrops = {{x, y, z}}
local drawable = false
RegisterNetEvent("bms:lawenforcement:evidence:markbulletcasings")
AddEventHandler("bms:lawenforcement:evidence:markbulletcasings", function(rbs)
    drawable = true
    playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed, true)
    if (drawable) then
      DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.0, 66, 176, 244, 500, 0, 0, 2, 0, 0, 0, 0)
    end
    table.insert(casingDrops, {x = pos.x, y = pos.y, z = pos.z}) -- saves drop location in table
end)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        playerPed = PlayerPedId()
        local isArmed = IsPedArmed(playerPed, 4)
        local currentWeapon = GetCurrentPedWeapon(playerPed, 1) -- current weapon
        local currentWeaponAmmo = GetAmmoInPedWeapon(playerPed, currentWeapon) -- current clip size
        local maxAmmo = GetMaxAmmoInClip(playerPed, currentWeapon, 1) -- full clip
        local ammoType = GetPedAmmoTypeFromWeapon(playerPed, currentWeapon) -- ammo type for current weapon
        local shooting = IsPedShooting(playerPed)
        local ammoTypeName = ammoType .. " bullet casing"

        if (isArmed and shooting) then
            if ((currentWeaponAmmo < maxAmmo) and (currentWeaponAmmo > 0) and (shooting)) then -- if 11 < 20 then
                TriggerServerEvent("bms:lawenforcement:evidence:useweapon", playerPed, currentWeapon, ammoType, pos.x, pos.y, pos.z)
                Wait(1000) -- wait 1 second before drawing next marker
            end
        elseif ((not shooting) and #casingDrops > 0) then
          for i = 1, #casingDrops do
            local dist = Vdist(pos.x, pos.y, pos.z, casingDrops[i].x, casingDrops[i].y, casingDrops[i].z)
            if dist < 1.5 then
                drawText("Pick up " .. ammoType .. " bullet casing")
                if (isGameControlPressed(1, 38)) then --press E
                    -- do quick pick up / kneel animation
                    TriggerServerEvent("bms:lawenforcement:evidence:pickupcasing", playerPed, ammoTypeName) -- add item to player inv
                    table.remove(casingDrops, {casingDrops[i].x, casingDrops[i].y, casingDrops[i].z}) -- clear casing from list
                    drawable = false
                    -- remove DrawMarker
                end
            end
        end
    end
end)