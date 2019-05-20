RegisterServerEvent('prisonwork:maintjobCompleted')
AddEventHandler('prisonwork:maintjobCompleted', function()
local src = source
local maint_amount = 275
  TriggerEvent("es:getPlayerFromId", src, function(user)
    exports.characters:giveMoneyToChar(user, maint_amount)
      Citizen.Wait(1)
      TriggerClientEvent("pNotify:SendNotification", src, {text = 'You have been paid <font color="#50b64e">' .. maint_amount .. '</font> for your work.'})
  end)
end)

RegisterServerEvent('prisonwork:licensejobCompleted')
AddEventHandler('prisonwork:licensejobCompleted', function()
local src = source
local license_amount = 200
  TriggerEvent("es:getPlayerFromId", src, function(user)
    exports.characters:giveMoneyToChar(user, license_amount)
      Citizen.Wait(1)
      TriggerClientEvent("pNotify:SendNotification", src, {text = 'You have been paid <font color="#50b64e">' .. license_amount .. '</font> for your work.'})
  end)
end)

RegisterServerEvent('prisonwork:constructionjobCompleted')
AddEventHandler('prisonwork:constructionjobCompleted', function()
local src = source
local const_amount = 175
  TriggerEvent("es:getPlayerFromId", src, function(user)
    exports.characters:giveMoneyToChar(user, const_amount)
      Citizen.Wait(1)
      TriggerClientEvent("pNotify:SendNotification", src, {text = 'You have been paid <font color="#50b64e">' .. const_amount .. '</font> for your work.'})
  end)
end)