ESX = nil
local xPlayers = 0
local xPlayer = 0
local playerName = ""
local s = source
local amount = 0
local getBank = 0
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('prisonworkjob')
AddEventHandler('prisonworkjob', function(job)
  xPlayers = ESX.GetPlayers()
  for i = 1, #xPlayers, 1 do
    xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    playerName = xPlayer.name
    if xPlayer.job.name == 'unemployed' then
      amount = 275
      getBank = xPlayer.getBank()
      xPlayer.setBankBalance(getBank + amount)
      Citizen.Wait(1)
      TriggerClientEvent('pNotify:SendNotification', -1, {text = 'You have been paid $' .. amount .. ' for your work.', type = "info", timeout = 5000, layout = "centerRight"})
    end
  end
end)