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
      TriggerClientEvent('pNotify:SendNotification', -1, {text = '~y~You have been paid $' .. amount .. ' for your work.~s~', type = "info", timeout = 8000, layout = "centerRight"})
    end
  end
end)