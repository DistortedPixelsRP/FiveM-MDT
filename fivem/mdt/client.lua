local characterName = nil
local characterID = nil
local idholder = nil
local holdingID = nil

--color names for vehicle registration
local colorNames = {
    ['0'] = "Metallic Black",
    ['1'] = "Metallic Graphite Black",
    ['2'] = "Metallic Black Steal",
    ['3'] = "Metallic Dark Silver",
    ['4'] = "Metallic Silver",
    ['5'] = "Metallic Blue Silver",
    ['6'] = "Metallic Steel Gray",
    ['7'] = "Metallic Shadow Silver",
    ['8'] = "Metallic Stone Silver",
    ['9'] = "Metallic Midnight Silver",
    ['10'] = "Metallic Gun Metal",
    ['11'] = "Metallic Anthracite Grey",
    ['12'] = "Matte Black",
    ['13'] = "Matte Gray",
    ['14'] = "Matte Light Grey",
    ['15'] = "Util Black",
    ['16'] = "Util Black Poly",
    ['17'] = "Util Dark silver",
    ['18'] = "Util Silver",
    ['19'] = "Util Gun Metal",
    ['20'] = "Util Shadow Silver",
    ['21'] = "Worn Black",
    ['22'] = "Worn Graphite",
    ['23'] = "Worn Silver Grey",
    ['24'] = "Worn Silver",
    ['25'] = "Worn Blue Silver",
    ['26'] = "Worn Shadow Silver",
    ['27'] = "Metallic Red",
    ['28'] = "Metallic Torino Red",
    ['29'] = "Metallic Formula Red",
    ['30'] = "Metallic Blaze Red",
    ['31'] = "Metallic Graceful Red",
    ['32'] = "Metallic Garnet Red",
    ['33'] = "Metallic Desert Red",
    ['34'] = "Metallic Cabernet Red",
    ['35'] = "Metallic Candy Red",
    ['36'] = "Metallic Sunrise Orange",
    ['37'] = "Metallic Classic Gold",
    ['38'] = "Metallic Orange",
    ['39'] = "Matte Red",
    ['40'] = "Matte Dark Red",
    ['41'] = "Matte Orange",
    ['42'] = "Matte Yellow",
    ['43'] = "Util Red",
    ['44'] = "Util Bright Red",
    ['45'] = "Util Garnet Red",
    ['46'] = "Worn Red",
    ['47'] = "Worn Golden Red",
    ['48'] = "Worn Dark Red",
    ['49'] = "Metallic Dark Green",
    ['50'] = "Metallic Racing Green",
    ['51'] = "Metallic Sea Green",
    ['52'] = "Metallic Olive Green",
    ['53'] = "Metallic Green",
    ['54'] = "Metallic Gasoline Blue Green",
    ['55'] = "Matte Lime Green",
    ['56'] = "Util Dark Green",
    ['57'] = "Util Green",
    ['58'] = "Worn Dark Green",
    ['59'] = "Worn Green",
    ['60'] = "Worn Sea Wash",
    ['61'] = "Metallic Midnight Blue",
    ['62'] = "Metallic Dark Blue",
    ['63'] = "Metallic Saxony Blue",
    ['64'] = "Metallic Blue",
    ['65'] = "Metallic Mariner Blue",
    ['66'] = "Metallic Harbor Blue",
    ['67'] = "Metallic Diamond Blue",
    ['68'] = "Metallic Surf Blue",
    ['69'] = "Metallic Nautical Blue",
    ['70'] = "Metallic Bright Blue",
    ['71'] = "Metallic Purple Blue",
    ['72'] = "Metallic Spinnaker Blue",
    ['73'] = "Metallic Ultra Blue",
    ['74'] = "Metallic Bright Blue",
    ['75'] = "Util Dark Blue",
    ['76'] = "Util Midnight Blue",
    ['77'] = "Util Blue",
    ['78'] = "Util Sea Foam Blue",
    ['79'] = "Uil Lightning blue",
    ['80'] = "Util Maui Blue Poly",
    ['81'] = "Util Bright Blue",
    ['82'] = "Matte Dark Blue",
    ['83'] = "Matte Blue",
    ['84'] = "Matte Midnight Blue",
    ['85'] = "Worn Dark blue",
    ['86'] = "Worn Blue",
    ['87'] = "Worn Light blue",
    ['88'] = "Metallic Taxi Yellow",
    ['89'] = "Metallic Race Yellow",
    ['90'] = "Metallic Bronze",
    ['91'] = "Metallic Yellow Bird",
    ['92'] = "Metallic Lime",
    ['93'] = "Metallic Champagne",
    ['94'] = "Metallic Pueblo Beige",
    ['95'] = "Metallic Dark Ivory",
    ['96'] = "Metallic Choco Brown",
    ['97'] = "Metallic Golden Brown",
    ['98'] = "Metallic Light Brown",
    ['99'] = "Metallic Straw Beige",
    ['100'] = "Metallic Moss Brown",
    ['101'] = "Metallic Biston Brown",
    ['102'] = "Metallic Beechwood",
    ['103'] = "Metallic Dark Beechwood",
    ['104'] = "Metallic Choco Orange",
    ['105'] = "Metallic Beach Sand",
    ['106'] = "Metallic Sun Bleeched Sand",
    ['107'] = "Metallic Cream",
    ['108'] = "Util Brown",
    ['109'] = "Util Medium Brown",
    ['110'] = "Util Light Brown",
    ['111'] = "Metallic White",
    ['112'] = "Metallic Frost White",
    ['113'] = "Worn Honey Beige",
    ['114'] = "Worn Brown",
    ['115'] = "Worn Dark Brown",
    ['116'] = "Worn straw beige",
    ['117'] = "Brushed Steel",
    ['118'] = "Brushed Black steel",
    ['119'] = "Brushed Aluminium",
    ['120'] = "Chrome",
    ['121'] = "Worn Off White",
    ['122'] = "Util Off White",
    ['123'] = "Worn Orange",
    ['124'] = "Worn Light Orange",
    ['125'] = "Metallic Securicor Green",
    ['126'] = "Worn Taxi Yellow",
    ['127'] = "police car blue",
    ['128'] = "Matte Green",
    ['129'] = "Matte Brown",
    ['130'] = "Worn Orange",
    ['131'] = "Matte White",
    ['132'] = "Worn White",
    ['133'] = "Worn Olive Army Green",
    ['134'] = "Pure White",
    ['135'] = "Hot Pink",
    ['136'] = "Salmon pink",
    ['137'] = "Metallic Vermillion Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Mettalic Black Blue",
    ['142'] = "Metallic Black Purple",
    ['143'] = "Metallic Black Red",
    ['144'] = "hunter green",
    ['145'] = "Metallic Purple",
    ['146'] = "Metaillic V Dark Blue",
    ['147'] = "MODSHOP BLACK1",
    ['148'] = "Matte Purple",
    ['149'] = "Matte Dark Purple",
    ['150'] = "Metallic Lava Red",
    ['151'] = "Matte Forest Green",
    ['152'] = "Matte Olive Drab",
    ['153'] = "Matte Desert Brown",
    ['154'] = "Matte Desert Tan",
    ['155'] = "Matte Foilage Green",
    ['156'] = "DEFAULT ALLOY COLOR",
    ['157'] = "Epsilon Blue",
}

--Debug commands
--[[
RegisterCommand('change', function(source, args)
        GuiChange(args[1])
end, false)

RegisterCommand('server', function(source, args)
        TriggerServerEvent(args[1])
end, false)

RegisterCommand('off', function(source, args)
        EnableGui(false)
end, false)
]]--

--opens character selection
RegisterNetEvent("showCharacters")
AddEventHandler("showCharacters", function(c)
characters = c
GuiChange('character')
--print(characters)
    SendNUIMessage({
        type = "showCharacters",
        characters = characters
    })
end)

--opens character selection to change character
RegisterCommand('changeCharacter', function(source, args)
        TriggerServerEvent('showCharactersServer')
end, false)

--reloads character selection
RegisterNUICallback(
    "reload",
    function(data)
        if data.reload then
            --print("reload")
			TriggerServerEvent('showCharactersServer')
        end
    end
)

--sets the character 
RegisterNUICallback(
    "setCharacter",
    function(data)
		characterName = data.name
		characterID = data.id
		TriggerServerEvent('setCharacter', characterName, characterID)
		TriggerEvent('chatMessage', "^*^3SYSTEM", { 128, 128, 128 }, "^rYou are now " .. characterName)
		--print(characterName)
		--print(characterID)
		EnableGui(false)
    end
)


--register vehicle in db command
RegisterCommand('register', function(source, args)
if IsPedInAnyVehicle(PlayerPedId(), false) then
local vehicleModel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))))
local vehiclePlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))
local primary, secondary = GetVehicleColours(GetVehiclePedIsIn(PlayerPedId()))
primary = colorNames[tostring(primary)]
secondary = colorNames[tostring(secondary)]
local vehicleColor = primary .. " and " .. secondary
print(vehicleModel .. " " .. vehiclePlate .. " " .. vehicleColor)
if characterID == nil then
TriggerServerEvent('showCharactersServer')
else
TriggerServerEvent('registerVehicle', vehicleModel, vehiclePlate, vehicleColor, characterID)
end
else
TriggerEvent('chatMessage', "^*^3DMV", { 128, 128, 128 }, "^rYou are not in a vehicle.")
end
end)

--command to give someone else your id
RegisterCommand('giveID', function(source, args)
	if characterName == nil then
	TriggerEvent('chatMessage', "^*^1ERROR", { 128, 128, 128 }, "^rPlease select a character using '/changeCharacter'")
	elseif idholder ~= nil then
	TriggerEvent('chatMessage', "^*^1ERRORS", { 128, 128, 128 }, "^rCan't Give ID because ^*" .. idholder .. "^r is holding it. Use '/resetID' to return ID if this is a mistake.")
	else
	if GetPedInFront() == 0 then
	TriggerEvent('chatMessage', "^*^1ERROR", { 128, 128, 128 }, "^rNo one nearby to give ID to")
	else
	TriggerEvent('chatMessage', "^*^3SYSTEM", { 128, 128, 128 }, "^rID given to " .. GetPlayerName(GetPlayerFromPed(GetPedInFront())))
	TriggerServerEvent('showID', GetPlayerServerId(GetPlayerFromPed(GetPedInFront())), characterID, GetPlayerServerId(PlayerId()))
	print(GetPlayerServerId(GetPlayerFromPed(GetPedInFront())))
	idholder = GetPlayerName(GetPlayerFromPed(GetPedInFront()))
	setID(false)
	end
	end
end, false)

--sets if the ID icon in the corner should be showing if your holding your id or not
function setID(have)
SendNUIMessage({
type = 'setID',
have = have
})
end

--command to reset id if the system glitches or you die or something idk
RegisterCommand('resetID', function(source, args)
TriggerEvent('chatMessage', "^*^3SYSTEM", { 128, 128, 128 }, "^rID returned!")
idholder = nil
setID(true)
end, false)

--/me command trigger
RegisterCommand('me', function(source, args, raw)
msg = string.sub(raw, 3)
TriggerServerEvent('me', msg, characterName)
end)

--sends everyone in the radius the /me message
RegisterNetEvent('me')
AddEventHandler("me", function(id, message, name)
print(message)
if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(PlayerId())), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id))), true) < 20.0 then
TriggerEvent('chatMessage', "^*^7" .. name, {255, 0, 0}, "^r" .. message)
end
end)

--command that allows you to hand back someones id without them having to do /resetID
RegisterCommand('returnID', function(source, args)
if holdingID ~= nil then
TriggerServerEvent('returnID', characterName, holdingID)
EnableGui(false)
holdingID = nil
TriggerEvent('chatMessage', "^*^3" .. characterName, { 128, 128, 128 }, "^rHands back ID")
else
TriggerEvent('chatMessage', "^*^3SYSTEM", { 128, 128, 128 }, "^rYou are not holding anyones ID")
end
end, false)

--more return id stuff
RegisterNetEvent('returnID')
AddEventHandler("returnID", function(name)
TriggerEvent('chatMessage', "^*^3" .. name, { 128, 128, 128 }, "^rHands back ID")
idholder = nil
setID(true)
end)

--takes the person who handed the id to you info and shows it on your screen
RegisterNetEvent('showID')
AddEventHandler("showID", function(last, first, dob, gender, id)
	holdingID = id
	print("id" .. first .. " " .. last)
	GuiChange('showID')
	SetNuiFocus(false, false)
	SendNUIMessage({
        type = "showID",
        last = last,
		first = first,
		dob = dob,
		gender = gender
    })
end)

--get the ped closest to you. used for handing id
function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 2.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

--gets everyone in the servers ped, compares it with the one provided, then returns the one that matches
function GetPlayerFromPed(ped)
	for a = 0, 64 do
		if GetPlayerPed(a) == ped then
			return a
		end
	end
	return -1
end

--sends character name back to server
RegisterNetEvent('getName')
AddEventHandler("getName", function(msg, event)
if characterName == nil then
TriggerServerEvent('showCharactersServer')
else
TriggerServerEvent(event, characterName, msg)
end
end)

--changes the webpage displayed on your screen ex character selection screen
function GuiChange(pageName)
	EnableGui(true)
    SendNUIMessage({
        type = "uiChange",
        page = [[#]] .. pageName
    })
end

--link command (more in server)
RegisterCommand('link', function(source, args)
		TriggerServerEvent('linkServer', randomNumber())
end, false)

--unlink command (more in server)
RegisterCommand('unlink', function(source, args)
		TriggerServerEvent('unlinkServer')
end, false)

--generates a random 4 digit number. used for linking fivem and mdt account
function randomNumber()
math.randomseed(GetClockMinutes())
number = ""
for i = 1, 4 do
number = number .. math.random(0, 9)
end
TriggerEvent('chatMessage', '^3Your code is: ^7^*' .. number, {255, 255, 255})
return number
end

--turns on and off webpage on screen. ex character selection screen
function EnableGui(enable)
    SetNuiFocus(enable, enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end
EnableGui(false)

--turns on and off webpage on screen. ex character selection screen
RegisterNUICallback("close", function(data, cb)
	EnableGui(false)
	GuiDefault()
    cb('ok')
end)

--sets webpage back to default
function GuiDefault()
SendNUIMessage({default = true})
end