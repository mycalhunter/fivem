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
      local amount = 275
      local getBank = xPlayer.getBank()
      xPlayer.setBankBalance(getBank + amount)
      Citizen.Wait(1)
      TriggerClientEvent('esx:showNotification', s, '~y~You have been paid $100 for your work.~s~')
    end
  end
end)