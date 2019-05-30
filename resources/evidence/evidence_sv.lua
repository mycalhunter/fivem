RegisterServerEvent("bms:lawenforcement:evidence:useweapon")
AddEventHandler("bms:lawenforcement:evidence:useweapon", function(playerPed, currentWeapon, ammoType)
    print(string.format("PlayerId(%s) has used a %s with %s ammo at %s, %s, %s", playerPed, currentWeapon, ammoType, pos.x, pos.y, pos.z))
    TriggerClientEvent("bms:lawenforcement:evidence:markbulletcasings")
end)

RegisterServerEvent("bms:lawenforcement:evidence:pickupcasing")
AddEventHandler("bms:lawenforcement:evidence:pickupcasing", function(playerPed, ammoTypeName)
  local src = source
  TriggerEvent("es:getPlayerFromId", src, function(user)
    TriggerEvent("bms:addCharacterInvItemById", src, ammoTypeName, 1)
    print(string.format("PlayerId(%s) picked up %s ammo", ammoTypeName))
  end)
end)