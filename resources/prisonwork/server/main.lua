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
    
    --get updated bank
    local function getBankFromUser(id_user)
    local xPlayer = ESX.GetPlayerFromId(id_user)
    local account = xPlayer.getAccount('bank')
    return account.money
    end
    
    RegisterServerEvent('bank:getbank')
    AddEventHandler('bank:getbank', function()
      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      if xPlayer ~= nil then
        local bank = getBankFromUser(_source)
        TriggerClientEvent("banking:updateBalance", _source, bank)
      end
    end)
    --end getting updated bank
    
    
  end
end)

