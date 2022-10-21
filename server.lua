QBCore = nil
local timecache,collecting = {},{}
webhook = 'https://discord.com/api/webhooks/1016382145289269278/-PzVgajfj6w0MJq6YFTrVPQ6xCofj-Ykv4DmL3PubgG9vk9CbmMmPNza-5ojOMOGypv-'
local DISCORDS_NAME = "Maaş Log"
local DISCORDS_IMAGE = "https://cdn.discordapp.com/attachments/890722303271374909/1008799987288772688/screenshot.jpg"
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


Citizen.CreateThread(function()
		exports.ghmattimysql:execute("SELECT steam,next_collect FROM `week_free`",{},function(data)
			for k,v in ipairs(data) do
				timecache[v.steam]=v.next_collect
			end
		end)
end)

RegisterServerEvent("snr:updateTimeout")
AddEventHandler("snr:updateTimeout", function()
	local _source = source
	local steamId = GetPlayerIdentifiers(_source)[1]

	if not steamId then return end
	local now = os.time()
	if timecache[steamId] then
		TriggerClientEvent("snr:setTimeout", _source, timecache[steamId])
	else
		exports.ghmattimysql:execute('SELECT `next_collect` FROM `week_free` WHERE `steam`=@steam;', {['@steam'] = steamId}, function(collect)
			if collect[1] then
				TriggerClientEvent("snr:setTimeout", _source, collect[1].next_collect)
				timecache[steamId] = collect[1].next_collect
			else
				TriggerClientEvent("snr:setTimeout", _source, 0)
				timecache[steamId] = 0
			end
		end)
	end
end)



RegisterServerEvent("snr:collect")
AddEventHandler("snr:collect", function(t)
	local _source = source
	local player = QBCore.Functions.GetPlayer(_source)
	if collecting[_source] then return end
	collecting[_source]=true -- small cache, this fixes dupe bug
	local xPlayer = QBCore.Functions.GetPlayers(_source)
	local steamId = GetPlayerIdentifiers(_source)[1]
	local now = os.time()
	local nextcollect = os.time() + Config.rtime
	if timecache[steamId] then -- if the time is cached just check that first to make things faster
		if timecache[steamId] > now then
			TriggerClientEvent("snr:setTimeout", _source, timecache[steamId])
			collecting[_source]=nil
			return
		end
	end
	exports.ghmattimysql:execute('SELECT * FROM `week_free` WHERE `steam`=@steam;', {['@steam'] = steamId}, function(collect)
		if collect[1] then
			if collect[1].next_collect < now then
			player.Functions.AddMoney('bank', 150000, "Haftalık maaş")
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
				TriggerClientEvent("snr:toggleFreeMenu", _source, false)
				exports.ghmattimysql:executeSync('UPDATE `week_free` SET `next_collect`=@nextcollect,`times_collected`=@timescollected WHERE `steam`=@steam', {["@steam"] = steamId, ["@nextcollect"] = nextcollect, ["@timescollected"] = collect[1].times_collected+1}, nil)
				TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			else
				TriggerClientEvent("snr:setTimeout", _source, collect[1].next_collect)
				TriggerClientEvent("chat:addMessage", _source, {color={255,0,0}, multiline=false, args={"Week Free", "It's still not time..."}})
			end
		else
			player.Functions.AddMoney('bank', 150000, "Haftalık maaş")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
			TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			TriggerClientEvent("snr:toggleFreeMenu", _source, false)
			exports.ghmattimysql:executeSync('INSERT INTO `week_free` (`steam`, `next_collect`, `times_collected`) VALUES (@steam, @nextcollect, 1);', {['@steam'] = steamId, ['@nextcollect'] = nextcollect}, nil)
		end
	end)
	collecting[_source]=nil
end)

RegisterServerEvent("snr:taksi")
AddEventHandler("snr:taksi", function(t)
	local _source = source
	local player = QBCore.Functions.GetPlayer(_source)
	if collecting[_source] then return end
	collecting[_source]=true -- small cache, this fixes dupe bug
	local xPlayer = QBCore.Functions.GetPlayers(_source)
	local steamId = GetPlayerIdentifiers(_source)[1]
	local now = os.time()
	local nextcollect = os.time() + Config.rtime
	if timecache[steamId] then -- if the time is cached just check that first to make things faster
		if timecache[steamId] > now then
			TriggerClientEvent("snr:setTimeout", _source, timecache[steamId])
			collecting[_source]=nil
			return
		end
	end
	exports.ghmattimysql:execute('SELECT * FROM `week_free` WHERE `steam`=@steam;', {['@steam'] = steamId}, function(collect)
		if collect[1] then
			if collect[1].next_collect < now then
			player.Functions.AddMoney('bank', 150000, "Haftalık maaş")
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
				TriggerClientEvent("snr:toggleFreeMenu", _source, false)
				exports.ghmattimysql:executeSync('UPDATE `week_free` SET `next_collect`=@nextcollect,`times_collected`=@timescollected WHERE `steam`=@steam', {["@steam"] = steamId, ["@nextcollect"] = nextcollect, ["@timescollected"] = collect[1].times_collected+1}, nil)
				TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			else
				TriggerClientEvent("snr:setTimeout", _source, collect[1].next_collect)
				TriggerClientEvent("chat:addMessage", _source, {color={255,0,0}, multiline=false, args={"Week Free", "It's still not time..."}})
			end
		else
			player.Functions.AddMoney('bank', 150000, "Haftalık maaş")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
			TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			TriggerClientEvent("snr:toggleFreeMenu", _source, false)
			exports.ghmattimysql:executeSync('INSERT INTO `week_free` (`steam`, `next_collect`, `times_collected`) VALUES (@steam, @nextcollect, 1);', {['@steam'] = steamId, ['@nextcollect'] = nextcollect}, nil)
		end
	end)
	collecting[_source]=nil
end)


RegisterServerEvent("snr:issizpust")
AddEventHandler("snr:issizpust", function(t)
	local _source = source
	local player = QBCore.Functions.GetPlayer(_source)
	if collecting[_source] then return end
	collecting[_source]=true -- small cache, this fixes dupe bug
	local xPlayer = QBCore.Functions.GetPlayers(_source)
	local steamId = GetPlayerIdentifiers(_source)[1]
	local now = os.time()
	local nextcollect = os.time() + Config.rtime
	if timecache[steamId] then -- if the time is cached just check that first to make things faster
		if timecache[steamId] > now then
			TriggerClientEvent("snr:setTimeout", _source, timecache[steamId])
			collecting[_source]=nil
			return
		end
	end
	exports.ghmattimysql:execute('SELECT * FROM `week_free` WHERE `steam`=@steam;', {['@steam'] = steamId}, function(collect)
		if collect[1] then
			if collect[1].next_collect < now then
			player.Functions.AddMoney('bank', 20000, "Haftalık maaş")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
				TriggerClientEvent("snr:toggleFreeMenu", _source, false)
				exports.ghmattimysql:executeSync('UPDATE `week_free` SET `next_collect`=@nextcollect,`times_collected`=@timescollected WHERE `steam`=@steam', {["@steam"] = steamId, ["@nextcollect"] = nextcollect, ["@timescollected"] = collect[1].times_collected+1}, nil)
				TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			else
				TriggerClientEvent("snr:setTimeout", _source, collect[1].next_collect)
				TriggerClientEvent("chat:addMessage", _source, {color={255,0,0}, multiline=false, args={"Week Free", "It's still not time..."}})
			end
		else
			player.Functions.AddMoney('bank', 20000, "Haftalık maaş")
			sendToDiscord("MAAŞ LOG", " **"..getPlayerInfo(_source).."** İŞSİZLİK MAAŞINI ALDI.", 16744576, webhook)
			TriggerClientEvent("QBCore:Notify", _source, 'Bankanıza para yatırıldı.', "error")
			TriggerClientEvent("snr:setTimeout", _source, nextcollect)
			TriggerClientEvent("snr:toggleFreeMenu", _source, false)
			exports.ghmattimysql:executeSync('INSERT INTO `week_free` (`steam`, `next_collect`, `times_collected`) VALUES (@steam, @nextcollect, 1);', {['@steam'] = steamId, ['@nextcollect'] = nextcollect}, nil)
		end
	end)
	collecting[_source]=nil
end)






--================ LOG SİDE ======================
function sendToDiscord(name, message, color, selam)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d - %H:%M:%S') .. " - Alfheim Roleplay",
			  },
		  }
	  }
	PerformHttpRequest(selam, function(err, text, headers) end, 'POST', json.encode({username = DISCORDS_NAME, embeds = connect, avatar_url = DISCORDS_IMAGE}), { ['Content-Type'] = 'application/json' })
end

function getPlayerInfo(player)
	local _player = player
	local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
	-- if Config.BilgileriPaylas then
		for k,v in pairs(GetPlayerIdentifiers(_player)) do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
			else
				infoString = infoString .. "\n" .. v
			end
		end
	-- end
	return infoString
end