--Resets list of online players on server restart
Citizen.CreateThread(function()
MySQL.Sync.execute("DELETE FROM players")
end)

--Adds player to list of online players 
RegisterNetEvent('logPlayers')
AddEventHandler("logPlayers", function()
  -- ip = tostring(GetPlayerEndpoint(source))
  -- ip = ip:gsub("[^1234567890.]", "")
  local steamid = GetPlayerIdentifier(source,0)
  local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
  -- print(steamid) 
  -- print(realSteamID) 
  
  MySQL.Sync.execute("INSERT INTO players (id, steam, name) VALUES (@ClientID, @steamid, @ClientName)", {['@ClientID'] = source, ['@steamid'] = realSteamID, ['@ClientName'] = tostring(GetPlayerName(source))})
end)

--Sends link code to database to link user
RegisterNetEvent("linkServer")
AddEventHandler("linkServer", function(code)
  local source = source
  local steamid = GetPlayerIdentifier(source,0)
  local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
  
MySQL.Async.fetchAll("SELECT name FROM users WHERE steam=@steam", {['@steam'] = realSteamID}, function(users)
	if #users > 0 then
	print('exist')
TriggerClientEvent('chatMessage', source, "^1^*ERROR", { 128, 128, 128 }, "^r Your account is already linked with ^*^_" .. users[1].name .. "^r. Use '/unlink' to unlink your account!")
	else
print('not exist')
MySQL.Sync.execute("INSERT INTO players (id, steam, name) VALUES (@ClientID, @steamid, @ClientName)", {['@ClientID'] = source, ['@steamid'] = realSteamID, ['@ClientName'] = tostring(GetPlayerName(source))})
MySQL.Sync.execute("UPDATE players SET code=@code WHERE id=@ClientID", {['@ClientID'] = source, ['@code'] = code})
end
end)
end)

RegisterNetEvent('unlinkServer')
AddEventHandler("unlinkServer", function()
local source = source
local steamid = GetPlayerIdentifier(source,0)
local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
MySQL.Sync.execute("UPDATE users SET steam='0' WHERE steam=@steam", {['@steam'] = realSteamID})

TriggerClientEvent('chatMessage', source, "^2^*SUCCESS", { 128, 128, 128 }, "^r Account successfully unlinked!")
end)

local user_id = nil

RegisterNetEvent('showCharactersServer')
AddEventHandler("showCharactersServer", function()
local src = source
local steamid = GetPlayerIdentifier(source,0)
local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))

print('ran')

MySQL.Async.fetchAll("SELECT user_id FROM users WHERE steam=@steam", {['@steam'] = realSteamID}, function(users)
if #users == 0 then
TriggerClientEvent('chatMessage', src, "^1^*ERROR", { 128, 128, 128 }, "^r Your account has not been linked yet! Please login to the online MDT and follow the instructions.")
else
MySQL.Async.fetchAll("SELECT * FROM characters WHERE ownerID=@ownerID", {['@ownerID'] = users[1].user_id}, function(characters)
TriggerClientEvent('showCharacters', src, characters)
print('sql')
end)
end
end)
end)

RegisterNetEvent('registerVehicle')
AddEventHandler("registerVehicle", function(vehicleModel, vehiclePlate, vehicleColor, id)
local source = source
MySQL.Async.fetchAll("SELECT * FROM characters WHERE id=@id", {['@id'] = id}, function(users)
if users[1].lic == 'None' then
TriggerClientEvent('chatMessage', source, "^3^*DMV", { 128, 128, 128 }, "^r You do not have a drivers license yet! We are creating one for you now. Please type ^*'/register'^r again to continue registering your vehicle.")
MySQL.Sync.execute("UPDATE characters SET lic='Valid' WHERE id=@id", {['@id'] = id})
else
TriggerClientEvent('chatMessage', source, "^3^*DMV", { 128, 128, 128 }, "^r Your ^*" .. vehicleColor .. " " .. vehicleModel .. "^r with the plate ^*" .. vehiclePlate .. "^r has been successfully registered to ^*" .. users[1].first .. " " .. users[1].last .. "^r.")
	MySQL.Sync.execute("INSERT INTO vehicles (ownerID, characterID, model, plate, description, reg, insurance, flags) VALUES (@ownerID, @characterID, @model, @plate, @description, 'Valid', 'Valid', 'None')", {['@ownerID'] = users[1].ownerID, ['@characterID'] = id, ['@model'] = vehicleModel, ['@plate'] = vehiclePlate, ['@description'] = vehicleColor})
end
end)
end)

RegisterNetEvent('me')
AddEventHandler("me", function(msg, name)
TriggerClientEvent('me', -1, source, msg, name)
end)

RegisterNetEvent('sendMSG')
AddEventHandler("sendMSG", function(characterName, msg)
if string.sub(msg, 1, 1) ~= '/' then
TriggerClientEvent('chatMessage', -1, "^*^4" .. characterName .. " (" .. source .. ")", { 128, 128, 128 }, "^r" .. msg)
end
end)

RegisterNetEvent('showID')
AddEventHandler("showID", function(giveID, characterID, userid)
print(characterID .. " " .. giveID)
MySQL.Async.fetchAll("SELECT * FROM characters WHERE id=@characterID", {['@characterID'] = characterID}, function(characters)

TriggerClientEvent('showID', giveID, characters[1].last, characters[1].first, characters[1].dob, characters[1].gender, userid)
end)
end)

RegisterNetEvent('returnID')
AddEventHandler("returnID", function(name, id)
TriggerClientEvent('returnID', id, name)
end)

function setCharacter(characterName,characterID) 
characterName = characterName
characterID = characterID
print(characterName)
end

AddEventHandler('chatMessage', function(source, color, msg)
local src = source
CancelEvent()
TriggerClientEvent('getName', src, msg, 'sendMSG')
end)

RegisterNetEvent( 'hgg' )
AddEventHandler( 'hgg', function()

--local steamid = GetPlayerIdentifier(source,0)
--local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
local realSteamID = 3

--local players = MySQL.Sync.fetchAll("SELECT * FROM users WHERE steam=@steam", {['@steam'] = realSteamID})
--print(players.email)

MySQL.Async.fetchAll("SELECT user_id FROM users WHERE steam=@steam", {['@steam'] = realSteamID}, function(users)
    print(users[1].user_id)
end)

end)