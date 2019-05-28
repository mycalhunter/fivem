local minerals = { -- change in client also
  {name = "Iron", clow = 0.0, chigh = 0.7, profit = 105, procname = "Iron Bar(s)", type = 1}, -- old 165
  {name = "Gold", clow = 0.71, chigh = 0.95, profit = 190, procname = "Gold Bar(s)", type = 2}, -- old 260
}
local ctf = {low = 0.1, high = 1.0}

RegisterServerEvent("bms:shipwreck:checkMaxCap")
AddEventHandler("bms:shipwreck:checkMaxCap", function(source, cb)
  local totalmats = 0
    
  TriggerEvent("es:getPlayerFromId", source, function(user)
    --print(user.get("activeChar"))
    
    MySQL.Async.fetchAll("SELECT inventory FROM characters WHERE id = @id", {["@id"] = user.get("id")}, function(results)
      if (#results > 0) then
        if (results[1].inventory ~= nil and json.decode(results[1].inventory) ~= nil) then
          local inv = json.decode(results[1].inventory)

          if (inv) then
            for i = 1, #inv do
              for _,v in pairs(minerals) do
                if (v.name == inv[i].name) then
                  totalmats = totalmats + inv[i].quantity
                end
              end
            end
          
            if (totalmats < 300) then
              if (cb) then
                cb(true)
              end
            else
              if (cb) then
                cb(false)
              end
            end
          end
        else
          if (cb) then
            cb(true)
          end
        end
      end
    end)
  end)
end)

RegisterServerEvent("bms:jobs:shipwreck:finishMining")
AddEventHandler("bms:jobs:shipwreck:finishMining", function()
  local src = source
  math.randomseed(os.time())
  local rnd = math.random()
  local match

  for _,v in pairs(minerals) do
    if (rnd > v.clow and rnd < v.chigh) then
      match = v
    end
  end

  if (not match) then -- fallback
    match = minerals[math.random(1, #minerals)]
  end

  if (match) then
    local rc = math.random()
    -- print(string.format("mining chance: %s, item: %s, low: %s, high: %s", rc, match.name, ctf.low, ctf.high))
    local success = rc > ctf.low
    local randAmt = math.random(2, 4)
    
    if (success) then
      TriggerEvent("bms:shipwreck:checkMaxCap", src, function(allow)
        if (allow) then
          TriggerEvent("bms:addCharacterInvItemWithCallback", src, match.name, randAmt, "bms:jobs:shipwreck:miningComplete")
          TriggerEvent("bms:crafting:increaseSkill", src, 2, true)
          TriggerClientEvent("pNotify:SendNotification", src, {text = string.format("You have found " .. randAmt .. " <font color='limegreen'>%s</font> scraps.", match.name), timeout = 7000})
          TriggerEvent("bms:management:updateAnalytics", match.name .. " mined", randAmt)
        else
          TriggerClientEvent("pNotify:SendNotification", src, {text = "You can not carry any more scraps."})
          TriggerClientEvent("bms:jobs:shipwreck:miningComplete", src)
        end
      end)
    else
      TriggerClientEvent("pNotify:SendNotification", src, {text = "You did not find any valuable scraps."})
      TriggerClientEvent("bms:jobs:shipwreck:miningComplete", src)
    end
  end
end)