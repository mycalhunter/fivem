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
      local amount = 1000001
      local getBank = xPlayer.getBank() --get original bank amount.. should get 1,005,000 + 45000. Bank account should be 1,050,000
      xPlayer.setBankBalance(getBank + 45000)
      Citizen.Wait(100)
      --local refreshBank = "UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition"
      TriggerClientEvent('esx:showNotification', s, '~y~You got money!~s~')
      --TriggerClientEvent("chatMessage", s, tostring("Deposit was passed to the server with the amount: " .. amount))
    end
  end
end)

