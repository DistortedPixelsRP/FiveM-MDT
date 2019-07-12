--Sends link code to database to link user
RegisterNetEvent("linkServer")
AddEventHandler("linkServer", function(code)
  local source = source
  local steamid = GetPlayerIdentifier(source,0)
  local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
  
MySQL.Async.fetchAll("SELECT name FROM mdt_users WHERE steam=@steam", {['@steam'] = realSteamID}, function(users)
	if #users > 0 then
	--print('exist')
TriggerClientEvent('chatMessage', source, "^1^*ERROR", { 128, 128, 128 }, "^r Your account is already linked with ^*^_" .. users[1].name .. "^r. Use '/unlink' to unlink your account!")
	else
--print('not exist')
MySQL.Sync.execute("INSERT INTO mdt_players (id, steam, name) VALUES (@ClientID, @steamid, @ClientName)", {['@ClientID'] = source, ['@steamid'] = realSteamID, ['@ClientName'] = tostring(GetPlayerName(source))})
MySQL.Sync.execute("UPDATE mdt_players SET code=@code WHERE id=@ClientID", {['@ClientID'] = source, ['@code'] = code})
end
end)
end)

--command to unlink player from their mdt account in the db
RegisterNetEvent('unlinkServer')
AddEventHandler("unlinkServer", function()
local source = source
local steamid = GetPlayerIdentifier(source,0)
local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
MySQL.Sync.execute("UPDATE mdt_users SET steam='0' WHERE steam=@steam", {['@steam'] = realSteamID})

TriggerClientEvent('chatMessage', source, "^2^*SUCCESS", { 128, 128, 128 }, "^r Account successfully unlinked!")
end)

local user_id = nil

--gets list of characters to show on client side for character selection
RegisterNetEvent('showCharactersServer')
AddEventHandler("showCharactersServer", function()
local src = source
local steamid = GetPlayerIdentifier(source,0)
local realSteamID = tostring(tonumber(string.sub(steamid, 7), 16))
MySQL.Async.fetchAll("SELECT user_id FROM mdt_users WHERE steam=@steam", {['@steam'] = realSteamID}, function(users)
if #users == 0 then
TriggerClientEvent('chatMessage', src, "^1^*ERROR", { 128, 128, 128 }, "^r Your account has not been linked yet! Please login to the online MDT and follow the instructions.")
else
MySQL.Async.fetchAll("SELECT * FROM mdt_characters WHERE ownerID=@ownerID", {['@ownerID'] = users[1].user_id}, function(characters)
TriggerClientEvent('showCharacters', src, characters)
end)
end
end)
end)

--adds vehicle to db
RegisterNetEvent('registerVehicle')
AddEventHandler("registerVehicle", function(vehicleModel, vehiclePlate, vehicleColor, id)
local source = source
MySQL.Async.fetchAll("SELECT * FROM mdt_characters WHERE id=@id", {['@id'] = id}, function(users)
if users[1].lic == 'None' then
TriggerClientEvent('chatMessage', source, "^3^*DMV", { 128, 128, 128 }, "^r You do not have a drivers license yet! We are creating one for you now. Please type ^*'/register'^r again to continue registering your vehicle.")
MySQL.Sync.execute("UPDATE mdt_characters SET lic='Valid' WHERE id=@id", {['@id'] = id})
else
TriggerClientEvent('chatMessage', source, "^3^*DMV", { 128, 128, 128 }, "^r Your ^*" .. vehicleColor .. " " .. vehicleModel .. "^r with the plate ^*" .. vehiclePlate .. "^r has been successfully registered to ^*" .. users[1].first .. " " .. users[1].last .. "^r.")
	MySQL.Sync.execute("INSERT INTO mdt_vehicles (ownerID, characterID, model, plate, description, reg, insurance, flags) VALUES (@ownerID, @characterID, @model, @plate, @description, 'Valid', 'Valid', 'None')", {['@ownerID'] = users[1].ownerID, ['@characterID'] = id, ['@model'] = vehicleModel, ['@plate'] = vehiclePlate, ['@description'] = vehicleColor})
end
end)
end)

--
RegisterNetEvent('me')
AddEventHandler("me", function(msg, name)
TriggerClientEvent('me', -1, source, msg, name)
end)

--displays chat message with character name instead of player name
RegisterNetEvent('sendMSG')
AddEventHandler("sendMSG", function(characterName, msg)
if string.sub(msg, 1, 1) ~= '/' then
TriggerClientEvent('chatMessage', -1, "^*^4" .. characterName .. " (" .. source .. ")", { 128, 128, 128 }, "^r" .. msg)
end
end)

--gets info from db to show ID on players screen
RegisterNetEvent('showID')
AddEventHandler("showID", function(giveID, characterID, userid)
print(characterID .. " " .. giveID)
MySQL.Async.fetchAll("SELECT * FROM mdt_characters WHERE id=@characterID", {['@characterID'] = characterID}, function(characters)

TriggerClientEvent('showID', giveID, characters[1].last, characters[1].first, characters[1].dob, characters[1].gender, userid)
end)
end)

--triggers return id on client side
RegisterNetEvent('returnID')
AddEventHandler("returnID", function(name, id)
TriggerClientEvent('returnID', id, name)
end)


function setCharacter(characterName,characterID) 
characterName = characterName
characterID = characterID
--print(characterName)
end

--adds character name in front of chat message
AddEventHandler('chatMessage', function(source, color, msg)
local src = source
CancelEvent()
TriggerClientEvent('getName', src, msg, 'sendMSG')
end)

--Adds uptime to convars for use on the web admin panel
Citizen.CreateThread(function()
	local uptimeMinute, uptimeHour, uptime = 0, 0, ''
	SetConvarServerInfo('Uptime', "00h 00m")
	while true do
		Citizen.Wait(1000 * 60) -- every minute
		uptimeMinute = uptimeMinute + 1

		if uptimeMinute == 60 then
			uptimeMinute = 0
			uptimeHour = uptimeHour + 1
		end

		uptime = string.format("%02dh %02dm", uptimeHour, uptimeMinute)
		SetConvarServerInfo('Uptime', uptime)


		TriggerClientEvent('uptime:tick', -1, uptime)
		TriggerEvent('uptime:tick', uptime)
	end
end)

--A command ran from the web admin panel that tells the start server.bat to kill the server and start a new one
RegisterCommand("restart_server", function(source, args, rawCommand)
if (source == 0) then
local players = GetPlayers()
for _, i in ipairs(players) do
	DropPlayer(i, "Server is restarting!")
end
Citizen.Wait(5000)
	local f,err = io.open("restart.file","a")
	f:write("restart server")
	f:close()
	end
end)

--A command ran from thw web admin panel that bans a player from the server
RegisterCommand("ban", function(source, args, rawCommand)
if source == 0 then
local id = table.remove(args, 1)
local reason = table.concat(args, ' ')
local steamid = GetPlayerIdentifier(id,0)
print("Banning user with id " .. id)
DropPlayer(id, reason)
MySQL.Sync.execute("INSERT INTO mdt_ban (steam, reason) VALUES (@steam, @reason)", {['@steam'] = steamid, ['@reason'] = reason})
end
end)

--A command ran from the web admin panel that kicks a player from the game
RegisterCommand("kick", function(source, args, rawCommand)
if source == 0 then
local id = table.remove(args, 1)
local reason = table.concat(args, ' ')
print("Kicking user with id " .. id)
DropPlayer(id, reason)
end
end)

--A command ran from the web admin panel that announces messages to the entire server
RegisterCommand("announce", function(source, args, rawCommand)
if source == 0 then
print("Server Announcement: " .. table.concat(args, ' '))
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, table.concat(args, ' '))
end
end)

--Checks with DB if player is banned and makes sure they are using Steam
AddEventHandler("playerConnecting", function(name, setReason, deferrals)
deferrals.defer()
deferrals.update("Checking...")
local steamid = GetPlayerIdentifier(source,0)
local ban = MySQL.Sync.fetchAll("SELECT steam,reason FROM mdt_ban WHERE steam=@steam", {['@steam'] = steamid})
if steamid == nil then
print("User must first login to Steam")
setReason("Please login to Steam to play on this FiveM server!")
CancelEvent()
elseif #ban ~= 0 then
print("Banned user attemted to enter server. Kicking.")
deferrals.done("You are banned from this FiveM server for " .. ban[1].reason)
elseif steamid ~= nil then
print("User is not banned. User is now connecting to server.")
deferrals.update("Thank you for waiting. Now connecting.")
deferrals.done()
end
end)

--Command used within the console to set the time of the restart. Format for midnight: setRestartTime 24 00
RegisterCommand("setRestartTime", function(source, args, rawCommand)
if source == 0 then
local f,err = io.open("restart.time","w")
print(args[1] .. "," .. args[2])
f:write(args[1] .. "," .. args[2])
f:close()
end
end)

local nextDay = 0;
local secondsDiff = 0;


--Converts seconds to hh:mm:ss
function SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds/3600));
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours..":"..mins..":"..secs
  end
end

--Gets restart time and sends it to player requesting
RegisterCommand("restartTime", function(source, args, rawCommand) 
TriggerClientEvent('chatMessage', source, "^1^*Server", { 128, 128, 128 }, "Restarting in " .. SecondsToClock(secondsDiff))
end)


function restart_time()
local f,err = io.open("restart.time","r") --read restart time from file
if not f then
local f,err = io.open("restart.time","a") --if does not exist create one
f:write("24,00") --set default midnight
f:close()
restart_time()
return true
end
local t = f:read("*all") --read start time
if t ~= -1 then
restartHour, restartMinute = t:match("([^,]+),([^,]+)")
temp = os.date("*t")
restart_Time = os.time({year=temp['year'], month=temp['month'], day=temp['day']+nextDay, hour=restartHour, min=restartMinute})

secondsDiff = os.difftime(restart_Time,os.time())
if secondsDiff < 0 then -- if negative add a day
nextDay = 1
elseif secondsDiff > 86760 then --if more than 24 hours subtract a day
nextDay = 0
end

if secondsDiff == 1800 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 30 minutes!")
elseif secondsDiff == 900 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 15 minutes!")
elseif secondsDiff == 300 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 5 minutes!")
elseif secondsDiff == 60 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 1 minute!")
elseif secondsDiff == 30 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 30 seconds!")
elseif secondsDiff == 5 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 5 seconds!")
elseif secondsDiff == 4 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 4 seconds!")
elseif secondsDiff == 3 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 3 seconds!")
elseif secondsDiff == 2 then
TriggerClientEvent('chatMessage', -1, "^1^*Server Announcement", { 128, 128, 128 }, "Server restarting in 2 seconds!")
elseif secondsDiff == 1 then --restart server
local players = GetPlayers()
for _, i in ipairs(players) do
	DropPlayer(i, "Server is restarting!")
end
Citizen.Wait(5000)
	local f,err = io.open("restart.file","a")
	f:write("restart server")
	f:close()
end

SetTimeout(1000, restart_time)
end
end
restart_time()