ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('prisonworkjob')
AddEventHandler('prisonworkjob', function(job)
  local xPlayers = ESX.GetPlayers()
  for i = 1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    local playerName = xPlayer.name
    if xPlayer.job.name == 'unemployed' then
      local s = source
      local amount = 150
      local getBank = xPlayer.getBank() --get original bank amount
      xPlayer.setBankBalance(getBank + amount) --add bank account to original + $150
      Citizen.Wait(100)
      TriggerClientEvent('esx:showNotification', s, '~y~You have been paid for your work.~s~')
    end
  end
end)